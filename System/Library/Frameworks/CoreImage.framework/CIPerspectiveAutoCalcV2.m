@implementation CIPerspectiveAutoCalcV2

- (CIPerspectiveAutoCalcV2)initWithContext:(id)a3 image:(id)a4 config:(id *)a5
{
  CIPerspectiveAutoCalcV2 *v5;
  double v6;
  unsigned int v7;
  float64_t v8;
  float64x2_t v9;
  double v10;
  float focalLength;
  float v12;
  float v13;
  int32x2_t v14;
  int32x4_t v15;
  int32x4_t v21;
  float v23;
  float v24;
  int32x2_t v25;
  objc_super v26;
  simd_float3x3 v27;
  simd_float3x3 v28;

  v26.receiver = self;
  v26.super_class = (Class)CIPerspectiveAutoCalcV2;
  v5 = -[CIPerspectiveAutoCalc initWithContext:image:config:](&v26, sel_initWithContext_image_config_, a3, a4, a5);
  -[CIImage extent](v5->super.img, "extent");
  *(float *)&v7 = v6;
  v9.f64[1] = v8;
  *(float *)&v8 = v10;
  v23 = *(float *)&v8;
  v24 = *(float *)&v7;
  v25 = (int32x2_t)vmla_f32(vcvt_f32_f64(v9), (float32x2_t)0x3F0000003F000000, (float32x2_t)__PAIR64__(LODWORD(v8), v7));
  focalLength = v5->super.config.focalLength;
  v12 = focalLength / hypotf(36.0, 24.0);
  v13 = hypotf(v24, v23);
  v15.i64[0] = COERCE_UNSIGNED_INT(v12 * v13);
  v15.u64[1] = (unint64_t)v25;
  v27.columns[0].i32[1] = 0;
  v27.columns[0].i64[1] = 0;
  v27.columns[0].f32[0] = v12 * v13;
  *(float *)v14.i32 = v27.columns[0].f32[0];
  __asm { FMOV            V3.4S, #1.0 }
  v21 = vzip2q_s32(v15, _Q3);
  *(int32x2_t *)_Q3.i8 = vdup_lane_s32(v25, 1);
  v27.columns[2] = (simd_float3)vzip1q_s32(v21, _Q3);
  v27.columns[1] = (simd_float3)vzip2q_s32((int32x4_t)v27.columns[0].u32[0], vdupq_lane_s32(v14, 0));
  *(_OWORD *)v5->_anon_90 = v27.columns[0].u32[0];
  *(simd_float3 *)&v5->_anon_90[16] = v27.columns[1];
  *(simd_float3 *)&v5->_anon_90[32] = v27.columns[2];
  v28 = __invert_f3(v27);
  *(_QWORD *)v5->_anon_c0 = v28.columns[0].i64[0];
  *(_DWORD *)&v5->_anon_c0[8] = v28.columns[0].i32[2];
  *(_DWORD *)&v5->_anon_c0[24] = v28.columns[1].i32[2];
  *(_QWORD *)&v5->_anon_c0[16] = v28.columns[1].i64[0];
  *(_DWORD *)&v5->_anon_c0[40] = v28.columns[2].i32[2];
  *(_QWORD *)&v5->_anon_c0[32] = v28.columns[2].i64[0];
  v5->super.confidence = -1.0;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(*(void **)self->gradMapBmp);
  v3.receiver = self;
  v3.super_class = (Class)CIPerspectiveAutoCalcV2;
  -[CIPerspectiveAutoCalc dealloc](&v3, sel_dealloc);
}

- (BOOL)compute
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  double v7;
  int v8;
  double v9;
  CIImage *img;
  CGColor *v11;
  CIImage *v12;
  CGColor *v13;
  CIImage *v14;
  CGColor *v15;
  CIImage *v16;
  CGColor *v17;
  CIImage *debugImage;
  float pitch;
  float yaw;
  float roll;
  CIFilter *v22;
  double v23;
  double v24;
  double v25;
  CIImage *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CIFilter *v35;
  double MidX;
  double v37;
  uint64_t v38;
  CIFilter *v39;
  CIImage *v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  os_signpost_id_t v44;
  _DWORD v46[2];
  __int16 v47;
  int v48;
  uint64_t v49;
  CGRect v50;
  CGRect v51;

  v49 = *MEMORY[0x1E0C80C00];
  self->super.pitchFailureReason = 0;
  self->super.yawFailureReason = 0;
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      -[CIImage extent](self->super.img, "extent");
      v8 = (int)v7;
      -[CIImage extent](self->super.img, "extent");
      v46[0] = 67109376;
      v46[1] = v8;
      v47 = 1024;
      v48 = (int)v9;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "compute", "imageSize: %d x %d", (uint8_t *)v46, 0xEu);
    }
  }
  -[CIPerspectiveAutoCalcV2 standardizeImage](self, "standardizeImage");
  -[CIPerspectiveAutoCalcV2 createGradientMap](self, "createGradientMap");
  -[CIPerspectiveAutoCalcV2 normalizeGradientMap](self, "normalizeGradientMap");
  -[CIPerspectiveAutoCalcV2 thresholdGradientMap](self, "thresholdGradientMap");
  -[CIPerspectiveAutoCalcV2 extractLineSegments](self, "extractLineSegments");
  -[CIPerspectiveAutoCalcV2 clusterLineSegments](self, "clusterLineSegments");
  if (-[CIPerspectiveAutoCalc generateDebugImage](self, "generateDebugImage"))
  {
    img = self->super.img;
    self->super.debugImage = img;
    v11 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
    v12 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(img, v11, (uint64_t **)&self->vClusterInliers);
    self->super.debugImage = v12;
    v13 = CGColorCreateSRGB(1.0, 1.0, 0.0, 1.0);
    v14 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v12, v13, (uint64_t **)&self->vClusterOutliers);
    self->super.debugImage = v14;
    v15 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
    v16 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v14, v15, (uint64_t **)&self->hClusterInliers);
    self->super.debugImage = v16;
    v17 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    self->super.debugImage = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v16, v17, (uint64_t **)&self->hClusterOutliers);
  }
  -[CIPerspectiveAutoCalcV2 setupCostFunction](self, "setupCostFunction");
  -[CIPerspectiveAutoCalcV2 runOptimization](self, "runOptimization");
  -[CIPerspectiveAutoCalcV2 computeConfidence](self, "computeConfidence");
  if (-[CIPerspectiveAutoCalc generateDebugImage](self, "generateDebugImage"))
  {
    debugImage = self->super.debugImage;
    pitch = self->super.pitch;
    yaw = self->super.yaw;
    roll = self->super.roll;
    v22 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveRotate"));
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", debugImage, CFSTR("inputImage"));
    *(float *)&v23 = pitch;
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), CFSTR("inputPitch"));
    *(float *)&v24 = yaw;
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), CFSTR("inputYaw"));
    *(float *)&v25 = roll;
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25), CFSTR("inputRoll"));
    v26 = -[CIFilter outputImage](v22, "outputImage");
    self->super.debugImage = v26;
    -[CIImage extent](v26, "extent");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CICheckerboardGenerator"));
    v50.origin.x = v28;
    v50.origin.y = v30;
    v50.size.width = v32;
    v50.size.height = v34;
    MidX = CGRectGetMidX(v50);
    v51.origin.x = v28;
    v51.origin.y = v30;
    v51.size.width = v32;
    v51.size.height = v34;
    -[CIFilter setValue:forKey:](v35, "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", MidX, CGRectGetMidY(v51)), CFSTR("inputCenter"));
    if (v32 >= v34)
      v37 = v34;
    else
      v37 = v32;
    -[CIFilter setValue:forKey:](v35, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37 * 0.05), CFSTR("inputWidth"));
    v38 = -[CIImage imageByCroppingToRect:](-[CIFilter outputImage](v35, "outputImage"), "imageByCroppingToRect:", v28, v30, v32, v34);
    v39 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithAlphaMask"));
    v40 = -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.95)), "imageByCroppingToRect:", v28, v30, v32, v34);
    -[CIFilter setValue:forKey:](v39, "setValue:forKey:", v26, CFSTR("inputImage"));
    -[CIFilter setValue:forKey:](v39, "setValue:forKey:", v38, CFSTR("inputBackgroundImage"));
    -[CIFilter setValue:forKey:](v39, "setValue:forKey:", v40, CFSTR("inputMaskImage"));
    self->super.debugImage = -[CIImage imageByCompositingOverImage:](-[CIFilter outputImage](v39, "outputImage"), "imageByCompositingOverImage:", v38);
  }
  v41 = ci_signpost_log_perspectiveAC();
  v42 = ci_signpost_log_perspectiveAC();
  v43 = os_signpost_id_make_with_pointer(v42, self);
  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v44 = v43;
    if (os_signpost_enabled(v41))
    {
      LOWORD(v46[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v41, OS_SIGNPOST_INTERVAL_END, v44, "compute", (const char *)&unk_192520C83, (uint8_t *)v46, 2u);
    }
  }
  return 1;
}

