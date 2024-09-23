@implementation CAMZoomControlUtilities

+ (void)layoutZoomControl:(id)a3 forLayoutStyle:(int64_t)a4 bottomBar:(id)a5 previewView:(id)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v12, "superview");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "backgroundStyle") == 1;
  objc_msgSend(v11, "layoutIfNeeded");
  objc_msgSend(v11, "shutterButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "alignmentRectForFrame:");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:toView:", v48, v16, v18, v20, v22);
  v46 = v25;
  v47 = v24;
  v44 = v27;
  v45 = v26;

  objc_msgSend(v11, "bounds");
  objc_msgSend(v11, "convertRect:toView:", v48);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  objc_msgSend(v10, "bounds");
  objc_msgSend(v10, "convertRect:toView:", v48);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  objc_msgSend(a1, "layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:", v12, a4, v13, v29, v31, v33, v35, v47, v46, v45, v44, v37, v39, v41, v43);
}

+ (double)zoomControlDisplayValueForZoomFactor:(double)a3 mode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6
{
  double result;

  objc_msgSend(a1, "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:videoStabilizationStrength:", a4, a5, a6, 0, a3);
  return result;
}

+ (void)layoutZoomControl:(id)a3 layoutSide:(int64_t)a4 forLayoutStyle:(int64_t)a5 width:(double)a6 marginForZoomButtonFromEdge:(double)a7 marginForZoomDialFromEdge:(double)a8 zoomDialContentMaskingHeight:(double)a9 centerOfZoomControlInContainerView:(CGPoint)a10
{
  double y;
  double x;
  id v18;
  double *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MaxY;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  double v42;
  CGFloat rect;
  double v44;
  double v45;
  double v46;
  double v47;
  CGAffineTransform v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGAffineTransform v53;
  CGRect v54;
  CGRect v55;

  y = a10.y;
  x = a10.x;
  v18 = a3;
  v19 = (double *)MEMORY[0x1E0C9D648];
  v46 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v47 = *MEMORY[0x1E0DC49E8];
  v44 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v45 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  objc_msgSend(v18, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  rect = v25;
  v27 = v26;

  v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v53.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v53.c = v28;
  *(_OWORD *)&v53.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "_zoomControlRadiusForZoomControl:layoutSide:layoutStyle:width:centerOfZoomControlInContainerBounds:marginForZoomDiaFromEdge:", v18, a4, a5, a6, x, y, a8);
  v30 = v29;
  if (a4 == 1)
  {
    v32 = vabdd_f64(v29, fabs(x));
    v37 = v29;
    v39 = (a6 - v32) * 0.5;
    v33 = a8 - v39;
    v40 = a7;
    v31 = v27 * 0.5 - a6 * 0.5 + v39;
    v38 = v32 - (v40 + a8);
    CGAffineTransformMakeRotation(&v53, 1.57079633);
    objc_msgSend(v18, "setOrientation:", 4);
  }
  else if (a4)
  {
    v33 = *v19;
    v31 = v19[1];
    v38 = 0.0;
    a6 = v19[2];
    v32 = v19[3];
    v37 = v29;
  }
  else
  {
    v42 = a7;
    v31 = y - v29;
    v32 = v27 - (y - v29) - a8;
    v33 = x + a6 * -0.5;
    v54.origin.x = v22;
    v34 = v30;
    v54.origin.y = v24;
    v54.size.width = rect;
    v54.size.height = v27;
    MaxY = CGRectGetMaxY(v54);
    v55.origin.x = v33;
    v55.origin.y = v31;
    v55.size.width = a6;
    v55.size.height = v32;
    v36 = MaxY - CGRectGetMaxY(v55);
    v37 = v34;
    v38 = v32 - (v42 - v36);
  }
  objc_msgSend(v18, "setContentInsets:", v47, v46, v45, v44);
  objc_msgSend(v18, "frameForAlignmentRect:", v33, v31, a6, v32);
  v41 = *((_OWORD *)v19 + 1);
  v51 = *(_OWORD *)v19;
  v52 = v41;
  v50 = *MEMORY[0x1E0C9D538];
  +[CAMView convertRect:toCeiledBounds:andRoundedCenter:toViewScale:](CAMView, "convertRect:toCeiledBounds:andRoundedCenter:toViewScale:", &v51, &v50, v18);
  objc_msgSend(v18, "setZoomButtonMaxYWhenContracted:", v38);
  objc_msgSend(v18, "setZoomDialContentMaskingHeight:", a9);
  objc_msgSend(v18, "setZoomDialRadius:", v37);
  objc_msgSend(v18, "setBounds:", v51, v52);
  objc_msgSend(v18, "setCenter:", v50);
  v49 = v53;
  objc_msgSend(v18, "setTransform:", &v49);

}

