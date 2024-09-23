double CEKClamp(double a1, double a2, double a3)
{
  return fmax(fmin(fmax(a2, a3), a1), fmin(a2, a3));
}

double CEKInterpolate(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double CEKInterpolateClamped(double a1, double a2, double a3)
{
  return fmax(fmin(fmax(a1, a2), a1 + (a2 - a1) * a3), fmin(a1, a2));
}

double CEKRectWithSize()
{
  return 0.0;
}

double CEKProgressClamped(double a1, double a2, double a3)
{
  double v3;

  v3 = 0.0;
  if (a3 != a2)
    v3 = (a1 - a2) / (a3 - a2);
  return fmax(fmin(v3, 1.0), 0.0);
}

double CEKPortraitOrientedSize(double a1, double a2)
{
  return fmin(a1, a2);
}

uint64_t CEKIsSFCameraSupportedForLocale(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = CEKIsSFCameraSupportedForLocale_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CEKIsSFCameraSupportedForLocale_onceToken, &__block_literal_global_1_0);
  v3 = (void *)CEKIsSFCameraSupportedForLocale_sfCameraLanguageCodes;
  objc_msgSend(v2, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "containsObject:", v4);
  return v5;
}

uint64_t CEKIsPadLayoutForView(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v17;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v1, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_referenceBounds");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v1, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "userInterfaceIdiom");
  v15 = v14 == 1;
  if (v4 * v6 != 0.0 && v14 == 1)
  {
    v17 = fmin(v4, v6) >= fmin(v10, v12) * 0.8;
    if (fmax(v4, v6) < fmax(v10, v12) * 0.8)
      v17 = 0;
    v15 = v4 >= v6 || v17;
  }

  return v15;
}

uint64_t CEKIsViewInMultitask(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  _BOOL4 v14;
  double v15;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1)
  {
    objc_msgSend(v1, "bounds");
    v7 = v6;
    v9 = v8;
    if (!v3)
      goto LABEL_6;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (!v2)
    {
LABEL_6:
      v12 = 0;
      goto LABEL_10;
    }
  }
  v10 = v7;
  v11 = v9;
  if (CGRectIsEmpty(*(CGRect *)&v4))
    goto LABEL_6;
  objc_msgSend(v3, "_referenceBounds");
  v14 = fmin(v7, v9) != v13;
  v12 = fmax(v7, v9) != v15 || v14;
LABEL_10:

  return v12;
}

uint64_t CEKIsSmallPhone()
{
  if (CEKIsSmallPhone_onceToken != -1)
    dispatch_once(&CEKIsSmallPhone_onceToken, &__block_literal_global_2);
  return CEKIsSmallPhone_isSmallPhone;
}

void sub_1B9837AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

id CEKFontOfSizeWeightStyle(uint64_t a1, CGFloat a2, double a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a1 == 1)
  {
    _CEKSFCameraFontOfSizeAndWeight(a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      CEKFontOfSizeAndStyle(a2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v7;

  }
  else if (a1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC4A70], a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

CTFontRef _CEKSFCameraFontOfSizeAndWeight(CGFloat a1, double a2)
{
  double v4;
  __CFString *v5;
  CTFontRef v6;

  if (UIAccessibilityIsBoldTextEnabled())
  {
    CTFontGetAccessibilityBoldWeightOfWeight();
    a2 = v4;
  }
  _CEKSFCameraFontNameForWeight(a2);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CTFontCreateWithNameAndOptions(v5, a1, 0, 0x400uLL);

  return v6;
}

const __CFString *_CEKSFCameraFontNameForWeight(double a1)
{
  if (*MEMORY[0x1E0DC4BB0] == a1)
    return CFSTR(".SFCamera-Ultralight");
  if (*MEMORY[0x1E0DC4BA0] == a1)
    return CFSTR(".SFCamera-Thin");
  if (*MEMORY[0x1E0DC4B80] == a1)
    return CFSTR(".SFCamera-Light");
  if (*MEMORY[0x1E0DC4B90] == a1)
    return CFSTR(".SFCamera-Regular");
  if (*MEMORY[0x1E0DC4B88] == a1)
    return CFSTR(".SFCamera-Medium");
  if (*MEMORY[0x1E0DC4B98] == a1)
    return CFSTR(".SFCamera-Semibold");
  if (*MEMORY[0x1E0DC4B70] == a1)
    return CFSTR(".SFCamera-Bold");
  if (*MEMORY[0x1E0DC4B68] == a1 || *MEMORY[0x1E0DC4B78] == a1)
    return CFSTR(".SFCamera-Heavy");
  else
    return 0;
}

void CEKExpandNormalizedRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CEKExpandNormalizedPoint(a1, a2, a5, a6, a7, a8);
}

double CEKExpandNormalizedPoint(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MinX;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  MinX = CGRectGetMinX(v14);
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  v12 = MinX + (CGRectGetMaxX(v15) - MinX) * a1;
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGRectGetMinY(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMaxY(v17);
  return v12;
}

double Rotation(float a1, float a2, float a3)
{
  unint64_t v3;
  int32x4_t v4;
  float32x2_t v5;
  float32x2_t v6;
  __float2 v7;
  double v16;
  float32x4_t v26;

  v3 = __PAIR64__(LODWORD(a3), LODWORD(a2));
  v4 = (int32x4_t)vmulq_f32((float32x4_t)v3, (float32x4_t)v3);
  v4.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v4, 2), vadd_f32(*(float32x2_t *)v4.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v4.i8, 1))).u32[0];
  v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  v26 = vmulq_n_f32((float32x4_t)v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
  v7 = __sincosf_stret(a1);
  _Q19 = v26;
  _S5 = (float)(1.0 - v7.__cosval) * v26.f32[0];
  __asm
  {
    FMLA            S7, S5, V19.S[1]
    FMLA            S16, S5, V19.S[2]
  }
  v16 = COERCE_DOUBLE(__PAIR64__(_S7, COERCE_UNSIGNED_INT(vmlas_n_f32(v7.__cosval, _S5, v26.f32[0]))));
  __asm { FMLA            S6, S5, V19.S[1] }
  _S7 = vmuls_lane_f32(1.0 - v7.__cosval, *(float32x2_t *)v26.f32, 1);
  __asm
  {
    FMLA            S16, S7, V19.S[1]
    FMLA            S17, S7, V19.S[2]
    FMLA            S6, S5, V19.S[2]
    FMLA            S0, S7, V19.S[2]
  }
  _S3 = vmuls_lane_f32(1.0 - v7.__cosval, v26, 2);
  __asm { FMLA            S1, S3, V19.S[2] }
  return v16;
}

CGAffineTransform *CubePoints(uint64_t a1, uint64_t a2, float64x2_t *a3, uint64_t *a4, uint64_t a5, CGFloat a6, CGFloat a7)
{
  CGAffineTransform *result;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  uint64_t v16;
  double *v17;
  CGAffineTransform v18;

  memset(&v18, 0, sizeof(v18));
  result = CGAffineTransformMakeScale(&v18, a6, a7);
  if (a5 >= 1)
  {
    v13 = *(float64x2_t *)&v18.a;
    v14 = *(float64x2_t *)&v18.c;
    v15 = *(float64x2_t *)&v18.tx;
    do
    {
      v16 = *a4++;
      v17 = (double *)(a1 + 16 * *(_QWORD *)(a2 + 8 * v16));
      *a3++ = vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v17[1]), v13, *v17));
      --a5;
    }
    while (a5);
  }
  return result;
}

CGPath *CreateRoundedPathForConvexPolygon(double *a1, uint64_t a2, double a3)
{
  CGPath *Mutable;
  CGPath *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  double *v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  double v37;

  Mutable = CGPathCreateMutable();
  v7 = Mutable;
  v8 = a1[2];
  v9 = a1[3];
  v10 = *a1 - v8;
  v11 = a1[1] - v9;
  v12 = sqrt(v11 * v11 + v10 * v10);
  v13 = v10 / v12;
  v14 = v12 == 0.0;
  if (v12 == 0.0)
    v13 = 0.0;
  v15 = v11 / v12;
  if (v14)
    v15 = 0.0;
  CGPathMoveToPoint(Mutable, 0, v8 + v10 - v13 * a3, v9 + v11 - v15 * a3);
  if (a2 >= 1)
  {
    v16 = 0;
    v17 = a1 + 1;
    do
    {
      if (a2 - 1 == v16)
        v18 = 0;
      else
        v18 = v16 + 1;
      v19 = &a1[2 * v18];
      v20 = &a1[2 * ((v16 + 2) % a2)];
      v21 = *v19;
      v22 = v19[1];
      v23 = *(v17 - 1);
      v25 = *v20;
      v24 = v20[1];
      v26 = *v19 - v23;
      v27 = v22 - *v17;
      v28 = sqrt(v27 * v27 + v26 * v26);
      v29 = v26 / v28;
      v30 = v28 == 0.0;
      if (v28 == 0.0)
        v29 = 0.0;
      v31 = v27 / v28;
      if (v30)
        v31 = 0.0;
      CGPathAddLineToPoint(v7, 0, v23 + v26 - v29 * a3, *v17 + v27 - v31 * a3);
      if (a3 > 0.0)
      {
        v32 = v21 - v25;
        v33 = v22 - v24;
        v34 = sqrt(v33 * v33 + v32 * v32);
        v35 = (v21 - v25) / v34;
        v36 = v34 == 0.0;
        if (v34 == 0.0)
          v35 = 0.0;
        v37 = v33 / v34;
        if (v36)
          v37 = 0.0;
        CGPathAddQuadCurveToPoint(v7, 0, v21, v22, v25 + v32 - v35 * a3, v24 + v33 - v37 * a3);
      }
      ++v16;
      v17 += 2;
    }
    while (a2 != v16);
  }
  return v7;
}

void sub_1B983EAB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B983EB90(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double convertDampingRatioAndResponseToTensionAndFriction(double *a1, double *a2, double result, double a4)
{
  double v4;
  double v5;

  v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1)
    *a1 = v4;
  if (a2)
  {
    v5 = sqrt(v4);
    result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double convertTensionAndFrictionToDampingRatioAndResponse(double *a1, double *a2, double a3, double a4)
{
  double result;

  result = sqrt(a3);
  if (a1)
    *a1 = a4 / (result + result);
  if (a2)
  {
    result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double convertDampingMassAndStiffnessToDampingRatioAndResponse(double *a1, double *a2, double result, double a4, double a5)
{
  double v5;

  v5 = sqrt(a5 / a4);
  if (a1)
  {
    result = result / a4 / (v5 + v5);
    *a1 = result;
  }
  if (a2)
  {
    result = 6.28318531 / v5;
    *a2 = 6.28318531 / v5;
  }
  return result;
}

uint64_t CEKHapticsAllowed()
{
  if (CEKHapticsAllowed_onceToken != -1)
    dispatch_once(&CEKHapticsAllowed_onceToken, &__block_literal_global_0);
  return CEKHapticsAllowed_allowsHaptics;
}

void sub_1B98460E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CGColorRef CreateStrokeColor()
{
  CGColorSpace *DeviceRGB;
  CGColorRef v1;
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v3[0] = xmmword_1B9877C90;
  v3[1] = unk_1B9877CA0;
  v1 = CGColorCreate(DeviceRGB, (const CGFloat *)v3);
  CGColorSpaceRelease(DeviceRGB);
  return v1;
}

CGGradientRef CreateBackgroundGradient()
{
  CGColorSpace *DeviceGray;
  CGColorRef v6;
  CGColorRef v7;
  CGColorRef v8;
  CGColorRef v9;
  CGColorRef v10;
  CGColorRef v11;
  CGColorRef v12;
  CGColorRef v13;
  CGGradient *v14;
  CGGradientRef CopyWithAlpha;
  CGColorRef v17;
  __int128 v18;
  CGColorRef v19;
  CGFloat locations[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  CGFloat v26[2];
  CGFloat v27[2];
  CGFloat v28[2];
  CGFloat v29[2];
  CGFloat v30[2];
  CGFloat v31[2];
  CGFloat v32[2];
  CGFloat v33[2];
  CGFloat v34[2];
  CGFloat v35[2];
  CGFloat components[3];
  _QWORD v37[13];

  v37[11] = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  __asm { FMOV            V0.2D, #1.0 }
  v18 = _Q0;
  *(_OWORD *)components = _Q0;
  v19 = CGColorCreate(DeviceGray, components);
  v37[0] = v19;
  *(_OWORD *)v35 = v18;
  *(_QWORD *)&v18 = CGColorCreate(DeviceGray, v35);
  v37[1] = v18;
  *(_OWORD *)v34 = xmmword_1B9877B70;
  v17 = CGColorCreate(DeviceGray, v34);
  v37[2] = v17;
  *(_OWORD *)v33 = xmmword_1B9877B80;
  v6 = CGColorCreate(DeviceGray, v33);
  v37[3] = v6;
  *(_OWORD *)v32 = xmmword_1B9877B90;
  v7 = CGColorCreate(DeviceGray, v32);
  v37[4] = v7;
  *(_OWORD *)v31 = xmmword_1B9877BA0;
  v8 = CGColorCreate(DeviceGray, v31);
  v37[5] = v8;
  *(_OWORD *)v30 = xmmword_1B9877BB0;
  v9 = CGColorCreate(DeviceGray, v30);
  v37[6] = v9;
  *(_OWORD *)v29 = xmmword_1B9877BC0;
  v10 = CGColorCreate(DeviceGray, v29);
  v37[7] = v10;
  *(_OWORD *)v28 = xmmword_1B9877BD0;
  v11 = CGColorCreate(DeviceGray, v28);
  v37[8] = v11;
  *(_OWORD *)v27 = xmmword_1B9877BE0;
  v12 = CGColorCreate(DeviceGray, v27);
  v37[9] = v12;
  *(_OWORD *)v26 = xmmword_1B9877BF0;
  v13 = CGColorCreate(DeviceGray, v26);
  v37[10] = v13;
  *(_OWORD *)locations = xmmword_1B9877C00;
  v21 = xmmword_1B9877C10;
  v22 = xmmword_1B9877C20;
  v23 = xmmword_1B9877C30;
  v24 = xmmword_1B9877C40;
  v25 = 0x3FF0000000000000;
  v14 = CGGradientCreateWithColors(DeviceGray, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 11), locations);

  CopyWithAlpha = CubeGradientCreateCopyWithAlpha();
  CGGradientRelease(v14);
  CGColorSpaceRelease(DeviceGray);
  return CopyWithAlpha;
}

CGColorRef CreateFillColor()
{
  CGColorSpace *DeviceGray;
  CGColorRef v6;
  CGFloat v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)v8 = _Q0;
  v6 = CGColorCreate(DeviceGray, v8);
  CGColorSpaceRelease(DeviceGray);
  return v6;
}

CGGradientRef CreateGlowGradient()
{
  CGColorSpace *DeviceRGB;
  CGColor *v1;
  CGColorRef v2;
  CGColorRef v3;
  CGColorRef v4;
  CGColorRef v5;
  CGColorRef v6;
  CGColorRef v7;
  CGColorRef v8;
  CGGradientRef v9;
  CGColorRef v11;
  CGColorRef v12;
  CGColorRef v13;
  CGColorRef CopyWithAlpha;
  CGFloat locations[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[11];
  CGFloat components[2];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)components = xmmword_1B9877CB0;
  v23 = unk_1B9877CC0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v1 = CGColorCreate(DeviceRGB, components);
  CopyWithAlpha = CGColorCreateCopyWithAlpha(v1, 1.0);
  v21[0] = CopyWithAlpha;
  v13 = CGColorCreateCopyWithAlpha(v1, 0.872);
  v21[1] = v13;
  v12 = CGColorCreateCopyWithAlpha(v1, 0.697);
  v21[2] = v12;
  v11 = CGColorCreateCopyWithAlpha(v1, 0.536);
  v21[3] = v11;
  v2 = CGColorCreateCopyWithAlpha(v1, 0.392);
  v21[4] = v2;
  v3 = CGColorCreateCopyWithAlpha(v1, 0.268);
  v21[5] = v3;
  v4 = CGColorCreateCopyWithAlpha(v1, 0.18);
  v21[6] = v4;
  v5 = CGColorCreateCopyWithAlpha(v1, 0.119);
  v21[7] = v5;
  v6 = CGColorCreateCopyWithAlpha(v1, 0.079);
  v21[8] = v6;
  v7 = CGColorCreateCopyWithAlpha(v1, 0.059);
  v21[9] = v7;
  v8 = CGColorCreateCopyWithAlpha(v1, 0.0);
  v21[10] = v8;
  v20 = 0x3FF0000000000000;
  v17 = xmmword_1B9877CF0;
  v18 = unk_1B9877D00;
  v19 = xmmword_1B9877D10;
  *(_OWORD *)locations = xmmword_1B9877CD0;
  v16 = unk_1B9877CE0;
  v9 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 11), locations);

  CGColorRelease(v1);
  CGColorSpaceRelease(DeviceRGB);
  return v9;
}

CGGradientRef CreateMaskGradient(CGFloat a1, CGFloat a2)
{
  CGColorSpace *DeviceGray;
  CGColorRef v5;
  CGColorRef v6;
  CGGradientRef v7;
  __int128 v9;
  CGFloat v10[2];
  CGFloat components[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  components[0] = 1.0;
  components[1] = a1;
  v5 = CGColorCreate(DeviceGray, components);
  v12[0] = v5;
  v10[0] = 1.0;
  v10[1] = a2;
  v6 = CGColorCreate(DeviceGray, v10);
  v12[1] = v6;
  v9 = xmmword_1B9877C50;
  v7 = CGGradientCreateWithColors(DeviceGray, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2), (const CGFloat *)&v9);

  CGColorSpaceRelease(DeviceGray);
  return v7;
}

CGGradientRef CubeGradientCreateCopyWithAlpha()
{
  CGColorSpace *ColorSpace;
  size_t NumberOfComponents;
  size_t LocationCount;
  CGGradientRef v3;
  CGFloat *v5;
  CGFloat *v6;

  ColorSpace = (CGColorSpace *)CGGradientGetColorSpace();
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  LocationCount = CGGradientGetLocationCount();
  v5 = (CGFloat *)malloc_type_calloc(8 * NumberOfComponents + 8, LocationCount, 0xDF3CE48AuLL);
  v6 = (CGFloat *)malloc_type_calloc(8uLL, LocationCount, 0x53B41BBEuLL);
  CGGradientApply();
  v3 = CGGradientCreateWithColorComponents(ColorSpace, v5, v6, LocationCount);
  free(v6);
  free(v5);
  return v3;
}

uint64_t _CubeGradientCreateCopyWithAlphaApplier(uint64_t result, uint64_t *a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(result + 32);
  v4 = *(_QWORD *)(result + 8);
  v5 = *(_QWORD *)(result + 16);
  if (v4)
  {
    v6 = (_QWORD *)(v5 + 8 * v3 * (v4 + 1));
    v7 = a2;
    v8 = *(_QWORD *)(result + 8);
    do
    {
      v9 = *v7++;
      *v6++ = v9;
      --v8;
    }
    while (v8);
  }
  *(double *)(v5 + 8 * ((v4 + 1) * v3 + v4)) = *(double *)&a2[v4] * *(double *)result;
  *(double *)(*(_QWORD *)(result + 24) + 8 * v3) = a3;
  *(_QWORD *)(result + 32) = v3 + 1;
  return result;
}

CGColorRef CubeColorCreateInterpolated(CGColorRef color, CGColorRef a2, double a3)
{
  CGColorSpace *ColorSpace;
  CGColorSpace *v8;
  CGColorSpaceModel Model;
  size_t NumberOfComponents;
  const CGFloat *Components;
  const CGFloat *v12;
  size_t v13;
  BOOL v14;
  const CGFloat *v15;
  CGFloat *v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  CGColorRef v21;
  double v22;
  CGColor *v23;

  if (!((unint64_t)color | (unint64_t)a2))
    return 0;
  if (!color)
  {
    v22 = CGColorGetAlpha(a2) * a3;
    v23 = a2;
    return CGColorCreateCopyWithAlpha(v23, v22);
  }
  if (!a2)
  {
    v22 = (1.0 - a3) * CGColorGetAlpha(color);
    v23 = color;
    return CGColorCreateCopyWithAlpha(v23, v22);
  }
  ColorSpace = CGColorGetColorSpace(color);
  v8 = CGColorGetColorSpace(a2);
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model != CGColorSpaceGetModel(v8))
    abort();
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  Components = CGColorGetComponents(color);
  v12 = CGColorGetComponents(a2);
  v13 = NumberOfComponents + 1;
  v14 = NumberOfComponents == -1;
  v15 = (const CGFloat *)malloc_type_calloc(8 * (NumberOfComponents + 1), 1uLL, 0xCA02327DuLL);
  v16 = (CGFloat *)v15;
  if (!v14)
  {
    v17 = (double *)v15;
    do
    {
      v18 = *Components++;
      v19 = v18;
      v20 = *v12++;
      *v17++ = v19 + (v20 - v19) * a3;
      --v13;
    }
    while (v13);
  }
  v21 = CGColorCreate(ColorSpace, v15);
  free(v16);
  return v21;
}

CGGradientRef CubeGradientCreateInterpolated(uint64_t a1, uint64_t a2, double a3)
{
  CGGradientRef v3;
  uint64_t LocationCount;
  size_t v6;
  CGColorSpace *ColorSpace;
  CGColorSpace *v8;
  CGColorSpaceModel Model;
  size_t NumberOfComponents;
  size_t v11;
  double *v12;
  double *v13;
  double *v14;
  CGFloat *v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  double *v19;
  double *v20;
  double *v21;
  double *v22;
  double *v23;
  size_t v24;
  double v25;
  double v26;
  double v27;
  double *v29;
  CGFloat *v30;
  CGColorSpace *space;

  if (!(a1 | a2))
    return 0;
  if (a1 && a2)
  {
    LocationCount = CGGradientGetLocationCount();
    if (LocationCount != CGGradientGetLocationCount()
      || (v6 = CGGradientGetLocationCount(),
          ColorSpace = (CGColorSpace *)CGGradientGetColorSpace(),
          v8 = (CGColorSpace *)CGGradientGetColorSpace(),
          Model = CGColorSpaceGetModel(ColorSpace),
          Model != CGColorSpaceGetModel(v8)))
    {
      abort();
    }
    space = ColorSpace;
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
    v11 = 8 * (NumberOfComponents + 1);
    v12 = (double *)malloc_type_calloc(v11, v6, 0xEA2BD2E0uLL);
    v29 = (double *)malloc_type_calloc(v11, v6, 0x75F3B625uLL);
    v30 = (CGFloat *)malloc_type_calloc(v11, v6, 0x9607E606uLL);
    v13 = (double *)malloc_type_calloc(8uLL, v6, 0x1A021E2FuLL);
    v14 = (double *)malloc_type_calloc(8uLL, v6, 0x316EA296uLL);
    v15 = (CGFloat *)malloc_type_calloc(8uLL, v6, 0x51DF049DuLL);
    CGGradientApply();
    CGGradientApply();
    if (v6)
    {
      v16 = 0;
      v17 = 8 * NumberOfComponents + 8;
      v18 = v30;
      v19 = v29;
      v20 = v12;
      do
      {
        v15[v16] = v13[v16] + (v14[v16] - v13[v16]) * a3;
        v21 = v18;
        v22 = v19;
        v23 = v20;
        v24 = NumberOfComponents + 1;
        if (NumberOfComponents != -1)
        {
          do
          {
            v25 = *v23++;
            v26 = v25;
            v27 = *v22++;
            *v21++ = v26 + (v27 - v26) * a3;
            --v24;
          }
          while (v24);
        }
        ++v16;
        v20 = (double *)((char *)v20 + v17);
        v19 = (double *)((char *)v19 + v17);
        v18 = (double *)((char *)v18 + v17);
      }
      while (v16 != v6);
    }
    v3 = CGGradientCreateWithColorComponents(space, v30, v15, v6);
    free(v13);
    free(v14);
    free(v15);
    free(v12);
    free(v29);
    free(v30);
    return v3;
  }
  return CubeGradientCreateCopyWithAlpha();
}

_QWORD *_CubeGradientCreateInterpolatedApplier(_QWORD *result, uint64_t *a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = result[3];
  v4 = *result + 1;
  if (*result != -1)
  {
    v5 = (_QWORD *)(result[1] + 8 * v3 * v4);
    do
    {
      v6 = *a2++;
      *v5++ = v6;
      --v4;
    }
    while (v4);
  }
  *(double *)(result[2] + 8 * v3) = a3;
  result[3] = v3 + 1;
  return result;
}

double CEKPixelWidthForView(void *a1)
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = 1.0 / v2;

  return v3;
}