- (void)standardizeImage
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  unsigned int v17;
  double v18;
  double v19;
  float64x2_t v20;
  int32x4_t v21;
  int32x4_t v22;
  CIImage *img;
  CIImage *v29;
  CIImage *v30;
  NSString *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  os_signpost_id_t v35;
  float64_t v36;
  float64_t v37;
  float32x2_t v38;
  _QWORD v39[4];
  float64x2_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  simd_float3x3 v46;
  simd_float3x3 v47;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      -[CIImage extent](self->super.img, "extent");
      v8 = v7;
      -[CIImage extent](self->super.img, "extent");
      *(_DWORD *)buf = 134218240;
      v42 = v8;
      v43 = 2048;
      v44 = v9;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StandardizeImage", "imageSize: %f x %f", buf, 0x16u);
    }
  }
  -[CIImage extent](self->super.img, "extent");
  v36 = v13;
  v37 = v12;
  if (v10 <= v11)
    v14 = v11;
  else
    v14 = v10;
  v15 = v14 * 0.0009765625;
  v16 = logf(v15);
  *(float *)&v17 = 1.0 / exp2(ceilf(v16));
  v18 = (float)-*(float *)&v17;
  v46.columns[1].i32[0] = 0;
  v46.columns[1].i64[1] = 0;
  v46.columns[0] = (simd_float3)v17;
  v46.columns[1].i32[1] = v17;
  *(_OWORD *)self->_anon_f0 = v17;
  *(_OWORD *)&self->_anon_f0[16] = v46.columns[1].u64[0];
  v19 = *(float *)&v17;
  v20.f64[0] = v37;
  v20.f64[1] = v36;
  *(float32x2_t *)v21.i8 = vcvt_f32_f64(vmulq_n_f64(v20, v18));
  v38 = *(float32x2_t *)v21.i8;
  v22 = vuzp2q_s32(v21, vzip1q_s32(v21, v21));
  __asm { FMOV            V3.4S, #1.0 }
  v46.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v22, _Q3), v22);
  *(simd_float3 *)&self->_anon_f0[32] = v46.columns[2];
  v47 = __invert_f3(v46);
  *(_QWORD *)self->_anon_120 = v47.columns[0].i64[0];
  *(_DWORD *)&self->_anon_120[8] = v47.columns[0].i32[2];
  *(_QWORD *)&self->_anon_120[16] = v47.columns[1].i64[0];
  *(_DWORD *)&self->_anon_120[24] = v47.columns[1].i32[2];
  *(_QWORD *)&self->_anon_120[32] = v47.columns[2].i64[0];
  *(_DWORD *)&self->_anon_120[40] = v47.columns[2].i32[2];
  v39[1] = 0;
  v39[2] = 0;
  img = self->super.img;
  *(double *)v39 = v19;
  *(double *)&v39[3] = v19;
  v40 = vcvtq_f64_f32(v38);
  self->super.img = -[CIImage imageByApplyingTransform:highQualityDownsample:](img, "imageByApplyingTransform:highQualityDownsample:", v39, 1);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v29 = self->super.img;
    v30 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("0_standardized"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v29, v30, v31, *MEMORY[0x1E0C9D628]);
  }
  v32 = ci_signpost_log_perspectiveAC();
  v33 = ci_signpost_log_perspectiveAC();
  v34 = os_signpost_id_make_with_pointer(v33, self);
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v35 = v34;
    if (os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v32, OS_SIGNPOST_INTERVAL_END, v35, "StandardizeImage", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)createGradientMap
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  unint64_t gradMapW;
  unint64_t gradMapH;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIImage *v17;
  CIColorKernel *v18;
  uint64_t v19;
  CIFilter *v20;
  CI::Perspective *v21;
  CGRect *v22;
  CIImage *v23;
  NSString *v24;
  CI::Perspective *v25;
  CIImage *v26;
  NSString *v27;
  CIImage *v28;
  CIImage *v29;
  CIImage *v30;
  CIImage *v31;
  CIImage *v32;
  CIImage *v33;
  CIImage *v34;
  NSString *v35;
  CIImage *v36;
  CIImage *v37;
  CIImage *v38;
  NSString *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  os_signpost_id_t v43;
  _QWORD v44[3];
  uint8_t buf[4];
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;
  CGRect v50;
  CGRect v51;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      gradMapW = self->gradMapW;
      gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      v46 = gradMapW;
      v47 = 2048;
      v48 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CreateGradientMap", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  -[CIImage extent](self->super.img, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  self->gradMapW = (unint64_t)v13;
  self->gradMapH = (unint64_t)v15;
  v17 = -[CIImage imageByApplyingFilter:withInputParameters:](self->super.img, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), &unk_1E2F1D5D0);
  v18 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_lumaRange);
  v44[0] = self->super.img;
  v44[1] = &unk_1E2F1DA88;
  v44[2] = &unk_1E2F1DA98;
  v19 = -[CIColorKernel applyWithExtent:arguments:](v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3), v10, v12, v14, v16);
  v20 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIBlendWithMask"));
  -[CIFilter setValue:forKey:](v20, "setValue:forKey:", self->super.img, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v20, "setValue:forKey:", v17, CFSTR("inputBackgroundImage"));
  -[CIFilter setValue:forKey:](v20, "setValue:forKey:", v19, CFSTR("inputMaskImage"));
  v21 = -[CIFilter outputImage](v20, "outputImage");
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  v22 = (CGRect *)MEMORY[0x1E0C9D628];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v23 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("0_Enhanced"));
    CI::Perspective::CIImageToFile(v21, v23, v24, *v22);
  }
  v25 = (CI::Perspective *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CI::Perspective imageByApplyingFilter:](v21, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve")), "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", 1.4), "imageByCroppingToRect:", v10, v12, v14, v16);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v26 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("1_Preprocessed"));
    CI::Perspective::CIImageToFile(v25, v26, v27, *v22);
  }
  v28 = (CIImage *)-[CI::Perspective imageByApplyingFilter:](v25, "imageByApplyingFilter:", CFSTR("CIGaborGradients"));
  self->gradMap = v28;
  -[CIImage extent](v28, "extent");
  v51 = CGRectInset(v50, 5.0, 5.0);
  v29 = -[CIImage imageByCroppingToRect:](v28, "imageByCroppingToRect:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);
  self->gradMap = v29;
  v30 = -[CIImage imageByCompositingOverImage:](v29, "imageByCompositingOverImage:", +[CIImage blackImage](CIImage, "blackImage"));
  self->gradMap = v30;
  v31 = -[CIImage imageByCroppingToRect:](v30, "imageByCroppingToRect:", v10, v12, v14, v16);
  self->gradMap = v31;
  self->gradMap = -[CIImage imageByInsertingIntermediate:](v31, "imageByInsertingIntermediate:", 1);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v33 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v32);
    v34 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("2_GradMap_dir"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v33, v34, v35, *v22);
    v37 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v36);
    v38 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("2_GradMap_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v37, v38, v39, *v22);
  }
  v40 = ci_signpost_log_perspectiveAC();
  v41 = ci_signpost_log_perspectiveAC();
  v42 = os_signpost_id_make_with_pointer(v41, self);
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v43 = v42;
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v40, OS_SIGNPOST_INTERVAL_END, v43, "CreateGradientMap", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)normalizeGradientMap
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  unint64_t gradMapW;
  unint64_t gradMapH;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIImage *v17;
  CIImage *v18;
  uint64_t v19;
  CIColorKernel *v20;
  CIImage *v21;
  CIImage *v22;
  CIImage *v23;
  CGRect *v24;
  NSString *v25;
  CIImage *v26;
  CIImage *v27;
  CIImage *v28;
  NSString *v29;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  os_signpost_id_t v33;
  _QWORD v34[2];
  const __CFString *v35;
  CIVector *v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      gradMapW = self->gradMapW;
      gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      v38 = gradMapW;
      v39 = 2048;
      v40 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "NormalizeGradientMap", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  -[CIImage extent](self->gradMap, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v17);
  v35 = CFSTR("inputExtent");
  -[CIImage extent](v18, "extent");
  v36 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v19 = -[CIImage imageByApplyingFilter:withInputParameters:](v18, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  v20 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gradientNormalizeV2);
  v34[0] = self->gradMap;
  v34[1] = v19;
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v20, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2), v10, v12, v14, v16);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v22 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v21);
    v23 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("3_GradMapNormalized_dir"));
    v24 = (CGRect *)MEMORY[0x1E0C9D628];
    CI::Perspective::CIImageToFile((CI::Perspective *)v22, v23, v25, *MEMORY[0x1E0C9D628]);
    v27 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v26);
    v28 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("3_GradMapNormalized_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v27, v28, v29, *v24);
  }
  v30 = ci_signpost_log_perspectiveAC();
  v31 = ci_signpost_log_perspectiveAC();
  v32 = os_signpost_id_make_with_pointer(v31, self);
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v33 = v32;
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v30, OS_SIGNPOST_INTERVAL_END, v33, "NormalizeGradientMap", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)thresholdGradientMap
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  unint64_t gradMapW;
  unint64_t gradMapH;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIColorKernel *v17;
  CIImage *v18;
  CIImage *v19;
  CIImage *v20;
  CGRect *v21;
  NSString *v22;
  CIImage *v23;
  CIImage *v24;
  CIImage *v25;
  NSString *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  os_signpost_id_t v30;
  _QWORD v31[3];
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      gradMapW = self->gradMapW;
      gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      v33 = gradMapW;
      v34 = 2048;
      v35 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ThresholdGradientMap", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  -[CIImage extent](self->gradMap, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gradientThresholdV2);
  v31[0] = self->gradMap;
  v31[1] = &unk_1E2F1DAA8;
  v31[2] = &unk_1E2F1DAB8;
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3), v10, v12, v14, v16);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v19 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v18);
    v20 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("4_GradMapThresholded_dir"));
    v21 = (CGRect *)MEMORY[0x1E0C9D628];
    CI::Perspective::CIImageToFile((CI::Perspective *)v19, v20, v22, *MEMORY[0x1E0C9D628]);
    v24 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v23);
    v25 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("4_GradMapThresholded_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v24, v25, v26, *v21);
  }
  v27 = ci_signpost_log_perspectiveAC();
  v28 = ci_signpost_log_perspectiveAC();
  v29 = os_signpost_id_make_with_pointer(v28, self);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v30 = v29;
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v27, OS_SIGNPOST_INTERVAL_END, v30, "ThresholdGradientMap", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)extractLineSegments
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  unint64_t gradMapW;
  unint64_t gradMapH;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  __int128 v27;
  int32x2_t *v28;
  int32x2_t *v29;
  float v30;
  float v31;
  int32x2_t v32;
  float32x2_t v33;
  int32x2_t v34;
  float32x2_t v35;
  vector<CI::Perspective::Line, std::allocator<CI::Perspective::Line>> *p_vLines;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  float32x2_t *v49;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v50;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v51;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  CIImage *img;
  CGColor *v55;
  void *v56;
  CGColor *v57;
  CI::Perspective *v58;
  CIImage *v59;
  NSString *v60;
  NSObject *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  os_signpost_id_t v64;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t v67;
  os_signpost_id_t v68;
  int32x2_t v69;
  uint8_t buf[4];
  unint64_t v71;
  __int16 v72;
  unint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      gradMapW = self->gradMapW;
      gradMapH = self->gradMapH;
      *(_DWORD *)buf = 134218240;
      v71 = gradMapW;
      v72 = 2048;
      v73 = gradMapH;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ExtractLineSegments", "gradMapSize: %lu x %lu", buf, 0x16u);
    }
  }
  v9 = ci_signpost_log_perspectiveAC();
  v10 = ci_signpost_log_perspectiveAC();
  v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v12, "GradientMapRender", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  v13 = (8 * self->gradMapW + 15) & 0xFFFFFFFFFFFFFFF0;
  self->gradMapRb = v13;
  v14 = malloc_type_malloc(self->gradMapH * v13, 0x199F2148uLL);
  *(_QWORD *)self->gradMapBmp = v14;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](self->super.ctx, "render:toBitmap:rowBytes:bounds:format:colorSpace:", self->gradMap, v14, self->gradMapRb, 2310, 0, 0.0, 0.0, (double)self->gradMapW, (double)self->gradMapH);
  v15 = ci_signpost_log_perspectiveAC();
  v16 = ci_signpost_log_perspectiveAC();
  v17 = os_signpost_id_make_with_pointer(v16, self);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v15, OS_SIGNPOST_INTERVAL_END, v18, "GradientMapRender", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  v19 = ci_signpost_log_perspectiveAC();
  v20 = ci_signpost_log_perspectiveAC();
  v21 = os_signpost_id_make_with_pointer(v20, self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v22, "EDLines", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  v23 = CI::Perspective::EDLines::Create(*(_QWORD *)self->gradMapBmp, self->gradMapW, self->gradMapH, self->gradMapRb, 0);
  v24 = tan(self->super.config.lineSearchRangeH);
  v25 = tan(self->super.config.lineSearchRangeV);
  v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
  v28 = *(int32x2_t **)v26;
  v29 = *(int32x2_t **)(v26 + 8);
  if (*(int32x2_t **)v26 != v29)
  {
    v30 = v24;
    v31 = v25;
    do
    {
      *(float *)&v27 = (float)self->gradMapH;
      v34 = v28[1];
      v32 = (int32x2_t)vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v27, 0), (float32x2_t)vzip2_s32(*v28, v34));
      v33 = (float32x2_t)vzip1_s32(*v28, v32);
      v34.i32[1] = v32.i32[1];
      v69 = v34;
      v35 = vsub_f32(v33, (float32x2_t)v34);
      *(int8x8_t *)&v27 = vbsl_s8((int8x8_t)vcgez_f32(v35), (int8x8_t)v35, (int8x8_t)vneg_f32(v35));
      if (*(float *)&v27 <= *((float *)&v27 + 1))
      {
        if ((float)(*(float *)&v27 / *((float *)&v27 + 1)) < v31)
        {
          p_vLines = &self->vLines;
          end = self->vLines.__end_;
          value = self->vLines.__end_cap_.__value_;
          if (end < value)
          {
LABEL_28:
            DWORD1(v27) = v34.i32[1];
            *(float32x2_t *)end = v33;
            *((int32x2_t *)end + 1) = v34;
            v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
LABEL_47:
            p_vLines->__end_ = v45;
            goto LABEL_48;
          }
          v46 = (end - p_vLines->__begin_) >> 4;
          v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 60)
            abort();
          v48 = value - p_vLines->__begin_;
          if (v48 >> 3 > v47)
            v47 = v48 >> 3;
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0)
            v42 = 0xFFFFFFFFFFFFFFFLL;
          else
            v42 = v47;
          if (v42)
            v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)&self->vLines.__end_cap_, v42);
          else
            v43 = 0;
          v49 = (float32x2_t *)&v43[16 * v46];
          DWORD1(v27) = v69.i32[1];
          *v49 = v33;
          v49[1] = (float32x2_t)v69;
          begin = p_vLines->__begin_;
          v50 = self->vLines.__end_;
          v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v49;
          if (v50 != p_vLines->__begin_)
          {
            do
            {
              v27 = *((_OWORD *)v50 - 1);
              *((_OWORD *)v52 - 1) = v27;
              v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v52 - 16);
              v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v50 - 16);
            }
            while (v50 != begin);
LABEL_44:
            v50 = p_vLines->__begin_;
          }
LABEL_45:
          v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v49[2];
          p_vLines->__begin_ = v52;
          p_vLines->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v49[2];
          p_vLines->__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v43[16 * v42];
          if (v50)
            operator delete(v50);
          goto LABEL_47;
        }
      }
      else if ((float)(*((float *)&v27 + 1) / *(float *)&v27) < v30)
      {
        p_vLines = &self->hLines;
        end = self->hLines.__end_;
        v38 = self->hLines.__end_cap_.__value_;
        if (end < v38)
          goto LABEL_28;
        v39 = (end - p_vLines->__begin_) >> 4;
        v40 = v39 + 1;
        if ((unint64_t)(v39 + 1) >> 60)
          abort();
        v41 = v38 - p_vLines->__begin_;
        if (v41 >> 3 > v40)
          v40 = v41 >> 3;
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0)
          v42 = 0xFFFFFFFFFFFFFFFLL;
        else
          v42 = v40;
        if (v42)
          v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)&self->hLines.__end_cap_, v42);
        else
          v43 = 0;
        v49 = (float32x2_t *)&v43[16 * v39];
        DWORD1(v27) = v69.i32[1];
        *v49 = v33;
        v49[1] = (float32x2_t)v69;
        v51 = p_vLines->__begin_;
        v50 = self->hLines.__end_;
        v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v49;
        if (v50 != p_vLines->__begin_)
        {
          do
          {
            v27 = *((_OWORD *)v50 - 1);
            *((_OWORD *)v52 - 1) = v27;
            v52 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v52 - 16);
            v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v50 - 16);
          }
          while (v50 != v51);
          goto LABEL_44;
        }
        goto LABEL_45;
      }
