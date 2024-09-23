@implementation AXMGeometryUtilities

+ (CGRect)motionCorrectedNormalizedFrame:(CGRect)a3 fromAttitude:(id)a4 fromFieldOfViewX:(float)a5 fromFieldOfViewY:(float)a6 toAttitude:(id)a7 toFieldOfViewX:(float)a8 toFieldOfViewY:(float)a9 interfaceOrientation:(int64_t)a10 mirrored:(BOOL)a11
{
  _BOOL4 v11;
  double height;
  double width;
  double y;
  double x;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  long double v37;
  double v38;
  double v39;
  long double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float64x2_t v48;
  float64x2_t v49;
  int8x16_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  double v57;
  float64x2_t v58;
  double v59;
  double v60;
  double v61;
  double MidY;
  double MidX;
  double v64;
  double v65;
  double v66;
  CGRect v67;
  CGRect v68;
  CGRect result;

  v11 = a11;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = a4;
  v23 = a7;
  v24 = v23;
  if (!v22 || !v23 || a5 == 0.0 || a6 == 0.0 || a8 == 0.0 || a9 == 0.0)
  {
    AXMediaLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[AXMGeometryUtilities motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:].cold.1(v25);

  }
  else
  {
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    MidX = CGRectGetMidX(v67);
    v68.origin.x = x;
    v68.origin.y = y;
    v68.size.width = width;
    v68.size.height = height;
    MidY = CGRectGetMidY(v68);
    v30 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v30, "multiplyByInverseOfAttitude:", v24);
    v31 = -1.0;
    if (v11)
      v31 = 1.0;
    v66 = v31;
    v32 = tan(a5 * 0.5 * 0.0174532925);
    v33 = tan(a6 * 0.5 * 0.0174532925);
    v34 = a8 == a5;
    v35 = v32;
    if (!v34)
    {
      v36 = v33;
      v37 = tan(a8 * 0.5 * 0.0174532925);
      v33 = v36;
      v32 = v37;
    }
    v34 = a9 == a6;
    v38 = v33;
    if (!v34)
    {
      v39 = v33;
      v40 = tan(a9 * 0.5 * 0.0174532925);
      v33 = v39;
      v38 = v40;
    }
    v41 = MidX + -0.5 + MidX + -0.5;
    v42 = MidY + -0.5 + MidY + -0.5;
    switch(a10)
    {
      case 0:
      case 1:
        v42 = -v42;
        v43 = MidX + -0.5 + MidX + -0.5;
        break;
      case 2:
        v43 = -v41;
        break;
      case 3:
        v43 = -v42;
        v42 = -v41;
        break;
      case 4:
        v43 = MidY + -0.5 + MidY + -0.5;
        v42 = MidX + -0.5 + MidX + -0.5;
        break;
      default:
        v43 = 0.0;
        v42 = 0.0;
        break;
    }
    v64 = v33 * v42;
    v65 = v35 * v43;
    objc_msgSend(v30, "quaternion");
    v48.f64[0] = v46;
    v48.f64[1] = v47;
    v49.f64[0] = v44;
    v49.f64[1] = v45;
    v50 = (int8x16_t)vnegq_f64(v49);
    v51 = vmulq_f64(v48, (float64x2_t)xmmword_1B0EFFC00);
    v52 = (float64x2_t)vextq_s8((int8x16_t)v51, (int8x16_t)vnegq_f64(v51), 8uLL);
    v53 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v49, v64), (float64x2_t)vextq_s8(v50, (int8x16_t)v49, 8uLL), v65), v52, v66);
    v54 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v51, v64), v52, v65), (float64x2_t)vextq_s8((int8x16_t)v49, v50, 8uLL), v66);
    v55 = vnegq_f64(v54);
    v56 = (float64x2_t)vextq_s8((int8x16_t)v53, (int8x16_t)vnegq_f64(v53), 8uLL);
    v57 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v53, v47), v56, v46), vmlaq_n_f64(vmulq_n_f64(v55, v45), (float64x2_t)vextq_s8((int8x16_t)v54, (int8x16_t)v55, 8uLL), v44)).f64[0];
    if (v57 == 0.0)
      v58 = 0uLL;
    else
      v58 = vmulq_n_f64(vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v54, v47), (float64x2_t)vextq_s8((int8x16_t)v55, (int8x16_t)v54, 8uLL), v46), vmlaq_n_f64(vmulq_n_f64(v53, v45), v56, v44)), v66 / v57);
    v59 = v58.f64[0] / v32;
    v60 = v58.f64[1] / v38;
    switch(a10)
    {
      case 0:
      case 1:
        v60 = -v60;
        v61 = v59;
        break;
      case 2:
        v61 = -v59;
        break;
      case 3:
        v61 = -v60;
        v60 = -v59;
        break;
      case 4:
        v61 = v58.f64[1] / v38;
        v60 = v59;
        break;
      default:
        v61 = 0.0;
        v60 = 0.0;
        break;
    }
    x = v61 * 0.5 + 0.5 - width * 0.5;
    y = v60 * 0.5 + 0.5 - height * 0.5;

  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

+ (void)motionCorrectedNormalizedFrame:(os_log_t)log fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "AXMGeometryUtilities motionCorrectedNormalizedFrame received invalid input", v1, 2u);
}

@end