uint64_t CEKIsPadLayoutForWindowSizeInScreenSize(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result;
  _BOOL4 v8;

  result = a1 == 1;
  if (a2 * a3 != 0.0 && a1 == 1)
  {
    v8 = fmin(a2, a3) >= fmin(a4, a5) * 0.8;
    if (fmax(a2, a3) < fmax(a4, a5) * 0.8)
      v8 = 0;
    return a2 >= a3 || v8;
  }
  return result;
}

double CEKScrollableDistanceInScrollView(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v1 = a1;
  objc_msgSend(v1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "contentSize");
  v7 = v6 + v3 + v5;
  objc_msgSend(v1, "bounds");
  v9 = v8;

  return fmax(v7 - v9, 0.0);
}

BOOL CEKEdgeInsetsEqualToInsets(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

id CEKFontOfSizeAndStyle(uint64_t a1, CGFloat a2)
{
  return CEKFontOfSizeWeightStyle(a1, a2, *MEMORY[0x1E0DC4B90]);
}

id CEKMonospacedStylisticNumeralFontOfSizeAndStyle(uint64_t a1, CGFloat a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC4A48];
  v22[0] = *MEMORY[0x1E0DC4A58];
  v4 = v22[0];
  v22[1] = v5;
  v23[0] = &unk_1E70B3E60;
  v23[1] = &unk_1E70B3E78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v20[0] = v4;
  v20[1] = v5;
  v21[0] = &unk_1E70B3E90;
  v21[1] = &unk_1E70B3EA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  v18[0] = v4;
  v18[1] = v5;
  v19[0] = &unk_1E70B3E90;
  v19[1] = &unk_1E70B3EC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CEKFontOfSizeWeightStyle(a1, a2, *MEMORY[0x1E0DC4B90]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC4A28];
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v13, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t CEKIsCustomKerningSupportedForLocale(void *a1)
{
  void *v1;
  int v2;

  objc_msgSend(a1, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("ar"));

  return v2 ^ 1u;
}

double CEKProgress(double a1, double a2, double a3)
{
  double result;

  result = 0.0;
  if (a3 != a2)
    return (a1 - a2) / (a3 - a2);
  return result;
}

double CEKNormalizePoint(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MinX;
  double MaxX;
  double v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  MaxX = CGRectGetMaxX(v16);
  v13 = 0.0;
  if (MaxX != MinX)
    v13 = (a1 - MinX) / (MaxX - MinX);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMinY(v17);
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  CGRectGetMaxY(v18);
  return v13;
}

double CEKNormalizeSize(double a1, double a2, double a3)
{
  double result;

  result = a1 / a3;
  if (a3 == 0.0)
    return 0.0;
  return result;
}

void CEKNormalizeRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CEKNormalizePoint(a1, a2, a5, a6, a7, a8);
}

double CEKExpandNormalizedSize(double a1, double a2, double a3)
{
  return a3 * a1 + 0.0;
}

double CEKExpandNormalizedContactPoint(double a1, double a2)
{
  if (CEKExpandNormalizedContactPoint_onceToken != -1)
    dispatch_once(&CEKExpandNormalizedContactPoint_onceToken, &__block_literal_global_70);
  return CEKExpandNormalizedPoint(a1, a2, 0.0, 0.0, *(CGFloat *)&CEKExpandNormalizedContactPoint_contactFrame_2, *(CGFloat *)&CEKExpandNormalizedContactPoint_contactFrame_3);
}

double CEKSizeAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CEKSizeSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

double CEKSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CEKSizeInvert(double a1, double a2)
{
  return a2;
}

double CEKSizeMin(double a1, double a2, double a3)
{
  return fmin(a1, a3);
}

double CEKSizeMax(double a1, double a2, double a3)
{
  return fmax(a1, a3);
}

double CEKSizeCeilToScale()
{
  double v0;
  double v1;

  UICeilToScale();
  v1 = v0;
  UICeilToScale();
  return v1;
}

CGFloat CEKRectInsetsInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18 = a2 - a6;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetMaxY(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGRectGetMaxY(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetMaxX(v22);
  return v18;
}

id CEKDisplayStringForSemanticStyleMakerPreset(unint64_t a1)
{
  if (a1 > 9)
    return 0;
  CEKLocalizedFrameworkString(off_1E70A5040[a1], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CEKLocalizedFrameworkString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __CEKLocalizedFrameworkString_block_invoke;
  v8[3] = &unk_1E70A5020;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(&unk_1E70B4608, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1B984CABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CEKFrameworkBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)__CEKFrameworkBundle;
  if (!__CEKFrameworkBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("CEKLightingEffectManager")));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__CEKFrameworkBundle;
    __CEKFrameworkBundle = v1;

    v0 = (void *)__CEKFrameworkBundle;
  }
  return v0;
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

CGImage *CreateMask(int a1, void *a2, double a3, double a4, CGFloat a5)
{
  void (**v9)(id, CGContext *);
  CGColorSpace *DeviceGray;
  CGContext *v11;
  CGImage *Image;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  CGImageRef v19;

  v9 = a2;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v11 = CGBitmapContextCreate(0, (unint64_t)(a3 * a5), (unint64_t)(a4 * a5), 8uLL, (unint64_t)(a3 * a5), DeviceGray, 0);
  CGContextScaleCTM(v11, a5, a5);
  CGContextTranslateCTM(v11, a3 * 0.5, a4 * 0.5);
  v9[2](v9, v11);

  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  CGColorSpaceRelease(DeviceGray);
  if (!a1)
    return Image;
  Width = CGImageGetWidth(Image);
  Height = CGImageGetHeight(Image);
  BitsPerComponent = CGImageGetBitsPerComponent(Image);
  BitsPerPixel = CGImageGetBitsPerPixel(Image);
  BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  v19 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  CGImageRelease(Image);
  return v19;
}

void DrawPlaneGlow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v22;
  void (**v23)(_QWORD, double, double, double, double, double, double);
  void (**v24)(_QWORD, double, double, double, double, double, double, double, double);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  double *v30;
  _QWORD v31[13];
  _QWORD aBlock[13];

  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __DrawPlaneGlow_block_invoke;
  aBlock[3] = &__block_descriptor_104_e47_v56__0_CGPoint_dd_8_CGPoint_dd_24_CGPoint_dd_40l;
  *(double *)&aBlock[4] = a7;
  aBlock[5] = a5;
  aBlock[6] = a1;
  aBlock[7] = a4;
  *(double *)&aBlock[8] = a8;
  *(double *)&aBlock[9] = a9;
  *(double *)&aBlock[10] = a10;
  *(double *)&aBlock[11] = a11;
  aBlock[12] = a3;
  v23 = (void (**)(_QWORD, double, double, double, double, double, double))_Block_copy(aBlock);
  v31[0] = v22;
  v31[1] = 3221225472;
  v31[2] = __DrawPlaneGlow_block_invoke_2;
  v31[3] = &__block_descriptor_104_e61_v72__0_CGPoint_dd_8_CGPoint_dd_24_CGPoint_dd_40_CGPoint_dd_56l;
  *(double *)&v31[4] = a7;
  v31[5] = a5;
  v31[6] = a1;
  v31[7] = a4;
  *(double *)&v31[8] = a8;
  *(double *)&v31[9] = a9;
  *(double *)&v31[10] = a10;
  *(double *)&v31[11] = a11;
  v31[12] = a3;
  v24 = (void (**)(_QWORD, double, double, double, double, double, double, double, double))_Block_copy(v31);
  v25 = 0;
  do
  {
    if (((1 << v25) & a6) != 0)
    {
      ++v25;
    }
    else
    {
      v26 = v25 + 1;
      v24[2](v24, *(double *)(a2 + 16 * v25), *(double *)(a2 + 16 * v25 + 8), *(double *)(a2 + 16 * ((v25 + 1) & 3)), *(double *)(a2 + 16 * ((v25 + 1) & 3) + 8), *(double *)(a2 + 16 * (((_BYTE)v25 - 1) & 3)), *(double *)(a2 + 16 * (((_BYTE)v25 - 1) & 3) + 8), *(double *)(a2 + 16 * (((_BYTE)v25 + 2) & 3)), *(double *)(a2 + 16 * (((_BYTE)v25 + 2) & 3) + 8));
      v25 = v26;
    }
  }
  while (v25 != 4);
  if (a7 > 0.0)
  {
    v27 = 0;
    v28 = (double *)(a2 + 8);
    do
    {
      v29 = v27 + 1;
      if (((1 << v27) & a6) == 0)
      {
        v30 = (double *)(a2 + 16 * (((_BYTE)v27 - 1) & 3));
        v23[2](v23, *v30, v30[1], *(v28 - 1), *v28, *(double *)(a2 + 16 * (v29 & 3)), *(double *)(a2 + 16 * (v29 & 3) + 8));
      }
      v28 += 2;
      v27 = v29;
    }
    while (v29 != 4);
  }

}

void DrawPlaneFill(CGContext *a1, CGFloat *a2, CGColor *a3, CGImage *a4, const CGPath *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGPath *Mutable;
  uint64_t i;
  CGRect v20;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, *a2, a2[1]);
  for (i = 0; i != 6; i += 2)
    CGPathAddLineToPoint(Mutable, 0, a2[i + 2], a2[i + 3]);
  CGPathCloseSubpath(Mutable);
  CGContextSetFillColorWithColor(a1, a3);
  if (a4)
  {
    v20.origin.x = a6;
    v20.origin.y = a7;
    v20.size.width = a8;
    v20.size.height = a9;
    CGContextClipToMask(a1, v20, a4);
  }
  if (a5)
  {
    CGContextAddPath(a1, a5);
    CGContextClip(a1);
    CGContextBeginPath(a1);
  }
  CGContextAddPath(a1, Mutable);
  CGContextFillPath(a1);
  CGContextBeginPath(a1);
  CGContextResetClip(a1);
  CGPathRelease(Mutable);
}

const __CFString *CEKStringFromAnimationUpdateMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unspecified");
  else
    return off_1E70A51E0[a1 - 1];
}

id _CEKModifyFrameRateForAnimationBlockFromSettings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v17;
  float v18;
  float v19;
  float v20;
  int v21;
  CAFrameRateRange v22;

  v3 = a1;
  v4 = a2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "frameRateRange");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v4, "highFrameRateReason");

  v22.minimum = v7;
  v22.maximum = v9;
  v22.preferred = v11;
  if (!CAFrameRateRangeIsEqualToRange(v22, *MEMORY[0x1E0CD23C0]))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = ___CEKModifyFrameRateForAnimationBlockFromSettings_block_invoke;
    aBlock[3] = &unk_1E70A5148;
    v18 = v7;
    v19 = v9;
    v20 = v11;
    v21 = v12;
    v17 = v3;
    v13 = _Block_copy(aBlock);

    v5 = v13;
  }
  v14 = _Block_copy(v5);

  return v14;
}

void sub_1B9850658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9850A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9850C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9854D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1B9858654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CEKDefaultSliderPositionDriver()
{
  int AppBooleanValue;
  __objc2_class **v1;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("systemOverlay.alternateScrollModel"), CFSTR("com.apple.camera"), 0);
  v1 = &off_1E70A4070;
  if (AppBooleanValue)
    v1 = off_1E70A4068;
  return objc_alloc_init(*v1);
}

void *CEKSmartStyleAllPresetTypes()
{
  return &unk_1E70B4650;
}

void *CEKSmartStyleSystemStylePresetTypes()
{
  return &unk_1E70B4668;
}

void *CEKSmartStyleCreativeStylePresetTypes()
{
  return &unk_1E70B4680;
}

__CFString *CEKDebugStringForSmartStylePresetType(unint64_t a1)
{
  if (a1 > 0xF)
    return 0;
  else
    return off_1E70A5648[a1];
}

__CFString *CEKDebugStringForSmartStyleCastType(unint64_t a1)
{
  if (a1 > 0xE)
    return 0;
  else
    return off_1E70A54D0[a1];
}

id CEKSmartStyleIntensitySliderGradientColorsForCastType(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.741, 0.784, 0.812, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.741, 0.784, 0.812, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.851, 0.784, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.894, 0.675, 0.529, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.557, 0.235, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v27[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v27;
      goto LABEL_15;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.91, 0.91, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.965, 0.784, 0.71, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941, 0.553, 0.608, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v26[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v26;
      goto LABEL_15;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.859, 0.569, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.675, 0.329, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.867, 0.596, 0.227, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v25[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v25;
      goto LABEL_15;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.867, 0.929, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.675, 0.855, 0.988, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.588, 0.745, 0.859, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v24[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v24;
      goto LABEL_15;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.953, 0.804, 0.651, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.718, 0.761, 0.882, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v6;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = v23;
      goto LABEL_17;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.953, 0.961, 0.98, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.718, 0.761, 0.882, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v6;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = v22;
      goto LABEL_17;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.584, 0.784, 0.706, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.953, 0.804, 0.651, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.953, 0.906, 0.631, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v21[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v21;
      goto LABEL_15;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.086, 0.086, 0.086, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.667, 0.667, 0.667, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v6;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = v20;
      goto LABEL_17;
    case 9:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.137, 0.729, 1.0, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988, 0.745, 0.435, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996, 0.306, 0.451, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v19[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v19;
      goto LABEL_15;
    case 10:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.584, 0.784, 0.706, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.816, 0.745, 0.855, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.953, 0.804, 0.651, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v18[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v18;
      goto LABEL_15;
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.749, 0.557, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.757, 0.875, 0.878, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.012, 0.792, 1.0, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v17[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v17;
      goto LABEL_15;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.718, 0.824, 0.898, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.882, 0.725, 0.6, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941, 0.435, 0.341, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v16[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v16;
      goto LABEL_15;
    case 13:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.953, 0.839, 0.886, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.816, 0.745, 0.855, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v6;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.6, 0.765, 0.878, 1.0);
      v7 = objc_claimAutoreleasedReturnValue();
      v15[2] = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v15;
LABEL_15:
      objc_msgSend(v8, "arrayWithObjects:count:", v9, 3);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
      goto LABEL_18;
    case 14:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.502, 0.502, 0.502, 1.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v5;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.922, 0.922, 0.922, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v6;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = v14;
LABEL_17:
      objc_msgSend(v10, "arrayWithObjects:count:", v11, 2);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_18:

      v4 = (void *)v12;
      break;
    default:
      return v4;
  }
  return v4;
}

id CEKSmartStylePaletteColorsForCastType(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.266666667, 0.549019608, 0.796078431, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.780392157, 0.698039216, 0.6, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.6, 0.525490196, 0.458823529, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.509803922;
      v6 = 0.792156863;
      v7 = 0.611764706;
      goto LABEL_10;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 1.0, 0.796078431, 0.698039216, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 1.0, 0.898039216, 0.643137255, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0x3FEB3B3B3B3B3B3BLL;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.819607843, 0.850980392, 0.584313725, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.694117647;
      v7 = 0.901960784;
      goto LABEL_12;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.960784314, 0.960784314, 0.960784314, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.835294118, 0.835294118, 0.835294118, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.57254902, 0.57254902, 0.57254902, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.368627451;
      goto LABEL_14;
    case 9:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.792156863, 0.564705882, 0.580392157, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.384313725, 0.00784313725, 0.0117647059, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 1.0, 0.807843137, 0.439215686, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.392156863;
      v6 = 0.376470588;
      v7 = 0.235294118;
      goto LABEL_10;
    case 10:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.964705882, 0.8, 0.949019608, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.984313725, 0.890196078, 0.890196078, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.854901961, 0.980392157, 0.866666667, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.811764706;
      v6 = 0.992156863;
      v10 = 1.0;
      v7 = 0.992156863;
      goto LABEL_15;
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.474509804, 0.0980392157, 0.0823529412, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.88627451, 0.490196078, 0.290196078, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.235294118, 0.498039216, 0.380392157, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.305882353;
      v6 = 0.764705882;
      v7 = 0.862745098;
      goto LABEL_10;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.964705882, 0.776470588, 0.819607843, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.968627451, 0.815686275, 0.768627451, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.784313725, 0.921568627, 0.77254902, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.725490196;
      v6 = 0.866666667;
      v7 = 0.949019608;
LABEL_10:
      v10 = 1.0;
      goto LABEL_15;
    case 13:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.937254902, 0.48627451, 0.501960784, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.898039216, 0.792156863, 0.341176471, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0x3FE6565656565656;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.698039216, 0.784313725, 0.278431373, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.345098039;
      v7 = 0.690196078;
LABEL_12:
      v10 = 1.0;
      v6 = *(double *)&v9;
      goto LABEL_15;
    case 14:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.631372549, 0.631372549, 0.631372549, 1.0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.388235294, 0.388235294, 0.388235294, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0DC3658];
      v5 = 0.274509804;
LABEL_14:
      v10 = 1.0;
      v6 = v5;
      v7 = v5;
LABEL_15:
      objc_msgSend(v4, "colorWithDisplayP3Red:green:blue:alpha:", v5, v6, v7, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v1 = 0;
      v2 = 0;
      v3 = 0;
      v8 = 0;
      break;
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v1 && v2 && v3 && v8)
  {
    v13[0] = v1;
    v13[1] = v2;
    v13[2] = v3;
    v13[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id CEKSmartStyleRepresentativeColorForCastType(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t j;
  uint64_t k;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[128];
  double v20;
  double v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CEKSmartStylePaletteColorsForCastType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v16 = 0;
        v17 = 0;
        v18 = 0;
        if (objc_msgSend(v7, "getRed:green:blue:alpha:", &v16, &v17, &v18, 0))
        {
          for (j = 0; j != 24; j += 8)
            *(double *)((char *)&v20 + j) = *(double *)((char *)&v16 + j) + *(double *)((char *)&v20 + j);
          ++v4;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    }
    while (v3);
    if (v4 >= 1)
    {
      for (k = 0; k != 24; k += 8)
        *(double *)((char *)&v20 + k) = *(double *)((char *)&v20 + k) / (double)v4;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v20, v21, v22, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1B9860840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9860A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B98612D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9864E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B9866294(void *a1)
{
  uint64_t v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = objc_msgSend(a1, sel__contact);
  if (v3)
  {
    v11 = v3;
    v4 = 0.0;
    if (((unint64_t)objc_msgSend(v3, sel_touchPositionHints) & 0x18) == 0)
    {
      objc_msgSend(v11, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v5, v6);
      v4 = -v7;
    }
    if (qword_1EF232258 != -1)
      swift_once();
    v8 = v4 * *(double *)&qword_1EF232900;
    *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled) = v8 + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceTraveled);
    if (qword_1EF232270 != -1)
      swift_once();
    v9 = sub_1B987244C();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EF232918);
    objc_msgSend(a1, sel__timestamp);
    sub_1B9867C1C(v10, SLOBYTE(v8), 0, 1u);

  }
}

uint64_t sub_1B9866424(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v3 = sub_1B987244C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0.0;
  v8 = 0.0;
  if (a1)
  {
    v9 = objc_msgSend(a1, sel__contact);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, sel_positionDelta);
      CEKExpandNormalizedContactPoint(0.0, v11);
      v13 = v12;

      v8 = -v13;
    }
  }
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_liftoffVelocity) = v8;
  if (fabs(v8) > 0.6)
  {
    v14 = -(v8 * 0.001 - dbl_1B9878420[v8 * 0.001 < 0.0]) / log(*MEMORY[0x1E0DC5360]);
    if (qword_1EF232260 != -1)
      swift_once();
    v7 = v14 * *(double *)&qword_1EF232908;
  }
  v15 = OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate;
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit34HIDPassthroughSliderPositionDriver_distanceToDecelerate) = v7;
  if (qword_1EF232270 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v3, (uint64_t)qword_1EF232918);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v16, v3);
  if (a1)
  {
    objc_msgSend(a1, sel__timestamp);
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  sub_1B9867C1C(v18, a1 == 0, *(_QWORD *)(v1 + v15), 2u);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id sub_1B98666D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HIDPassthroughSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HIDPassthroughSliderPositionDriver()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for CGColor()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF232300)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF232300);
  }
}

id sub_1B986678C(uint64_t a1)
{
  return sub_1B986681C(a1, (SEL *)&selRef_whiteColor, &qword_1EF2323D0);
}

void sub_1B98667A0()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
  v1 = objc_msgSend(v0, sel_colorWithAlphaComponent_, 0.4);

  qword_1EF2323D8 = (uint64_t)v1;
}