LABEL_48:
      v28 += 2;
    }
    while (v28 != v29);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_54);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    img = self->super.img;
    v55 = CGColorCreateSRGB(1.0, 0.0, 1.0, 1.0);
    v56 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(img, v55, (uint64_t **)&self->hLines);
    v57 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
    v58 = (CI::Perspective *)CI::Perspective::plotLines<CI::Perspective::Line>(v56, v57, (uint64_t **)&self->vLines);
    v59 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV2_%@.png"), CFSTR("6_LineSegments"));
    CI::Perspective::CIImageToFile(v58, v59, v60, *MEMORY[0x1E0C9D628]);
  }
  v61 = ci_signpost_log_perspectiveAC();
  v62 = ci_signpost_log_perspectiveAC();
  v63 = os_signpost_id_make_with_pointer(v62, self);
  if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v64 = v63;
    if (os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v61, OS_SIGNPOST_INTERVAL_END, v64, "EDLines", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  v65 = ci_signpost_log_perspectiveAC();
  v66 = ci_signpost_log_perspectiveAC();
  v67 = os_signpost_id_make_with_pointer(v66, self);
  if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v68 = v67;
    if (os_signpost_enabled(v65))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v65, OS_SIGNPOST_INTERVAL_END, v68, "ExtractLineSegments", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)clusterLineSegments
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  _BYTE *v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  unint64_t v16;
  float32x2_t v17;
  float32x2_t *v18;
  float32x2_t *v19;
  float32x2_t *v20;
  float32x2_t *v21;
  _BOOL4 v22;
  BOOL v23;
  float32x2_t v24;
  float32x2_t v25;
  float v26;
  float32x2_t v27;
  float32x2_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float32x2_t v37;
  unint64_t v38;
  float32x2_t *v39;
  float32x2_t *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  float32x2_t *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  unint64_t v75;
  float v76;
  __int128 v77;
  int v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  _BYTE *v95;
  uint64_t v96;
  char *v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  void *v101;
  _QWORD *v102;
  float32x2_t v104[7];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  void *v108[2];
  uint64_t v109;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v5 = a3 + 16;
  v7 = *a2;
  v6 = a2[1];
  v8 = ((v6 - *a2) >> 4) * ((v6 - *a2) >> 4);
  v102 = (_QWORD *)v5;
  if (v8 >= 2)
  {
    if (v8 >= 0xCCCCCCCCCCCCCCELL)
      abort();
    std::__split_buffer<-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis>::__split_buffer(&v107, v8 >> 1, 0, v5);
    v9 = *(char **)a3;
    v10 = *(_BYTE **)(a3 + 8);
    v11 = *((_QWORD *)&v107 + 1);
    if (v10 == *(_BYTE **)a3)
    {
      v9 = *(char **)(a3 + 8);
    }
    else
    {
      v12 = *(char **)(a3 + 8);
      do
      {
        v13 = *(_OWORD *)(v12 - 40);
        v14 = *(_OWORD *)(v12 - 24);
        *(_QWORD *)(v11 - 8) = *((_QWORD *)v12 - 1);
        *(_OWORD *)(v11 - 24) = v14;
        *(_OWORD *)(v11 - 40) = v13;
        v11 -= 40;
        v12 -= 40;
      }
      while (v12 != v9);
    }
    *(_QWORD *)a3 = v11;
    v15 = *(void **)(a3 + 16);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)v108;
    v108[0] = v10;
    v108[1] = v15;
    *(_QWORD *)&v107 = v9;
    *((_QWORD *)&v107 + 1) = v9;
    if (v10 != v9)
      v108[0] = &v9[(v10 - v9 - 40) % 0x28uLL];
    if (v9)
      operator delete(v9);
    v7 = *a2;
    v6 = a2[1];
  }
  if (v6 != v7)
  {
    v16 = 0;
    do
    {
      if (v16)
      {
        v17 = 0;
        do
        {
          v18 = (float32x2_t *)(*a2 + 16 * v16);
          v19 = (float32x2_t *)(*a2 + 16 * *(_QWORD *)&v17);
          v104[0] = 0;
          v107 = *(_OWORD *)v18->f32;
          v20 = v18 + 1;
          v105 = *(_OWORD *)v19->f32;
          v21 = v19 + 1;
          v22 = CI::Perspective::intersect((int32x2_t *)&v107, (int32x2_t *)&v105, v104);
          v23 = v22;
          if (!v22 || (CI::Perspective::pointInBounds(v104, a1) & 1) == 0)
          {
            v24 = *v18;
            v25 = *v20;
            if ((vcgt_f32(*v20, *v18).u8[0] & 1) != 0)
              LODWORD(v26) = *(float32x2_t *)v18->f32;
            else
              LODWORD(v26) = *(float32x2_t *)v20->f32;
            v27 = *v19;
            v28 = *v21;
            if ((vcgt_f32(*v21, *v19).u8[0] & 1) != 0)
              LODWORD(v29) = *(float32x2_t *)v19->f32;
            else
              LODWORD(v29) = *(float32x2_t *)v21->f32;
            if (v26 >= v29)
              v26 = v29;
            if ((vcgt_f32(v24, v25).u8[0] & 1) != 0)
              LODWORD(v30) = *(float32x2_t *)v18->f32;
            else
              LODWORD(v30) = *(float32x2_t *)v20->f32;
            if ((vcgt_f32(v27, v28).u8[0] & 1) != 0)
              LODWORD(v31) = *(float32x2_t *)v19->f32;
            else
              LODWORD(v31) = *(float32x2_t *)v21->f32;
            if (v30 <= v31)
              v30 = v31;
            LODWORD(v32) = HIDWORD(*(unint64_t *)v18);
            v27.i32[0] = HIDWORD(*(unint64_t *)v19);
            if (v27.f32[1] <= v28.f32[1])
              LODWORD(v33) = HIDWORD(*(unint64_t *)v21);
            else
              LODWORD(v33) = HIDWORD(*(unint64_t *)v19);
            if (v27.f32[1] >= v28.f32[1])
              v27.i32[0] = HIDWORD(*(unint64_t *)v21);
            if (v24.f32[1] <= v25.f32[1])
              LODWORD(v34) = HIDWORD(*(unint64_t *)v20);
            else
              LODWORD(v34) = HIDWORD(*(unint64_t *)v18);
            if (v24.f32[1] >= v25.f32[1])
              LODWORD(v32) = HIDWORD(*(unint64_t *)v20);
            if (v34 <= v33)
              v35 = v33;
            else
              v35 = v34;
            if (v32 >= v27.f32[0])
              v32 = v27.f32[0];
            v36 = (float)(v30 - v26) * (float)(v35 - v32);
            v37 = v104[0];
            v39 = *(float32x2_t **)(a3 + 8);
            v38 = *(_QWORD *)(a3 + 16);
            if ((unint64_t)v39 >= v38)
            {
              v41 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v39 - *(_QWORD *)a3) >> 3);
              v42 = v41 + 1;
              if ((unint64_t)(v41 + 1) > 0x666666666666666)
                abort();
              v43 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v38 - *(_QWORD *)a3) >> 3);
              if (2 * v43 > v42)
                v42 = 2 * v43;
              if (v43 >= 0x333333333333333)
                v44 = 0x666666666666666;
              else
                v44 = v42;
              std::__split_buffer<-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis>::__split_buffer(&v107, v44, v41, (uint64_t)v102);
              v45 = (float32x2_t *)v108[0];
              *(_QWORD *)v108[0] = v16;
              v45[1] = v17;
              v45[2].i8[0] = v23;
              v45[3] = v37;
              v45[4].f32[0] = v36;
              v40 = v45 + 5;
              v108[0] = &v45[5];
              v46 = *(char **)a3;
              v47 = *(char **)(a3 + 8);
              v48 = *((_QWORD *)&v107 + 1);
              if (v47 == *(char **)a3)
              {
                v46 = *(char **)(a3 + 8);
              }
              else
              {
                v49 = *(char **)(a3 + 8);
                do
                {
                  v50 = *(_OWORD *)(v49 - 40);
                  v51 = *(_OWORD *)(v49 - 24);
                  *(_QWORD *)(v48 - 8) = *((_QWORD *)v49 - 1);
                  *(_OWORD *)(v48 - 24) = v51;
                  *(_OWORD *)(v48 - 40) = v50;
                  v48 -= 40;
                  v49 -= 40;
                }
                while (v49 != v46);
                v40 = (float32x2_t *)v108[0];
              }
              *(_QWORD *)a3 = v48;
              *(_QWORD *)(a3 + 8) = v40;
              v52 = *(void **)(a3 + 16);
              *(void **)(a3 + 16) = v108[1];
              v108[0] = v47;
              v108[1] = v52;
              *(_QWORD *)&v107 = v46;
              *((_QWORD *)&v107 + 1) = v46;
              if (v47 != v46)
                v108[0] = &v47[-40 - 40 * ((v47 - v46 - 40) / 0x28uLL)];
              if (v46)
                operator delete(v46);
            }
            else
            {
              *v39 = (float32x2_t)v16;
              v39[1] = v17;
              v39[2].i8[0] = v23;
              v39[3] = v37;
              v40 = v39 + 5;
              v39[4].f32[0] = v36;
            }
            *(_QWORD *)(a3 + 8) = v40;
          }
          ++*(_QWORD *)&v17;
        }
        while (*(_QWORD *)&v17 != v16);
        v7 = *a2;
        v6 = a2[1];
      }
      ++v16;
    }
    while (v16 < (v6 - v7) >> 4);
  }
  v53 = *(_QWORD *)a3;
  v54 = *(_QWORD *)(a3 + 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v54 - *(_QWORD *)a3) >> 3) >= 0x29)
  {
    for (i = 760; i != -40; i -= 40)
      std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::$_0::operator() const(std::vector<CI::Perspective::Line> const&,unsigned long)::{lambda(-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&)#1} &,std::__wrap_iter<-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis*>>(v53, 40, (float *)(v53 + i));
    v56 = v53 + 1600;
    if (v53 + 1600 != v54)
    {
      v57 = v53 + 1600;
      do
      {
        if (*(float *)(v57 + 32) > *(float *)(v53 + 32))
        {
          v58 = *(_OWORD *)v57;
          v59 = *(_OWORD *)(v57 + 16);
          v60 = *(_QWORD *)(v57 + 32);
          v61 = *(_QWORD *)(v53 + 32);
          v62 = *(_OWORD *)(v53 + 16);
          *(_OWORD *)v57 = *(_OWORD *)v53;
          *(_OWORD *)(v57 + 16) = v62;
          *(_QWORD *)(v57 + 32) = v61;
          *(_QWORD *)(v53 + 32) = v60;
          *(_OWORD *)v53 = v58;
          *(_OWORD *)(v53 + 16) = v59;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::$_0::operator() const(std::vector<CI::Perspective::Line> const&,unsigned long)::{lambda(-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&,-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis const&)#1} &,std::__wrap_iter<-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis*>>(v53, 40, (float *)v53);
        }
        v57 += 40;
      }
      while (v57 != v54);
    }
    v63 = 40;
    do
    {
      v64 = 0;
      v107 = *(_OWORD *)v53;
      *(_OWORD *)v108 = *(_OWORD *)(v53 + 16);
      v109 = *(_QWORD *)(v53 + 32);
      v65 = v53;
      do
      {
        v66 = v65;
        v67 = v64 + 1;
        v65 += 40 * (v64 + 1);
        v68 = 2 * v64;
        v64 = (2 * v64) | 1;
        v69 = v68 + 2;
        if (v69 < (uint64_t)v63 && *(float *)(v66 + 40 * v67 + 32) > *(float *)(v65 + 72))
        {
          v65 += 40;
          v64 = v69;
        }
        v70 = *(_OWORD *)v65;
        v71 = *(_OWORD *)(v65 + 16);
        *(_QWORD *)(v66 + 32) = *(_QWORD *)(v65 + 32);
        *(_OWORD *)v66 = v70;
        *(_OWORD *)(v66 + 16) = v71;
      }
      while (v64 <= (uint64_t)((v63 - 2) >> 1));
      v56 -= 40;
      if (v65 == v56)
      {
        v82 = v107;
        v83 = *(_OWORD *)v108;
        *(_QWORD *)(v65 + 32) = v109;
        *(_OWORD *)v65 = v82;
        *(_OWORD *)(v65 + 16) = v83;
      }
      else
      {
        v72 = *(_OWORD *)v56;
        v73 = *(_OWORD *)(v56 + 16);
        *(_QWORD *)(v65 + 32) = *(_QWORD *)(v56 + 32);
        *(_OWORD *)v65 = v72;
        *(_OWORD *)(v65 + 16) = v73;
        *(_OWORD *)v56 = v107;
        *(_OWORD *)(v56 + 16) = *(_OWORD *)v108;
        *(_QWORD *)(v56 + 32) = v109;
        v74 = v65 - v53 + 40;
        if (v74 >= 41)
        {
          v75 = (v74 / 0x28uLL - 2) >> 1;
          v76 = *(float *)(v65 + 32);
          if (*(float *)(v53 + 40 * v75 + 32) > v76)
          {
            v77 = *(_OWORD *)(v65 + 16);
            v105 = *(_OWORD *)v65;
            v106 = v77;
            v78 = *(_DWORD *)(v65 + 36);
            do
            {
              v79 = v65;
              v65 = v53 + 40 * v75;
              v80 = *(_OWORD *)v65;
              v81 = *(_OWORD *)(v65 + 16);
              *(_QWORD *)(v79 + 32) = *(_QWORD *)(v65 + 32);
              *(_OWORD *)v79 = v80;
              *(_OWORD *)(v79 + 16) = v81;
              if (!v75)
                break;
              v75 = (v75 - 1) >> 1;
            }
            while (*(float *)(v53 + 40 * v75 + 32) > v76);
            *(_OWORD *)v65 = v105;
            *(_OWORD *)(v65 + 16) = v106;
            *(float *)(v65 + 32) = v76;
            *(_DWORD *)(v65 + 36) = v78;
          }
        }
      }
    }
    while (v63-- > 2);
    v85 = *(_QWORD *)a3;
    v86 = *(_QWORD *)(a3 + 8);
    v87 = v86 - *(_QWORD *)a3;
    v88 = 0xCCCCCCCCCCCCCCCDLL * (v87 >> 3);
    if (v88 > 0x27)
    {
      if (v87 == 1600)
        return;
      v100 = v85 + 1600;
    }
    else
    {
      if (0xCCCCCCCCCCCCCCCDLL * ((*v102 - v86) >> 3) < 40 - v88)
      {
        v89 = 0xCCCCCCCCCCCCCCCDLL * ((*v102 - v85) >> 3);
        v90 = 2 * v89;
        if (2 * v89 <= 0x28)
          v90 = 40;
        if (v89 >= 0x333333333333333)
          v91 = 0x666666666666666;
        else
          v91 = v90;
        std::__split_buffer<-[CIPerspectiveAutoCalcV1 clusterLineSegments]::Hypothesis>::__split_buffer(&v107, v91, v88, (uint64_t)v102);
        v92 = (char *)v108[0];
        bzero(v108[0], 1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40);
        v93 = &v92[1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40];
        v108[0] = v93;
        v94 = *(char **)a3;
        v95 = *(_BYTE **)(a3 + 8);
        v96 = *((_QWORD *)&v107 + 1);
        if (v95 == *(_BYTE **)a3)
        {
          v94 = *(char **)(a3 + 8);
        }
        else
        {
          v97 = *(char **)(a3 + 8);
          do
          {
            v98 = *(_OWORD *)(v97 - 40);
            v99 = *(_OWORD *)(v97 - 24);
            *(_QWORD *)(v96 - 8) = *((_QWORD *)v97 - 1);
            *(_OWORD *)(v96 - 24) = v99;
            *(_OWORD *)(v96 - 40) = v98;
            v96 -= 40;
            v97 -= 40;
          }
          while (v97 != v94);
          v93 = (char *)v108[0];
        }
        *(_QWORD *)a3 = v96;
        *(_QWORD *)(a3 + 8) = v93;
        v101 = *(void **)(a3 + 16);
        *(void **)(a3 + 16) = v108[1];
        v108[0] = v95;
        v108[1] = v101;
        *(_QWORD *)&v107 = v94;
        *((_QWORD *)&v107 + 1) = v94;
        if (v95 != v94)
          v108[0] = &v94[(v95 - v94 - 40) % 0x28uLL];
        if (v94)
          operator delete(v94);
        return;
      }
      bzero(*(void **)(a3 + 8), 1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40);
      v100 = v86 + 1560 - v87 - (unsigned __int16)(1560 - v87) % 0x28u + 40;
    }
    *(_QWORD *)(a3 + 8) = v100;
  }
}

- (void)setupCostFunction
{
  vector<LineCostProxy, std::allocator<LineCostProxy>> *p_vClusterInliersProxies;
  vector<CI::Perspective::Line, std::allocator<CI::Perspective::Line>> *p_vClusterInliers;
  vector<LineCostProxy, std::allocator<LineCostProxy>> *p_vClusterOutliersProxies;
  vector<LineCostProxy, std::allocator<LineCostProxy>> *p_hClusterInliersProxies;
  vector<LineCostProxy, std::allocator<LineCostProxy>> *p_hClusterOutliersProxies;
  __int128 v8;
  float32x2_t *begin;
  unsigned __int8 *anon_120;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x2_t v22;
  int32x4_t v23;
  float32x2_t v24;
  int32x4_t v25;
  float32x2_t v26;
  float v27;
  float32x2_t v28;
  float v29;
  LineCostProxy *value;
  LineCostProxy *v31;
  LineCostProxy *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  LineCostProxy *v39;
  LineCostProxy *v40;
  LineCostProxy *v41;
  float32x2_t *v42;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v43;
  unsigned __int8 *v44;
  uint64_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x2_t v56;
  int32x4_t v57;
  float32x2_t v58;
  int32x4_t v59;
  float32x2_t v60;
  float v61;
  float32x2_t v62;
  float v63;
  LineCostProxy *v64;
  LineCostProxy *v65;
  LineCostProxy *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  char *v72;
  LineCostProxy *v73;
  LineCostProxy *v74;
  LineCostProxy *v75;
  float32x2_t *v76;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v77;
  unsigned __int8 *v78;
  uint64_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x2_t v90;
  int32x4_t v91;
  float32x2_t v92;
  int32x4_t v93;
  float32x2_t v94;
  float v95;
  float32x2_t v96;
  float v97;
  LineCostProxy *v98;
  LineCostProxy *v99;
  LineCostProxy *v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char *v105;
  char *v106;
  LineCostProxy *v107;
  LineCostProxy *v108;
  LineCostProxy *v109;
  float32x2_t *v110;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v111;
  unsigned __int8 *v112;
  uint64_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x2_t v124;
  int32x4_t v125;
  float32x2_t v126;
  int32x4_t v127;
  float32x2_t v128;
  float v129;
  float32x2_t v130;
  float v131;
  LineCostProxy *v132;
  LineCostProxy *v133;
  LineCostProxy *v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  char *v139;
  char *v140;
  LineCostProxy *v141;
  LineCostProxy *v142;
  LineCostProxy *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  uint64_t v159;
  vector<CI::Perspective::Line, std::allocator<CI::Perspective::Line>> *p_hClusterOutliers;
  vector<CI::Perspective::Line, std::allocator<CI::Perspective::Line>> *p_hClusterInliers;
  vector<CI::Perspective::Line, std::allocator<CI::Perspective::Line>> *p_vClusterOutliers;
  CIPerspectiveAutoCalcV2 *v163;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  float32x4_t v168;
  float32x4_t v169;
  float32x4_t v170;

  p_vClusterInliersProxies = &self->vClusterInliersProxies;
  p_vClusterInliers = &self->vClusterInliers;
  std::vector<LineCostProxy>::reserve((void **)&self->vClusterInliersProxies.__begin_, (self->vClusterInliers.__end_ - self->vClusterInliers.__begin_) >> 4);
  p_vClusterOutliersProxies = &self->vClusterOutliersProxies;
  p_vClusterOutliers = &self->vClusterOutliers;
  std::vector<LineCostProxy>::reserve((void **)&self->vClusterOutliersProxies.__begin_, (self->vClusterOutliers.__end_ - self->vClusterOutliers.__begin_) >> 4);
  p_hClusterInliersProxies = &self->hClusterInliersProxies;
  p_hClusterInliers = &self->hClusterInliers;
  std::vector<LineCostProxy>::reserve((void **)&self->hClusterInliersProxies.__begin_, (self->hClusterInliers.__end_ - self->hClusterInliers.__begin_) >> 4);
  p_hClusterOutliersProxies = &self->hClusterOutliersProxies;
  v163 = self;
  p_hClusterOutliers = &self->hClusterOutliers;
  std::vector<LineCostProxy>::reserve((void **)&self->hClusterOutliersProxies.__begin_, (self->hClusterOutliers.__end_ - self->hClusterOutliers.__begin_) >> 4);
  begin = (float32x2_t *)p_vClusterInliers->__begin_;
  end = p_vClusterInliers->__end_;
  if (p_vClusterInliers->__begin_ != end)
  {
    anon_120 = self->_anon_120;
    do
    {
      v11 = 0;
      v12 = *(float32x4_t *)self->_anon_c0;
      v13 = *(float32x4_t *)&self->_anon_c0[16];
      v14 = *(float32x4_t *)&self->_anon_c0[32];
      v15 = *(_OWORD *)anon_120;
      v16 = *(_OWORD *)&self->_anon_120[16];
      v17 = *(_OWORD *)&self->_anon_120[32];
      v165 = *(_OWORD *)anon_120;
      v166 = v16;
      v167 = v17;
      do
      {
        *(float32x4_t *)((char *)&v168 + v11) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v11))), v13, *(float32x2_t *)((char *)&v165 + v11), 1), v14, *(float32x4_t *)((char *)&v165 + v11), 2);
        v11 += 16;
      }
      while (v11 != 48);
      v18 = 0;
      v20 = v168;
      v19 = v169;
      v21 = v170;
      v22 = *begin;
      v165 = v15;
      v166 = v16;
      v167 = v17;
      do
      {
        *(float32x4_t *)((char *)&v168 + v18) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v12, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v18))), v13, *(float32x2_t *)((char *)&v165 + v18), 1), v14, *(float32x4_t *)((char *)&v165 + v18), 2);
        v18 += 16;
      }
      while (v18 != 48);
      v23 = (int32x4_t)vaddq_f32(v21, vmlaq_lane_f32(vmulq_n_f32(v20, v22.f32[0]), v19, v22, 1));
      v24 = vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2));
      v25 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(_QWORD *)&begin[1])), v169, begin[1], 1));
      v26 = vdiv_f32(*(float32x2_t *)v25.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2));
      *(float32x2_t *)v25.i8 = vsub_f32(v24, v26);
      *(double *)&v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v25.i8, *(float32x2_t *)v25.i8))), 0.25);
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v27 = *(double *)&v8;
      v28 = vmul_f32(vadd_f32(v24, v26), (float32x2_t)0x3F0000003F000000);
      v28.f32[0] = sqrtf(vaddv_f32(vmul_f32(v28, v28)));
      *(double *)&v8 = 1.0 / ((float)(v28.f32[0] + 1.0) * (float)(v28.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v29 = *(double *)&v8;
      v31 = p_vClusterInliersProxies->__end_;
      value = p_vClusterInliersProxies->__end_cap_.__value_;
      if (v31 >= value)
      {
        v33 = 0xAAAAAAAAAAAAAAABLL * ((v31 - p_vClusterInliersProxies->__begin_) >> 3);
        v34 = v33 + 1;
        if (v33 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_124:
          abort();
        v35 = 0xAAAAAAAAAAAAAAABLL * ((value - p_vClusterInliersProxies->__begin_) >> 3);
        if (2 * v35 > v34)
          v34 = 2 * v35;
        if (v35 >= 0x555555555555555)
          v36 = 0xAAAAAAAAAAAAAAALL;
        else
          v36 = v34;
        if (v36)
          v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_vClusterInliersProxies->__end_cap_, v36);
        else
          v37 = 0;
        v38 = &v37[24 * v33];
        *(float32x2_t *)v38 = v24;
        *((float32x2_t *)v38 + 1) = v26;
        *((float *)v38 + 4) = v27;
        *((float *)v38 + 5) = v29;
        v40 = p_vClusterInliersProxies->__begin_;
        v39 = p_vClusterInliersProxies->__end_;
        v41 = (LineCostProxy *)v38;
        if (v39 != p_vClusterInliersProxies->__begin_)
        {
          do
          {
            v8 = *(_OWORD *)((char *)v39 - 24);
            *((_QWORD *)v41 - 1) = *((_QWORD *)v39 - 1);
            *(_OWORD *)((char *)v41 - 24) = v8;
            v41 = (LineCostProxy *)((char *)v41 - 24);
            v39 = (LineCostProxy *)((char *)v39 - 24);
          }
          while (v39 != v40);
          v39 = p_vClusterInliersProxies->__begin_;
        }
        v32 = (LineCostProxy *)(v38 + 24);
        p_vClusterInliersProxies->__begin_ = v41;
        p_vClusterInliersProxies->__end_ = (LineCostProxy *)(v38 + 24);
        p_vClusterInliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v37[24 * v36];
        if (v39)
          operator delete(v39);
      }
      else
      {
        *(float32x2_t *)v31 = v24;
        *((float32x2_t *)v31 + 1) = v26;
        v32 = (LineCostProxy *)((char *)v31 + 24);
        *((float *)v31 + 4) = v27;
        *((float *)v31 + 5) = v29;
      }
      p_vClusterInliersProxies->__end_ = v32;
      begin += 2;
    }
    while (begin != (float32x2_t *)end);
  }
  v42 = (float32x2_t *)p_vClusterOutliers->__begin_;
  v43 = self->vClusterOutliers.__end_;
  if (p_vClusterOutliers->__begin_ != v43)
  {
    v44 = v163->_anon_120;
    do
    {
      v45 = 0;
      v46 = *(float32x4_t *)v163->_anon_c0;
      v47 = *(float32x4_t *)&v163->_anon_c0[16];
      v48 = *(float32x4_t *)&v163->_anon_c0[32];
      v49 = *(_OWORD *)v44;
      v50 = *(_OWORD *)&v163->_anon_120[16];
      v51 = *(_OWORD *)&v163->_anon_120[32];
      v165 = *(_OWORD *)v44;
      v166 = v50;
      v167 = v51;
      do
      {
        *(float32x4_t *)((char *)&v168 + v45) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v45))), v47, *(float32x2_t *)((char *)&v165 + v45), 1), v48, *(float32x4_t *)((char *)&v165 + v45), 2);
        v45 += 16;
      }
      while (v45 != 48);
      v52 = 0;
      v54 = v168;
      v53 = v169;
      v55 = v170;
      v56 = *v42;
      v165 = v49;
      v166 = v50;
      v167 = v51;
      do
      {
        *(float32x4_t *)((char *)&v168 + v52) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v52))), v47, *(float32x2_t *)((char *)&v165 + v52), 1), v48, *(float32x4_t *)((char *)&v165 + v52), 2);
        v52 += 16;
      }
      while (v52 != 48);
      v57 = (int32x4_t)vaddq_f32(v55, vmlaq_lane_f32(vmulq_n_f32(v54, v56.f32[0]), v53, v56, 1));
      v58 = vdiv_f32(*(float32x2_t *)v57.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v57, 2));
      v59 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(_QWORD *)&v42[1])), v169, v42[1], 1));
      v60 = vdiv_f32(*(float32x2_t *)v59.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v59, 2));
      *(float32x2_t *)v59.i8 = vsub_f32(v58, v60);
      *(double *)&v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v59.i8, *(float32x2_t *)v59.i8))), 0.25);
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v61 = *(double *)&v8;
      v62 = vmul_f32(vadd_f32(v58, v60), (float32x2_t)0x3F0000003F000000);
      v62.f32[0] = sqrtf(vaddv_f32(vmul_f32(v62, v62)));
      *(double *)&v8 = 1.0 / ((float)(v62.f32[0] + 1.0) * (float)(v62.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v63 = *(double *)&v8;
      v65 = p_vClusterOutliersProxies->__end_;
      v64 = p_vClusterOutliersProxies->__end_cap_.__value_;
      if (v65 >= v64)
      {
        v67 = 0xAAAAAAAAAAAAAAABLL * ((v65 - p_vClusterOutliersProxies->__begin_) >> 3);
        v68 = v67 + 1;
        if (v67 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_124;
        v69 = 0xAAAAAAAAAAAAAAABLL * ((v64 - p_vClusterOutliersProxies->__begin_) >> 3);
        if (2 * v69 > v68)
          v68 = 2 * v69;
        if (v69 >= 0x555555555555555)
          v70 = 0xAAAAAAAAAAAAAAALL;
        else
          v70 = v68;
        if (v70)
          v71 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_vClusterOutliersProxies->__end_cap_, v70);
        else
          v71 = 0;
        v72 = &v71[24 * v67];
        *(float32x2_t *)v72 = v58;
        *((float32x2_t *)v72 + 1) = v60;
        *((float *)v72 + 4) = v61;
        *((float *)v72 + 5) = v63;
        v74 = p_vClusterOutliersProxies->__begin_;
        v73 = p_vClusterOutliersProxies->__end_;
        v75 = (LineCostProxy *)v72;
        if (v73 != p_vClusterOutliersProxies->__begin_)
        {
          do
          {
            v8 = *(_OWORD *)((char *)v73 - 24);
            *((_QWORD *)v75 - 1) = *((_QWORD *)v73 - 1);
            *(_OWORD *)((char *)v75 - 24) = v8;
            v75 = (LineCostProxy *)((char *)v75 - 24);
            v73 = (LineCostProxy *)((char *)v73 - 24);
          }
          while (v73 != v74);
          v73 = p_vClusterOutliersProxies->__begin_;
        }
        v66 = (LineCostProxy *)(v72 + 24);
        p_vClusterOutliersProxies->__begin_ = v75;
        p_vClusterOutliersProxies->__end_ = (LineCostProxy *)(v72 + 24);
        p_vClusterOutliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v71[24 * v70];
        if (v73)
          operator delete(v73);
      }
      else
      {
        *(float32x2_t *)v65 = v58;
        *((float32x2_t *)v65 + 1) = v60;
        v66 = (LineCostProxy *)((char *)v65 + 24);
        *((float *)v65 + 4) = v61;
        *((float *)v65 + 5) = v63;
      }
      p_vClusterOutliersProxies->__end_ = v66;
      v42 += 2;
    }
    while (v42 != (float32x2_t *)v43);
  }
  v76 = (float32x2_t *)p_hClusterInliers->__begin_;
  v77 = p_hClusterInliers->__end_;
  if (p_hClusterInliers->__begin_ != v77)
  {
    v78 = v163->_anon_120;
    do
    {
      v79 = 0;
      v80 = *(float32x4_t *)v163->_anon_c0;
      v81 = *(float32x4_t *)&v163->_anon_c0[16];
      v82 = *(float32x4_t *)&v163->_anon_c0[32];
      v83 = *(_OWORD *)v78;
      v84 = *(_OWORD *)&v163->_anon_120[16];
      v85 = *(_OWORD *)&v163->_anon_120[32];
      v165 = *(_OWORD *)v78;
      v166 = v84;
      v167 = v85;
      do
      {
        *(float32x4_t *)((char *)&v168 + v79) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v79))), v81, *(float32x2_t *)((char *)&v165 + v79), 1), v82, *(float32x4_t *)((char *)&v165 + v79), 2);
        v79 += 16;
      }
      while (v79 != 48);
      v86 = 0;
      v88 = v168;
      v87 = v169;
      v89 = v170;
      v90 = *v76;
      v165 = v83;
      v166 = v84;
      v167 = v85;
      do
      {
        *(float32x4_t *)((char *)&v168 + v86) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v86))), v81, *(float32x2_t *)((char *)&v165 + v86), 1), v82, *(float32x4_t *)((char *)&v165 + v86), 2);
        v86 += 16;
      }
      while (v86 != 48);
      v91 = (int32x4_t)vaddq_f32(v89, vmlaq_lane_f32(vmulq_n_f32(v88, v90.f32[0]), v87, v90, 1));
      v92 = vdiv_f32(*(float32x2_t *)v91.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v91, 2));
      v93 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(_QWORD *)&v76[1])), v169, v76[1], 1));
      v94 = vdiv_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2));
      *(float32x2_t *)v93.i8 = vsub_f32(v92, v94);
      *(double *)&v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v93.i8, *(float32x2_t *)v93.i8))), 0.25);
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v95 = *(double *)&v8;
      v96 = vmul_f32(vadd_f32(v92, v94), (float32x2_t)0x3F0000003F000000);
      v96.f32[0] = sqrtf(vaddv_f32(vmul_f32(v96, v96)));
      *(double *)&v8 = 1.0 / ((float)(v96.f32[0] + 1.0) * (float)(v96.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v97 = *(double *)&v8;
      v99 = p_hClusterInliersProxies->__end_;
      v98 = p_hClusterInliersProxies->__end_cap_.__value_;
      if (v99 >= v98)
      {
        v101 = 0xAAAAAAAAAAAAAAABLL * ((v99 - p_hClusterInliersProxies->__begin_) >> 3);
        v102 = v101 + 1;
        if (v101 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_124;
        v103 = 0xAAAAAAAAAAAAAAABLL * ((v98 - p_hClusterInliersProxies->__begin_) >> 3);
        if (2 * v103 > v102)
          v102 = 2 * v103;
        if (v103 >= 0x555555555555555)
          v104 = 0xAAAAAAAAAAAAAAALL;
        else
          v104 = v102;
        if (v104)
          v105 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_hClusterInliersProxies->__end_cap_, v104);
        else
          v105 = 0;
        v106 = &v105[24 * v101];
        *(float32x2_t *)v106 = v92;
        *((float32x2_t *)v106 + 1) = v94;
        *((float *)v106 + 4) = v95;
        *((float *)v106 + 5) = v97;
        v108 = p_hClusterInliersProxies->__begin_;
        v107 = p_hClusterInliersProxies->__end_;
        v109 = (LineCostProxy *)v106;
        if (v107 != p_hClusterInliersProxies->__begin_)
        {
          do
          {
            v8 = *(_OWORD *)((char *)v107 - 24);
            *((_QWORD *)v109 - 1) = *((_QWORD *)v107 - 1);
            *(_OWORD *)((char *)v109 - 24) = v8;
            v109 = (LineCostProxy *)((char *)v109 - 24);
            v107 = (LineCostProxy *)((char *)v107 - 24);
          }
          while (v107 != v108);
          v107 = p_hClusterInliersProxies->__begin_;
        }
        v100 = (LineCostProxy *)(v106 + 24);
        p_hClusterInliersProxies->__begin_ = v109;
        p_hClusterInliersProxies->__end_ = (LineCostProxy *)(v106 + 24);
        p_hClusterInliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v105[24 * v104];
        if (v107)
          operator delete(v107);
      }
      else
      {
        *(float32x2_t *)v99 = v92;
        *((float32x2_t *)v99 + 1) = v94;
        v100 = (LineCostProxy *)((char *)v99 + 24);
        *((float *)v99 + 4) = v95;
        *((float *)v99 + 5) = v97;
      }
      p_hClusterInliersProxies->__end_ = v100;
      v76 += 2;
    }
    while (v76 != (float32x2_t *)v77);
  }
  v110 = (float32x2_t *)p_hClusterOutliers->__begin_;
  v111 = p_hClusterOutliers->__end_;
  if (p_hClusterOutliers->__begin_ != v111)
  {
    v112 = v163->_anon_120;
    do
    {
      v113 = 0;
      v114 = *(float32x4_t *)v163->_anon_c0;
      v115 = *(float32x4_t *)&v163->_anon_c0[16];
      v116 = *(float32x4_t *)&v163->_anon_c0[32];
      v117 = *(_OWORD *)v112;
      v118 = *(_OWORD *)&v163->_anon_120[16];
      v119 = *(_OWORD *)&v163->_anon_120[32];
      v165 = *(_OWORD *)v112;
      v166 = v118;
      v167 = v119;
      do
      {
        *(float32x4_t *)((char *)&v168 + v113) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v113))), v115, *(float32x2_t *)((char *)&v165 + v113), 1), v116, *(float32x4_t *)((char *)&v165 + v113), 2);
        v113 += 16;
      }
      while (v113 != 48);
      v120 = 0;
      v122 = v168;
      v121 = v169;
      v123 = v170;
      v124 = *v110;
      v165 = v117;
      v166 = v118;
      v167 = v119;
      do
      {
        *(float32x4_t *)((char *)&v168 + v120) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(__int128 *)((char *)&v165 + v120))), v115, *(float32x2_t *)((char *)&v165 + v120), 1), v116, *(float32x4_t *)((char *)&v165 + v120), 2);
        v120 += 16;
      }
      while (v120 != 48);
      v125 = (int32x4_t)vaddq_f32(v123, vmlaq_lane_f32(vmulq_n_f32(v122, v124.f32[0]), v121, v124, 1));
      v126 = vdiv_f32(*(float32x2_t *)v125.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v125, 2));
      v127 = (int32x4_t)vaddq_f32(v170, vmlaq_lane_f32(vmulq_n_f32(v168, COERCE_FLOAT(*(_QWORD *)&v110[1])), v169, v110[1], 1));
      v128 = vdiv_f32(*(float32x2_t *)v127.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v127, 2));
      *(float32x2_t *)v127.i8 = vsub_f32(v126, v128);
      *(double *)&v8 = pow(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v127.i8, *(float32x2_t *)v127.i8))), 0.25);
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v129 = *(double *)&v8;
      v130 = vmul_f32(vadd_f32(v126, v128), (float32x2_t)0x3F0000003F000000);
      v130.f32[0] = sqrtf(vaddv_f32(vmul_f32(v130, v130)));
      *(double *)&v8 = 1.0 / ((float)(v130.f32[0] + 1.0) * (float)(v130.f32[0] + 1.0));
      if (*(double *)&v8 >= 1.0)
        *(double *)&v8 = 1.0;
      v131 = *(double *)&v8;
      v133 = p_hClusterOutliersProxies->__end_;
      v132 = p_hClusterOutliersProxies->__end_cap_.__value_;
      if (v133 >= v132)
      {
        v135 = 0xAAAAAAAAAAAAAAABLL * ((v133 - p_hClusterOutliersProxies->__begin_) >> 3);
        v136 = v135 + 1;
        if (v135 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_124;
        v137 = 0xAAAAAAAAAAAAAAABLL * ((v132 - p_hClusterOutliersProxies->__begin_) >> 3);
        if (2 * v137 > v136)
          v136 = 2 * v137;
        if (v137 >= 0x555555555555555)
          v138 = 0xAAAAAAAAAAAAAAALL;
        else
          v138 = v136;
        if (v138)
          v139 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SWRendererFunctionInputNode>>((uint64_t)&p_hClusterOutliersProxies->__end_cap_, v138);
        else
          v139 = 0;
        v140 = &v139[24 * v135];
        *(float32x2_t *)v140 = v126;
        *((float32x2_t *)v140 + 1) = v128;
        *((float *)v140 + 4) = v129;
        *((float *)v140 + 5) = v131;
        v142 = p_hClusterOutliersProxies->__begin_;
        v141 = p_hClusterOutliersProxies->__end_;
        v143 = (LineCostProxy *)v140;
        if (v141 != p_hClusterOutliersProxies->__begin_)
        {
          do
          {
            v8 = *(_OWORD *)((char *)v141 - 24);
            *((_QWORD *)v143 - 1) = *((_QWORD *)v141 - 1);
            *(_OWORD *)((char *)v143 - 24) = v8;
            v143 = (LineCostProxy *)((char *)v143 - 24);
            v141 = (LineCostProxy *)((char *)v141 - 24);
          }
          while (v141 != v142);
          v141 = p_hClusterOutliersProxies->__begin_;
        }
        v134 = (LineCostProxy *)(v140 + 24);
        p_hClusterOutliersProxies->__begin_ = v143;
        p_hClusterOutliersProxies->__end_ = (LineCostProxy *)(v140 + 24);
        p_hClusterOutliersProxies->__end_cap_.__value_ = (LineCostProxy *)&v139[24 * v138];
        if (v141)
          operator delete(v141);
      }
      else
      {
        *(float32x2_t *)v133 = v126;
        *((float32x2_t *)v133 + 1) = v128;
        v134 = (LineCostProxy *)((char *)v133 + 24);
        *((float *)v133 + 4) = v129;
        *((float *)v133 + 5) = v131;
      }
      p_hClusterOutliersProxies->__end_ = v134;
      v110 += 2;
    }
    while (v110 != (float32x2_t *)v111);
  }
  v144 = 0;
  v145 = 0;
  do
  {
    v146 = 0;
    LODWORD(v8) = dword_1924967D0[v144];
    do
    {
      v147 = 0;
      v148 = v8;
      DWORD1(v148) = dword_1924967D0[v146];
      do
      {
        v149 = v148;
        DWORD2(v149) = dword_1924967D0[v147];
        *(_OWORD *)&v163->initialSimplexVerticesXYZ[16 * v145 + 16 * v147++] = v149;
      }
      while (v147 != 4);
      ++v146;
      v145 += 4;
    }
    while (v146 != 4);
    ++v144;
  }
  while (v144 != 4);
  v150 = 0;
  v151 = 0;
  do
  {
    v152 = 0;
    v153 = dword_1924967D0[v150];
    do
    {
      LODWORD(v154) = v153;
      HIDWORD(v154) = dword_1924967D0[v152];
      *(_QWORD *)&v163->initialSimplexVerticesXZ[8 * v151 + 8 * v152++] = v154;
    }
    while (v152 != 4);
    ++v150;
    v151 += 4;
  }
  while (v150 != 4);
  v155 = 0;
  v156 = 0;
  do
  {
    v157 = 0;
    v158 = dword_1924967D0[v155];
    do
    {
      LODWORD(v159) = v158;
      HIDWORD(v159) = dword_1924967D0[v157];
      *(_QWORD *)&v163->initialSimplexVerticesYZ[8 * v156 + 8 * v157++] = v159;
    }
    while (v157 != 4);
    ++v155;
    v156 += 4;
  }
  while (v155 != 4);
}