+ (void)layoutZoomControl:(CGFloat)a3 forLayoutStyle:(CGFloat)a4 bottomBarAlignmentRect:(CGFloat)a5 bottomBarTransparent:(CGFloat)a6 shutterButtonAlignmentRect:(CGFloat)a7 previewViewAlignmentRect:(CGFloat)a8
{
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  int v32;
  double v33;
  double v35;
  double v36;
  double v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v38 = a11;
  UIRectGetCenter();
  v36 = v23;
  v37 = v22;
  objc_msgSend(v38, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scale");
  v35 = v28;

  if (a13)
  {
    v39.origin.x = a5;
    v39.origin.y = a6;
    v39.size.width = a7;
    v39.size.height = a8;
    v29 = v26 - CGRectGetMinY(v39) + 31.0;
    v30 = 0.0;
  }
  else
  {
    v40.origin.x = a1;
    v40.origin.y = a2;
    v40.size.width = a3;
    v40.size.height = a4;
    v29 = v26 - CGRectGetMinY(v40) + 21.0;
    v41.origin.x = a1;
    v41.origin.y = a2;
    v41.size.width = a3;
    v41.size.height = a4;
    v30 = v26 - CGRectGetMinY(v41);
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isSplitScreenSupported");

  v33 = fmin(a3, 414.0);
  if (!v32)
    v33 = a3;
  +[CAMZoomControlUtilities layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:](CAMZoomControlUtilities, "layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:", v38, 0, a12, v33, v29 + -1.0 / v35, v30, a4, v37, v36);

}

+ (double)_zoomControlRadiusForZoomControl:(id)a3 layoutSide:(int64_t)a4 layoutStyle:(int64_t)a5 width:(double)a6 centerOfZoomControlInContainerBounds:(CGPoint)a7 marginForZoomDiaFromEdge:(double)a8
{
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  v10 = a3;
  objc_msgSend(v10, "zoomDialBorderWidth");
  v12 = v11;
  if (!a4)
  {
    objc_msgSend(v10, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");

  }
  if (a5 == 4 && v12 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");

  }
  UIFloorToViewScale();
  v16 = v12 + v15;

  return v16;
}

+ (int64_t)deviceForEmulatingZoomFactor:(double)a3 fromDevice:(int64_t)a4 mode:(int64_t)a5 continuousZoomSupported:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  int64_t v22;
  void *v23;
  int64_t v24;
  uint64_t v25;
  BOOL v26;
  double v27;

  v6 = a6;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((unint64_t)(a4 - 1) > 0xA)
    v12 = 0;
  else
    v12 = qword_1DB9A4B90[a4 - 1];
  objc_msgSend(v10, "superWideToWideZoomFactorForDevicePosition:", v12);
  v14 = v13;
  objc_msgSend(v11, "wideToTelephotoZoomFactorForDevicePosition:", v12);
  v16 = v15;
  v17 = 1.0;
  if (!v6)
  {
    objc_msgSend(v11, "significantZoomFactorsForMode:device:", a5, 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    v17 = v20 / v14;

  }
  v21 = v14 * v16;
  if (a4 == 6 && v21 <= a3)
  {
    v22 = 4;
    v23 = v11;
    v24 = a5;
    v25 = 4;
  }
  else
  {
    if (a4 != 4 || v17 <= a3)
    {
      if (a4 == 5 && v21 <= a3 && (objc_msgSend(v11, "isBackTelephotoSupported") & 1) != 0)
        goto LABEL_25;
      if (a4 == 5 && v14 <= a3)
      {
        v22 = 2;
        goto LABEL_36;
      }
      if (a4 == 10 && v14 <= a3)
      {
        v22 = 8;
        goto LABEL_36;
      }
      if (a4 == 2 && v16 <= a3 && (objc_msgSend(v11, "isBackTelephotoSupported") & 1) != 0)
      {
LABEL_25:
        v22 = 3;
        goto LABEL_36;
      }
      v26 = a3 < 1.0;
      if (a3 < 1.0 && a4 == 2 && v6)
      {
        if ((objc_msgSend(v11, "isBackSuperWideSupported") & 1) != 0)
          goto LABEL_32;
      }
      else
      {
        if (a3 >= 1.0 || a4 != 8 || !v6)
          goto LABEL_14;
        if ((objc_msgSend(v11, "isFrontSuperWideSupported") & 1) != 0)
          goto LABEL_21;
      }
      v26 = 1;
      goto LABEL_14;
    }
    v22 = 6;
    v23 = v11;
    v24 = a5;
    v25 = 6;
  }
  if ((objc_msgSend(v23, "isSupportedMode:withDevice:", v24, v25) & 1) != 0)
    goto LABEL_36;
  v26 = a3 < 1.0;
LABEL_14:
  v27 = 1.0 / v14;
  if (a4 == 2 && v27 >= a3 && !v6)
    goto LABEL_31;
  if (a4 == 8 && v27 >= a3 && !v6)
  {
    if ((objc_msgSend(v11, "isFrontSuperWideSupported") & 1) != 0)
    {
LABEL_21:
      v22 = 10;
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  if (a4 == 3 && 1.0 / v16 > a3)
  {
LABEL_31:
    if ((objc_msgSend(v11, "isBackSuperWideSupported") & 1) != 0)
    {
LABEL_32:
      v22 = 5;
      goto LABEL_36;
    }
  }
LABEL_33:
  if (v26 && a4 == 3)
    v22 = 2;
  else
    v22 = a4;
LABEL_36:

  return v22;
}

+ (double)_baseSingleCameraDeviceForDevice:(int64_t)a3
{
  int64_t v3;

  v3 = 2;
  if (a3 != 4)
    v3 = a3;
  if ((unint64_t)(a3 - 6) >= 2)
    return (double)v3;
  else
    return (double)5;
}

+ (double)equivalentZoomFactor:(double)a3 forDevice:(int64_t)a4 fromDevice:(int64_t)a5
{
  double v6;

  if (a5 != a4)
  {
    objc_msgSend(a1, "zoomScaleFromDevice:toDevice:", a5, a4);
    return v6 * a3;
  }
  return a3;
}

+ (double)zoomScaleFromDevice:(int64_t)a3 toDevice:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  int v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((unint64_t)(a3 - 1) > 0xA)
    v9 = 0;
  else
    v9 = qword_1DB9A4B90[a3 - 1];
  if ((unint64_t)(a4 - 1) > 0xA)
    v10 = 0;
  else
    v10 = qword_1DB9A4B90[a4 - 1];
  if (v9 == v10)
  {
    objc_msgSend(v7, "superWideToWideZoomFactorForDevicePosition:", v9);
    v12 = v11;
    objc_msgSend(v8, "wideToTelephotoZoomFactorForDevicePosition:", v9);
    v14 = v13;
    objc_msgSend(a1, "_baseSingleCameraDeviceForDevice:", a3);
    v16 = (uint64_t)v15;
    objc_msgSend(a1, "_baseSingleCameraDeviceForDevice:", a4);
    v18 = (uint64_t)v17;
    v19 = 1.0;
    switch(v16)
    {
      case 2:
      case 8:
        if (v18 == 3)
        {
          v19 = 1.0 / v14;
          goto LABEL_23;
        }
        if (v16 == 8)
          goto LABEL_35;
        if (v16 == 3)
        {
LABEL_38:
          v19 = v12 * v14;
          switch(v18)
          {
            case 2:
            case 8:
              v19 = v14;
              break;
            case 5:
            case 10:
              goto LABEL_23;
            default:
              goto LABEL_22;
          }
          goto LABEL_23;
        }
        if (v16 != 2)
          goto LABEL_23;
        goto LABEL_35;
      case 3:
        goto LABEL_38;
      case 4:
      case 6:
      case 7:
      case 9:
        goto LABEL_23;
      case 5:
      case 10:
        if (v18 == 3)
        {
          v19 = 1.0 / (v12 * v14);
          goto LABEL_23;
        }
        if (v16 == 10)
          goto LABEL_31;
        if (v16 != 8)
        {
          if (v16 == 5)
          {
LABEL_31:
            if (v18 == 8 || v18 == 2)
              v19 = 1.0 / v12;
          }
          goto LABEL_23;
        }
LABEL_35:
        v19 = v12;
        if (v18 == 5 || v18 == 10)
          goto LABEL_23;
        break;
      default:
        break;
    }
  }
  else
  {
    v20 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 0xB)
        v21 = 0;
      else
        v21 = off_1EA328E98[a3];
      if ((unint64_t)a4 > 0xB)
        v22 = 0;
      else
        v22 = off_1EA328E98[a4];
      v24 = 138543618;
      v25 = v21;
      v26 = 2114;
      v27 = v22;
      _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "Cannot calculate relative zoom between front and back devices: %{public}@, %{public}@", (uint8_t *)&v24, 0x16u);
    }

  }
LABEL_22:
  v19 = 1.0;
LABEL_23:

  return v19;
}

+ (BOOL)shouldEmulateTripleCameraZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  int64_t v8;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  char v15;
  int v16;

  v8 = a4;
  if ((unint64_t)(a4 - 1) > 0xA)
    v10 = 0;
  else
    v10 = qword_1DB9A4B90[a4 - 1];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v10, a5, a6) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v12 = objc_msgSend(v11, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", a3, objc_msgSend(v11, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", v8, a3, a5, a6, 0), a5, a6);
    LOBYTE(v8) = 0;
    if (v12)
    {
      v13 = objc_msgSend(v11, "isSuperWideSupportedForMode:devicePosition:videoConfiguration:", a3, v10, a5);
      v14 = objc_msgSend(v11, "isWideSupportedForMode:devicePosition:videoConfiguration:", a3, v10, a5);
      v15 = objc_msgSend(v11, "isTelephotoSupportedForMode:devicePosition:videoConfiguration:", a3, v10, a5);
      if (v13 && v14 && (v15 & 1) != 0)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        v16 = objc_msgSend(v11, "isDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v10, a5, a6);
        LODWORD(v8) = v16 & objc_msgSend(v11, "isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v10, a5, a6);
      }
    }
  }

  return v8;
}

+ (BOOL)shouldEmulateWideDualCameraZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6
{
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;

  if ((unint64_t)(a4 - 8) < 3 || a4 == 11 || a4 == 1)
  {
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6, 0);
  v15 = objc_msgSend(a1, "shouldEmulateTripleCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v14, a5, a6);
  v16 = 0;
  if ((v15 & 1) == 0)
  {
    if ((objc_msgSend(v13, "isTripleCameraSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v12, a5, a6) & 1) != 0|| (objc_msgSend(v13, "isWideDualSupportedForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a3, v12, a5, a6) & 1) != 0|| !objc_msgSend(v13, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v14, a5,
                          a6))
    {
      goto LABEL_17;
    }
    v17 = objc_msgSend(v13, "isSuperWideSupportedForMode:devicePosition:videoConfiguration:", a3, v12, a5);
    v18 = objc_msgSend(v13, "isWideSupportedForMode:devicePosition:videoConfiguration:", a3, v12, a5);
    v19 = v18;
    if ((v11 & 1) != 0)
    {
      if ((v17 & v18 & 1) == 0)
      {
LABEL_17:
        v16 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "frontZoomBehaviorForCaptureMode:", a3);

      if ((unint64_t)(v21 - 1) < 2 || ((v17 ^ 1) & 1) != 0 || ((v19 ^ 1) & 1) != 0)
        goto LABEL_17;
    }
    v16 = 1;
  }
LABEL_18:

  return v16;
}

+ (BOOL)shouldApplyContinuousZoomForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 zoomFactors:(id *)a7 displayZoomFactors:(id *)a8
{
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unsigned int v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  _QWORD *v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  double v122;
  _BOOL4 v123;
  _BOOL4 v124;
  _BOOL4 v125;
  int v128;
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[3];
  _QWORD v132[3];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[3];
  _QWORD v145[4];
  _QWORD v146[4];
  _QWORD v147[3];
  _QWORD v148[3];
  _QWORD v149[4];
  _QWORD v150[6];

  v150[4] = *MEMORY[0x1E0C80C00];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((unint64_t)(a4 - 8) < 3)
    goto LABEL_4;
  if (a4 == 11)
  {
    v15 = 1;
    v14 = 1;
  }
  else
  {
    if (a4 == 1)
    {
LABEL_4:
      v14 = 1;
      v15 = 1;
      goto LABEL_5;
    }
    v14 = 0;
    v15 = 0;
  }
LABEL_5:
  v16 = objc_msgSend(v12, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a4, a3, a5, a6, 0);
  v17 = objc_msgSend(v13, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v16, a5, a6);
  v18 = (0x420u >> v16) & 1;
  if (v16 > 0xA)
    v18 = 0;
  v121 = v18;
  v19 = v16 <= 0xA && (v16 & 0x7FF) == 4;
  v124 = v19;
  v20 = v16 <= 0xA && (v16 & 0x7FF) == 6;
  v21 = v16 <= 0xA && (v16 & 0x7FF) == 3;
  v123 = v21;
  v22 = v16 <= 0xA && (v16 & 0x7FF) == 7;
  v23 = v16 <= 0xA && (v16 & 0x7FF) == 2;
  v125 = v23;
  v128 = objc_msgSend(v13, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a3, v15, a5);
  objc_msgSend(v13, "quadraWideDisplayZoomFactor");
  v25 = v24;
  objc_msgSend(v13, "quadraWideRelativeZoomFactor");
  v27 = v26;
  objc_msgSend(v13, "superWideDisplayZoomFactor");
  v29 = v28;
  objc_msgSend(v13, "wideDisplayZoomFactor");
  v31 = v30;
  objc_msgSend(v13, "telephotoDisplayZoomFactor");
  if (((v14 | v17 ^ 1) & 1) != 0)
    goto LABEL_23;
  v36 = v32;
  objc_msgSend(v13, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v16, a5, a6);
  v38 = v37;
  v39 = +[CAMZoomControlUtilities shouldEmulateTripleCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:](CAMZoomControlUtilities, "shouldEmulateTripleCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v16, a5, a6);
  v40 = +[CAMZoomControlUtilities shouldEmulateWideDualCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:](CAMZoomControlUtilities, "shouldEmulateWideDualCameraZoomForMode:device:videoConfiguration:videoStabilizationStrength:", a3, v16, a5, a6);
  if (v22)
  {
    v122 = v25;
    objc_msgSend(v13, "tripleCameraSwitchOverZoomFactorsForDevicePosition:", v15);
    v42 = v41;
    v44 = v43;
    v45 = v38 / v41;
    if ((objc_msgSend(v13, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, v15) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v148[0] = v46;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v148[1] = v47;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v148[2] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 3);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v147[0] = v49;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v147[1] = v50;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v147[2] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v128 & 1) != 0)
      {
        v27 = v27 * v42;
        v52 = 1;
LABEL_41:
        v25 = v122;
LABEL_42:
        v76 = (void *)objc_msgSend(v35, "mutableCopy");
        v77 = (void *)objc_msgSend(v34, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "insertObject:atIndex:", v78, v52);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "insertObject:atIndex:", v79, v52);

LABEL_43:
        v35 = v76;
        v34 = v77;
        goto LABEL_44;
      }
      goto LABEL_44;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v150[0] = v69;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v150[1] = v70;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v150[2] = v71;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v45);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v150[3] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 4);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v149[0] = &unk_1EA3B1770;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v149[1] = v73;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v149[2] = v74;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v149[3] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v128 & 1) == 0)
      goto LABEL_44;
    v27 = v27 * v42;