id sub_1B9866808(uint64_t a1)
{
  return sub_1B986681C(a1, (SEL *)&selRef_darkGrayColor, &qword_1EF2323E0);
}

id sub_1B986681C(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), *a2);
  *a3 = result;
  return result;
}

uint64_t CEKColoredPaletteSlider.colors.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

void CEKColoredPaletteSlider.colors.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CEKColoredPaletteSlider_colors);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  sub_1B9866B18();
}

void sub_1B9866A28(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_colors);
  if (v3)
  {
    v4 = v3;
    sub_1B9867B70(0, &qword_1EF232410);
    v5 = sub_1B9872494();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_1B9866AA4(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
  {
    sub_1B9867B70(0, &qword_1EF232410);
    v3 = sub_1B9872488();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, sel_setColors_);

}

void sub_1B9866B18()
{
  char *v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  int64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v1 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  objc_msgSend(*(id *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_trackLayer], sel_removeFromSuperlayer);
  v2 = &v0[OBJC_IVAR___CEKColoredPaletteSlider_colors];
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  if (*(_QWORD *)v2)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_1B9872590();
      if (v4 >= 2)
      {
LABEL_4:
        v22 = v1;
        v23 = v0;
        v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2790]), sel_init);
        objc_msgSend(v5, sel_setStartPoint_, 0.0, 0.5);
        objc_msgSend(v5, sel_setEndPoint_, 1.0, 0.5);
        v26 = MEMORY[0x1E0DEE9D8];
        sub_1B9869A3C(0, v4, 0);
        v6 = 0;
        v7 = v26;
        do
        {
          if ((v3 & 0xC000000000000001) != 0)
            v8 = (id)MEMORY[0x1BCCC539C](v6, v3);
          else
            v8 = *(id *)(v3 + 8 * v6 + 32);
          v9 = v8;
          v10 = objc_msgSend(v8, sel_CGColor, v22, v23, (_QWORD)v24);
          type metadata accessor for CGColor();
          v25 = v11;

          *(_QWORD *)&v24 = v10;
          v26 = v7;
          v13 = *(_QWORD *)(v7 + 16);
          v12 = *(_QWORD *)(v7 + 24);
          if (v13 >= v12 >> 1)
          {
            sub_1B9869A3C(v12 > 1, v13 + 1, 1);
            v7 = v26;
          }
          ++v6;
          *(_QWORD *)(v7 + 16) = v13 + 1;
          sub_1B9867C0C(&v24, (_OWORD *)(v7 + 32 * v13 + 32));
        }
        while (v4 != v6);
        swift_bridgeObjectRelease();
        v14 = (id)sub_1B9872488();
        swift_bridgeObjectRelease();
        objc_msgSend(v5, sel_setColors_, v14);
        v1 = v22;
        v0 = v23;
        goto LABEL_26;
      }
    }
    else
    {
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4 >= 2)
        goto LABEL_4;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_1EF232250 != -1)
    swift_once();
  v14 = objc_msgSend((id)qword_1EF2323E0, sel_CGColor);
  v15 = *(_QWORD *)v2;
  if (!*(_QWORD *)v2)
  {
LABEL_25:
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD27A8]), sel_init);
    objc_msgSend(v5, sel_setBackgroundColor_, v14);
LABEL_26:

    v20 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v5;

    v21 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v21, sel_insertSublayer_atIndex_, *(_QWORD *)&v0[v1], 1);

    return;
  }
  if (!(v15 >> 62))
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16)
      goto LABEL_19;
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  if (!sub_1B9872590())
    goto LABEL_24;
LABEL_19:
  if ((v15 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x1BCCC539C](0, v15);
    goto LABEL_22;
  }
  if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(id *)(v15 + 32);
LABEL_22:
    v18 = v17;
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v18, sel_CGColor);

    v14 = v19;
    goto LABEL_25;
  }
  __break(1u);
}

char *sub_1B9866EAC(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  objc_super v27;

  *(_QWORD *)&v4[OBJC_IVAR___CEKColoredPaletteSlider_colors] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight] = 0;
  v9 = OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer;
  v10 = objc_allocWithZone(MEMORY[0x1E0CD27A8]);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_init);
  v12 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  *(_QWORD *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD27A8]), sel_init);

  v27.receiver = v11;
  v27.super_class = (Class)CEKColoredPaletteSlider;
  v13 = (char *)objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
  sub_1B9867170();
  objc_msgSend(v13, sel_addTarget_action_forControlEvents_, v13, sel_valueChanged_, 4096);
  v14 = OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer;
  v15 = qword_1EF232248;
  v16 = *(id *)&v13[OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer];
  if (v15 != -1)
    swift_once();
  v17 = objc_msgSend((id)qword_1EF2323D8, sel_CGColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  v18 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v18, sel_insertSublayer_atIndex_, *(_QWORD *)&v13[v14], 0);

  v19 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  v20 = qword_1EF232250;
  v21 = *(id *)&v13[OBJC_IVAR___CEKColoredPaletteSlider_trackLayer];
  if (v20 != -1)
    swift_once();
  v22 = objc_msgSend((id)qword_1EF2323E0, sel_CGColor);
  objc_msgSend(v21, sel_setBackgroundColor_, v22);

  v23 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v23, sel_insertSublayer_atIndex_, *(_QWORD *)&v13[v19], 1);

  v24 = (void *)sub_1B98672B8(0);
  v25 = (void *)sub_1B98672B8(1);
  objc_msgSend(v13, sel_setThumbImage_forState_, v24, 0);
  objc_msgSend(v13, sel_setThumbImage_forState_, v25, 1);
  objc_msgSend(v13, sel_setThumbImage_forState_, v25, 4);

  return v13;
}

void sub_1B9867170()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setTintColor_, v2);

  v3 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setMaximumTrackTintColor_, v3);

  v4 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setMinimumTrackTintColor_, v4);

  v5 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v5);

  v6 = objc_msgSend(v1, sel_clearColor);
  objc_msgSend(v0, sel_setThumbTintColor_, v6);

}

uint64_t sub_1B98672B8(char a1)
{
  void *v1;
  void *v2;
  double Height;
  double v5;
  double v6;
  CGFloat v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t result;
  _QWORD v14[6];
  CGRect v15;
  CGRect v16;

  v2 = v1;
  objc_msgSend(v2, sel_bounds);
  Height = CGRectGetHeight(v15);
  if ((a1 & 1) != 0)
    v5 = 4.0;
  else
    v5 = -4.0;
  if ((a1 & 1) != 0)
    v6 = Height + 4.0;
  else
    v6 = Height;
  objc_msgSend(v2, sel_bounds);
  v7 = CGRectGetHeight(v16) + v5;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3828]), sel_initWithSize_, v6, v6);
  v9 = swift_allocObject();
  *(_BYTE *)(v9 + 16) = a1;
  *(CGFloat *)(v9 + 24) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1B9867BB8;
  *(_QWORD *)(v10 + 24) = v9;
  v14[4] = sub_1B9867BD4;
  v14[5] = v10;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1B9867554;
  v14[3] = &block_descriptor;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  v12 = objc_msgSend(v8, sel_imageWithActions_, v11);

  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v8 & 1) == 0)
    return (uint64_t)v12;
  __break(1u);
  return result;
}

void sub_1B9867464(void *a1, char a2, CGFloat a3)
{
  CGContext *v6;
  double v7;
  CGColor *v8;
  CGContext *v9;
  CGRect v10;

  v6 = (CGContext *)objc_msgSend(a1, sel_CGContext);
  if (qword_1EF232240 != -1)
    swift_once();
  if ((a2 & 1) != 0)
    v7 = 0.0;
  else
    v7 = 2.0;
  v8 = (CGColor *)objc_msgSend((id)qword_1EF2323D0, sel_CGColor);
  CGContextSetFillColorWithColor(v6, v8);

  v9 = (CGContext *)objc_msgSend(a1, sel_CGContext);
  v10.origin.x = v7;
  v10.origin.y = v7;
  v10.size.width = a3;
  v10.size.height = a3;
  CGContextFillEllipseInRect(v9, v10);

}

void sub_1B9867554(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

Swift::Void __swiftcall CEKColoredPaletteSlider.layoutSubviews()()
{
  char *v0;
  uint64_t v1;
  double v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  id v34;
  double MidX;
  double v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  double Width;
  uint64_t v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v1 = OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight;
  v2 = *(double *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight];
  objc_msgSend(v0, sel_bounds);
  if (v2 != CGRectGetHeight(v44))
  {
    v3 = (void *)sub_1B98672B8(0);
    v4 = (void *)sub_1B98672B8(1);
    objc_msgSend(v0, sel_setThumbImage_forState_, v3, 0);
    objc_msgSend(v0, sel_setThumbImage_forState_, v4, 1);
    objc_msgSend(v0, sel_setThumbImage_forState_, v4, 4);

    objc_msgSend(v0, sel_bounds);
    *(CGFloat *)&v0[v1] = CGRectGetHeight(v45);
  }
  v43.receiver = v0;
  v43.super_class = (Class)CEKColoredPaletteSlider;
  objc_msgSendSuper2(&v43, sel_layoutSubviews);
  v5 = *(void **)&v0[OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v5, sel_setFrame_);
  objc_msgSend(v5, sel_bounds);
  objc_msgSend(v5, sel_setCornerRadius_, CGRectGetHeight(v46) * 0.5);
  v6 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  v7 = *(id *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_trackLayer];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v7, sel_setCornerRadius_, CGRectGetHeight(v47) * 0.5);

  v8 = (void *)objc_opt_self();
  objc_msgSend(v8, sel_begin);
  objc_msgSend(v8, sel_setDisableActions_, 1);
  objc_msgSend(v0, sel_bounds);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_trackRectForBounds_);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v0, sel_value);
  LODWORD(v42) = v25;
  objc_msgSend(v0, sel_thumbRectForBounds_trackRect_value_, v10, v12, v14, v16, v18, v20, v22, v24, v42);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v34 = *(id *)&v0[v6];
  v48.origin.x = v27;
  v48.origin.y = v29;
  v48.size.width = v31;
  v48.size.height = v33;
  MidX = CGRectGetMidX(v48);
  objc_msgSend(v0, sel_bounds);
  v36 = MidX + CGRectGetHeight(v49) * 0.5;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v34, sel_setFrame_, 0.0, 0.0, v36, CGRectGetHeight(v50));

  v37 = *(void **)&v0[v6];
  objc_opt_self();
  v38 = swift_dynamicCastObjCClass();
  if (v38)
  {
    v39 = (void *)v38;
    v40 = v37;
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v51);
    v52.origin.x = v27;
    v52.origin.y = v29;
    v52.size.width = v31;
    v52.size.height = v33;
    objc_msgSend(v39, sel_setEndPoint_, Width / CGRectGetMidX(v52), 0.5);

  }
  objc_msgSend(v8, sel_commit);
}

Swift::Bool __swiftcall CEKColoredPaletteSlider.point(inside:with:)(CGPoint inside, UIEvent_optional with)
{
  void *v2;
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;
  CGRect v8;

  y = inside.y;
  x = inside.x;
  objc_msgSend(v2, sel_bounds);
  v8 = CGRectInset(v7, -10.0, -10.0);
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v8, v6);
}

void __swiftcall CEKColoredPaletteSlider.init(coder:)(CEKColoredPaletteSlider_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void _sSo23CEKColoredPaletteSliderC13CameraEditKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_colors] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CEKColoredPaletteSlider_boundsHeight] = 0;
  v1 = OBJC_IVAR___CEKColoredPaletteSlider_backgroundLayer;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD27A8]), sel_init);
  v2 = OBJC_IVAR___CEKColoredPaletteSlider_trackLayer;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD27A8]), sel_init);

  sub_1B9872584();
  __break(1u);
}

char *keypath_get_selector_colors()
{
  return sel_colors;
}

uint64_t type metadata accessor for CEKColoredPaletteSlider(uint64_t a1)
{
  return sub_1B9867B70(a1, &qword_1EF232408);
}

uint64_t sub_1B9867B70(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B9867BA8()
{
  return swift_deallocObject();
}

void sub_1B9867BB8(void *a1)
{
  uint64_t v1;

  sub_1B9867464(a1, *(_BYTE *)(v1 + 16), *(CGFloat *)(v1 + 24));
}

uint64_t sub_1B9867BC4()
{
  return swift_deallocObject();
}

uint64_t sub_1B9867BD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

_OWORD *sub_1B9867C0C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1B9867C1C(uint64_t a1, char a2, uint64_t a3, unsigned __int8 a4)
{
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  if (qword_1EF232278 != -1)
    swift_once();
  if (byte_1EF232930 == 1)
  {
    v19 = 0x3A22657361685022;
    v20 = 0xE900000000000022;
    sub_1B9872470();
    swift_bridgeObjectRelease();
    sub_1B9872470();
    sub_1B9872470();
    if (a4 < 2u || (a2 & 1) == 0)
      sub_1B98724C4();
    sub_1B9872470();
    swift_bridgeObjectRelease();
    sub_1B9872470();
    swift_bridgeObjectRelease();
    v7 = v19;
    v6 = v20;
    if (!a4)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1B9872434();
      v13 = sub_1B98724DC();
      if (os_log_type_enabled(v8, v13))
      {
        v10 = swift_slowAlloc();
        v14 = swift_slowAlloc();
        v19 = v14;
        *(_DWORD *)v10 = 136446210;
        swift_bridgeObjectRetain();
        sub_1B9868548(v7, v6, &v19);
        sub_1B98724E8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1B9835000, v8, v13, "{%{public}s)}", (uint8_t *)v10, 0xCu);
        swift_arrayDestroy();
        v12 = v14;
        goto LABEL_13;
      }
      goto LABEL_16;
    }
    if (a4 == 1)
    {
      swift_bridgeObjectRetain();
      sub_1B9868540();
      v8 = sub_1B9872434();
      v9 = sub_1B98724DC();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = swift_slowAlloc();
        v11 = swift_slowAlloc();
        v19 = v11;
        *(_DWORD *)v10 = 136446722;
        swift_bridgeObjectRetain();
        sub_1B9868548(v7, v6, &v19);
        sub_1B98724E8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v10 + 12) = 1040;
        sub_1B98724E8();
        *(_WORD *)(v10 + 18) = 2050;
        sub_1B98724E8();
        _os_log_impl(&dword_1B9835000, v8, v9, "{%{public}s), \"ScrollTravel\": %{public}+.*f)}", (uint8_t *)v10, 0x1Cu);
        swift_arrayDestroy();
        v12 = v11;
LABEL_13:
        MEMORY[0x1BCCC5FB4](v12, -1, -1);
        MEMORY[0x1BCCC5FB4](v10, -1, -1);

        return;
      }
LABEL_16:
      swift_bridgeObjectRelease_n();

      return;
    }
    swift_bridgeObjectRetain();
    sub_1B9868540();
    v15 = sub_1B9872434();
    v16 = sub_1B98724DC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v19 = v18;
      *(_DWORD *)v17 = 136446722;
      swift_bridgeObjectRetain();
      sub_1B9868548(v7, v6, &v19);
      sub_1B98724E8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 1040;
      sub_1B98724E8();
      *(_WORD *)(v17 + 18) = 2050;
      sub_1B98724E8();
      _os_log_impl(&dword_1B9835000, v15, v16, "{%{public}s), \"DecelerationDistance\": %{public}+.*f)}", (uint8_t *)v17, 0x1Cu);
      swift_arrayDestroy();
      MEMORY[0x1BCCC5FB4](v18, -1, -1);
      MEMORY[0x1BCCC5FB4](v17, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
}

void sub_1B9868198(uint64_t a1)
{
  sub_1B98682BC(a1, 0xD00000000000001ELL, 0x80000001B9879F40, &qword_1EF232900);
}

uint64_t sub_1B98681BC()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[2];

  v1 = (void *)sub_1B9872464();
  v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_1B9872500();
    swift_unknownObjectRelease();
    sub_1B98683B4((uint64_t)v7);
    v3 = (void *)sub_1B9872464();
    objc_msgSend(v0, sel_doubleForKey_, v3);
    v5 = v4;

    return v5;
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    sub_1B98683B4((uint64_t)v7);
    return 0;
  }
}

void sub_1B9868298(uint64_t a1)
{
  sub_1B98682BC(a1, 0xD000000000000020, 0x80000001B9879C60, &qword_1EF232908);
}

void sub_1B98682BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (qword_1EF232268 != -1)
    swift_once();
  v5 = 0x3FF999999999999ALL;
  if (qword_1EF232910)
  {
    v6 = sub_1B98681BC();
    if ((v7 & 1) == 0)
      v5 = v6;
  }
  *a4 = v5;
}

void sub_1B9868348()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1B9872464();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_1EF232910 = (uint64_t)v2;
}

uint64_t sub_1B98683B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232418);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCC5F30]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B9868434()
{
  uint64_t v0;

  v0 = sub_1B987244C();
  __swift_allocate_value_buffer(v0, qword_1EF232918);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF232918);
  return sub_1B9872440();
}

void sub_1B98684B0()
{
  void *v0;
  void *v1;

  if (qword_1EF232268 != -1)
    swift_once();
  v0 = (void *)qword_1EF232910;
  if (qword_1EF232910)
  {
    v1 = (void *)sub_1B9872464();
    LOBYTE(v0) = objc_msgSend(v0, sel_BOOLForKey_, v1);

  }
  byte_1EF232930 = (char)v0;
}

uint64_t sub_1B9868540()
{
  return 0;
}

uint64_t sub_1B9868548(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B9868618(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B9868BA8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1B9868BA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B9868618(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1B98724F4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1B98687D0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1B987256C();
  if (!v8)
  {
    sub_1B9872578();
    __break(1u);
LABEL_17:
    result = sub_1B98725C0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1B98687D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B9868864(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1B9868A3C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1B9868A3C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B9868864(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1B98689D8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1B9872554();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1B9872578();
      __break(1u);
LABEL_10:
      v2 = sub_1B987247C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1B98725C0();
    __break(1u);
LABEL_14:
    result = sub_1B9872578();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1B98689D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(qword_1EF232420);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B9868A3C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF232420);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1B98725C0();
  __break(1u);
  return result;
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

uint64_t sub_1B9868BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1B9868C2C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1B9868C80()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = v0;
  v2 = *v0;
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 80);
  v4 = swift_bridgeObjectRetain();
  v5 = MEMORY[0x1BCCC52DC](v4, v3);
  swift_bridgeObjectRelease();
  if (v5 < 1)
    return sub_1B9872518();
  v6 = sub_1B9872524();
  v7 = sub_1B98724AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324F0);
  MEMORY[0x1BCCC5F48](MEMORY[0x1E0DEAF28], v7);
  sub_1B9869FAC(&qword_1EF2324F8, &qword_1EF2324F0, MEMORY[0x1E0DEC928]);
  sub_1B9872458();
  v9 = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232500);
  sub_1B9869FAC(&qword_1EF232508, &qword_1EF232500, MEMORY[0x1E0DEC940]);
  sub_1B9872458();
  MEMORY[0x1BCCC5F48](MEMORY[0x1E0DEBF90], v6);
  sub_1B98724D0();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_1B9868E5C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OverwritingRingBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OverwritingRingBuffer);
}

uint64_t sub_1B9868E8C()
{
  uint64_t v0;

  sub_1B9868C80();
  v0 = sub_1B987250C();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_1B9868ED8()
{
  return sub_1B9868E8C();
}

id sub_1B9868EF8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  objc_super v14;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_decelerationTarget] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324E8);
  v1 = swift_allocObject();
  v2 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + 16) = MEMORY[0x1E0DEE9D8];
  *(_OWORD *)(v1 + 24) = xmmword_1B98784A0;
  swift_beginAccess();
  v3 = *(_QWORD **)(v1 + 16);
  v4 = v0;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 16) = v3;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v3[3] <= 0x1BuLL)
  {
    if (v3[2] <= 0xEuLL)
      v6 = 14;
    else
      v6 = v3[2];
    v3 = sub_1B9870A98(isUniquelyReferenced_nonNull_native, v6, 0, v3);
  }
  v7 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_allSamples;
  *(_QWORD *)(v1 + 16) = v3;
  swift_endAccess();
  *(_QWORD *)&v4[v7] = v1;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v2;
  *(_OWORD *)(v8 + 24) = xmmword_1B98784B0;
  swift_beginAccess();
  v9 = *(_QWORD **)(v8 + 16);
  v10 = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v8 + 16) = v9;
  if (!(_DWORD)v10 || v9[3] <= 0xBuLL)
  {
    if (v9[2] <= 6uLL)
      v11 = 6;
    else
      v11 = v9[2];
    v9 = sub_1B9870A98(v10, v11, 0, v9);
  }
  v12 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_validSamples;
  *(_QWORD *)(v8 + 16) = v9;
  swift_endAccess();
  *(_QWORD *)&v4[v12] = v8;
  *(_QWORD *)&v4[OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime] = 0x10000000000000;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for BetterSliderPositionDriver();
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_1B98690D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BetterSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BetterSliderPositionDriver()
{
  return objc_opt_self();
}