- (float)evaluateCost:(CIPerspectiveAutoCalcV2 *)self
{
  __int128 v2;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  LineCostProxy *begin;
  LineCostProxy *end;
  float v9;
  float i;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float v15;
  LineCostProxy *v16;
  LineCostProxy *v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x2_t v21;
  float v22;
  LineCostProxy *v23;
  LineCostProxy *v24;
  float v25;
  float j;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x2_t v30;
  float v31;
  LineCostProxy *v32;
  LineCostProxy *v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x2_t v37;
  float v38;

  *(__n64 *)v4.f32 = CI::Perspective::getRotation((CI::Perspective *)self, *(float *)&v2, *((float *)&v2 + 1), *((float *)&v2 + 2));
  begin = self->vClusterInliersProxies.__begin_;
  end = self->vClusterInliersProxies.__end_;
  v9 = 0.0;
  for (i = 0.0; begin != end; begin = (LineCostProxy *)((char *)begin + 24))
  {
    v11 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(_QWORD *)begin)), v5, *(float32x2_t *)begin, 1));
    v12 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_QWORD *)begin + 1))), v5, *(float32x2_t *)((char *)begin + 8), 1));
    v13 = vsubq_f32(vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2)), vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)));
    v14 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v13, v13)));
    *(float32x2_t *)v12.f32 = vrsqrte_f32(v14);
    *(float32x2_t *)v12.f32 = vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32)));
    v15 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v13.f32, vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32))).f32[0]), (float32x2_t)1065353216));
    if (v15 < 0.0)
      v15 = -v15;
    i = i + (float)(*((float *)begin + 5) * (float)(*((float *)begin + 4) * v15));
  }
  v16 = self->vClusterOutliersProxies.__begin_;
  v17 = self->vClusterOutliersProxies.__end_;
  if (v16 != v17)
  {
    v9 = 0.0;
    do
    {
      v18 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(_QWORD *)v16)), v5, *(float32x2_t *)v16, 1));
      v19 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_QWORD *)v16 + 1))), v5, *(float32x2_t *)((char *)v16 + 8), 1));
      v20 = vsubq_f32(vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2)), vdivq_f32(v18, (float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2)));
      v21 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20)));
      *(float32x2_t *)v19.f32 = vrsqrte_f32(v21);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      v22 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v20.f32, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]), (float32x2_t)1065353216));
      if (v22 < 0.0)
        v22 = -v22;
      v9 = v9 + (float)(*((float *)v16 + 5) * (float)(*((float *)v16 + 4) * v22));
      v16 = (LineCostProxy *)((char *)v16 + 24);
    }
    while (v16 != v17);
  }
  v23 = self->hClusterInliersProxies.__begin_;
  v24 = self->hClusterInliersProxies.__end_;
  v25 = 0.0;
  for (j = 0.0; v23 != v24; v23 = (LineCostProxy *)((char *)v23 + 24))
  {
    v27 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(_QWORD *)v23)), v5, *(float32x2_t *)v23, 1));
    v28 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_QWORD *)v23 + 1))), v5, *(float32x2_t *)((char *)v23 + 8), 1));
    v29 = vsubq_f32(vdivq_f32(v28, (float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2)), vdivq_f32(v27, (float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2)));
    v30 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v29, v29)));
    *(float32x2_t *)v28.f32 = vrsqrte_f32(v30);
    *(float32x2_t *)v28.f32 = vmul_f32(*(float32x2_t *)v28.f32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v28.f32, *(float32x2_t *)v28.f32)));
    v31 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v29.f32, vmul_f32(*(float32x2_t *)v28.f32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v28.f32, *(float32x2_t *)v28.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
    if (v31 < 0.0)
      v31 = -v31;
    j = j + (float)(*((float *)v23 + 5) * (float)(*((float *)v23 + 4) * v31));
  }
  v32 = self->hClusterOutliersProxies.__begin_;
  v33 = self->hClusterOutliersProxies.__end_;
  if (v32 != v33)
  {
    v25 = 0.0;
    do
    {
      v34 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(_QWORD *)v32)), v5, *(float32x2_t *)v32, 1));
      v35 = vaddq_f32(v6, vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*((_QWORD *)v32 + 1))), v5, *(float32x2_t *)((char *)v32 + 8), 1));
      v36 = vsubq_f32(vdivq_f32(v35, (float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2)), vdivq_f32(v34, (float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2)));
      v37 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v36, v36)));
      *(float32x2_t *)v35.f32 = vrsqrte_f32(v37);
      *(float32x2_t *)v35.f32 = vmul_f32(*(float32x2_t *)v35.f32, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v35.f32, *(float32x2_t *)v35.f32)));
      v38 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v36.f32, vmul_f32(*(float32x2_t *)v35.f32, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v35.f32, *(float32x2_t *)v35.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
      if (v38 < 0.0)
        v38 = -v38;
      v25 = v25 + (float)(*((float *)v32 + 5) * (float)(*((float *)v32 + 4) * v38));
      v32 = (LineCostProxy *)((char *)v32 + 24);
    }
    while (v32 != v33);
  }
  return (float)((float)((float)(v9 + (float)(i * 1.5)) * 1.25) + (float)((float)(v25 + (float)(j * 1.5)) * 0.75)) * 0.5;
}