LABEL_40:
    v52 = 2;
    goto LABEL_41;
  }
  if (v39)
  {
    v122 = v25;
    objc_msgSend(v13, "superWideToWideZoomFactorForDevicePosition:", v15);
    v54 = v53;
    objc_msgSend(v13, "wideToTelephotoZoomFactorForDevicePosition:", v15);
    v56 = v55;
    objc_msgSend(v13, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:", a3, 7, 0, a6, 0);
    v58 = v57;
    v59 = 1.0 / (v54 * v56);
    if (!v123)
      v59 = 1.0;
    if (v124 || v125)
      v60 = 1.0 / v54;
    else
      v60 = v59;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v146[0] = v61;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v146[1] = v62;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v146[2] = v63;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58 / v54);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v146[3] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 4);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v145[0] = v65;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54 * v60);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v145[1] = v66;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56 * (v54 * v60));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v145[2] = v67;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58 * v60);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v145[3] = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v128 & 1) == 0)
      goto LABEL_44;
    v27 = v27 * (v54 * v60);
    goto LABEL_40;
  }
  if (v40)
  {
    v81 = v27;
    objc_msgSend(v13, "superWideToWideZoomFactorForDevicePosition:", v15);
    v83 = v82;
    objc_msgSend(v13, "maximumZoomFactorForMode:device:videoConfiguration:videoStabilizationStrength:shouldResolveDevice:", a3, 6, 0, a6, 0);
    v85 = v84;
    v86 = v84 / v83;
    if (v125)
      v87 = 1.0 / v83;
    else
      v87 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v88;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v89;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v86);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v144[2] = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 3);
    v35 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v143[0] = v91;
    v92 = v83 * v87;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v143[1] = v93;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v85 * v87);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v143[2] = v94;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v128 & 1) != 0)
    {
      v27 = v81 * v92;
      v52 = 2;
      goto LABEL_42;
    }
  }
  else
  {
    if (v124)
    {
      objc_msgSend(v13, "wideToTelephotoZoomFactorForDevicePosition:", v15);
      v142[0] = &unk_1EA3B1770;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v142[1] = v95;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v142[2] = v96;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 3);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v141[0] = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v141[1] = v35;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v141[2] = v97;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 3);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_43;
    }
    if (!v20)
    {
      if (v123)
      {
        objc_msgSend(v13, "wideToTelephotoZoomFactorForDevicePosition:", v15);
        v106 = v105;
        v136[0] = &unk_1EA3B1770;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v136[1] = v107;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = v34;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38 * v106);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v135[1] = v35;
        v108 = (void *)MEMORY[0x1E0C99D20];
        v109 = v135;
      }
      else
      {
        if (!v121)
        {
          if (!v125)
          {
LABEL_23:
            v33 = 0;
            v34 = 0;
            v35 = 0;
            goto LABEL_51;
          }
          if (!objc_msgSend(v13, "isFrontSuperWideSupported")
            || (objc_msgSend(v13, "isBackDualSupported") & 1) != 0
            || (objc_msgSend(v13, "isBackWideDualSupported") & 1) != 0
            || (objc_msgSend(v13, "isBackTripleCameraSupported") & 1) != 0)
          {
            v130[0] = &unk_1EA3B1770;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v130[1] = v116;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v129[0] = v117;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v129[1] = v118;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 2);
            v35 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v132[0] = &unk_1EA3B1770;
            v132[1] = &unk_1EA3B1780;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v132[2] = v119;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v131[0] = v117;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31 + v31);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v131[1] = v118;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v131[2] = v120;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 3);
            v35 = (id)objc_claimAutoreleasedReturnValue();

          }
          if (v128)
          {
            v52 = 1;
            goto LABEL_42;
          }
          goto LABEL_44;
        }
        objc_msgSend(v13, "superWideToWideZoomFactorForDevicePosition:", v15);
        v114 = v113;
        v134[0] = &unk_1EA3B1770;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v134[1] = v115;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v133[0] = v34;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38 / v114);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v133[1] = v35;
        v108 = (void *)MEMORY[0x1E0C99D20];
        v109 = v133;
      }
      objc_msgSend(v108, "arrayWithObjects:count:", v109, 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    objc_msgSend(v13, "superWideToWideZoomFactorForDevicePosition:", v15);
    v99 = v98;
    v100 = v38 / v98;
    if ((objc_msgSend(v13, "isDualDeviceDisparitySupportedForMode:devicePosition:", a3, v15) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v138[0] = v101;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v100);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v138[1] = v102;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v99);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v137[0] = v103;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v137[1] = v104;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v140[0] = v110;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v140[1] = v111;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v100);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v140[2] = v112;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 3);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      v139[0] = &unk_1EA3B1770;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v99);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v139[1] = v103;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v38);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v139[2] = v104;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 2;
    }

    if ((v128 & 1) != 0)
    {
      v27 = v27 * v99;
      goto LABEL_42;
    }
  }