uint64_t sub_1B98691B8()
{
  double v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  double v9;
  double *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v0 = CACurrentMediaTime();
  swift_retain();
  sub_1B986BBC0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  result = swift_release();
  v8 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v4))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v4) < 1)
      return swift_unknownObjectRelease();
    v9 = 0.0;
    if (v4 == v8)
      return swift_unknownObjectRelease();
    if (v4 < v8)
    {
      v10 = (double *)(v2 + 24 * v4 + 16);
      v11 = (v6 >> 1) - v4;
      do
      {
        v12 = *(v10 - 2);
        v13 = *v10;
        v14 = v0 - *(v10 - 1);
        v15 = 0.0;
        if (v14 < 0.18)
          v15 = pow(v14 / -0.18 + 1.0, 6.0);
        v9 = v9 + v12 / v13 * v15 * 0.83;
        v10 += 3;
        --v11;
      }
      while (v11);
      return swift_unknownObjectRelease();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B986934C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;
  unsigned __int8 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;

  v2 = v1;
  result = (uint64_t)objc_msgSend(a1, sel__contact);
  if (result)
  {
    v4 = (void *)result;
    v5 = objc_msgSend((id)result, sel_touchPositionHints);
    if ((v5 & 8) != 0 || (v5 & 0x10) != 0)
    {

      v10 = 0.0;
    }
    else
    {
      objc_msgSend(v4, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v6, v7);
      v9 = v8;

      v10 = -v9;
    }
    *(double *)(v2 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation) = v10 * 2.58
                                                                                              + *(double *)(v2 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation);
    v11 = CACurrentMediaTime();
    v12 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime;
    v13 = v11 - *(double *)(v2 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime);
    swift_retain();
    sub_1B986B7A4(v10, v11, v13);
    swift_release();
    result = BSFloatIsZero();
    if ((result & 1) == 0)
    {
      swift_retain();
      sub_1B986B7A4(v10, v11, v13);
      result = swift_release();
    }
    *(double *)(v2 + v12) = v11;
  }
  return result;
}

uint64_t sub_1B98694D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;

  swift_retain();
  sub_1B986BBC0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  result = swift_release();
  v7 = v5 >> 1;
  if (__OFSUB__(v5 >> 1, v3))
  {
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if ((uint64_t)((v5 >> 1) - v3) < 1)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  if (__OFSUB__(v3, v7))
    goto LABEL_38;
  if ((unint64_t)(v3 - v7 + 5) >= 6)
    v8 = v7 - 6;
  else
    v8 = v3;
  if (v7 < v8)
    goto LABEL_39;
  if (v8 < v3)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v9 = v7 - v8;
  if (v7 == v8)
  {
    swift_unknownObjectRetain();
    v10 = MEMORY[0x1E0DEE9D8];
    goto LABEL_11;
  }
  if (v7 <= v8)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  swift_unknownObjectRetain();
  v12 = (_QWORD *)(v1 + 24 * v8 + 16);
  v10 = MEMORY[0x1E0DEE9D8];
  do
  {
    v16 = *v12;
    v34 = *((_OWORD *)v12 - 1);
    if ((BSFloatIsZero() & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_1B9869A58(0, *(_QWORD *)(v10 + 16) + 1, 1);
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
        sub_1B9869A58(v13 > 1, v14 + 1, 1);
      *(_QWORD *)(v10 + 16) = v14 + 1;
      v15 = v10 + 24 * v14;
      *(_OWORD *)(v15 + 32) = v34;
      *(_QWORD *)(v15 + 48) = v16;
    }
    v12 += 3;
    --v9;
  }
  while (v9);
LABEL_11:
  v11 = *(_QWORD *)(v10 + 16);
  swift_release();
  if (!v11)
  {
    swift_unknownObjectRelease_n();
    return 1;
  }
  if (v11 > 2)
  {
    swift_unknownObjectRelease_n();
    return 0;
  }
  v17 = CACurrentMediaTime();
  swift_retain();
  sub_1B986BBC0();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  result = swift_release();
  v24 = v23 >> 1;
  v25 = (v23 >> 1) - v21;
  if (__OFSUB__(v23 >> 1, v21))
    goto LABEL_42;
  if (v25 < 1)
  {
    swift_unknownObjectRelease();
    v27 = 0.0;
    goto LABEL_31;
  }
  v26 = 0.0;
  if (v21 == v24)
  {
LABEL_29:
    swift_unknownObjectRelease();
    v27 = v26 / (double)v25;
LABEL_31:
    swift_unknownObjectRelease_n();
    return CGFAbs(v27) <= 90.0;
  }
  if (v21 < v24)
  {
    v28 = (double *)(v19 + 24 * v21 + 16);
    v29 = (v23 >> 1) - v21;
    do
    {
      v30 = *(v28 - 2);
      v31 = *v28;
      v32 = v17 - *(v28 - 1);
      v33 = 0.0;
      if (v32 < 0.18)
        v33 = pow(v32 / -0.18 + 1.0, 6.0);
      v26 = v26 + v30 / v31 * v33 * 0.83;
      v28 += 3;
      --v29;
    }
    while (v29);
    goto LABEL_29;
  }
LABEL_43:
  __break(1u);
  return result;
}

void sub_1B98697F4()
{
  double v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  double v8;
  double *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v0 = CACurrentMediaTime();
  swift_retain();
  sub_1B986BBC0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  swift_release();
  v7 = v6 >> 1;
  if (__OFSUB__(v6 >> 1, v4))
  {
    __break(1u);
  }
  else
  {
    if ((uint64_t)((v6 >> 1) - v4) < 1 || (v8 = 0.0, v4 == v7))
    {
LABEL_4:
      swift_unknownObjectRelease();
      log(*MEMORY[0x1E0DC5360]);
      return;
    }
    if (v4 < v7)
    {
      v9 = (double *)(v2 + 24 * v4 + 16);
      v10 = (v6 >> 1) - v4;
      do
      {
        v11 = *(v9 - 2);
        v12 = *v9;
        v13 = v0 - *(v9 - 1);
        v14 = 0.0;
        if (v13 < 0.18)
          v14 = pow(v13 / -0.18 + 1.0, 6.0);
        v8 = v8 + v11 / v12 * v14 * 0.83;
        v9 += 3;
        --v10;
      }
      while (v10);
      goto LABEL_4;
    }
  }
  __break(1u);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BetterSliderPositionDriver.DeltaSample(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BetterSliderPositionDriver.DeltaSample(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BetterSliderPositionDriver.DeltaSample()
{
  return &type metadata for BetterSliderPositionDriver.DeltaSample;
}

uint64_t sub_1B9869A3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1B9869A74(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1B9869A58(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1B9869BE0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1B9869A74(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF232510);
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
  result = sub_1B98725C0();
  __break(1u);
  return result;
}

uint64_t sub_1B9869BE0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324E0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1B98725C0();
  __break(1u);
  return result;
}

void sub_1B9869D58()
{
  uint64_t v0;
  uint64_t v1;
  CFTimeInterval v2;
  uint64_t v3;

  v1 = v0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_translation) = 0;
  swift_retain();
  sub_1B986BB10();
  swift_release();
  swift_retain();
  sub_1B986BB10();
  swift_release();
  v2 = CACurrentMediaTime();
  v3 = OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime;
  *(CFTimeInterval *)(v1 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_lastUpdateTime) = v2;
  *(CFTimeInterval *)(v1 + v3) = CACurrentMediaTime();
}

void sub_1B9869DD8()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  char v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v1 = CACurrentMediaTime();
  swift_retain();
  sub_1B986BBC0();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  swift_release();
  v8 = v7 >> 1;
  v9 = (v7 >> 1) - v5;
  if (__OFSUB__(v7 >> 1, v5))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v9 < 1)
  {
    swift_unknownObjectRelease();
    v11 = 0.0;
    goto LABEL_6;
  }
  v10 = 0.0;
  if (v5 != v8)
  {
    if (v5 < v8)
    {
      v14 = (double *)(v3 + 24 * v5 + 16);
      v15 = (v7 >> 1) - v5;
      do
      {
        v16 = *(v14 - 2);
        v17 = *v14;
        v18 = v1 - *(v14 - 1);
        v19 = 0.0;
        if (v18 < 0.18)
          v19 = pow(v18 / -0.18 + 1.0, 6.0);
        v10 = v10 + v16 / v17 * v19 * 0.83;
        v14 += 3;
        --v15;
      }
      while (v15);
      goto LABEL_4;
    }
LABEL_16:
    __break(1u);
    return;
  }
LABEL_4:
  swift_unknownObjectRelease();
  v11 = v10 / (double)v9;
LABEL_6:
  v12 = sub_1B98694D0();
  v13 = 0;
  if ((v12 & 1) == 0 && fabs(v11) > 0.6)
    sub_1B98697F4();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit26BetterSliderPositionDriver_decelerationTarget) = v13;
}

double CGFAbs(double a1)
{
  return fabs(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCC5F3C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B9869FAC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCCC5F48](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1BCCC5F00](a1, v6, a5);
}

unint64_t sub_1B986A018(uint64_t a1)
{
  unint64_t result;

  result = sub_1B986A03C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B986A03C()
{
  unint64_t result;

  result = qword_1EF232520;
  if (!qword_1EF232520)
  {
    result = MEMORY[0x1BCCC5F48](MEMORY[0x1E0DEF068], MEMORY[0x1E0DEF040]);
    atomic_store(result, (unint64_t *)&qword_1EF232520);
  }
  return result;
}

_QWORD *sub_1B986A200(_QWORD *result, double a2)
{
  uint64_t v2;
  double v3;

  v3 = *(double *)(v2 + *result);
  *(double *)(v2 + *result) = a2;
  if (v3 != a2)
  {
    result = (_QWORD *)MEMORY[0x1BCCC6008](v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
    if (result)
    {
      objc_msgSend(result, sel_tickMarksModelDidChangeWidthForTickMarkCountWithModel_, v2);
      return (_QWORD *)swift_unknownObjectRelease();
    }
  }
  return result;
}

void *sub_1B986A314(void *result, _QWORD *a2)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + *a2);
  *(_QWORD *)(v2 + *a2) = result;
  if (v3 != result)
  {
    result = (void *)MEMORY[0x1BCCC6008](v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
    if (result)
    {
      objc_msgSend(result, sel_tickMarksModelDidChangeWidthForTickMarkCountWithModel_, v2);
      return (void *)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1B986A498(uint64_t result, _QWORD *a2, SEL *a3)
{
  uint64_t v3;
  int v4;

  v4 = *(unsigned __int8 *)(v3 + *a2);
  *(_BYTE *)(v3 + *a2) = result;
  if (v4 != (result & 1))
  {
    result = MEMORY[0x1BCCC6008](v3 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
    if (result)
    {
      objc_msgSend((id)result, *a3, v3);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_1B986A53C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v7[6];

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor);
  if (v1)
  {
    v2 = *(id *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor);
  }
  else if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows) == 1)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  }
  else
  {
    v3 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
    v7[4] = sub_1B986A890;
    v7[5] = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 1107296256;
    v7[2] = sub_1B986B17C;
    v7[3] = &block_descriptor_4;
    v4 = _Block_copy(v7);
    v2 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
    _Block_release(v4);
    swift_release();
  }
  v5 = v1;
  return v2;
}

id sub_1B986A6B4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);
  if (v1)
  {
    v2 = *(id *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor);
  }
  else if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows) == 1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    v2 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.6);

  }
  else
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
    v8[4] = sub_1B986A8A0;
    v8[5] = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 1107296256;
    v8[2] = sub_1B986B17C;
    v8[3] = &block_descriptor_0;
    v5 = _Block_copy(v8);
    v2 = objc_msgSend(v4, sel_initWithDynamicProvider_, v5);
    _Block_release(v5);
    swift_release();
  }
  v6 = v1;
  return v2;
}

void sub_1B986A824(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(v2 + *a2);
  *(_QWORD *)(v2 + *a2) = a1;
  v5 = a1;

  v4 = (void *)MEMORY[0x1BCCC6008](v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_delegate);
  if (v4)
  {
    objc_msgSend(v4, sel_tickMarksModelDidChangeAppearanceWithModel_, v2);
    swift_unknownObjectRelease();
  }

}

id sub_1B986A890(void *a1)
{
  return sub_1B986A8B4(a1, (SEL *)&selRef_secondaryLabelColor, 0.75);
}

id sub_1B986A8A0(void *a1)
{
  return sub_1B986A8B4(a1, (SEL *)&selRef_quaternaryLabelColor, 0.4);
}

id sub_1B986A8B4(void *a1, SEL *a2, double a3)
{
  if (objc_msgSend(a1, sel_userInterfaceStyle) == (id)2)
    return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithWhite_alpha_, a3, 1.0);
  else
    return objc_msgSend((id)objc_opt_self(), *a2);
}

double sub_1B986A950()
{
  uint64_t v0;
  double result;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) != 1)
    return *(double *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth)
         + *(double *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
         * ((double)*(unint64_t *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount) + -1.0);
  sub_1B986A9A4();
  return result;
}

void sub_1B986A9A4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
  if (v1)
  {
    v2 = v1 - 1;
    if (v2)
      log10(1.0 / (double)v2 * 9.0 + 1.0);
  }
}

void sub_1B986AA28(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
  {
    v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v2)
    {
      v3 = v2 - 1;
      if (v3)
        log10((double)a1 / (double)v3 * 9.0 + 1.0);
      sub_1B986A9A4();
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1BCCC6008](v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v4)
    {
      objc_msgSend(v4, sel_alignmentRectInsets);
      swift_unknownObjectRelease();
    }
  }
}

long double sub_1B986AB60(long double a1)
{
  uint64_t v1;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = (void *)MEMORY[0x1BCCC6008](v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
  if (v3)
  {
    objc_msgSend(v3, sel_alignmentRectInsets);
    v5 = v4;
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = 0.0;
  }
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) & 1) != 0)
  {
    sub_1B986A9A4();
    v7 = v6;
    v8 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    if (a1 >= 0.0)
      a1 = log10(a1 * 9.0 + 1.0);
    else
      a1 = 0.0;
  }
  else
  {
    v8 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    v7 = v8
       + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
       * ((double)*(unint64_t *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount) + -1.0);
  }
  return v5 + a1 * (v7 - v8);
}

double sub_1B986AC98(double a1, double a2)
{
  uint64_t v2;
  int v4;
  double v5;

  v4 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic);
  v5 = CEKClamp(a1, 0.0, 1.0);
  if (v4 == 1)
    v5 = (__exp10(v5) + -1.0) / 9.0;
  return v5 * a2;
}

void sub_1B986AD3C(double a1)
{
  uint64_t v1;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  double v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  double v18;

  v3 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
  {
    sub_1B986A9A4();
    v5 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
  }
  else
  {
    v5 = *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    v4 = v5
       + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
       * ((double)*(unint64_t *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount) + -1.0);
  }
  v6 = v4 - v5;
  if (v4 - v5 > 0.0)
  {
    v7 = (void *)MEMORY[0x1BCCC6008](v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v7)
    {
      objc_msgSend(v7, sel_alignmentRectInsets);
      v9 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0.0;
    }
    v10 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount;
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    v12 = v11 - 1;
    if (!v11)
    {
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    v13 = *(unsigned __int8 *)(v1 + v3);
    v14 = CEKClamp((a1 - v9) / v6, 0.0, 1.0);
    if (v13 == 1)
      v14 = (__exp10(v14) + -1.0) / 9.0;
    v15 = *(_QWORD *)(v1 + v10);
    v16 = v15 != 0;
    v17 = v15 - 1;
    if (!v16)
      goto LABEL_19;
    v18 = CEKClamp(v14 * (double)v12, 0.0, (double)v17);
    if ((~*(_QWORD *)&v18 & 0x7FF0000000000000) == 0)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if (v18 <= -1.0)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    if (v18 >= 1.84467441e19)
LABEL_22:
      __break(1u);
  }
}

BOOL sub_1B986AF04(_BOOL8 result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent) == 1)
  {
    if (!result)
      return 1;
    v2 = result + 1;
    if (__OFADD__(result, 1))
      goto LABEL_16;
    if ((v2 & 0x8000000000000000) == 0
      && v2 == *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount))
    {
      return 1;
    }
  }
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset);
  v4 = __OFADD__(result, v3);
  v5 = result + v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_15;
  }
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval);
  if (!v6)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v5 != 0x8000000000000000 || v6 != -1)
    return v5 % v6 == 0;
LABEL_17:
  __break(1u);
  return result;
}

id sub_1B986AFC4()
{
  _BYTE *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing] = 0x402E000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth] = 0x3FF0000000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval] = 3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset] = 0;
  v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic] = 0;
  v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent] = 0;
  v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_useTickMarkLegibilityShadows] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__primaryTickMarkColor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit14TickMarksModel__secondaryTickMarkColor] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_1B986B0D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TickMarksModel()
{
  return objc_opt_self();
}

id sub_1B986B17C(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
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

uint64_t sub_1B986B1E4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

double sub_1B986B270()
{
  uint64_t v0;
  double *v1;
  double result;
  double v3;
  double *v4;
  double v5;

  v1 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
  result = 0.0;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24) & 1) == 0)
  {
    v3 = v1[2];
    if (v3 <= 0.0025)
      v3 = 0.0025;
    result = *v1 / v3;
  }
  v4 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample + 24) & 1) == 0)
  {
    v5 = v4[2];
    if (v5 <= 0.0025)
      v5 = 0.0025;
    return result * 0.2 + *v4 / v5 * 0.8;
  }
  return result;
}

void sub_1B986B33C(void *a1)
{
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double Current;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  double v12;
  id v13;

  v2 = objc_msgSend(a1, sel__contact);
  if (v2)
  {
    v13 = v2;
    v3 = 0.0;
    if (((unint64_t)objc_msgSend(v2, sel_touchPositionHints) & 0x18) == 0)
    {
      objc_msgSend(v13, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v4, v5);
      v3 = -v6;
    }
    *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = v3 + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled);
    Current = CFAbsoluteTimeGetCurrent();
    v8 = v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample;
    v9 = *(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24);
    v10 = v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample;
    v11 = *(_OWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 8);
    v12 = Current - *(double *)&v11;
    if (v9)
      v12 = 0.0;
    *(_QWORD *)v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
    *(_OWORD *)(v10 + 8) = v11;
    *(_BYTE *)(v10 + 24) = v9;
    *(double *)v8 = v3;
    *(double *)(v8 + 8) = Current;
    *(double *)(v8 + 16) = v12;
    *(_BYTE *)(v8 + 24) = 0;

  }
}

long double sub_1B986B494()
{
  uint64_t v0;
  double *v1;
  double v2;
  double v3;
  double *v4;
  double v5;

  v1 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
  v2 = 0.0;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24) & 1) == 0)
  {
    v3 = v1[2];
    if (v3 <= 0.0025)
      v3 = 0.0025;
    v2 = *v1 / v3;
  }
  v4 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample + 24) & 1) == 0)
  {
    v5 = v4[2];
    if (v5 <= 0.0025)
      v5 = 0.0025;
    v2 = v2 * 0.2 + *v4 / v5 * 0.8;
  }
  return -(v2 * 0.001 - dbl_1B9878420[v2 * 0.001 < 0.0]) / log(*MEMORY[0x1E0DC5360]);
}

id sub_1B986B5EC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasicSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BasicSliderPositionDriver()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for BasicSliderPositionDriver.VelocitySample()
{
  return &type metadata for BasicSliderPositionDriver.VelocitySample;
}

void sub_1B986B64C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double Current;
  char v4;
  __int128 v5;
  double v6;

  *(_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceTraveled) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = 0;
  v1 = v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample;
  *(_QWORD *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 24) = 1;
  v2 = v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample;
  *(_QWORD *)(v2 + 8) = 0;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 24) = 1;
  Current = CFAbsoluteTimeGetCurrent();
  v4 = *(_BYTE *)(v1 + 24);
  v5 = *(_OWORD *)(v1 + 8);
  v6 = Current - *(double *)&v5;
  if (v4)
    v6 = 0.0;
  *(_QWORD *)v2 = *(_QWORD *)v1;
  *(_OWORD *)(v2 + 8) = v5;
  *(_BYTE *)(v2 + 24) = v4;
  *(_QWORD *)v1 = 0;
  *(double *)(v1 + 8) = Current;
  *(double *)(v1 + 16) = v6;
  *(_BYTE *)(v1 + 24) = 0;
}

void sub_1B986B6EC()
{
  uint64_t v0;
  double *v1;
  double v2;
  double v3;
  double *v4;
  double v5;
  double v6;
  double v7;

  v1 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample);
  v2 = 0.0;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_latestSample + 24) & 1) == 0)
  {
    v3 = v1[2];
    if (v3 <= 0.0025)
      v3 = 0.0025;
    v2 = *v1 / v3;
  }
  v4 = (double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_previousSample + 24) & 1) == 0)
  {
    v5 = v4[2];
    if (v5 <= 0.0025)
      v5 = 0.0025;
    v2 = v2 * 0.2 + *v4 / v5 * 0.8;
  }
  v6 = fabs(v2);
  v7 = 0.0;
  if (v6 > 0.6)
    v7 = sub_1B986B494();
  *(double *)(v0 + OBJC_IVAR____TtC13CameraEditKit25BasicSliderPositionDriver_distanceToDecelerate) = v7;
}