- (float)evaluateCostXZ:(CIPerspectiveAutoCalcV2 *)self
{
  uint64_t v2;
  float v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  LineCostProxy *begin;
  LineCostProxy *end;
  float i;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float v15;
  LineCostProxy *v16;
  LineCostProxy *v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x2_t v21;
  float v22;

  v4 = 0.0;
  *(__n64 *)v5.f32 = CI::Perspective::getRotation((CI::Perspective *)self, *(float *)&v2, 0.0, *((float *)&v2 + 1));
  begin = self->vClusterInliersProxies.__begin_;
  end = self->vClusterInliersProxies.__end_;
  for (i = 0.0; begin != end; begin = (LineCostProxy *)((char *)begin + 24))
  {
    v11 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_QWORD *)begin)), v6, *(float32x2_t *)begin, 1));
    v12 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((_QWORD *)begin + 1))), v6, *(float32x2_t *)((char *)begin + 8), 1));
    v13 = vsubq_f32(vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2)), vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)));
    v14 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v13, v13)));
    *(float32x2_t *)v12.f32 = vrsqrte_f32(v14);
    *(float32x2_t *)v12.f32 = vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32)));
    v15 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v13.f32, vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32))).f32[0]), (float32x2_t)1065353216));
    if (v15 < 0.0)
      v15 = -v15;
    i = i + (float)(*((float *)begin + 5) * (float)(*((float *)begin + 4) * v15));
  }
  v16 = self->vClusterOutliersProxies.__begin_;
  v17 = self->vClusterOutliersProxies.__end_;
  if (v16 != v17)
  {
    v4 = 0.0;
    do
    {
      v18 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_QWORD *)v16)), v6, *(float32x2_t *)v16, 1));
      v19 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((_QWORD *)v16 + 1))), v6, *(float32x2_t *)((char *)v16 + 8), 1));
      v20 = vsubq_f32(vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2)), vdivq_f32(v18, (float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2)));
      v21 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20)));
      *(float32x2_t *)v19.f32 = vrsqrte_f32(v21);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      v22 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v20.f32, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]), (float32x2_t)1065353216));
      if (v22 < 0.0)
        v22 = -v22;
      v4 = v4 + (float)(*((float *)v16 + 5) * (float)(*((float *)v16 + 4) * v22));
      v16 = (LineCostProxy *)((char *)v16 + 24);
    }
    while (v16 != v17);
  }
  return v4 + (float)(i * 1.5);
}