LABEL_44:
  v33 = 0;
  if (v34 && v35)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v34);
    if (a8)
    {
      v35 = objc_retainAutorelease(v35);
      *a8 = v35;
    }
    v33 = 1;
  }
LABEL_51:

  return v33;
}

+ (double)zoomControlDisplayValueForZoomFactor:(double)a3 mode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoStabilizationStrength:(int64_t)a7
{
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  id v26;
  id v27;
  double v28;
  double v29;
  int v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSObject *v36;
  BOOL v38;
  int v39;
  double v40;
  id v41;
  id v42;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((unint64_t)(a5 - 1) > 0xA)
    v16 = 0;
  else
    v16 = qword_1DB9A4B90[a5 - 1];
  v17 = objc_msgSend(v14, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", a4, a5, a6, a7);
  v18 = objc_msgSend(v15, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", a4, v16, a6, a7);
  v19 = objc_msgSend(v15, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", a5, a4, a6, a7, 0);
  objc_msgSend(v15, "superWideDisplayZoomFactor");
  v21 = v20;
  objc_msgSend(v15, "wideDisplayZoomFactor");
  v23 = v22;
  objc_msgSend(v15, "telephotoDisplayZoomFactor");
  if (v17)
  {
    v41 = 0;
    v42 = 0;
    v25 = objc_msgSend(a1, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", a4, v19, a6, a7, &v42, &v41);
    v26 = v42;
    v27 = v41;
    if (v25)
    {
      objc_msgSend(a1, "piecewiseLinearMappingForX:fromXValues:toYValues:", v26, v27, a3);
      a3 = v28;
    }

    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    v21 = a3;
    goto LABEL_14;
  }
  v29 = v24;
  v30 = objc_msgSend(v15, "isDualDeviceDisparitySupportedForMode:devicePosition:", a4, v16);
  v31 = objc_msgSend(v15, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a4, v16, a6);
  objc_msgSend(v15, "quadraWideDisplayZoomFactor");
  v33 = v32;
  objc_msgSend(v15, "quadraWideRelativeZoomFactor");
  v35 = v34;
  switch(v19)
  {
    case 0uLL:
    case 1uLL:
    case 7uLL:
    case 9uLL:
      v36 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[CAMZoomControlUtilities zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:videoStabilizationStrength:].cold.1(a2, v19, v36);

      v21 = v23;
      break;
    case 2uLL:
    case 8uLL:
    case 0xBuLL:
      v38 = v34 == a3;
      goto LABEL_16;
    case 3uLL:
      v21 = v29;
      break;
    case 4uLL:
      if (v30)
        v21 = v29;
      else
        v21 = v23;
      break;
    case 5uLL:
    case 0xAuLL:
      break;
    case 6uLL:
      if (v30)
      {
        objc_msgSend(v15, "superWideToWideZoomFactorForDevicePosition:", 0);
        v38 = v35 * v40 == a3;
LABEL_16:
        v39 = v38;
        if ((v31 & v39) != 0)
          v21 = v33;
        else
          v21 = v23;
      }
      break;
    default:
      v21 = 0.0;
      break;
  }
LABEL_14:

  return v21;
}

+ (double)piecewiseLinearMappingForX:(double)a3 fromXValues:(id)a4 toYValues:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  double v21;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "count");
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = a3;
  if (v9)
  {
    v10 = v9;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__CAMZoomControlUtilities_piecewiseLinearMappingForX_fromXValues_toYValues___block_invoke;
    v12[3] = &unk_1EA328E50;
    v16 = a3;
    v13 = v8;
    v15 = &v18;
    v14 = v7;
    v17 = v10;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v12);

    a3 = v19[3];
  }
  _Block_object_dispose(&v18, 8);

  return a3;
}

void __76__CAMZoomControlUtilities_piecewiseLinearMappingForX_fromXValues_toYValues___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  objc_msgSend(a2, "doubleValue");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (*(double *)(a1 + 56) <= v8)
  {
    if (a3)
    {
      v12 = a3 - 1;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v18 = v17;

      +[CAMZoomControlUtilities linearMappingForX:x1:y1:x2:y2:clamp:](CAMZoomControlUtilities, "linearMappingForX:x1:y1:x2:y2:clamp:", 1, *(double *)(a1 + 56), v15, v18, v8, v11);
      v11 = v19;
    }
    goto LABEL_6;
  }
  if (*(_QWORD *)(a1 + 64) - 1 == a3)
  {
LABEL_6:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
    *a4 = 1;
  }
}