uint64_t sub_1B986B7A4(double a1, double a2, double a3)
{
  _QWORD *v3;
  uint64_t *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  double *v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  v7 = v3 + 2;
  swift_beginAccess();
  if (*(_QWORD *)(v3[2] + 16) >= v3[4])
  {
    v13 = v3[3];
    swift_beginAccess();
    v8 = (_QWORD *)v3[2];
    result = swift_isUniquelyReferenced_nonNull_native();
    v3[2] = v8;
    if ((result & 1) != 0)
    {
      if ((v13 & 0x8000000000000000) == 0)
        goto LABEL_8;
    }
    else
    {
      result = (uint64_t)sub_1B9870DD4(v8);
      v8 = (_QWORD *)result;
      *v7 = result;
      if ((v13 & 0x8000000000000000) == 0)
      {
LABEL_8:
        if (v13 < v8[2])
        {
          v12 = (double *)&v8[3 * v13];
          goto LABEL_10;
        }
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_beginAccess();
  v8 = (_QWORD *)*v7;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = (uint64_t)v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_17;
  while (1)
  {
    v11 = v8[2];
    v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      v8 = sub_1B9870A98((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
      *v7 = (uint64_t)v8;
    }
    v8[2] = v11 + 1;
    v12 = (double *)&v8[3 * v11];
LABEL_10:
    v12[4] = a1;
    v12[5] = a2;
    v12[6] = a3;
    result = swift_endAccess();
    v15 = v3[3];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
    {
      __break(1u);
      goto LABEL_16;
    }
    v18 = v3[4];
    if (v18)
      break;
LABEL_16:
    __break(1u);
LABEL_17:
    v8 = sub_1B9870A98(0, v8[2] + 1, 1, v8);
    *v7 = (uint64_t)v8;
  }
  if (v17 != 0x8000000000000000 || v18 != -1)
  {
    v3[3] = v17 % v18;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1B986B95C(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  uint64_t *v9;
  _QWORD *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  double *v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v9 = v4 + 2;
  swift_beginAccess();
  if (*(_QWORD *)(v4[2] + 16) >= v4[4])
  {
    v15 = v4[3];
    swift_beginAccess();
    v10 = (_QWORD *)v4[2];
    result = swift_isUniquelyReferenced_nonNull_native();
    v4[2] = v10;
    if ((result & 1) != 0)
    {
      if ((v15 & 0x8000000000000000) == 0)
        goto LABEL_8;
    }
    else
    {
      result = (uint64_t)sub_1B9870DE8(v10);
      v10 = (_QWORD *)result;
      *v9 = result;
      if ((v15 & 0x8000000000000000) == 0)
      {
LABEL_8:
        if (v15 < v10[2])
        {
          v14 = (double *)&v10[4 * v15];
          goto LABEL_10;
        }
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_beginAccess();
  v10 = (_QWORD *)*v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v9 = (uint64_t)v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_17;
  while (1)
  {
    v13 = v10[2];
    v12 = v10[3];
    if (v13 >= v12 >> 1)
    {
      v10 = sub_1B9870BBC((_QWORD *)(v12 > 1), v13 + 1, 1, v10);
      *v9 = (uint64_t)v10;
    }
    v10[2] = v13 + 1;
    v14 = (double *)&v10[4 * v13];
LABEL_10:
    v14[4] = a1;
    v14[5] = a2;
    v14[6] = a3;
    v14[7] = a4;
    result = swift_endAccess();
    v17 = v4[3];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
    {
      __break(1u);
      goto LABEL_16;
    }
    v20 = v4[4];
    if (v20)
      break;
LABEL_16:
    __break(1u);
LABEL_17:
    v10 = sub_1B9870BBC(0, v10[2] + 1, 1, v10);
    *v9 = (uint64_t)v10;
  }
  if (v19 != 0x8000000000000000 || v20 != -1)
  {
    v4[3] = v19 % v20;
    return result;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1B986BB10()
{
  return sub_1B986BB24((void (*)(_QWORD, _QWORD))sub_1B986DDE0, (uint64_t (*)(_QWORD, _QWORD))sub_1B986CB18);
}

uint64_t sub_1B986BB24(void (*a1)(_QWORD, _QWORD), uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t result;

  v5 = v2;
  v6 = (_QWORD *)(v2 + 16);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *(_QWORD *)(v5 + 16);
  if (isUniquelyReferenced_nonNull_native)
  {
    a1(0, *(_QWORD *)(v8 + 16));
  }
  else
  {
    *v6 = a2(0, *(_QWORD *)(v8 + 24) >> 1);
    swift_bridgeObjectRelease();
  }
  result = swift_endAccess();
  *(_QWORD *)(v5 + 24) = 0;
  return result;
}

uint64_t sub_1B986BBC0()
{
  return sub_1B986BBCC((void (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_1B986E4C8);
}

uint64_t sub_1B986BBCC(void (*a1)(uint64_t, uint64_t, _QWORD, uint64_t))
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
    return MEMORY[0x1E0DEE9D8];
  v6 = *(_QWORD *)(v1 + 24);
  if (v5 < v6)
  {
    __break(1u);
  }
  else if ((v6 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(v1 + 16);
    v7 = (2 * v6) | 1;
    swift_bridgeObjectRetain_n();
    a1(v4, v4 + 32, 0, v7);
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B986BC9C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  result = swift_beginAccess();
  v4 = v1[2];
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    v13 = 0uLL;
    v14 = 0uLL;
    goto LABEL_10;
  }
  v6 = v1[3];
  v7 = v6 - 1;
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  v8 = v1[4];
  v9 = __OFADD__(v7, v8);
  v10 = v7 + v8;
  if (v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v8)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v8 == -1 && v10 == 0x8000000000000000)
    goto LABEL_15;
  v11 = v10 % v8;
  if (v11 < v5)
  {
    v12 = v4 + 32 * v11;
    v13 = *(_OWORD *)(v12 + 32);
    v14 = *(_OWORD *)(v12 + 48);
LABEL_10:
    *(_OWORD *)a1 = v13;
    *(_OWORD *)(a1 + 16) = v14;
    *(_BYTE *)(a1 + 32) = v5 == 0;
    return result;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1B986BD58()
{
  sub_1B9872548();
  sub_1B9872470();
  sub_1B98724B8();
  sub_1B9872470();
  swift_bridgeObjectRelease();
  sub_1B9872470();
  sub_1B98724B8();
  sub_1B9872470();
  swift_bridgeObjectRelease();
  sub_1B9872470();
  sub_1B98724C4();
  sub_1B9872470();
  sub_1B98724B8();
  sub_1B9872470();
  swift_bridgeObjectRelease();
  sub_1B9872470();
  return 0;
}

uint64_t sub_1B986BEA0()
{
  return sub_1B986BD58();
}

void sub_1B986BF24(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[40];
  _BYTE v17[16];
  double v18;
  char v19;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate) = 0;
  sub_1B986BB24((void (*)(_QWORD, _QWORD))sub_1B986DF40, (uint64_t (*)(_QWORD, _QWORD))sub_1B986CB9C);
  v3 = v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample;
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_BYTE *)(v3 + 32) = 1;
  v4 = objc_msgSend(a1, sel__contact);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_position);
    v8 = CEKExpandNormalizedContactPoint(v6, v7);
    v10 = -v9;
    objc_msgSend(a1, sel__timestamp, v8);
    v12 = v11;
    sub_1B986BC9C((uint64_t)v16);
    sub_1B986EEA0((uint64_t)v16, (uint64_t)v17);
    if (v19)
      v13 = 0.0;
    else
      v13 = v12 - v18;
    sub_1B986B95C(v10, 0.0, v12, v13);
    if (qword_1EF232270 != -1)
      swift_once();
    v14 = sub_1B987244C();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EF232918);
    objc_msgSend(a1, sel__timestamp);
    sub_1B9867C1C(v15, 0, 0, 0);

  }
}

void sub_1B986C0E8(void *a1)
{
  uint64_t v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  int v22;
  char v23;
  double v24;
  unsigned int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  char v34;
  id v35;
  _BYTE v36[40];
  _BYTE v37[40];
  _BYTE v38[16];
  double v39;
  char v40;
  _QWORD v41[4];
  char v42;

  v3 = objc_msgSend(a1, sel__contact);
  if (v3)
  {
    v35 = v3;
    v4 = 0.0;
    if (((unint64_t)objc_msgSend(v3, sel_touchPositionHints) & 0x18) == 0)
    {
      objc_msgSend(v35, sel_positionDelta);
      CEKExpandNormalizedContactPoint(v5, v6);
      v4 = -v7;
    }
    if (qword_1EF232258 != -1)
      swift_once();
    v8 = v4 * *(double *)&qword_1EF232900;
    objc_msgSend(a1, sel__timestamp);
    v10 = v9;
    v11 = OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled;
    *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled) = v8 + *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled);
    if (qword_1EF232270 != -1)
      swift_once();
    v12 = sub_1B987244C();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EF232918);
    sub_1B9867C1C(*(uint64_t *)&v10, SLOBYTE(v8), 0, 1u);
    if (*(double *)(v1 + v11) == 0.0)
    {

      return;
    }
    sub_1B986BC9C((uint64_t)v36);
    sub_1B986EEA0((uint64_t)v36, (uint64_t)v41);
    if (v42 == 1)
      goto LABEL_34;
    v13 = *(double *)v41;
    v14 = *(double *)&v41[2];
    objc_msgSend(v35, sel_position);
    CEKExpandNormalizedContactPoint(v15, v16);
    v18 = -v17;
    sub_1B986C7D0();
    v20 = v19;
    v21 = v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample;
    v22 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample + 32);
    if (((unint64_t)objc_msgSend(v35, sel_touchPositionHints) & 0x18) != 0
      || (((unint64_t)objc_msgSend(v35, sel_touchPositionHints) & 4) == 0 ? (v23 = 1) : (v23 = v22),
          (v23 & 1) == 0))
    {
      sub_1B986C720();
      v27 = 0.0;
    }
    else
    {
      v24 = v18 - v13;
      v25 = v22 & (objc_msgSend(v35, sel_touchPositionHints) >> 2);
      v26 = (v10 - v14) * v20;
      if (fabs(v26) >= fabs(v24))
        v26 = v24;
      if (v25 == 1)
        v27 = v26;
      else
        v27 = v24;
    }
    sub_1B986BC9C((uint64_t)v37);
    sub_1B986EEA0((uint64_t)v37, (uint64_t)v38);
    if (v40)
      v28 = 0.0;
    else
      v28 = v10 - v39;
    sub_1B986B95C(v18, v27, v10, v28);
    v29 = 0.00001;
    if (v28 > 0.00001)
      v29 = v28;
    v30 = v27 / v29;
    if (fabs(v30) < 50.0 || v20 * v30 < 0.0)
    {
      if ((v22 & 1) == 0)
      {
LABEL_34:
        v31 = v35;
LABEL_35:

        return;
      }
LABEL_33:
      *(double *)v21 = v18;
      *(double *)(v21 + 8) = v27;
      *(double *)(v21 + 16) = v10;
      *(double *)(v21 + 24) = v28;
      *(_BYTE *)(v21 + 32) = 0;
      sub_1B986C720();
      goto LABEL_34;
    }
    if (objc_msgSend(a1, sel__stage) == (id)4)
    {
      if (!v22)
        goto LABEL_34;
      goto LABEL_33;
    }
    v31 = v35;
    if (v22)
      goto LABEL_35;
    v32 = *(double *)v21;
    v33 = *(double *)(v21 + 16);
    v34 = *(_BYTE *)(v21 + 32);

    if ((v34 & 1) == 0 && v10 - v33 > 0.05 && vabdd_f64(v18, v32) > 10.0)
    {
      *(_OWORD *)v21 = 0u;
      *(_OWORD *)(v21 + 16) = 0u;
      *(_BYTE *)(v21 + 32) = 1;
    }
  }
}

uint64_t sub_1B986C4B0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v3 = sub_1B987244C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a1, sel__contact);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, sel_touchPositionHints);
    v10 = (v9 & 8) == 0 && (v9 & 0x10) == 0;
  }
  else
  {
    v10 = 0;
  }
  sub_1B986C7D0();
  v12 = 0.0;
  if (v10
    && fabs(v11) > 0.6
    && *(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample + 32) == 1)
  {
    v13 = log(*MEMORY[0x1E0DC5360]);
    sub_1B986C7D0();
    v15 = -(v14 * 0.001 - dbl_1B9878420[v14 * 0.001 < 0.0]) / v13;
    if (qword_1EF232260 != -1)
      swift_once();
    v12 = v15 * *(double *)&qword_1EF232908;
  }
  v16 = OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate;
  *(double *)(v1 + OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate) = v12;
  if (qword_1EF232270 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v3, (uint64_t)qword_1EF232918);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v17, v3);
  if (a1)
  {
    objc_msgSend(a1, sel__timestamp);
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }
  sub_1B9867C1C(v19, a1 == 0, *(_QWORD *)(v1 + v16), 2u);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1B986C720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  BOOL v7;
  uint64_t v8;
  double *v9;

  sub_1B986BBCC((void (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_1B986EBC8);
  v1 = v0;
  v3 = v2;
  v5 = v4;
  result = sub_1B986BB24((void (*)(_QWORD, _QWORD))sub_1B986DF40, (uint64_t (*)(_QWORD, _QWORD))sub_1B986CB9C);
  v7 = __OFSUB__(v5 >> 1, v3);
  v8 = (v5 >> 1) - v3;
  if (!v8)
    return swift_unknownObjectRelease();
  if (!((v8 < 0) ^ v7 | (v8 == 0)))
  {
    swift_unknownObjectRetain();
    v9 = (double *)(v1 + 32 * v3 + 24);
    do
    {
      sub_1B986B95C(*(v9 - 3), 0.0, *(v9 - 1), *v9);
      v9 += 4;
      --v8;
    }
    while (v8);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B986C7D0()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  double *v9;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double *v14;
  double v15;
  double v16;
  double v17;

  result = sub_1B986BBCC((void (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_1B986EBC8);
  v4 = v2;
  v5 = v3 >> 1;
  v6 = 0.0;
  v7 = (v3 >> 1) - v2;
  if (v3 >> 1 == v2)
    goto LABEL_16;
  if ((uint64_t)(v3 >> 1) <= v2)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  if (v7 < 2)
  {
    v8 = v2;
LABEL_12:
    v13 = v5 - v8;
    v14 = (double *)(v1 + 32 * v8 + 24);
    do
    {
      v15 = *(v14 - 2);
      v16 = *v14;
      v14 += 4;
      v17 = v16;
      if (v16 <= 0.00001)
        v17 = 0.00001;
      v6 = v6 + v15 / v17;
      --v13;
    }
    while (v13);
    goto LABEL_16;
  }
  v8 = v2 + (v7 & 0xFFFFFFFFFFFFFFFELL);
  v9 = (double *)(v1 + 32 * v2 + 40);
  v10 = v7 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    v11 = *(v9 - 2);
    v12 = v9[2];
    if (v11 <= 0.00001)
      v11 = 0.00001;
    if (v12 <= 0.00001)
      v12 = 0.00001;
    v6 = v6 + *(v9 - 4) / v11 + *v9 / v12;
    v9 += 8;
    v10 -= 2;
  }
  while (v10);
  if (v7 != (v7 & 0xFFFFFFFFFFFFFFFELL))
    goto LABEL_12;
LABEL_16:
  result = swift_unknownObjectRelease();
  if (__OFSUB__(v5, v4))
  {
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

id sub_1B986C8DC()
{
  char *v0;
  uint64_t v1;
  _QWORD *v2;
  char *v3;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v5;
  uint64_t v6;
  char *v7;
  objc_super v9;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceTraveled] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_distanceToDecelerate] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232648);
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = MEMORY[0x1E0DEE9D8];
  *(_OWORD *)(v1 + 24) = xmmword_1B98784B0;
  swift_beginAccess();
  v2 = *(_QWORD **)(v1 + 16);
  v3 = v0;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 16) = v2;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v2[3] <= 0xBuLL)
  {
    if (v2[2] <= 6uLL)
      v5 = 6;
    else
      v5 = v2[2];
    v2 = sub_1B9870BBC(isUniquelyReferenced_nonNull_native, v5, 0, v2);
  }
  v6 = OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_samples;
  *(_QWORD *)(v1 + 16) = v2;
  swift_endAccess();
  *(_QWORD *)&v3[v6] = v1;
  v7 = &v3[OBJC_IVAR____TtC13CameraEditKit32ContactAwareSliderPositionDriver_deadZoneSample];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ContactAwareSliderPositionDriver();
  return objc_msgSendSuper2(&v9, sel_init);
}

id sub_1B986CA20()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactAwareSliderPositionDriver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ContactAwareSliderPositionDriver()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for ContactAwareSliderPositionDriver.VelocitySample(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactAwareSliderPositionDriver.VelocitySample(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ContactAwareSliderPositionDriver.VelocitySample(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ContactAwareSliderPositionDriver.VelocitySample()
{
  return &type metadata for ContactAwareSliderPositionDriver.VelocitySample;
}

_QWORD *sub_1B986CB18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 24);
  return v4;
}

_QWORD *sub_1B986CB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232638);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 1;
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 5);
  return v4;
}

size_t sub_1B986CC10(size_t result)
{
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;

  v2 = result;
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD **)v1;
  v5 = v3 >> 1;
  if ((v3 & 1) == 0 || (result = swift_isUniquelyReferenced_nonNull(), *(_QWORD *)v1 = v4, (result & 1) == 0))
  {
    v9 = v4;
    goto LABEL_9;
  }
  v6 = *(_QWORD *)(v1 + 16);
  v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v8 = *(_QWORD *)(v1 + 8);
  sub_1B98725CC();
  swift_unknownObjectRetain();
  result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    result = MEMORY[0x1E0DEE9D8];
  }
  v9 = *(_QWORD **)(result + 16);
  if (v8 + 24 * v6 + 24 * v7 == result + 24 * (_QWORD)v9 + 32)
    goto LABEL_29;
  result = swift_release();
  while (1)
  {
    if (v7 >= v2)
      goto LABEL_26;
    v9 = *(_QWORD **)v1;
LABEL_9:
    v7 = *(_QWORD *)(v1 + 16);
    v10 = v5 - v7;
    if (__OFSUB__(v5, v7))
    {
      __break(1u);
      goto LABEL_33;
    }
    v11 = *(_QWORD *)(v1 + 8);
    if (!(v10 <= v2 ? v2 : v5 - v7))
      break;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324E0);
    v4 = (_QWORD *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v4);
    v4[2] = v10;
    v4[3] = 2 * ((uint64_t)(result - 32) / 24);
    if (v5 >= v7)
      goto LABEL_15;
LABEL_28:
    __break(1u);
LABEL_29:
    v18 = *(_QWORD *)(result + 24);
    result = swift_release();
    v19 = (v18 >> 1) - (_QWORD)v9;
    v20 = __OFADD__(v7, v19);
    v7 += v19;
    if (v20)
      goto LABEL_38;
  }
  v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v5 < v7)
    goto LABEL_28;
LABEL_15:
  if ((v10 & 0x8000000000000000) == 0)
  {
    v13 = (unint64_t)(v4 + 4);
    v14 = (_QWORD *)(v11 + 24 * v7);
    if (v14 >= &v4[3 * v10 + 4] || v13 >= (unint64_t)&v14[3 * v10])
    {
      memcpy(v4 + 4, v14, 24 * v10);
      if (!__OFSUB__(0, v7))
      {
        v16 = v4[2];
        v17 = v7 + v16;
        if (!__OFADD__(v7, v16))
        {
          if (v17 >= v7)
          {
            result = swift_unknownObjectRelease();
            if ((v17 & 0x8000000000000000) == 0)
            {
              *(_QWORD *)(v1 + 8) = v13 - 24 * v7;
              *(_QWORD *)(v1 + 16) = v7;
              *(_QWORD *)(v1 + 24) = (2 * v17) | 1;
LABEL_26:
              *(_QWORD *)v1 = v4;
              return result;
            }
            goto LABEL_36;
          }
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
LABEL_39:
  result = sub_1B98725C0();
  __break(1u);
  return result;
}

uint64_t sub_1B986CE9C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;

  v2 = result;
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD **)v1;
  v5 = v3 >> 1;
  if ((v3 & 1) == 0 || (result = swift_isUniquelyReferenced_nonNull(), *(_QWORD *)v1 = v4, (result & 1) == 0))
  {
    v9 = v4;
    goto LABEL_9;
  }
  v6 = *(_QWORD *)(v1 + 16);
  v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v8 = *(_QWORD *)(v1 + 8);
  sub_1B98725CC();
  swift_unknownObjectRetain();
  result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    result = MEMORY[0x1E0DEE9D8];
  }
  v9 = *(_QWORD **)(result + 16);
  if (v8 + 32 * v6 + 32 * v7 == result + 32 * (_QWORD)v9 + 32)
    goto LABEL_31;
  result = swift_release();
  while (1)
  {
    if (v7 >= v2)
      goto LABEL_28;
    v9 = *(_QWORD **)v1;
LABEL_9:
    v7 = *(_QWORD *)(v1 + 16);
    v10 = v5 - v7;
    if (__OFSUB__(v5, v7))
    {
      __break(1u);
      goto LABEL_35;
    }
    v11 = *(_QWORD *)(v1 + 8);
    if (v10 <= v2 ? v2 : v5 - v7)
      break;
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if (v5 >= v7)
      goto LABEL_17;
LABEL_30:
    __break(1u);
LABEL_31:
    v19 = *(_QWORD *)(result + 24);
    result = swift_release();
    v20 = (v19 >> 1) - (_QWORD)v9;
    v21 = __OFADD__(v7, v20);
    v7 += v20;
    if (v21)
      goto LABEL_40;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232638);
  v4 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v4);
  v13 = result - 32;
  if (result < 32)
    v13 = result - 1;
  v4[2] = v10;
  v4[3] = 2 * (v13 >> 5);
  if (v5 < v7)
    goto LABEL_30;