- (float)evaluateCostYZ:(CIPerspectiveAutoCalcV2 *)self
{
  uint64_t v2;
  float v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  LineCostProxy *begin;
  LineCostProxy *end;
  float i;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float v15;
  LineCostProxy *v16;
  LineCostProxy *v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x2_t v21;
  float v22;

  v4 = 0.0;
  *(__n64 *)v5.f32 = CI::Perspective::getRotation((CI::Perspective *)self, 0.0, *(float *)&v2, *((float *)&v2 + 1));
  begin = self->hClusterInliersProxies.__begin_;
  end = self->hClusterInliersProxies.__end_;
  for (i = 0.0; begin != end; begin = (LineCostProxy *)((char *)begin + 24))
  {
    v11 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_QWORD *)begin)), v6, *(float32x2_t *)begin, 1));
    v12 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((_QWORD *)begin + 1))), v6, *(float32x2_t *)((char *)begin + 8), 1));
    v13 = vsubq_f32(vdivq_f32(v12, (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2)), vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)));
    v14 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v13, v13)));
    *(float32x2_t *)v12.f32 = vrsqrte_f32(v14);
    *(float32x2_t *)v12.f32 = vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32)));
    v15 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v13.f32, vmul_f32(*(float32x2_t *)v12.f32, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(*(float32x2_t *)v12.f32, *(float32x2_t *)v12.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
    if (v15 < 0.0)
      v15 = -v15;
    i = i + (float)(*((float *)begin + 5) * (float)(*((float *)begin + 4) * v15));
  }
  v16 = self->hClusterOutliersProxies.__begin_;
  v17 = self->hClusterOutliersProxies.__end_;
  if (v16 != v17)
  {
    v4 = 0.0;
    do
    {
      v18 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*(_QWORD *)v16)), v6, *(float32x2_t *)v16, 1));
      v19 = vaddq_f32(v7, vmlaq_lane_f32(vmulq_n_f32(v5, COERCE_FLOAT(*((_QWORD *)v16 + 1))), v6, *(float32x2_t *)((char *)v16 + 8), 1));
      v20 = vsubq_f32(vdivq_f32(v19, (float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2)), vdivq_f32(v18, (float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2)));
      v21 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v20, v20)));
      *(float32x2_t *)v19.f32 = vrsqrte_f32(v21);
      *(float32x2_t *)v19.f32 = vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32)));
      v22 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v20.f32, vmul_f32(*(float32x2_t *)v19.f32, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(*(float32x2_t *)v19.f32, *(float32x2_t *)v19.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
      if (v22 < 0.0)
        v22 = -v22;
      v4 = v4 + (float)(*((float *)v16 + 5) * (float)(*((float *)v16 + 4) * v22));
      v16 = (LineCostProxy *)((char *)v16 + 24);
    }
    while (v16 != v17);
  }
  return v4 + (float)(i * 2.0);
}