+ (double)linearMappingForX:(double)a3 x1:(double)a4 y1:(double)a5 x2:(double)a6 y2:(double)a7 clamp:(BOOL)a8
{
  double v9;
  double v10;

  if (a3 == a4)
    return a5;
  if (a3 == a6)
    return a7;
  if (a6 == a4)
    return a5;
  if (!a8)
    return a5 + (a3 - a4) / (a6 - a4) * (a7 - a5);
  if (a4 <= a6)
  {
    v9 = a7;
    v10 = a6;
    a7 = a5;
    a6 = a4;
  }
  else
  {
    v9 = a5;
    v10 = a4;
  }
  if (a6 >= a3)
    return a7;
  if (v10 <= a3)
    return v9;
  return a7 + (a3 - a6) / (v10 - a6) * (v9 - a7);
}

+ (double)appropriateSignificantZoomFactorForDevice:(int64_t)a3 fromDevice:(int64_t)a4 currentZoomFactor:(double)a5 targetZoomFactor:(double)a6 mode:(int64_t)a7
{
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  double v29;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "significantZoomFactorsForMode:device:", a7, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count") == 2)
  {
    objc_msgSend(a1, "zoomScaleFromDevice:toDevice:", a4, a3);
    v16 = v15 * a5;
    v17 = v15 * a6;
    objc_msgSend(v14, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v14, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    v24 = v16 < v23 || v17 > v20;
    v25 = v20;
    if (v24)
    {
      v26 = v16 > v20 || v17 < v23;
      v25 = v23;
      if (v26)
      {
        if (a3 == a4)
        {
          v25 = v16;
        }
        else if (v16 < (v20 + v23) * 0.5)
        {
          v25 = v20;
        }
        else
        {
          v25 = v23;
        }
      }
    }
  }
  else
  {
    if ((unint64_t)objc_msgSend(v14, "count") >= 3)
    {
      v27 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        +[CAMZoomControlUtilities appropriateSignificantZoomFactorForDevice:fromDevice:currentZoomFactor:targetZoomFactor:mode:].cold.1((uint64_t)v14, v27);

    }
    objc_msgSend(v14, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v25 = v29;

  }
  return v25;
}

+ (id)exifFocalLengthsByZoomFactorForMode:(int64_t)a3 device:(int64_t)a4 videoConfiguration:(int64_t)a5 videoStabilizationStrength:(int64_t)a6 customLensGroup:(id)a7 isTrueVideo:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  void *v27;
  double v28;
  double v29;
  double v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  id v34;
  void *v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v8 = a8;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isCustomLensSupportedForMode:device:isTrueVideo:", a3, a4, v8))
  {
    v46 = 0;
    v45 = 0;
    v15 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", a3, a4, a5, a6, &v46, &v45);
    v16 = v46;
    v17 = v45;
    v35 = v16;
    if (v15)
    {
      v34 = v17;
      +[CAMZoomPoint zoomPointsWithFactors:displayZoomFactors:customLensGroup:](CAMZoomPoint, "zoomPointsWithFactors:displayZoomFactors:customLensGroup:", v16, v17, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 0x7FFFFFFFFFFFFFFFLL;
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0x7FFFFFFFFFFFFFFFLL;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __144__CAMZoomControlUtilities_exifFocalLengthsByZoomFactorForMode_device_videoConfiguration_videoStabilizationStrength_customLensGroup_isTrueVideo___block_invoke;
      v36[3] = &unk_1EA328E78;
      v36[4] = &v41;
      v36[5] = &v37;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v36);
      if (v42[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v42[3];
        v21 = v38[3];
        v22 = objc_msgSend(v18, "count");
        if (v20)
          v24 = v20 - 1;
        else
          v24 = 0;
        if (v21 + 1 < (unint64_t)(v22 - 1))
          v25 = v21 + 1;
        else
          v25 = v22 - 1;
        if (v24 <= v25)
        {
          *(_QWORD *)&v23 = 138543362;
          v33 = v23;
          do
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", v24, v33);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "zoomFactor");
            v29 = v28;
            objc_msgSend(v27, "displayFocalLength");
            if (v30 == 0.0)
            {
              v31 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                v48 = v27;
                _os_log_error_impl(&dword_1DB760000, v31, OS_LOG_TYPE_ERROR, "Failed to determine focal length for zoomPoint: %{public}@, skipping it.", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v31 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, v32);

            }
            ++v24;
          }
          while (v24 <= v25);
        }
      }
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);

      v17 = v34;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

uint64_t __144__CAMZoomControlUtilities_exifFocalLengthsByZoomFactorForMode_device_videoConfiguration_videoStabilizationStrength_customLensGroup_isTrueVideo___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;

  result = objc_msgSend(a2, "customLens");
  if (result)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v8 + 24) == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v8 + 24) = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *a4 = 1;
  }
  return result;
}

+ (void)zoomControlDisplayValueForZoomFactor:(NSObject *)a3 mode:device:videoConfiguration:videoStabilizationStrength:.cold.1(const char *a1, unint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CAMDebugStringForCaptureDevice(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Unhandled case for zoom button toggle/selection in %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

+ (void)appropriateSignificantZoomFactorForDevice:(uint64_t)a1 fromDevice:(NSObject *)a2 currentZoomFactor:targetZoomFactor:mode:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Cannot handle more than 2 significant zoom factors at this time: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