LABEL_17:
  if ((v10 & 0x8000000000000000) == 0)
  {
    v14 = (unint64_t)(v4 + 4);
    v15 = (_QWORD *)(v11 + 32 * v7);
    if (v15 >= &v4[4 * v10 + 4] || v14 >= (unint64_t)&v15[4 * v10])
    {
      memcpy(v4 + 4, v15, 32 * v10);
      if (!__OFSUB__(0, v7))
      {
        v17 = v4[2];
        v18 = v7 + v17;
        if (!__OFADD__(v7, v17))
        {
          if (v18 >= v7)
          {
            result = swift_unknownObjectRelease();
            if ((v18 & 0x8000000000000000) == 0)
            {
              *(_QWORD *)(v1 + 8) = v14 - 32 * v7;
              *(_QWORD *)(v1 + 16) = v7;
              *(_QWORD *)(v1 + 24) = (2 * v18) | 1;
LABEL_28:
              *(_QWORD *)v1 = v4;
              return result;
            }
            goto LABEL_38;
          }
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_41:
  result = sub_1B98725C0();
  __break(1u);
  return result;
}

uint64_t sub_1B986D108(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  char *__dst;

  v6 = v4[2];
  v7 = v4[3] >> 1;
  v8 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_32;
  }
  v10 = *a1;
  v11 = *(_QWORD *)(*a1 + 16);
  v30 = __OFSUB__(v11, a2);
  v12 = v11 - a2;
  if (v30)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v14 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v15 = v8 - a2;
  if (__OFSUB__(v8, a2))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v30 = __OFSUB__(v15, v14);
  v16 = v15 - v14;
  if (v30)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v38 = v16;
  __dst = (char *)(v10 + 32);
  v18 = sub_1B986DAF4(v8);
  v37 = (char *)(v10 + 32 + 24 * a2 + 24 * a3);
  if (v18)
  {
    v36 = a4;
    if (a2 < 0)
      goto LABEL_46;
    v19 = v18;
    v20 = v4[2];
    v21 = (char *)(v4[1] + 24 * v20);
    v22 = &v21[24 * a2];
    if (__dst != v21 || __dst >= v22)
      memmove(__dst, v21, 24 * a2);
    v36(v10 + 32 + 24 * a2, a3);
    if (v14 < 0)
      goto LABEL_46;
    v23 = &v22[24 * v38];
    if (v37 != v23 || v37 >= &v23[24 * v14])
      memmove(v37, v23, 24 * v14);
    *(_QWORD *)(v19 + 16) = 0;
    swift_release();
LABEL_26:
    swift_retain();
    result = swift_unknownObjectRelease();
    if (!__OFSUB__(0, v20))
    {
      v34 = *(_QWORD *)(v10 + 16);
      v30 = __OFADD__(v20, v34);
      v35 = v20 + v34;
      if (!v30)
      {
        if (v35 >= v20)
        {
          if ((v35 & 0x8000000000000000) == 0)
          {
            *v4 = v10;
            v4[1] = &__dst[-24 * v20];
            v4[2] = v20;
            v4[3] = (2 * v35) | 1;
            return result;
          }
          goto LABEL_39;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v25 = (void (*)(char *, uint64_t))a4;
  v20 = v4[2];
  v26 = v20 + a2;
  if (__OFADD__(v20, a2))
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v26 < v20)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (__OFSUB__(v26, v20))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v27 = v4[1];
  memcpy(__dst, (const void *)(v27 + 24 * v20), 24 * a2);
  v25(&__dst[24 * a2], a3);
  v28 = v26 + v38;
  if (__OFADD__(v26, v38))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v29 = v4[3] >> 1;
  v30 = __OFSUB__(v29, v28);
  v31 = v29 < v28;
  v32 = v29 - v28;
  if (v31)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!v30)
  {
    memcpy(v37, (const void *)(v27 + 24 * v28), 24 * v32);
    goto LABEL_26;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  result = sub_1B98725C0();
  __break(1u);
  return result;
}

uint64_t sub_1B986D3A0(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  char *__dst;

  v6 = v4[2];
  v7 = v4[3] >> 1;
  v8 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_32;
  }
  v10 = *a1;
  v11 = *(_QWORD *)(*a1 + 16);
  v30 = __OFSUB__(v11, a2);
  v12 = v11 - a2;
  if (v30)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v14 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v15 = v8 - a2;
  if (__OFSUB__(v8, a2))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v30 = __OFSUB__(v15, v14);
  v16 = v15 - v14;
  if (v30)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v38 = v16;
  __dst = (char *)(v10 + 32);
  v18 = sub_1B986DC74(v8);
  v37 = (char *)(v10 + 32 + 32 * a2 + 32 * a3);
  if (v18)
  {
    v36 = a4;
    if (a2 < 0)
      goto LABEL_46;
    v19 = v18;
    v20 = v4[2];
    v21 = (char *)(v4[1] + 32 * v20);
    v22 = &v21[32 * a2];
    if (__dst != v21 || __dst >= v22)
      memmove(__dst, v21, 32 * a2);
    v36(v10 + 32 + 32 * a2, a3);
    if (v14 < 0)
      goto LABEL_46;
    v23 = &v22[32 * v38];
    if (v37 != v23 || v37 >= &v23[32 * v14])
      memmove(v37, v23, 32 * v14);
    *(_QWORD *)(v19 + 16) = 0;
    swift_release();
LABEL_26:
    swift_retain();
    result = swift_unknownObjectRelease();
    if (!__OFSUB__(0, v20))
    {
      v34 = *(_QWORD *)(v10 + 16);
      v30 = __OFADD__(v20, v34);
      v35 = v20 + v34;
      if (!v30)
      {
        if (v35 >= v20)
        {
          if ((v35 & 0x8000000000000000) == 0)
          {
            *v4 = v10;
            v4[1] = &__dst[-32 * v20];
            v4[2] = v20;
            v4[3] = (2 * v35) | 1;
            return result;
          }
          goto LABEL_39;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v25 = (void (*)(char *, uint64_t))a4;
  v20 = v4[2];
  v26 = v20 + a2;
  if (__OFADD__(v20, a2))
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v26 < v20)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (__OFSUB__(v26, v20))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v27 = v4[1];
  memcpy(__dst, (const void *)(v27 + 32 * v20), 32 * a2);
  v25(&__dst[32 * a2], a3);
  v28 = v26 + v38;
  if (__OFADD__(v26, v38))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v29 = v4[3] >> 1;
  v30 = __OFSUB__(v29, v28);
  v31 = v29 < v28;
  v32 = v29 - v28;
  if (v31)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!v30)
  {
    memcpy(v37, (const void *)(v27 + 32 * v28), 32 * v32);
    goto LABEL_26;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  result = sub_1B98725C0();
  __break(1u);
  return result;
}

uint64_t sub_1B986D610(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = v3 >> 1;
  v5 = __OFSUB__(v3 >> 1, v2);
  v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  v7 = result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7)
    return result;
  sub_1B98725CC();
  swift_unknownObjectRetain();
  result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    result = MEMORY[0x1E0DEE9D8];
  }
  v8 = *(_QWORD *)(result + 16);
  v5 = __OFADD__(v8, v7);
  v9 = v8 + v7;
  if (v5)
    goto LABEL_13;
  *(_QWORD *)(result + 16) = v9;
  result = swift_release();
  v10 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v1 + 24) = v3 & 1 | (2 * v10);
  return result;
}

uint64_t sub_1B986D6C4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  size_t v28;

  v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_32:
    if (v8 >= v7)
      goto LABEL_21;
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  v7 = a2;
  v6 = result;
  if ((a6 & 1) == 0)
    goto LABEL_32;
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    v11 = MEMORY[0x1E0DEE9D8];
  }
  v12 = *(_QWORD *)(v11 + 16);
  v13 = a4 + 24 * a5 + 24 * v8;
  if (v13 == v11 + 24 * v12 + 32)
  {
    v15 = *(_QWORD *)(v11 + 24);
    result = swift_release();
    v16 = (v15 >> 1) - v12;
    v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    swift_release();
    v14 = v8;
  }
  swift_unknownObjectRetain();
  v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      v17 = MEMORY[0x1E0DEE9D8];
    }
    v18 = *(_QWORD *)(v17 + 16);
    if (v13 == v17 + 24 * v18 + 32)
    {
      v20 = *(_QWORD *)(v17 + 24);
      result = swift_release();
      v21 = (v20 >> 1) - v18;
      v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
    else
    {
      result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    v17 = MEMORY[0x1E0DEE9D8];
  }
  v19 = *(_QWORD *)(v17 + 16);
  if (v13 == v17 + 24 * v19 + 32)
  {
    v23 = *(_QWORD *)(v17 + 24);
    result = swift_release();
    v24 = (v23 >> 1) - v19;
    v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22)
      goto LABEL_21;
LABEL_37:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7)
    v25 = v7;
  else
    v25 = v8;
  if (v25 <= v6)
    v26 = v6;
  else
    v26 = v25;
  if (!v26)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324E0);
  v27 = (_QWORD *)swift_allocObject();
  v28 = _swift_stdlib_malloc_size(v27);
  v27[2] = v6;
  v27[3] = 2 * ((uint64_t)(v28 - 32) / 24);
  return (uint64_t)v27;
}

uint64_t sub_1B986D8E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  uint64_t v29;

  v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_34:
    if (v8 >= v7)
      goto LABEL_21;
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_37;
  }
  v7 = a2;
  v6 = result;
  if ((a6 & 1) == 0)
    goto LABEL_34;
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    v11 = MEMORY[0x1E0DEE9D8];
  }
  v12 = *(_QWORD *)(v11 + 16);
  v13 = a4 + 32 * a5 + 32 * v8;
  if (v13 == v11 + 32 * v12 + 32)
  {
    v15 = *(_QWORD *)(v11 + 24);
    result = swift_release();
    v16 = (v15 >> 1) - v12;
    v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
  }
  else
  {
    swift_release();
    v14 = v8;
  }
  swift_unknownObjectRetain();
  v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      v17 = MEMORY[0x1E0DEE9D8];
    }
    v18 = *(_QWORD *)(v17 + 16);
    if (v13 == v17 + 32 * v18 + 32)
    {
      v20 = *(_QWORD *)(v17 + 24);
      result = swift_release();
      v21 = (v20 >> 1) - v18;
      v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    else
    {
      result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    v17 = MEMORY[0x1E0DEE9D8];
  }
  v19 = *(_QWORD *)(v17 + 16);
  if (v13 == v17 + 32 * v19 + 32)
  {
    v23 = *(_QWORD *)(v17 + 24);
    result = swift_release();
    v24 = (v23 >> 1) - v19;
    v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22)
      goto LABEL_21;
LABEL_39:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7)
    v25 = v7;
  else
    v25 = v8;
  if (v25 <= v6)
    v26 = v6;
  else
    v26 = v25;
  if (!v26)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232638);
  v27 = (_QWORD *)swift_allocObject();
  v28 = _swift_stdlib_malloc_size(v27);
  v29 = v28 - 32;
  if (v28 < 32)
    v29 = v28 - 1;
  v27[2] = v6;
  v27[3] = 2 * (v29 >> 5);
  return (uint64_t)v27;
}

uint64_t (*sub_1B986DAE0())()
{
  return nullsub_1;
}

uint64_t sub_1B986DAF4(uint64_t a1)
{
  _QWORD *v1;
  int64_t isUniquelyReferenced_nonNull;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!(_DWORD)isUniquelyReferenced_nonNull)
    return 0;
  v6 = v1[2];
  v5 = v1[3];
  v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_18;
  }
  v8 = v1[1];
  if ((v5 & 1) == 0)
    goto LABEL_8;
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x1E0DEE9D8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  if (v8 + 24 * v6 + 24 * v7 != v9 + 24 * v10 + 32)
  {
    swift_release();
LABEL_8:
    v11 = v7;
    goto LABEL_10;
  }
  v12 = *(_QWORD *)(v9 + 24);
  result = swift_release();
  v14 = (v12 >> 1) - v10;
  v15 = __OFADD__(v7, v14);
  v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1)
      return 0;
    sub_1B98725CC();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x1E0DEE9D8];
    }
    v16 = (v8 + 24 * v6 - a1 - 32) / 24;
    isUniquelyReferenced_nonNull = v7 + v16;
    if (!__OFADD__(v7, v16))
    {
      v4 = *(_QWORD *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4)
        return a1;
LABEL_19:
      sub_1B986E098(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B986DC74(uint64_t a1)
{
  _QWORD *v1;
  int64_t isUniquelyReferenced_nonNull;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!(_DWORD)isUniquelyReferenced_nonNull)
    return 0;
  v6 = v1[2];
  v5 = v1[3];
  v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_20;
  }
  v8 = v1[1];
  if ((v5 & 1) == 0)
    goto LABEL_8;
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x1E0DEE9D8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  if (v8 + 32 * v6 + 32 * v7 != v9 + 32 * v10 + 32)
  {
    swift_release();
LABEL_8:
    v11 = v7;
    goto LABEL_10;
  }
  v12 = *(_QWORD *)(v9 + 24);
  result = swift_release();
  v14 = (v12 >> 1) - v10;
  v15 = __OFADD__(v7, v14);
  v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1)
      return 0;
    sub_1B98725CC();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x1E0DEE9D8];
    }
    v16 = v8 + 32 * v6 - a1;
    v17 = v16 - 32;
    v18 = v16 - 1;
    if (v17 >= 0)
      v18 = v17;
    isUniquelyReferenced_nonNull = v7 + (v18 >> 5);
    if (!__OFADD__(v7, v18 >> 5))
    {
      v4 = *(_QWORD *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4)
        return a1;
LABEL_21:
      sub_1B986E7B4(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

char *sub_1B986DDE0(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_1B9870A98(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[24 * a1 + 32];
    v15 = &v4[24 * a2 + 32];
    if (a1 != a2 || result >= &v15[24 * v14])
      result = (char *)memmove(result, v15, 24 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_1B98725C0();
  __break(1u);
  return result;
}

char *sub_1B986DF40(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_1B9870BBC(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[32 * a1 + 32];
    v15 = &v4[32 * a2 + 32];
    if (a1 != a2 || result >= &v15[32 * v14])
      result = (char *)memmove(result, v15, 32 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_1B98725C0();
  __break(1u);
  return result;
}

unint64_t sub_1B986E098(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  const void *v11;
  uint64_t v13;
  uint64_t v14;

  v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - v4;
  if (__OFSUB__(a3, v4))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v6)
    goto LABEL_14;
  v7 = *v3;
  v8 = *(_QWORD *)(v7 + 16);
  v9 = __OFSUB__(v8, a2);
  v10 = v8 - a2;
  if (v9)
    goto LABEL_18;
  if (v10 < 0)
  {
LABEL_21:
    result = sub_1B98725C0();
    __break(1u);
    return result;
  }
  result = v7 + 32 + 24 * result + 24 * a3;
  v11 = (const void *)(v7 + 32 + 24 * a2);
  if ((const void *)result != v11 || result >= (unint64_t)v11 + 24 * v10)
    result = (unint64_t)memmove((void *)result, v11, 24 * v10);
  v13 = *(_QWORD *)(v7 + 16);
  v9 = __OFADD__(v13, v6);
  v14 = v13 + v6;
  if (v9)
    goto LABEL_19;
  *(_QWORD *)(v7 + 16) = v14;
LABEL_14:
  if (a3 > 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

_QWORD *sub_1B986E194(_QWORD *result)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  __int128 *v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  unint64_t v34;
  uint64_t v35;

  v3 = v1[2];
  v2 = v1[3];
  v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3))
    goto LABEL_48;
  v5 = result[4];
  v31 = result[3] >> 1;
  if (v5 == v31)
    return result;
  if (v5 < result[2] || v5 >= v31)
    goto LABEL_49;
  v30 = result[2];
  v7 = v5 + 1;
  v29 = result[1];
  v8 = (__int128 *)(v29 + 24 * v5);
  v32 = *((_QWORD *)v8 + 2);
  v33 = *v8;
  while (!__OFADD__(v4, 1))
  {
    v35 = sub_1B986D6C4(v4, v4 + 1, *v1, v1[1], v3, v2);
    v9 = sub_1B986DAE0();
    sub_1B986D108(&v35, v4, 0, (void (*)(uint64_t, uint64_t))v9);
    swift_release();
    result = (_QWORD *)swift_release();
    v3 = v1[2];
    v2 = v1[3];
    v10 = (v2 >> 1) - v3;
    if (__OFSUB__(v2 >> 1, v3))
      goto LABEL_42;
    v11 = v1[1];
    v34 = v2 >> 1;
    if ((v2 & 1) != 0)
    {
      sub_1B98725CC();
      swift_unknownObjectRetain();
      v12 = swift_dynamicCastClass();
      if (!v12)
      {
        swift_unknownObjectRelease();
        v12 = MEMORY[0x1E0DEE9D8];
      }
      v13 = *(_QWORD *)(v12 + 16);
      if (v11 + 24 * v3 + 24 * v10 != v12 + 24 * v13 + 32)
      {
        result = (_QWORD *)swift_release();
        v14 = (v2 >> 1) - v3;
        if (v4 >= v10)
          goto LABEL_23;
        goto LABEL_19;
      }
      v17 = *(_QWORD *)(v12 + 24);
      result = (_QWORD *)swift_release();
      v18 = (v17 >> 1) - v13;
      v19 = __OFADD__(v10, v18);
      v14 = v10 + v18;
      if (v19)
        goto LABEL_47;
    }
    else
    {
      v14 = (v2 >> 1) - v3;
    }
    if (v4 >= v14)
    {
LABEL_23:
      v16 = 0;
      goto LABEL_31;
    }
LABEL_19:
    v15 = v11 + 24 * v3 + 24 * v4;
    *(_OWORD *)v15 = v33;
    *(_QWORD *)(v15 + 16) = v32;
    v33 = 0u;
    if (v7 != v31)
    {
      v20 = 0;
      v21 = 0;
      v22 = v29 + 24 * v7;
      while (v7 >= v30 && v7 + v21 < v31)
      {
        v23 = *(_QWORD *)(v22 + v20 + 16);
        if (~v4 + v14 == v21)
        {
          v16 = 0;
          v32 = *(_QWORD *)(v22 + v20 + 16);
          v7 += v21 + 1;
          v4 = v14;
          v33 = *(_OWORD *)(v22 + v20);
          goto LABEL_31;
        }
        v24 = v11 + 24 * v3 + 24 * v4 + v20;
        *(_OWORD *)(v24 + 24) = *(_OWORD *)(v22 + v20);
        *(_QWORD *)(v24 + 40) = v23;
        ++v21;
        v20 += 24;
        if (!(v7 - v31 + v21))
        {
          v32 = 0;
          v4 += 1 + v21;
          v7 = v31;
          v16 = 1;
          goto LABEL_31;
        }
      }
      __break(1u);
      break;
    }
    v32 = 0;
    v7 = v31;
    v16 = 1;
    ++v4;
LABEL_31:
    v25 = v4 - v10;
    if (__OFSUB__(v4, v10))
      goto LABEL_43;
    if (v25)
    {
      sub_1B98725CC();
      swift_unknownObjectRetain();
      result = (_QWORD *)swift_dynamicCastClass();
      if (!result)
      {
        swift_unknownObjectRelease();
        result = (_QWORD *)MEMORY[0x1E0DEE9D8];
      }
      v26 = result[2];
      v19 = __OFADD__(v26, v25);
      v27 = v26 + v25;
      if (v19)
        goto LABEL_44;
      result[2] = v27;
      result = (_QWORD *)swift_release();
      v28 = v34 + v25;
      if (__OFADD__(v34, v25))
        goto LABEL_45;
      if ((v28 & 0x8000000000000000) != 0)
        goto LABEL_46;
      v2 = v2 & 1 | (2 * v28);
      v1[3] = v2;
    }
    if ((v16 & 1) != 0)
      return result;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

_QWORD *sub_1B986E4C8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  int64_t v19;
  uint64_t v20;
  _QWORD *result;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  size_t v33;
  _QWORD v36[5];

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_38;
  }
  v8 = v4[2];
  v7 = v4[3];
  v9 = (v7 >> 1) - v8;
  if (__OFSUB__(v7 >> 1, v8))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((v7 & 1) == 0)
  {
LABEL_8:
    v15 = v9;
    goto LABEL_10;
  }
  v12 = v4[1];
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    v13 = MEMORY[0x1E0DEE9D8];
  }
  v14 = *(_QWORD *)(v13 + 16);
  if (v12 + 24 * v8 + 24 * v9 != v13 + 24 * v14 + 32)
  {
    swift_release();
    goto LABEL_8;
  }
  v16 = *(_QWORD *)(v13 + 24);
  swift_release();
  v17 = (v16 >> 1) - v14;
  v18 = __OFADD__(v9, v17);
  v15 = v9 + v17;
  if (v18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_10:
  v19 = v9 + v6;
  if (__OFADD__(v9, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v15 < v19)
  {
    if (v15 + 0x4000000000000000 < 0)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    v20 = 2 * v15;
    if (v20 > v19)
      v19 = v20;
  }
  result = (_QWORD *)sub_1B986CC10(v19);
  v23 = v4[2];
  v22 = v4[3];
  v24 = (v22 >> 1) - v23;
  if (__OFSUB__(v22 >> 1, v23))
    goto LABEL_40;
  v25 = (char *)(v4[1] + 24 * v23 + 24 * v24);
  if ((v22 & 1) == 0)
  {
LABEL_21:
    v28 = v24;
    goto LABEL_23;
  }
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v26 = swift_dynamicCastClass();
  if (!v26)
  {
    swift_unknownObjectRelease();
    v26 = MEMORY[0x1E0DEE9D8];
  }
  v27 = *(_QWORD *)(v26 + 16);
  if (v25 != (char *)(v26 + 24 * v27 + 32))
  {
    result = (_QWORD *)swift_release();
    goto LABEL_21;
  }
  v29 = *(_QWORD *)(v26 + 24);
  result = (_QWORD *)swift_release();
  v30 = (v29 >> 1) - v27;
  v18 = __OFADD__(v24, v30);
  v28 = v24 + v30;
  if (v18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_23:
  v31 = v28 - v24;
  if (__OFSUB__(v28, v24))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      v6 = 0;
      v5 = a3;
      goto LABEL_34;
    }
    goto LABEL_42;
  }
  if (v31 < v6)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v6 < 0)
    goto LABEL_48;
  v32 = (char *)(a2 + 24 * a3);
  v33 = 24 * v6;
  if (v32 < &v25[24 * v6] && v25 < &v32[v33])
    goto LABEL_48;
  result = memcpy(v25, v32, v33);
  if (v6)
  {
    if (__OFADD__(v24, v6))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      result = (_QWORD *)sub_1B98725C0();
      __break(1u);
      return result;
    }
    result = (_QWORD *)sub_1B986D610(v24 + v6);
  }
LABEL_34:
  if (v6 == v31)
  {
    v36[0] = a1;
    v36[1] = a2;
    v36[2] = a3;
    v36[3] = a4;
    v36[4] = v5;
    return sub_1B986E194(v36);
  }
  return result;
}

unint64_t sub_1B986E7B4(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  const void *v11;
  uint64_t v13;
  uint64_t v14;

  v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - v4;
  if (__OFSUB__(a3, v4))
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v6)
    goto LABEL_14;
  v7 = *v3;
  v8 = *(_QWORD *)(v7 + 16);
  v9 = __OFSUB__(v8, a2);
  v10 = v8 - a2;
  if (v9)
    goto LABEL_18;
  if (v10 < 0)
  {
LABEL_21:
    result = sub_1B98725C0();
    __break(1u);
    return result;
  }
  result = v7 + 32 + 32 * result + 32 * a3;
  v11 = (const void *)(v7 + 32 + 32 * a2);
  if ((const void *)result != v11 || result >= (unint64_t)v11 + 32 * v10)
    result = (unint64_t)memmove((void *)result, v11, 32 * v10);
  v13 = *(_QWORD *)(v7 + 16);
  v9 = __OFADD__(v13, v6);
  v14 = v13 + v6;
  if (v9)
    goto LABEL_19;
  *(_QWORD *)(v7 + 16) = v14;
LABEL_14:
  if (a3 > 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

_QWORD *sub_1B986E8A4(_QWORD *result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7;
  uint64_t v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  uint64_t (*v12)();
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  _OWORD *v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3))
    goto LABEL_54;
  v5 = result[4];
  v35 = result[3] >> 1;
  if (v5 != v35)
  {
    if (v5 < result[2] || v5 >= v35)
      goto LABEL_55;
    v7 = (uint64_t *)v1;
    v34 = result[2];
    v8 = v5 + 1;
    v9 = (__int128 *)(result[1] + 32 * v5);
    v10 = *v9;
    v11 = v9[1];
    v33 = result[1];
    while (!__OFADD__(v4, 1))
    {
      v37 = v11;
      v39 = v10;
      v41 = sub_1B986D8E0(v4, v4 + 1, *v7, v7[1], v3, v2);
      v12 = sub_1B986DAE0();
      v13 = v7;
      sub_1B986D3A0(&v41, v4, 0, (void (*)(uint64_t, uint64_t))v12);
      swift_release();
      result = (_QWORD *)swift_release();
      v3 = v7[2];
      v2 = v7[3];
      v14 = v2 >> 1;
      v15 = (v2 >> 1) - v3;
      if (__OFSUB__(v2 >> 1, v3))
        goto LABEL_48;
      v16 = v7[1];
      if ((v2 & 1) != 0)
      {
        v36 = v7[3];
        sub_1B98725CC();
        swift_unknownObjectRetain();
        v17 = swift_dynamicCastClass();
        if (!v17)
        {
          swift_unknownObjectRelease();
          v17 = MEMORY[0x1E0DEE9D8];
        }
        v18 = *(_QWORD *)(v17 + 16);
        if (v16 + 32 * v3 + 32 * v15 == v17 + 32 * v18 + 32)
        {
          v20 = *(_QWORD *)(v17 + 24);
          result = (_QWORD *)swift_release();
          v21 = (v20 >> 1) - v18;
          v22 = __OFADD__(v15, v21);
          v19 = v15 + v21;
          if (v22)
            goto LABEL_53;
          v7 = v13;
        }
        else
        {
          result = (_QWORD *)swift_release();
          v19 = v15;
        }
        v2 = v36;
      }
      else
      {
        v19 = (v2 >> 1) - v3;
      }
      v11 = v37;
      v10 = v39;
      if (v4 >= v19)
      {
        v24 = 0;
        v25 = v4 - v15;
        if (__OFSUB__(v4, v15))
          goto LABEL_49;
      }
      else
      {
        v23 = (_OWORD *)(v16 + 32 * v3 + 32 * v4);
        *v23 = v39;
        v23[1] = v37;
        if (v8 == v35)
        {
          v10 = 0uLL;
          v8 = v35;
          v24 = 1;
          ++v4;
LABEL_34:
          v11 = 0uLL;
          v25 = v4 - v15;
          if (__OFSUB__(v4, v15))
            goto LABEL_49;
        }
        else
        {
          v26 = 0;
          v27 = (_OWORD *)(v16 + 32 * v4 + 32 * v3 + 48);
          while (1)
          {
            if (v8 < v34 || v8 + v26 >= v35)
            {
              __break(1u);
              goto LABEL_47;
            }
            v28 = (__int128 *)(v33 + 32 * v8 + 32 * v26);
            v10 = *v28;
            v11 = v28[1];
            if (~v4 + v19 == v26)
              break;
            *(v27 - 1) = v10;
            *v27 = v11;
            ++v26;
            v27 += 2;
            if (!(v8 - v35 + v26))
            {
              v4 += 1 + v26;
              v10 = 0uLL;
              v8 = v35;
              v24 = 1;
              goto LABEL_34;
            }
          }
          v24 = 0;
          v8 += v26 + 1;
          v4 = v19;
          v25 = v19 - v15;
          if (__OFSUB__(v19, v15))
            goto LABEL_49;
        }
      }
      if (v25)
      {
        v29 = v2;
        v38 = v11;
        v40 = v10;
        sub_1B98725CC();
        swift_unknownObjectRetain();
        result = (_QWORD *)swift_dynamicCastClass();
        if (!result)
        {
          swift_unknownObjectRelease();
          result = (_QWORD *)MEMORY[0x1E0DEE9D8];
        }
        v30 = result[2];
        v22 = __OFADD__(v30, v25);
        v31 = v30 + v25;
        if (v22)
          goto LABEL_50;
        result[2] = v31;
        result = (_QWORD *)swift_release();
        v32 = v14 + v25;
        if (__OFADD__(v14, v25))
          goto LABEL_51;
        if ((v32 & 0x8000000000000000) != 0)
          goto LABEL_52;
        v2 = v29 & 1 | (2 * v32);
        v7[3] = v2;
        v11 = v38;
        v10 = v40;
      }
      if ((v24 & 1) != 0)
        return result;
    }
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
  }
  return result;
}

_QWORD *sub_1B986EBC8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *result;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  size_t v33;
  _QWORD v36[5];

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_38;
  }
  v8 = v4[2];
  v7 = v4[3];
  v9 = (v7 >> 1) - v8;
  if (__OFSUB__(v7 >> 1, v8))
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if ((v7 & 1) == 0)
  {
LABEL_8:
    v15 = v9;
    goto LABEL_10;
  }
  v12 = v4[1];
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    v13 = MEMORY[0x1E0DEE9D8];
  }
  v14 = *(_QWORD *)(v13 + 16);
  if (v12 + 32 * v8 + 32 * v9 != v13 + 32 * v14 + 32)
  {
    swift_release();
    goto LABEL_8;
  }
  v16 = *(_QWORD *)(v13 + 24);
  swift_release();
  v17 = (v16 >> 1) - v14;
  v18 = __OFADD__(v9, v17);
  v15 = v9 + v17;
  if (v18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_10:
  v19 = v9 + v6;
  if (__OFADD__(v9, v6))
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  if (v15 < v19)
  {
    if (v15 + 0x4000000000000000 < 0)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    v20 = 2 * v15;
    if (v20 > v19)
      v19 = v20;
  }
  result = (_QWORD *)sub_1B986CE9C(v19);
  v23 = v4[2];
  v22 = v4[3];
  v24 = (v22 >> 1) - v23;
  if (__OFSUB__(v22 >> 1, v23))
    goto LABEL_40;
  v25 = (char *)(v4[1] + 32 * v23 + 32 * v24);
  if ((v22 & 1) == 0)
  {
LABEL_21:
    v28 = v24;
    goto LABEL_23;
  }
  sub_1B98725CC();
  swift_unknownObjectRetain();
  v26 = swift_dynamicCastClass();
  if (!v26)
  {
    swift_unknownObjectRelease();
    v26 = MEMORY[0x1E0DEE9D8];
  }
  v27 = *(_QWORD *)(v26 + 16);
  if (v25 != (char *)(v26 + 32 * v27 + 32))
  {
    result = (_QWORD *)swift_release();
    goto LABEL_21;
  }
  v29 = *(_QWORD *)(v26 + 24);
  result = (_QWORD *)swift_release();
  v30 = (v29 >> 1) - v27;
  v18 = __OFADD__(v24, v30);
  v28 = v24 + v30;
  if (v18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_23:
  v31 = v28 - v24;
  if (__OFSUB__(v28, v24))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      v6 = 0;
      v5 = a3;
      goto LABEL_34;
    }
    goto LABEL_42;
  }
  if (v31 < v6)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v6 < 0)
    goto LABEL_48;
  v32 = (char *)(a2 + 32 * a3);
  v33 = 32 * v6;
  if (v32 < &v25[32 * v6] && v25 < &v32[v33])
    goto LABEL_48;
  result = memcpy(v25, v32, v33);
  if (v6)
  {
    if (__OFADD__(v24, v6))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      result = (_QWORD *)sub_1B98725C0();
      __break(1u);
      return result;
    }
    result = (_QWORD *)sub_1B986D610(v24 + v6);
  }