- (void)runOptimization
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  Solution *p_solution;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  float v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  uint64_t v20;
  float rZ;
  float v22;
  BOOL v23;
  float rY;
  float rX;
  float v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  int v39;
  float v40;
  float v41;
  float v42;
  float v43;
  BOOL v44;
  BOOL v45;
  float v46;
  double v47;
  double pitchLimit;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  os_signpost_id_t v57;
  uint64_t v58;
  float v59;
  float v60;
  float v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[5];
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[5];
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[5];
  uint8_t buf[4];
  int64_t v75;
  __int16 v76;
  int64_t v77;
  __int16 v78;
  int64_t v79;
  __int16 v80;
  _BYTE v81[14];
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      v7 = (self->vClusterInliers.__end_ - self->vClusterInliers.__begin_) >> 4;
      v8 = (self->vClusterOutliers.__end_ - self->vClusterOutliers.__begin_) >> 4;
      v9 = (self->hClusterInliers.__end_ - self->hClusterInliers.__begin_) >> 4;
      v10 = (self->hClusterOutliers.__end_ - self->hClusterOutliers.__begin_) >> 4;
      *(_DWORD *)buf = 134218752;
      v75 = v7;
      v76 = 2048;
      v77 = v8;
      v78 = 2048;
      v79 = v9;
      v80 = 2048;
      *(_QWORD *)v81 = v10;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "runOptimization", "vClusterInliers: %lu vClusterOutliers: %luhClusterInliers: %lu hClusterOutliers: %lu", buf, 0x2Au);
    }
  }
  self->solutionType = 0;
  p_solution = &self->solution;
  self->solution = (Solution)xmmword_1924967E0;
  begin = self->vLines.__begin_;
  end = self->vLines.__end_;
  if (begin == end)
  {
    v18 = self->hLines.__begin_;
    v19 = self->hLines.__end_;
    v14 = 0.0;
    if (v18 == v19)
    {
      v20 = 0;
      v59 = 0.0;
      v31 = INFINITY;
      v60 = 0.0;
      v30 = 0.0;
      v26 = 0.0;
      rX = 0.0;
      rY = 0.0;
      rZ = 0.0;
      v22 = INFINITY;
      v32 = INFINITY;
      goto LABEL_24;
    }
LABEL_11:
    v26 = 0.0;
    do
    {
      v27 = *(float32x2_t *)v18;
      v28 = *(float32x2_t *)((char *)v18 + 8);
      v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v18 + 16);
      v29 = vsub_f32(v27, v28);
      v26 = v26 + sqrtf(vaddv_f32(vmul_f32(v29, v29)));
    }
    while (v18 != v19);
    v30 = v14 + v26;
    v23 = v26 > 500.0;
    if (v14 <= 500.0 || v26 <= 500.0)
    {
      if (v14 <= 500.0)
      {
        v20 = 0;
        v59 = 0.0;
        v31 = INFINITY;
        v60 = 0.0;
        rX = 0.0;
        rY = 0.0;
        rZ = 0.0;
        v22 = INFINITY;
        v32 = INFINITY;
        if (v26 <= 500.0)
          goto LABEL_24;
        goto LABEL_22;
      }
      v61 = v14 + v26;
      rZ = 0.0;
      v22 = INFINITY;
      rY = 0.0;
      rX = 0.0;
    }
    else
    {
      v61 = v14 + v26;
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke;
      v73[3] = &unk_1E2EC4B68;
      v73[4] = self;
      v70 = xmmword_1924967B0;
      v71 = 981668463;
      v72 = 0;
      _ZN2CI11Perspective9NMSimplexIDv3_fEC2ENS0_8NMParamsEU13block_pointerFfRKS2_EPS5_m((uint64_t)buf, (uint64_t)&v70, (uint64_t)v73, (uint64_t)self->initialSimplexVerticesXYZ, 0x40uLL);
      rX = **(float **)&v81[6];
      rY = *(float *)(*(_QWORD *)&v81[6] + 4);
      rZ = *(float *)(*(_QWORD *)&v81[6] + 8);
      v22 = *(float *)(*(_QWORD *)&v81[6] + 16);
      v82 = *(_QWORD *)&v81[6];
      operator delete(*(void **)&v81[6]);
      v23 = 1;
    }
LABEL_18:
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_2;
    v69[3] = &unk_1E2EC4B68;
    v69[4] = self;
    v66 = xmmword_1924967B0;
    v67 = 981668463;
    v68 = 0;
    _ZN2CI11Perspective9NMSimplexIDv2_fEC2ENS0_8NMParamsEU13block_pointerFfRKS2_EPS5_m((uint64_t)buf, (uint64_t)&v66, (uint64_t)v69, (uint64_t)self->initialSimplexVerticesXZ, 0x10uLL);
    LODWORD(v60) = **(_QWORD **)&v81[6];
    LODWORD(v59) = HIDWORD(**(_QWORD **)&v81[6]);
    v31 = *(float *)(*(_QWORD *)&v81[6] + 8);
    v82 = *(_QWORD *)&v81[6];
    operator delete(*(void **)&v81[6]);
    if (!v23)
    {
      v20 = 0;
      v32 = INFINITY;
LABEL_23:
      v30 = v61;
      goto LABEL_24;
    }
    v30 = v61;
LABEL_22:
    v61 = v30;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_3;
    v65[3] = &unk_1E2EC4B68;
    v65[4] = self;
    v62 = xmmword_1924967B0;
    v63 = 981668463;
    v64 = 0;
    _ZN2CI11Perspective9NMSimplexIDv2_fEC2ENS0_8NMParamsEU13block_pointerFfRKS2_EPS5_m((uint64_t)buf, (uint64_t)&v62, (uint64_t)v65, (uint64_t)self->initialSimplexVerticesYZ, 0x10uLL);
    v58 = **(_QWORD **)&v81[6];
    v32 = *(float *)(*(_QWORD *)&v81[6] + 8);
    v82 = *(_QWORD *)&v81[6];
    operator delete(*(void **)&v81[6]);
    v20 = v58;
    goto LABEL_23;
  }
  v14 = 0.0;
  do
  {
    v15 = *(float32x2_t *)begin;
    v16 = *(float32x2_t *)((char *)begin + 8);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
    v17 = vsub_f32(v15, v16);
    v14 = v14 + sqrtf(vaddv_f32(vmul_f32(v17, v17)));
  }
  while (begin != end);
  v18 = self->hLines.__begin_;
  v19 = self->hLines.__end_;
  if (v18 != v19)
    goto LABEL_11;
  v20 = 0;
  rZ = 0.0;
  v22 = INFINITY;
  if (v14 > 500.0)
  {
    v23 = 0;
    rY = 0.0;
    rX = 0.0;
    v26 = 0.0;
    v61 = v14;
    goto LABEL_18;
  }
  v31 = INFINITY;
  v59 = 0.0;
  v60 = 0.0;
  v30 = v14;
  v26 = 0.0;
  rX = 0.0;
  v32 = INFINITY;
  rY = 0.0;
LABEL_24:
  v33 = (float)(v22 / v30) * 0.5;
  v34 = (float)(v31 / v14) * 0.75;
  v35 = v32 / v26;
  if (v33 > v34 || v33 > v35)
  {
    if (v34 > v33 || v34 > v35)
    {
      if (v35 > v33 || v35 > v34)
      {
        v39 = 0;
        rX = p_solution->rX;
        rY = self->solution.rY;
        rZ = self->solution.rZ;
        v41 = 0.0;
        v40 = INFINITY;
        v42 = 0.0;
        v43 = 0.0;
      }
      else
      {
        self->solutionType = 3;
        p_solution->rX = 0.0;
        *(_QWORD *)&self->solution.rY = v20;
        self->solution.cost = v32;
        v45 = v33 > v34;
        if (v33 <= v34)
          v39 = 1;
        else
          v39 = 2;
        if (v33 <= v34)
          v40 = v22;
        else
          v40 = v31;
        v41 = v59;
        if (!v45)
          v41 = rZ;
        v42 = 0.0;
        if (!v45)
          v42 = rY;
        v43 = v60;
        if (!v45)
          v43 = rX;
        rZ = *((float *)&v20 + 1);
        rY = *(float *)&v20;
        rX = 0.0;
      }
    }
    else
    {
      self->solutionType = 2;
      *(_QWORD *)&p_solution->rX = LODWORD(v60);
      self->solution.rZ = v59;
      self->solution.cost = v31;
      v44 = v33 > v35;
      if (v33 <= v35)
        v39 = 1;
      else
        v39 = 3;
      if (v33 <= v35)
        v40 = v22;
      else
        v40 = v32;
      v41 = *((float *)&v20 + 1);
      if (v44)
      {
        v42 = *(float *)&v20;
      }
      else
      {
        v41 = rZ;
        v42 = rY;
      }
      rY = 0.0;
      if (v44)
        v43 = 0.0;
      else
        v43 = rX;
      rZ = v59;
      rX = v60;
    }
  }
  else
  {
    self->solutionType = 1;
    p_solution->rX = rX;
    self->solution.rY = rY;
    self->solution.rZ = rZ;
    self->solution.cost = v22;
    v39 = 2;
    v40 = v31;
    v41 = v59;
    v42 = 0.0;
    v43 = v60;
  }
  self->unlimitedPitch = rX;
  self->unlimitedYaw = rY;
  self->unlimitedRoll = rZ;
  v46 = -rX;
  if (rX >= 0.0)
    v46 = rX;
  v47 = v46;
  pitchLimit = self->super.config.pitchLimit;
  if (pitchLimit < v47)
    goto LABEL_76;
  v49 = -rY;
  if (rY >= 0.0)
    v49 = rY;
  if (self->super.config.yawLimit < v49)
    goto LABEL_76;
  v50 = -rZ;
  if (rZ >= 0.0)
    v50 = rZ;
  if (self->super.config.rollLimit >= v50)
  {
    self->super.pitch = rX;
    self->super.yaw = rY;
    self->super.roll = rZ;
  }
  else
  {
LABEL_76:
    v51 = -v43;
    if (v43 >= 0.0)
      v51 = v43;
    if (pitchLimit < v51)
      goto LABEL_85;
    v52 = -v42;
    if (v42 >= 0.0)
      v52 = v42;
    if (self->super.config.yawLimit < v52)
      goto LABEL_85;
    v53 = -v41;
    if (v41 >= 0.0)
      v53 = v41;
    if (self->super.config.rollLimit >= v53)
    {
      self->solutionType = v39;
      p_solution->rX = v43;
      self->solution.rY = v42;
      self->solution.rZ = v41;
      self->solution.cost = v40;
      self->super.pitch = v43;
      self->super.yaw = v42;
      self->super.roll = v41;
    }
    else
    {
LABEL_85:
      self->super.pitchFailureReason = 1;
      self->super.yawFailureReason = 1;
    }
  }
  if (self->solution.cost == INFINITY)
  {
    self->super.pitchFailureReason = 2;
    self->super.yawFailureReason = 2;
  }
  else
  {
    v54 = ci_signpost_log_perspectiveAC();
    v55 = ci_signpost_log_perspectiveAC();
    v56 = os_signpost_id_make_with_pointer(v55, self);
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v57 = v56;
      if (os_signpost_enabled(v54))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1921E4000, v54, OS_SIGNPOST_INTERVAL_END, v57, "runOptimization", (const char *)&unk_192520C83, buf, 2u);
      }
    }
  }
}

uint64_t __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke(uint64_t a1, double *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateCost:", *a2);
}

uint64_t __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_2(uint64_t a1, double *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateCostXZ:", *a2);
}

uint64_t __42__CIPerspectiveAutoCalcV2_runOptimization__block_invoke_3(uint64_t a1, double *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateCostYZ:", *a2);
}