LABEL_34:
  if (v6 == v31)
  {
    v36[0] = a1;
    v36[1] = a2;
    v36[2] = a3;
    v36[3] = a4;
    v36[4] = v5;
    return sub_1B986E8A4(v36);
  }
  return result;
}

uint64_t sub_1B986EEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232640);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1B986EF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  long double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model);
  v2 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount;
  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount))
    return;
  v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_overlappingSections);
  swift_beginAccess();
  *v3 = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
  v4 = (_QWORD *)(v0 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_visibleSectionIndices);
  swift_beginAccess();
  *v4 = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v1 + v2);
  v6 = v5 - 1;
  if (v5 == 1)
    return;
  if (!v5)
    goto LABEL_60;
  v7 = 0;
  v42 = 0;
  v8 = 0;
  v9 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_endTickMarksProminent;
  v10 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset;
  v11 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkInterval;
  v47 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
  v44 = v1 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource;
  v46 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing;
  v45 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth;
  v12 = 1;
  v43 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_mainTickMarkOffset;
LABEL_5:
  v13 = v7;
  v14 = (double)v7;
  v7 = v12;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (*(_BYTE *)(v1 + v9) == 1)
    {
      if (__OFADD__(v7, 1))
        goto LABEL_58;
      if (v7 + 1 == *(_QWORD *)(v1 + v2))
      {
LABEL_44:
        if ((v8 & 1) != 0)
        {
          if (v7 < v42)
            goto LABEL_61;
          swift_beginAccess();
          sub_1B9870EDC(&v48, v42, v7);
          swift_endAccess();
          v10 = v43;
          if (v6 == v7)
            return;
        }
        else if (v6 == v7)
        {
          return;
        }
        v8 = 0;
        v42 = v7;
LABEL_52:
        v12 = v7 + 1;
        if (v7 + 1 < v5)
          goto LABEL_5;
LABEL_53:
        __break(1u);
        return;
      }
    }
    v15 = *(_QWORD *)(v1 + v10);
    v16 = __OFADD__(v7, v15);
    v17 = v7 + v15;
    if (v16)
      goto LABEL_56;
    v18 = *(_QWORD *)(v1 + v11);
    if (!v18)
      goto LABEL_57;
    if (v17 == 0x8000000000000000 && v18 == -1)
      goto LABEL_59;
    if (!(v17 % v18))
      goto LABEL_44;
    if (v13 != v7)
    {
      if (v13 >= v7)
        goto LABEL_48;
      if (*(_BYTE *)(v1 + v47) == 1)
      {
        v20 = *(_QWORD *)(v1 + v2);
        if (!v20)
        {
          v31 = 0.0;
          v32 = *(double *)(v1 + v45) + 0.0;
          goto LABEL_40;
        }
        v21 = v20 - 1;
        if (v21)
        {
          v22 = (double)v21;
          v23 = log10(v14 / (double)v21 * 9.0 + 1.0);
          v24 = *(double *)(v1 + v46);
          v25 = v24 / log10(1.0 / v22 * 9.0 + 1.0);
          v26 = *(double *)(v1 + v45);
          v27 = v25 + v26;
        }
        else
        {
          v27 = *(double *)(v1 + v45);
          v23 = 0.0;
          v26 = v27;
        }
        v32 = v23 * (v27 - v26) + v26;
        v33 = *(_QWORD *)(v1 + v2);
        if (v33)
        {
LABEL_34:
          v37 = v33 - 1;
          if (v37)
          {
            v38 = (double)v37;
            v39 = log10((double)v7 / (double)v37 * 9.0 + 1.0);
            v40 = *(double *)(v1 + v46);
            v41 = v26 + v40 / log10(1.0 / v38 * 9.0 + 1.0);
          }
          else
          {
            v39 = 0.0;
            v41 = v26;
          }
          v31 = v39 * (v41 - v26);
          goto LABEL_40;
        }
      }
      else
      {
        v28 = (void *)MEMORY[0x1BCCC6008](v44);
        if (v28)
        {
          objc_msgSend(v28, sel_alignmentRectInsets);
          v30 = v29;
          swift_unknownObjectRelease();
        }
        else
        {
          v30 = 0.0;
        }
        v26 = *(double *)(v1 + v45);
        v32 = v30 + *(double *)(v1 + v46) * v14 + v26;
        if (*(_BYTE *)(v1 + v47) != 1)
        {
          v34 = (void *)MEMORY[0x1BCCC6008](v44);
          if (v34)
          {
            objc_msgSend(v34, sel_alignmentRectInsets);
            v36 = v35;
            swift_unknownObjectRelease();
          }
          else
          {
            v36 = 0.0;
          }
          v10 = v43;
          v31 = v36 + *(double *)(v1 + v46) * (double)v7;
LABEL_40:
          if (v31 > v32 + 0.6666667)
          {
LABEL_48:
            if (v6 == v7)
              return;
            goto LABEL_52;
          }
          goto LABEL_41;
        }
        v10 = v43;
        v33 = *(_QWORD *)(v1 + v2);
        if (v33)
          goto LABEL_34;
      }
      v31 = 0.0;
      goto LABEL_40;
    }
LABEL_41:
    if (v6 == v7)
      return;
    ++v7;
    v8 = 1;
    if (v7 >= v5)
      goto LABEL_53;
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
}

uint64_t sub_1B986F428(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;

  v2 = v1;
  v4 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_needsRebuild) == 1)
  {
    sub_1B986EF98();
    *(_BYTE *)(v1 + v4) = 0;
  }
  v5 = v1 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_overlappingSections;
  result = swift_beginAccess();
  v7 = 0;
  v8 = *(_QWORD *)v5 + 56;
  v9 = 1 << *(_BYTE *)(*(_QWORD *)v5 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(*(_QWORD *)v5 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v14 = v13 | (v7 << 6);
LABEL_7:
    v15 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)v5 + 48) + 16 * v14);
    v16 = *v15;
    v17 = v15[1];
    if (*v15 <= a1 && v17 > a1)
    {
      if (v16 == a1)
      {
LABEL_31:
        v22 = 0;
      }
      else
      {
        v23 = (uint64_t *)(v2 + OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_visibleSectionIndices);
        swift_beginAccess();
        v24 = *v23;
        if (*(_QWORD *)(*v23 + 16) && (v25 = sub_1B9870E10(v16), (v26 & 1) != 0))
        {
          v27 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v25);
          swift_endAccess();
          v22 = sub_1B986F780(a1, v27) ^ 1;
        }
        else
        {
          swift_endAccess();
          sub_1B986F7E4(v16, v17);
          if (v16)
          {
            sub_1B986FF44(v16, v17, v28);
            v30 = v29;
            swift_beginAccess();
            swift_bridgeObjectRetain();
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v35 = *v23;
            *v23 = 0x8000000000000000;
            sub_1B9871B34(v30, v16, isUniquelyReferenced_nonNull_native);
            *v23 = v35;
            swift_bridgeObjectRelease();
            swift_endAccess();
            v32 = sub_1B986F780(a1, v30);
            swift_bridgeObjectRelease();
            v22 = v32 ^ 1;
          }
          else
          {
            v33 = sub_1B986FB74(0, v17);
            swift_beginAccess();
            swift_bridgeObjectRetain();
            v34 = swift_isUniquelyReferenced_nonNull_native();
            v36 = *v23;
            *v23 = 0x8000000000000000;
            sub_1B9871B34(v33, 0, v34);
            *v23 = v36;
            swift_bridgeObjectRelease();
            swift_endAccess();
            v22 = sub_1B986F780(a1, v33);
            swift_bridgeObjectRelease();
          }
        }
      }
      return v22 & 1;
    }
  }
  v19 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_40;
  }
  if (v19 >= v12)
    goto LABEL_31;
  v20 = *(_QWORD *)(v8 + 8 * v19);
  ++v7;
  if (v20)
    goto LABEL_29;
  v7 = v19 + 1;
  if (v19 + 1 >= v12)
    goto LABEL_31;
  v20 = *(_QWORD *)(v8 + 8 * v7);
  if (v20)
    goto LABEL_29;
  v7 = v19 + 2;
  if (v19 + 2 >= v12)
    goto LABEL_31;
  v20 = *(_QWORD *)(v8 + 8 * v7);
  if (v20)
    goto LABEL_29;
  v7 = v19 + 3;
  if (v19 + 3 >= v12)
    goto LABEL_31;
  v20 = *(_QWORD *)(v8 + 8 * v7);
  if (v20)
    goto LABEL_29;
  v7 = v19 + 4;
  if (v19 + 4 >= v12)
    goto LABEL_31;
  v20 = *(_QWORD *)(v8 + 8 * v7);
  if (v20)
  {
LABEL_29:
    v11 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v7 << 6);
    goto LABEL_7;
  }
  v21 = v19 + 5;
  if (v21 >= v12)
    goto LABEL_31;
  v20 = *(_QWORD *)(v8 + 8 * v21);
  if (v20)
  {
    v7 = v21;
    goto LABEL_29;
  }
  while (1)
  {
    v7 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v7 >= v12)
      goto LABEL_31;
    v20 = *(_QWORD *)(v8 + 8 * v7);
    ++v21;
    if (v20)
      goto LABEL_29;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1B986F780(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

void sub_1B986F7E4(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;

  if (a1 == a2)
    return;
  v4 = a1;
  if (a2 < a1)
  {
LABEL_42:
    __break(1u);
    return;
  }
  v5 = 0;
  v6 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model;
  v7 = a1;
  v35 = v2;
  do
  {
    if (v4 >= a2)
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v4 == v7)
      goto LABEL_5;
    if (!v4 || v7 >= v4)
    {
LABEL_4:
      if (__CFADD__(v5++, 1))
        goto LABEL_41;
LABEL_5:
      v7 = v4;
      goto LABEL_6;
    }
    v9 = *(_QWORD *)(v2 + v6);
    v10 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
    if (*(_BYTE *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
    {
      v11 = *(_QWORD *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v11)
      {
        v12 = v11 - 1;
        if (v12)
        {
          v13 = (double)v12;
          v14 = log10((double)v7 / (double)v12 * 9.0 + 1.0);
          v15 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          v16 = log10(1.0 / v13 * 9.0 + 1.0);
          v17 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          v18 = v15 / v16 + v17;
        }
        else
        {
          v18 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          v14 = 0.0;
          v17 = v18;
        }
        v22 = v14 * (v18 - v17);
      }
      else
      {
        v22 = 0.0;
      }
      v23 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      v24 = v22 + v23;
      goto LABEL_26;
    }
    v19 = (void *)MEMORY[0x1BCCC6008](v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v19)
    {
      objc_msgSend(v19, sel_alignmentRectInsets);
      v21 = v20;
      swift_unknownObjectRelease();
    }
    else
    {
      v21 = 0.0;
    }
    v23 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    v24 = v21 + *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v7 + v23;
    if (*(_BYTE *)(v9 + v10) == 1)
    {
      v2 = v35;
LABEL_26:
      v28 = *(_QWORD *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v28)
      {
        v29 = v28 - 1;
        if (v29)
        {
          v30 = (double)v29;
          v31 = log10((double)v4 / (double)v29 * 9.0 + 1.0);
          v32 = *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          v33 = v23 + v32 / log10(1.0 / v30 * 9.0 + 1.0);
        }
        else
        {
          v31 = 0.0;
          v33 = v23;
        }
        v34 = v31 * (v33 - v23);
      }
      else
      {
        v34 = 0.0;
      }
      goto LABEL_34;
    }
    v25 = (void *)MEMORY[0x1BCCC6008](v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v25)
    {
      objc_msgSend(v25, sel_alignmentRectInsets);
      v27 = v26;
      swift_unknownObjectRelease();
    }
    else
    {
      v27 = 0.0;
    }
    v34 = v27 + *(double *)(v9 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v4;
    v2 = v35;
LABEL_34:
    if (v34 > v24 + 0.6666667)
      goto LABEL_4;
LABEL_6:
    ++v4;
  }
  while (a2 != v4);
  if (v7 != a2 && v7 < a2)
  {
    sub_1B986AA28(v7);
    sub_1B986AA28(a2);
  }
}

unint64_t sub_1B986FB74(unint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;

  v3 = result;
  v4 = (uint64_t)(a2 - result) < 0;
  if (a2 < result)
  {
    v4 = (uint64_t)(result - a2) < 0;
    if ((uint64_t)(result - a2) >= 0)
      return MEMORY[0x1E0DEE9D8];
    __break(1u);
  }
  if (v4)
  {
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  if (a2 == result)
    return MEMORY[0x1E0DEE9D8];
  v5 = a2 - 1;
  if (!a2)
    goto LABEL_49;
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_50:
    __break(1u);
    return result;
  }
  v6 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v5 > result && a2 - 2 >= result)
  {
    v7 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model;
    v8 = a2 - 3;
    while (1)
    {
      v9 = v8 + 1;
      if (v8 + 1 != v5)
        break;
LABEL_42:
      v5 = v8 + 1;
LABEL_43:
      if (v8 >= v3 && v9 >= 1 && (uint64_t)v5 >= 1)
      {
        --v8;
        if (v5 > v3)
          continue;
      }
      return sub_1B98709E0((uint64_t)v6);
    }
    if (v8 + 1 >= v5)
    {
LABEL_37:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_1B9870CC8(0, v6[2] + 1, 1, v6);
      v37 = v6[2];
      v36 = v6[3];
      if (v37 >= v36 >> 1)
        v6 = sub_1B9870CC8((_QWORD *)(v36 > 1), v37 + 1, 1, v6);
      v6[2] = v37 + 1;
      v6[v37 + 4] = v5;
      goto LABEL_42;
    }
    v10 = *(_QWORD *)(v2 + v7);
    v11 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
    if (*(_BYTE *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
    {
      v12 = *(_QWORD *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v12)
      {
        v13 = v12 - 1;
        if (v13)
        {
          v14 = (double)v13;
          v15 = log10((double)(unint64_t)v9 / (double)v13 * 9.0 + 1.0);
          v16 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          v17 = log10(1.0 / v14 * 9.0 + 1.0);
          v18 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          v19 = v16 / v17 + v18;
        }
        else
        {
          v19 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          v15 = 0.0;
          v18 = v19;
        }
        v23 = v15 * (v19 - v18);
      }
      else
      {
        v23 = 0.0;
      }
      v24 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      v25 = v23 + v24;
    }
    else
    {
      v20 = (void *)MEMORY[0x1BCCC6008](v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
      if (v20)
      {
        objc_msgSend(v20, sel_alignmentRectInsets);
        v22 = v21;
        swift_unknownObjectRelease();
      }
      else
      {
        v22 = 0.0;
      }
      v24 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      v25 = v22
          + *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing)
          * (double)(unint64_t)v9
          + v24;
      if (*(_BYTE *)(v10 + v11) != 1)
      {
        v26 = (void *)MEMORY[0x1BCCC6008](v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
        if (v26)
        {
          objc_msgSend(v26, sel_alignmentRectInsets);
          v28 = v27;
          swift_unknownObjectRelease();
        }
        else
        {
          v28 = 0.0;
        }
        v35 = v28 + *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v5;
LABEL_36:
        if (v35 <= v25 + 0.6666667)
          goto LABEL_43;
        goto LABEL_37;
      }
    }
    v29 = *(_QWORD *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v29)
    {
      v30 = v29 - 1;
      if (v30)
      {
        v31 = (double)v30;
        v32 = log10((double)v5 / (double)v30 * 9.0 + 1.0);
        v33 = *(double *)(v10 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
        v34 = v24 + v33 / log10(1.0 / v31 * 9.0 + 1.0);
      }
      else
      {
        v32 = 0.0;
        v34 = v24;
      }
      v35 = v32 * (v34 - v24);
    }
    else
    {
      v35 = 0.0;
    }
    goto LABEL_36;
  }
  return sub_1B98709E0((uint64_t)v6);
}

void sub_1B986FF44(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  unint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  long double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  unint64_t v67;
  double v68;
  double v69;
  double v70;
  long double v71;
  double v72;
  double v73;
  _QWORD *v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  unint64_t v81;
  unint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  unint64_t v85;
  double v86;
  double v87;
  uint64_t v89;

  if (!a3)
    return;
  v4 = a1;
  v5 = a2 - a1;
  if (a2 >= a1)
  {
    if ((uint64_t)(a2 - a1) < 0)
    {
LABEL_154:
      __break(1u);
      goto LABEL_155;
    }
    if (v5 == 10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232680);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1B98786E0;
      if (v4 < 0xFFFFFFFFFFFFFFFELL)
      {
        *(_QWORD *)(v6 + 32) = v4 + 2;
        if (v4 < 0xFFFFFFFFFFFFFFFCLL)
        {
          *(_QWORD *)(v6 + 40) = v4 + 4;
          if (v4 < 0xFFFFFFFFFFFFFFFALL)
          {
            *(_QWORD *)(v6 + 48) = v4 + 6;
            if (v4 < 0xFFFFFFFFFFFFFFF8)
            {
              *(_QWORD *)(v6 + 56) = v4 + 8;
              return;
            }
LABEL_158:
            __break(1u);
            return;
          }
LABEL_157:
          __break(1u);
          goto LABEL_158;
        }
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
LABEL_155:
      __break(1u);
      goto LABEL_156;
    }
  }
  else
  {
    if ((uint64_t)(a1 - a2) < 0)
    {
LABEL_153:
      __break(1u);
      goto LABEL_154;
    }
    v5 = a2 - a1;
  }
  v7 = a3 + 1;
  if (a3 == -1)
  {
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  if (v7 < 2)
  {
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
    goto LABEL_152;
  }
  v8 = 0;
  v86 = (double)v5 / ((double)a3 + 1.0);
  v87 = (double)a1;
  v89 = OBJC_IVAR____TtC13CameraEditKit24TickMarksVisibilityModel_model;
  v83 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v9 = 1;
  v10 = -1.0;
  v84 = v3;
  v85 = a3 + 1;
LABEL_20:
  v12 = (double)v4;
  while (1)
  {
    v13 = v86 * (double)v9 + v87;
    v14 = floor(v13);
    if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_146:
      __break(1u);
      goto LABEL_147;
    }
    if (v14 <= v10)
      goto LABEL_146;
    if (v14 >= 1.84467441e19)
      goto LABEL_148;
    v15 = ceil(v13);
    if ((~*(_QWORD *)&v15 & 0x7FF0000000000000) == 0)
      goto LABEL_149;
    if (v15 <= v10)
      goto LABEL_150;
    if (v15 >= 1.84467441e19)
      goto LABEL_151;
    v11 = (unint64_t)v14;
    v16 = (unint64_t)v15;
    if (v4 == (unint64_t)v14)
    {
      if (v4 == v16)
      {
        v11 = v4;
        goto LABEL_18;
      }
      if (!v16)
      {
        if (v4)
        {
          if ((v8 & 1) != 0)
            goto LABEL_126;
          if (a3 == v9)
            return;
          v8 = 0;
          goto LABEL_19;
        }
        v11 = 0;
        goto LABEL_18;
      }
      if (v4 >= v16)
      {
        if ((v8 & 1) != 0)
          goto LABEL_128;
LABEL_135:
        if (a3 == v9)
          return;
        v8 = 0;
        goto LABEL_19;
      }
      v17 = 1;
      goto LABEL_69;
    }
    if (v11 && v4 < v11)
      break;
    if (v4 == v16)
    {
      if ((v8 & 1) == 0)
        goto LABEL_137;
      if (a3 == v9)
        return;
      v8 = 1;
      goto LABEL_19;
    }
    if (!v16)
    {
      if (v11)
      {
        if ((v8 & 1) == 0)
          goto LABEL_137;
LABEL_126:
        v16 = 0;
LABEL_128:
        v77 = v83;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v77 = sub_1B9870CC8(0, v83[2] + 1, 1, v83);
        v79 = v77[2];
        v78 = v77[3];
        if (v79 >= v78 >> 1)
          v77 = sub_1B9870CC8((_QWORD *)(v78 > 1), v79 + 1, 1, v77);
        v77[2] = v79 + 1;
        v83 = v77;
        v77[v79 + 4] = v16;
        if (a3 == v9)
          return;
        v8 = 0;
        v4 = v16;
LABEL_19:
        if (++v9 >= v7)
          goto LABEL_147;
        goto LABEL_20;
      }
LABEL_117:
      v74 = v83;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v74 = sub_1B9870CC8(0, v83[2] + 1, 1, v83);
      v76 = v74[2];
      v75 = v74[3];
      if (v76 >= v75 >> 1)
        v74 = sub_1B9870CC8((_QWORD *)(v75 > 1), v76 + 1, 1, v74);
      v74[2] = v76 + 1;
      v83 = v74;
      v74[v76 + 4] = v11;
      v3 = v84;
      v7 = v85;
LABEL_18:
      v4 = v11;
      if (a3 == v9)
        return;
      goto LABEL_19;
    }
    if (v4 >= v16)
    {
      if (v11 != v16)
      {
        if ((v8 & 1) == 0)
          goto LABEL_137;
        goto LABEL_128;
      }
      goto LABEL_117;
    }
    v17 = 0;
LABEL_69:
    v47 = *(_QWORD *)(v3 + v89);
    v48 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
    if (*(_BYTE *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
    {
      v49 = *(_QWORD *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v49)
      {
        v50 = v49 - 1;
        if (v50)
        {
          v51 = (double)v50;
          v52 = log10(v12 / (double)v50 * 9.0 + 1.0);
          v53 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          v54 = log10(1.0 / v51 * 9.0 + 1.0);
          v55 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          v56 = v53 / v54 + v55;
        }
        else
        {
          v56 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
          v52 = 0.0;
          v55 = v56;
        }
        v60 = v52 * (v56 - v55);
      }
      else
      {
        v60 = 0.0;
      }
      v61 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
      v62 = v60 + v61;
LABEL_84:
      v66 = *(_QWORD *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
      if (v66)
      {
        v67 = v66 - 1;
        if (v67)
        {
          v68 = (double)v67;
          v69 = log10((double)v16 / (double)v67 * 9.0 + 1.0);
          v70 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
          v71 = v70 / log10(1.0 / v68 * 9.0 + 1.0);
          v10 = -1.0;
          v72 = v61 + v71;
        }
        else
        {
          v69 = 0.0;
          v72 = v61;
        }
        v73 = v69 * (v72 - v61);
        if (v11 == v16)
          goto LABEL_116;
      }
      else
      {
        v73 = 0.0;
        if (v11 == v16)
          goto LABEL_116;
      }
      goto LABEL_94;
    }
    v57 = (void *)MEMORY[0x1BCCC6008](v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v57)
    {
      objc_msgSend(v57, sel_alignmentRectInsets);
      v59 = v58;
      swift_unknownObjectRelease();
    }
    else
    {
      v59 = 0.0;
    }
    v61 = *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    v62 = v59 + *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * v12 + v61;
    if (*(_BYTE *)(v47 + v48) == 1)
    {
      v3 = v84;
      v7 = v85;
      goto LABEL_84;
    }
    v63 = (void *)MEMORY[0x1BCCC6008](v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v63)
    {
      objc_msgSend(v63, sel_alignmentRectInsets);
      v65 = v64;
      swift_unknownObjectRelease();
    }
    else
    {
      v65 = 0.0;
    }
    v3 = v84;
    v7 = v85;
    v73 = v65 + *(double *)(v47 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v16;
    if (v11 == v16)
    {
LABEL_116:
      if (!v17)
        goto LABEL_117;
      v11 = v4;
      goto LABEL_18;
    }
LABEL_94:
    if ((v8 & 1) != 0)
    {
      if (v73 > v62 + 0.6666667)
        goto LABEL_128;
    }
    else if (!v17)
    {
      goto LABEL_137;
    }
    if (a3 == v9)
      return;
    if (++v9 >= v7)
      goto LABEL_147;
  }
  v19 = *(_QWORD *)(v3 + v89);
  v20 = OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic;
  if (*(_BYTE *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_logarithmic) == 1)
  {
    v21 = *(_QWORD *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v21)
    {
      v22 = v21 - 1;
      if (v22)
      {
        v23 = (double)v22;
        v24 = log10(v12 / (double)v22 * 9.0 + 1.0);
        v25 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
        v26 = log10(1.0 / v23 * 9.0 + 1.0);
        v27 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
        v28 = v25 / v26 + v27;
      }
      else
      {
        v28 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
        v24 = 0.0;
        v27 = v28;
      }
      v32 = v24 * (v28 - v27);
    }
    else
    {
      v32 = 0.0;
    }
    v33 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    v34 = v32 + v33;
LABEL_56:
    v38 = *(_QWORD *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarksCount);
    if (v38)
    {
      v39 = v38 - 1;
      if (v39)
      {
        v40 = (double)v39;
        v41 = log10((double)v11 / (double)v39 * 9.0 + 1.0);
        v42 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing);
        v43 = 1.0 / v40;
        v10 = -1.0;
        v44 = v33 + v42 / log10(v43 * 9.0 + 1.0);
      }
      else
      {
        v41 = 0.0;
        v44 = v33;
      }
      v45 = v41 * (v44 - v33);
    }
    else
    {
      v45 = 0.0;
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1BCCC6008](v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v29)
    {
      objc_msgSend(v29, sel_alignmentRectInsets);
      v31 = v30;
      swift_unknownObjectRelease();
    }
    else
    {
      v31 = 0.0;
    }
    v33 = *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkWidth);
    v34 = v31 + *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * v12 + v33;
    if (*(_BYTE *)(v19 + v20) == 1)
    {
      v3 = v84;
      v7 = v85;
      goto LABEL_56;
    }
    v35 = (void *)MEMORY[0x1BCCC6008](v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_dataSource);
    if (v35)
    {
      objc_msgSend(v35, sel_alignmentRectInsets);
      v37 = v36;
      swift_unknownObjectRelease();
    }
    else
    {
      v37 = 0.0;
    }
    v3 = v84;
    v7 = v85;
    v45 = v37 + *(double *)(v19 + OBJC_IVAR____TtC13CameraEditKit14TickMarksModel_tickMarkSpacing) * (double)v11;
  }
  v17 = v45 <= v34 + 0.6666667;
  if (v4 == v16)
  {
    if ((v8 & 1) == 0)
      goto LABEL_134;
    if (a3 == v9)
      return;
    v8 = 1;
    goto LABEL_19;
  }
  if (v16)
    v46 = v4 >= v16;
  else
    v46 = 1;
  if (!v46)
    goto LABEL_69;
  if (v11 == v16)
    goto LABEL_116;
  if ((v8 & 1) != 0)
    goto LABEL_128;
LABEL_134:
  if (v45 <= v34 + 0.6666667)
    goto LABEL_135;
LABEL_137:
  v80 = v83;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v80 = sub_1B9870CC8(0, v83[2] + 1, 1, v83);
  v82 = v80[2];
  v81 = v80[3];
  if (v82 >= v81 >> 1)
    v80 = sub_1B9870CC8((_QWORD *)(v81 > 1), v82 + 1, 1, v80);
  v80[2] = v82 + 1;
  v83 = v80;
  v80[v82 + 4] = v11;
  if (a3 != v9)
  {
    v8 = 1;
    v4 = v11;
    v7 = v85;
    goto LABEL_19;
  }
}

uint64_t type metadata accessor for TickMarksVisibilityModel()
{
  return objc_opt_self();
}

uint64_t sub_1B98709E0(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t i;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 < 2)
    return (uint64_t)v1;
  v3 = 0;
  v4 = v2 >> 1;
  for (i = v2 + 3; ; --i)
  {
    if (v3 == i - 4)
      goto LABEL_5;
    v6 = v1[2];
    if (v3 >= v6)
      break;
    if (i - 4 >= v6)
      goto LABEL_12;
    v7 = v1[v3 + 4];
    v8 = v1[i];
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1B9870DFC(v1);
      v1 = (_QWORD *)result;
    }
    v1[v3 + 4] = v8;
    v1[i] = v7;
LABEL_5:
    if (v4 == ++v3)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

_QWORD *sub_1B9870A98(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF2324E0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1B9871E0C(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B9870BBC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232638);
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
    sub_1B9871EF8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B9870CC8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232680);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B98720DC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B9870DD4(_QWORD *a1)
{
  return sub_1B9870A98(0, a1[2], 0, a1);
}

_QWORD *sub_1B9870DE8(_QWORD *a1)
{
  return sub_1B9870BBC(0, a1[2], 0, a1);
}

_QWORD *sub_1B9870DFC(_QWORD *a1)
{
  return sub_1B9870CC8(0, a1[2], 0, a1);
}

unint64_t sub_1B9870E10(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B98725F0();
  return sub_1B9870E40(a1, v2);
}

unint64_t sub_1B9870E40(uint64_t a1, uint64_t a2)
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

uint64_t sub_1B9870EDC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  __int128 v17;
  uint64_t result;
  uint64_t v19;

  v7 = *v3;
  sub_1B98725FC();
  sub_1B9872608();
  sub_1B9872608();
  v8 = sub_1B9872614();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    while (1)
    {
      v12 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v10);
      v14 = *v12;
      v13 = v12[1];
      if (v14 == a2 && v13 == a3)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_8;
    }
    result = 0;
    v17 = *(_OWORD *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
  }
  else
  {
LABEL_8:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v3;
    *v3 = 0x8000000000000000;
    sub_1B98712EC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *v3 = v19;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v17 = a2;
    *((_QWORD *)&v17 + 1) = a3;
    result = 1;
  }
  *a1 = v17;
  return result;
}

uint64_t sub_1B9871018()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232678);
  result = sub_1B987253C();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9)
          goto LABEL_33;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_33;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_33;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v9)
                    goto LABEL_33;
                  v16 = v29[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v14);
      v19 = *v18;
      v20 = v18[1];
      sub_1B98725FC();
      sub_1B9872608();
      sub_1B9872608();
      result = sub_1B9872614();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v11);
      *v12 = v19;
      v12[1] = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1B98712EC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v7 = result;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0)
    goto LABEL_15;
  if ((a4 & 1) != 0)
  {
    sub_1B9871018();
  }
  else
  {
    if (v9 > v8)
    {
      result = (uint64_t)sub_1B987144C();
      goto LABEL_15;
    }
    sub_1B98715E0();
  }
  v10 = *v4;
  sub_1B98725FC();
  sub_1B9872608();
  sub_1B9872608();
  result = sub_1B9872614();
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a3 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v12 = ~v11;
    do
    {
      v13 = (uint64_t *)(*(_QWORD *)(v10 + 48) + 16 * a3);
      v15 = *v13;
      v14 = v13[1];
      if (v15 == v7 && v14 == a2)
        goto LABEL_18;
      a3 = (a3 + 1) & v12;
    }
    while (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_15:
  v17 = *v4;
  *(_QWORD *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v18 = (uint64_t *)(*(_QWORD *)(v17 + 48) + 16 * a3);
  *v18 = v7;
  v18[1] = a2;
  v19 = *(_QWORD *)(v17 + 16);
  v20 = __OFADD__(v19, 1);
  v21 = v19 + 1;
  if (!v20)
  {
    *(_QWORD *)(v17 + 16) = v21;
    return result;
  }
  __break(1u);
LABEL_18:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232670);
  result = sub_1B98725D8();
  __break(1u);
  return result;
}

void *sub_1B987144C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232678);
  v2 = *v0;
  v3 = sub_1B9872530();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B98715E0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232678);
  result = sub_1B987253C();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v14);
    v19 = *v18;
    v20 = v18[1];
    sub_1B98725FC();
    sub_1B9872608();
    sub_1B9872608();
    result = sub_1B9872614();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v11);
    *v12 = v19;
    v12[1] = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1B9871880(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232688);
  result = sub_1B98725A8();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_1B98725F0();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B9871B34(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1B9870E10(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_1B9871C6C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B9871880(result, a3 & 1);
  result = sub_1B9870E10(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B98725E4();
  __break(1u);
  return result;
}

void *sub_1B9871C6C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232688);
  v2 = *v0;
  v3 = sub_1B987259C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
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
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
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

char *sub_1B9871E0C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 24 * a1 + 32);
    v6 = 24 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_1B98725C0();
  __break(1u);
  return result;
}

char *sub_1B9871EF8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 32 * a1 + 32);
    v6 = 32 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_1B98725C0();
  __break(1u);
  return result;
}

unint64_t sub_1B9871FE0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF232688);
  v3 = (_QWORD *)sub_1B98725B4();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_1B9870E10(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain();
    result = sub_1B9870E10(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

char *sub_1B98720DC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_1B98725C0();
  __break(1u);
  return result;
}

uint64_t sub_1B98721C4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1B9872434()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B9872440()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B987244C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B9872458()
{
  return MEMORY[0x1E0DEA448]();
}

uint64_t sub_1B9872464()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B9872470()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B987247C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B9872488()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B9872494()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B98724A0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1B98724AC()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B98724B8()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1B98724C4()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1B98724D0()
{
  return MEMORY[0x1E0DEB788]();
}

uint64_t sub_1B98724DC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B98724E8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B98724F4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B9872500()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B987250C()
{
  return MEMORY[0x1E0DEBEC8]();
}

uint64_t sub_1B9872518()
{
  return MEMORY[0x1E0DEBF28]();
}

uint64_t sub_1B9872524()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1B9872530()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B987253C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B9872548()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B9872554()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B9872560()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B987256C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B9872578()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B9872584()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B9872590()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B987259C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B98725A8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B98725B4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B98725C0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B98725CC()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1B98725D8()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B98725E4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B98725F0()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B98725FC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B9872608()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B9872614()
{
  return MEMORY[0x1E0DEDF40]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x1E0C92128](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x1E0C92140](*(_QWORD *)&inSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1E0D012B8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1E0D018E0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x1E0CD2618](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C1D0](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextResetClip(CGContextRef c)
{
  MEMORY[0x1E0C9C360](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C560](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

uint64_t CGGradientApply()
{
  return MEMORY[0x1E0C9CA70]();
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA80](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

uint64_t CGGradientGetColorSpace()
{
  return MEMORY[0x1E0C9CAA0]();
}

uint64_t CGGradientGetLocationCount()
{
  return MEMORY[0x1E0C9CAB8]();
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGGradientRef CGGradientRetain(CGGradientRef gradient)
{
  return (CGGradientRef)MEMORY[0x1E0C9CAC8](gradient);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1E0C9CC40](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x1E0C9CCA8](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1E0CA7A90](name, matrix, options, size);
}

uint64_t CTFontGetAccessibilityBoldWeightOfWeight()
{
  return MEMORY[0x1E0CA7B90]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PLTransformForImageOrientation()
{
  return MEMORY[0x1E0D748B8]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0DC4880]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0DC4CF0]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1E0DC5208]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1E0DC52D8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0DC52F0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISizeCeilToScale()
{
  return MEMORY[0x1E0DC5390]();
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

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x1E0DC5A68]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x1E0DC5A70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1E0DEEDC0]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
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