- (void)computeConfidence
{
  double v3;
  float pitch;
  float yaw;
  float roll;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float v11;
  LineCostProxy *begin;
  LineCostProxy *i;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x2_t v17;
  float v18;
  float v19;
  float v20;
  LineCostProxy *v21;
  LineCostProxy *j;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x2_t v26;
  float v27;
  float v28;
  float v29;
  LineCostProxy *v30;
  LineCostProxy *k;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x2_t v35;
  float v36;
  float v37;
  float v38;
  LineCostProxy *v39;
  LineCostProxy *m;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x2_t v44;
  float v45;
  float v46;
  float v47;
  LineCostProxy *v48;
  LineCostProxy *n;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x2_t v53;
  float v54;
  float v55;
  float v56;
  LineCostProxy *v57;
  LineCostProxy *ii;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x2_t v62;
  float v63;
  float v64;
  float v65;
  LineCostProxy *v66;
  LineCostProxy *jj;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x2_t v71;
  float v72;
  float v73;
  float v74;
  LineCostProxy *v75;
  LineCostProxy *kk;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x2_t v80;
  float v81;
  float v82;
  float v83;
  float v84;

  v3 = 0.0;
  if (self->solution.cost != INFINITY)
  {
    pitch = self->super.pitch;
    yaw = self->super.yaw;
    roll = self->super.roll;
    *(__n64 *)v7.f32 = CI::Perspective::getRotation((CI::Perspective *)self, pitch, yaw, roll);
    v10 = 0.0;
    v11 = 0.0;
    switch(self->solutionType)
    {
      case 0:
        break;
      case 1:
        begin = self->vClusterInliersProxies.__begin_;
        for (i = self->vClusterInliersProxies.__end_; begin != i; begin = (LineCostProxy *)((char *)begin + 24))
        {
          v14 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)begin)), v8, *(float32x2_t *)begin, 1));
          v15 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)begin + 1))), v8, *(float32x2_t *)((char *)begin + 8), 1));
          v16 = vsubq_f32(vdivq_f32(v15, (float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2)), vdivq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2)));
          v17 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v16, v16)));
          *(float32x2_t *)v15.f32 = vrsqrte_f32(v17);
          *(float32x2_t *)v15.f32 = vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32)));
          v18 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v16.f32, vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32))).f32[0]), (float32x2_t)1065353216));
          if (v18 < 0.0)
            v18 = -v18;
          v19 = *((float *)begin + 4);
          v20 = *((float *)begin + 5);
          v10 = v10 + (float)((float)(v20 * (float)(v19 * v18)) * 2.0);
          v11 = v11 + (float)(v19 * v20);
        }
        v21 = self->vClusterOutliersProxies.__begin_;
        for (j = self->vClusterOutliersProxies.__end_; v21 != j; v21 = (LineCostProxy *)((char *)v21 + 24))
        {
          v23 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v21)), v8, *(float32x2_t *)v21, 1));
          v24 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v21 + 1))), v8, *(float32x2_t *)((char *)v21 + 8), 1));
          v25 = vsubq_f32(vdivq_f32(v24, (float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2)), vdivq_f32(v23, (float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2)));
          v26 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v25, v25)));
          *(float32x2_t *)v24.f32 = vrsqrte_f32(v26);
          *(float32x2_t *)v24.f32 = vmul_f32(*(float32x2_t *)v24.f32, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(*(float32x2_t *)v24.f32, *(float32x2_t *)v24.f32)));
          v27 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v25.f32, vmul_f32(*(float32x2_t *)v24.f32, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(*(float32x2_t *)v24.f32, *(float32x2_t *)v24.f32))).f32[0]), (float32x2_t)1065353216));
          if (v27 < 0.0)
            v27 = -v27;
          v28 = *((float *)v21 + 4);
          v29 = *((float *)v21 + 5);
          v10 = v10 + (float)(v29 * (float)(v28 * v27));
          v11 = v11 + (float)(v28 * v29);
        }
        v30 = self->hClusterInliersProxies.__begin_;
        for (k = self->hClusterInliersProxies.__end_; v30 != k; v30 = (LineCostProxy *)((char *)v30 + 24))
        {
          v32 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v30)), v8, *(float32x2_t *)v30, 1));
          v33 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v30 + 1))), v8, *(float32x2_t *)((char *)v30 + 8), 1));
          v34 = vsubq_f32(vdivq_f32(v33, (float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2)), vdivq_f32(v32, (float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2)));
          v35 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v34, v34)));
          *(float32x2_t *)v33.f32 = vrsqrte_f32(v35);
          *(float32x2_t *)v33.f32 = vmul_f32(*(float32x2_t *)v33.f32, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(*(float32x2_t *)v33.f32, *(float32x2_t *)v33.f32)));
          v36 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v34.f32, vmul_f32(*(float32x2_t *)v33.f32, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(*(float32x2_t *)v33.f32, *(float32x2_t *)v33.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v36 < 0.0)
            v36 = -v36;
          v37 = *((float *)v30 + 4);
          v38 = *((float *)v30 + 5);
          v10 = v10 + (float)((float)(v38 * (float)(v37 * v36)) * 2.0);
          v11 = v11 + (float)(v37 * v38);
        }
        v39 = self->hClusterOutliersProxies.__begin_;
        for (m = self->hClusterOutliersProxies.__end_; v39 != m; v39 = (LineCostProxy *)((char *)v39 + 24))
        {
          v41 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v39)), v8, *(float32x2_t *)v39, 1));
          v42 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v39 + 1))), v8, *(float32x2_t *)((char *)v39 + 8), 1));
          v43 = vsubq_f32(vdivq_f32(v42, (float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2)), vdivq_f32(v41, (float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2)));
          v44 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v43, v43)));
          *(float32x2_t *)v42.f32 = vrsqrte_f32(v44);
          *(float32x2_t *)v42.f32 = vmul_f32(*(float32x2_t *)v42.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)v42.f32)));
          v45 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v43.f32, vmul_f32(*(float32x2_t *)v42.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)v42.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v45 < 0.0)
            v45 = -v45;
          v46 = *((float *)v39 + 4);
          v47 = *((float *)v39 + 5);
          v10 = v10 + (float)(v47 * (float)(v46 * v45));
          v11 = v11 + (float)(v46 * v47);
        }
        goto LABEL_37;
      case 2:
        v48 = self->vClusterInliersProxies.__begin_;
        for (n = self->vClusterInliersProxies.__end_; v48 != n; v48 = (LineCostProxy *)((char *)v48 + 24))
        {
          v50 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v48)), v8, *(float32x2_t *)v48, 1));
          v51 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v48 + 1))), v8, *(float32x2_t *)((char *)v48 + 8), 1));
          v52 = vsubq_f32(vdivq_f32(v51, (float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2)), vdivq_f32(v50, (float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2)));
          v53 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v52, v52)));
          *(float32x2_t *)v51.f32 = vrsqrte_f32(v53);
          *(float32x2_t *)v51.f32 = vmul_f32(*(float32x2_t *)v51.f32, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(*(float32x2_t *)v51.f32, *(float32x2_t *)v51.f32)));
          v54 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v52.f32, vmul_f32(*(float32x2_t *)v51.f32, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(*(float32x2_t *)v51.f32, *(float32x2_t *)v51.f32))).f32[0]), (float32x2_t)1065353216));
          if (v54 < 0.0)
            v54 = -v54;
          v55 = *((float *)v48 + 4);
          v56 = *((float *)v48 + 5);
          v10 = v10 + (float)((float)(v56 * (float)(v55 * v54)) * 2.0);
          v11 = v11 + (float)(v55 * v56);
        }
        v57 = self->vClusterOutliersProxies.__begin_;
        for (ii = self->vClusterOutliersProxies.__end_; v57 != ii; v57 = (LineCostProxy *)((char *)v57 + 24))
        {
          v59 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v57)), v8, *(float32x2_t *)v57, 1));
          v60 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v57 + 1))), v8, *(float32x2_t *)((char *)v57 + 8), 1));
          v61 = vsubq_f32(vdivq_f32(v60, (float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2)), vdivq_f32(v59, (float32x4_t)vdupq_laneq_s32((int32x4_t)v59, 2)));
          v62 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v61, v61)));
          *(float32x2_t *)v60.f32 = vrsqrte_f32(v62);
          *(float32x2_t *)v60.f32 = vmul_f32(*(float32x2_t *)v60.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v60.f32, *(float32x2_t *)v60.f32)));
          v63 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v61.f32, vmul_f32(*(float32x2_t *)v60.f32, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(*(float32x2_t *)v60.f32, *(float32x2_t *)v60.f32))).f32[0]), (float32x2_t)1065353216));
          if (v63 < 0.0)
            v63 = -v63;
          v64 = *((float *)v57 + 4);
          v65 = *((float *)v57 + 5);
          v10 = v10 + (float)(v65 * (float)(v64 * v63));
          v11 = v11 + (float)(v64 * v65);
        }
        goto LABEL_37;
      case 3:
        v66 = self->hClusterInliersProxies.__begin_;
        for (jj = self->hClusterInliersProxies.__end_; v66 != jj; v66 = (LineCostProxy *)((char *)v66 + 24))
        {
          v68 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v66)), v8, *(float32x2_t *)v66, 1));
          v69 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v66 + 1))), v8, *(float32x2_t *)((char *)v66 + 8), 1));
          v70 = vsubq_f32(vdivq_f32(v69, (float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2)), vdivq_f32(v68, (float32x4_t)vdupq_laneq_s32((int32x4_t)v68, 2)));
          v71 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v70, v70)));
          *(float32x2_t *)v69.f32 = vrsqrte_f32(v71);
          *(float32x2_t *)v69.f32 = vmul_f32(*(float32x2_t *)v69.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v69.f32, *(float32x2_t *)v69.f32)));
          v72 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v70.f32, vmul_f32(*(float32x2_t *)v69.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v69.f32, *(float32x2_t *)v69.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v72 < 0.0)
            v72 = -v72;
          v73 = *((float *)v66 + 4);
          v74 = *((float *)v66 + 5);
          v10 = v10 + (float)((float)(v74 * (float)(v73 * v72)) * 2.0);
          v11 = v11 + (float)(v73 * v74);
        }
        v75 = self->hClusterOutliersProxies.__begin_;
        for (kk = self->hClusterOutliersProxies.__end_; v75 != kk; v75 = (LineCostProxy *)((char *)v75 + 24))
        {
          v77 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(_QWORD *)v75)), v8, *(float32x2_t *)v75, 1));
          v78 = vaddq_f32(v9, vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*((_QWORD *)v75 + 1))), v8, *(float32x2_t *)((char *)v75 + 8), 1));
          v79 = vsubq_f32(vdivq_f32(v78, (float32x4_t)vdupq_laneq_s32((int32x4_t)v78, 2)), vdivq_f32(v77, (float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2)));
          v80 = (float32x2_t)COERCE_UNSIGNED_INT(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v79, v79)));
          *(float32x2_t *)v78.f32 = vrsqrte_f32(v80);
          *(float32x2_t *)v78.f32 = vmul_f32(*(float32x2_t *)v78.f32, vrsqrts_f32((float32x2_t)v80.u32[0], vmul_f32(*(float32x2_t *)v78.f32, *(float32x2_t *)v78.f32)));
          v81 = vaddv_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v79.f32, vmul_f32(*(float32x2_t *)v78.f32, vrsqrts_f32((float32x2_t)v80.u32[0], vmul_f32(*(float32x2_t *)v78.f32, *(float32x2_t *)v78.f32))).f32[0]), (float32x2_t)0x3F80000000000000));
          if (v81 < 0.0)
            v81 = -v81;
          v82 = *((float *)v75 + 4);
          v83 = *((float *)v75 + 5);
          v10 = v10 + (float)(v83 * (float)(v82 * v81));
          v11 = v11 + (float)(v82 * v83);
        }
        goto LABEL_37;
      default:
LABEL_37:
        v84 = fminf(fmaxf((float)((float)(v10 / v11) + -0.01) / 0.09, 0.0), 1.0);
        v3 = 1.0 - (v84 * -2.0 + 3.0) * (float)(v84 * v84);
        break;
    }
  }
  self->super.confidence = v3;
}

- (double)unlimitedPitch
{
  return self->unlimitedPitch;
}

- (double)unlimitedYaw
{
  return self->unlimitedYaw;
}

- (double)unlimitedRoll
{
  return self->unlimitedRoll;
}

- (void).cxx_destruct
{
  vector<LineCostProxy, std::allocator<LineCostProxy>> *p_hClusterOutliersProxies;
  LineCostProxy *begin;
  LineCostProxy *v5;
  LineCostProxy *v6;
  LineCostProxy *v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;

  p_hClusterOutliersProxies = &self->hClusterOutliersProxies;
  begin = self->hClusterOutliersProxies.__begin_;
  if (begin)
  {
    p_hClusterOutliersProxies->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->vClusterOutliersProxies.__begin_;
  if (v5)
  {
    self->vClusterOutliersProxies.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->hClusterInliersProxies.__begin_;
  if (v6)
  {
    self->hClusterInliersProxies.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->vClusterInliersProxies.__begin_;
  if (v7)
  {
    self->vClusterInliersProxies.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->hClusterOutliers.__begin_;
  if (v8)
  {
    self->hClusterOutliers.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->vClusterOutliers.__begin_;
  if (v9)
  {
    self->vClusterOutliers.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->hClusterInliers.__begin_;
  if (v10)
  {
    self->hClusterInliers.__end_ = v10;
    operator delete(v10);
  }
  v11 = self->vClusterInliers.__begin_;
  if (v11)
  {
    self->vClusterInliers.__end_ = v11;
    operator delete(v11);
  }
  v12 = self->hLines.__begin_;
  if (v12)
  {
    self->hLines.__end_ = v12;
    operator delete(v12);
  }
  v13 = self->vLines.__begin_;
  if (v13)
  {
    self->vLines.__end_ = v13;
    operator delete(v13);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_QWORD *)self + 48) = 0;
  *((_QWORD *)self + 49) = 0;
  *((_QWORD *)self + 47) = 0;
  *((_QWORD *)self + 51) = 0;
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 50) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 55) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 57) = 0;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 56) = 0;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 61) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 63) = 0;
  *((_QWORD *)self + 64) = 0;
  *((_QWORD *)self + 62) = 0;
  *((_QWORD *)self + 66) = 0;
  *((_QWORD *)self + 67) = 0;
  *((_QWORD *)self + 65) = 0;
  *((_QWORD *)self + 69) = 0;
  *((_QWORD *)self + 70) = 0;
  *((_QWORD *)self + 68) = 0;
  *((_QWORD *)self + 72) = 0;
  *((_QWORD *)self + 73) = 0;
  *((_QWORD *)self + 71) = 0;
  *((_QWORD *)self + 75) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 74) = 0;
  return self;
}

@end
