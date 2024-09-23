@implementation CIPerspectiveAutoCalcV1

- (CIPerspectiveAutoCalcV1)initWithContext:(id)a3 image:(id)a4 config:(id *)a5
{
  CIPerspectiveAutoCalcV1 *v5;
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
  v26.super_class = (Class)CIPerspectiveAutoCalcV1;
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
  v3.super_class = (Class)CIPerspectiveAutoCalcV1;
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
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  CIImage *img;
  CGColor *v15;
  CIImage *v16;
  CGColor *v17;
  CIImage *v18;
  CGColor *v19;
  CIImage *v20;
  CGColor *v21;
  __int128 v22;
  uint64_t *v23;
  __int128 v24;
  CIImage *debugImage;
  CGColor *v26;
  CIImage *v27;
  CGColor *v28;
  __int128 v29;
  uint64_t *v30;
  __int128 v31;
  uint64_t *v33;
  char *v34;
  char *v35;
  uint8_t buf[16];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = (int)v9;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "compute", "imageSize: %d x %d", buf, 0xEu);
    }
  }
  -[CIPerspectiveAutoCalcV1 standardizeImage](self, "standardizeImage");
  -[CIPerspectiveAutoCalcV1 createGradientMap](self, "createGradientMap");
  -[CIPerspectiveAutoCalcV1 normalizeGradientMap](self, "normalizeGradientMap");
  -[CIPerspectiveAutoCalcV1 thresholdGradientMap](self, "thresholdGradientMap");
  -[CIPerspectiveAutoCalcV1 rangeLimitGradientMap](self, "rangeLimitGradientMap");
  -[CIPerspectiveAutoCalcV1 extractLineSegments](self, "extractLineSegments");
  -[CIPerspectiveAutoCalcV1 clusterLineSegments](self, "clusterLineSegments");
  -[CIPerspectiveAutoCalcV1 computeGuides](self, "computeGuides");
  -[CIPerspectiveAutoCalcV1 computeTransform](self, "computeTransform");
  v10 = ci_signpost_log_perspectiveAC();
  v11 = ci_signpost_log_perspectiveAC();
  v12 = os_signpost_id_make_with_pointer(v11, self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v10, OS_SIGNPOST_INTERVAL_END, v13, "compute", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  if (-[CIPerspectiveAutoCalc generateDebugImage](self, "generateDebugImage"))
  {
    img = self->super.img;
    self->super.debugImage = img;
    v15 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    v16 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(img, v15, (uint64_t **)&self->vLines);
    self->super.debugImage = v16;
    v17 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    v18 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v16, v17, (uint64_t **)&self->hLines);
    self->super.debugImage = v18;
    if (self->vGuidesValid)
    {
      v19 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v20 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v18, v19, (uint64_t **)&self->vLineCluster);
      self->super.debugImage = v20;
      v21 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      v22 = *(_OWORD *)&self->_anon_1f8[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_1e8[4];
      v37 = v22;
      v23 = (uint64_t *)operator new(0x20uLL);
      v33 = v23;
      v35 = (char *)(v23 + 4);
      v24 = v37;
      *(_OWORD *)v23 = *(_OWORD *)buf;
      *((_OWORD *)v23 + 1) = v24;
      v34 = (char *)(v23 + 4);
      self->super.debugImage = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v20, v21, &v33);
      operator delete(v23);
    }
    if (self->hGuidesValid)
    {
      debugImage = self->super.debugImage;
      v26 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v27 = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(debugImage, v26, (uint64_t **)&self->hLineCluster);
      self->super.debugImage = v27;
      v28 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      v29 = *(_OWORD *)&self->_anon_218[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_208[4];
      v37 = v29;
      v30 = (uint64_t *)operator new(0x20uLL);
      v33 = v30;
      v35 = (char *)(v30 + 4);
      v31 = v37;
      *(_OWORD *)v30 = *(_OWORD *)buf;
      *((_OWORD *)v30 + 1) = v31;
      v34 = (char *)(v30 + 4);
      self->super.debugImage = (CIImage *)CI::Perspective::plotLines<CI::Perspective::Line>(v27, v28, &v33);
      operator delete(v30);
    }
  }
  return 1;
}

- (double)confidence
{
  double result;
  float vGuidesAOE;

  result = self->super.confidence;
  if (result < 0.0)
  {
    vGuidesAOE = self->vGuidesAOE;
    if (vGuidesAOE <= self->hGuidesAOE)
      vGuidesAOE = self->hGuidesAOE;
    result = (float)(vGuidesAOE / (float)(self->gradMapH * self->gradMapW));
    self->super.confidence = result;
  }
  return result;
}

- (void)standardizeImage
{
  float64x2_t v3;
  int32x4_t v4;
  double v5;
  double v6;
  unsigned int v7;
  unint64_t v8;
  float v9;
  double v10;
  int32x4_t v11;
  CIImage *img;
  CIImage *v18;
  CIImage *v19;
  NSString *v20;
  float32x2_t v21;
  _QWORD v22[4];
  float64x2_t v23;
  simd_float3x3 v24;
  simd_float3x3 v25;

  -[CIImage extent](self->super.img, "extent");
  if (v5 <= v6)
    v5 = v6;
  *(float *)&v7 = 1024.0 / v5;
  LODWORD(v8) = 0;
  v9 = *(float *)&v7;
  HIDWORD(v8) = v7;
  *(_OWORD *)self->_anon_f0 = v7;
  *(_OWORD *)&self->_anon_f0[16] = v8;
  v10 = *(float *)&v7;
  *(_QWORD *)&v3.f64[1] = v4.i64[0];
  *(float32x2_t *)v4.i8 = vcvt_f32_f64(vmulq_n_f64(v3, (float)-*(float *)&v7));
  v21 = *(float32x2_t *)v4.i8;
  v11 = vuzp2q_s32(v4, vzip1q_s32(v4, v4));
  __asm { FMOV            V1.4S, #1.0 }
  v24.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v11, _Q1), v11);
  *(simd_float3 *)&self->_anon_f0[32] = v24.columns[2];
  v24.columns[0] = (simd_float3)LODWORD(v9);
  v24.columns[1] = (simd_float3)v8;
  v25 = __invert_f3(v24);
  *(_QWORD *)self->_anon_120 = v25.columns[0].i64[0];
  *(_DWORD *)&self->_anon_120[8] = v25.columns[0].i32[2];
  *(_QWORD *)&self->_anon_120[16] = v25.columns[1].i64[0];
  *(_DWORD *)&self->_anon_120[24] = v25.columns[1].i32[2];
  *(_QWORD *)&self->_anon_120[32] = v25.columns[2].i64[0];
  *(_DWORD *)&self->_anon_120[40] = v25.columns[2].i32[2];
  v22[1] = 0;
  v22[2] = 0;
  img = self->super.img;
  *(double *)v22 = v10;
  *(double *)&v22[3] = v10;
  v23 = vcvtq_f64_f32(v21);
  self->super.img = -[CIImage imageByApplyingTransform:highQualityDownsample:](img, "imageByApplyingTransform:highQualityDownsample:", v22, 1);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v18 = self->super.img;
    v19 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("0_standardized"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v18, v19, v20, *MEMORY[0x1E0C9D628]);
  }
}

- (void)createGradientMap
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIImage *v11;
  CGRect *v12;
  CIImage *v13;
  NSString *v14;
  CIImage *v15;
  CIImage *v16;
  CIImage *v17;
  CIImage *v18;
  CIImage *v19;
  CIImage *v20;
  NSString *v21;
  CIImage *v22;
  CIImage *v23;
  CIImage *v24;
  NSString *v25;
  CGRect v26;
  CGRect v27;

  -[CIImage extent](self->super.img, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  self->gradMapW = (unint64_t)v7;
  self->gradMapH = (unint64_t)v9;
  v11 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingGaussianBlurWithSigma:](-[CIImage imageByClampingToExtent](self->super.img, "imageByClampingToExtent"), "imageByApplyingGaussianBlurWithSigma:", 1.2), "imageByCroppingToRect:", v3, v5, v7, v9);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  v12 = (CGRect *)MEMORY[0x1E0C9D628];
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v13 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("1_Preprocessed"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v11, v13, v14, *v12);
  }
  v15 = -[CIImage imageByApplyingFilter:](v11, "imageByApplyingFilter:", CFSTR("CIGaborGradients"));
  self->gradMap = v15;
  -[CIImage extent](v15, "extent");
  v27 = CGRectInset(v26, 5.0, 5.0);
  v16 = -[CIImage imageByCroppingToRect:](v15, "imageByCroppingToRect:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  self->gradMap = v16;
  v17 = -[CIImage imageByCompositingOverImage:](v16, "imageByCompositingOverImage:", +[CIImage blackImage](CIImage, "blackImage"));
  self->gradMap = v17;
  self->gradMap = -[CIImage imageByCroppingToRect:](v17, "imageByCroppingToRect:", v4, v6, v8, v10);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v19 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v18);
    v20 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("2_GradMap_dir"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v19, v20, v21, *v12);
    v23 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v22);
    v24 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("2_GradMap_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v23, v24, v25, *v12);
  }
}

- (void)normalizeGradientMap
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIImage *v11;
  CIImage *v12;
  CIColorKernel *v13;
  CIImage *v14;
  CIImage *v15;
  CIImage *v16;
  CGRect *v17;
  NSString *v18;
  CIImage *v19;
  CIImage *v20;
  CIImage *v21;
  NSString *v22;
  float v23;
  _QWORD v24[2];
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->gradMap, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v11);
  v25 = CFSTR("inputExtent");
  -[CIImage extent](v12, "extent");
  v26[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v23 = 0.0;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](self->super.ctx, "render:toBitmap:rowBytes:bounds:format:colorSpace:", -[CIImage imageByApplyingFilter:withInputParameters:](v12, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1)), &v23, 4, 2309, -[CIContext workingColorSpace](self->super.ctx, "workingColorSpace"), 0.0, 0.0, 1.0, 1.0);
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "maxGradientMagnitude: %f\n", v23);
  v13 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gradientNormalizeV1);
  v24[0] = self->gradMap;
  v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / v23);
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2), v4, v6, v8, v10);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v15 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v14);
    v16 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("3_GradMapNormalized_dir"));
    v17 = (CGRect *)MEMORY[0x1E0C9D628];
    CI::Perspective::CIImageToFile((CI::Perspective *)v15, v16, v18, *MEMORY[0x1E0C9D628]);
    v20 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v19);
    v21 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("3_GradMapNormalized_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v20, v21, v22, *v17);
  }
}

- (void)thresholdGradientMap
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIColorKernel *v11;
  CIImage *v12;
  CIImage *v13;
  CIImage *v14;
  CGRect *v15;
  NSString *v16;
  CIImage *v17;
  CIImage *v18;
  CIImage *v19;
  NSString *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->gradMap, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gradientThresholdV1);
  v21[0] = self->gradMap;
  v21[1] = &unk_1E2F1DA68;
  v21[2] = &unk_1E2F1DA78;
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3), v4, v6, v8, v10);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v13 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v12);
    v14 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("4_GradMapThresholded_dir"));
    v15 = (CGRect *)MEMORY[0x1E0C9D628];
    CI::Perspective::CIImageToFile((CI::Perspective *)v13, v14, v16, *MEMORY[0x1E0C9D628]);
    v18 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v17);
    v19 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("4_GradMapThresholded_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v18, v19, v20, *v15);
  }
}

- (void)rangeLimitGradientMap
{
  CIColorKernel *v3;
  double lineSearchRangeH;
  double v5;
  double v6;
  double lineSearchRangeV;
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
  CIImage *v18;
  CIImage *v19;
  CIImage *v20;
  CGRect *v21;
  NSString *v22;
  CIImage *v23;
  CIImage *v24;
  CIImage *v25;
  NSString *v26;
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gradientRangeLimit);
  lineSearchRangeH = self->super.config.lineSearchRangeH;
  v5 = tan(lineSearchRangeH + -0.0523598776);
  v6 = tan(lineSearchRangeH + 0.0523598776);
  lineSearchRangeV = self->super.config.lineSearchRangeV;
  v8 = tan(lineSearchRangeV + -0.0523598776);
  v9 = tan(lineSearchRangeV + 0.0523598776);
  -[CIImage extent](self->gradMap, "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v27[0] = self->gradMap;
  v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v27[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v27[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  self->gradMap = -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5), v11, v13, v15, v17);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v19 = CI::Perspective::gradDirImage((CI::Perspective *)self->gradMap, v18);
    v20 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("5_GradMapRangeLimited_dir"));
    v21 = (CGRect *)MEMORY[0x1E0C9D628];
    CI::Perspective::CIImageToFile((CI::Perspective *)v19, v20, v22, *MEMORY[0x1E0C9D628]);
    v24 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v23);
    v25 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("5_GradMapRangeLimited_mag"));
    CI::Perspective::CIImageToFile((CI::Perspective *)v24, v25, v26, *v21);
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
  uint64_t v24;
  __int128 v25;
  int32x2_t *v26;
  int32x2_t *v27;
  int32x2_t v28;
  float32x2_t v29;
  int32x2_t v30;
  float32x2_t v31;
  int32x2_t v32;
  int *v33;
  void **v34;
  float32x2_t *v35;
  unint64_t v36;
  float32x2_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  float32x2_t *v43;
  char *v44;
  char *v45;
  float32x2_t *v46;
  CIImage *img;
  CGColor *v48;
  void *v49;
  CGColor *v50;
  CI::Perspective *v51;
  CIImage *v52;
  NSString *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  os_signpost_id_t v57;
  NSObject *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  os_signpost_id_t v61;
  int32x2_t v62;
  uint8_t buf[4];
  unint64_t v64;
  __int16 v65;
  unint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
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
      v64 = gradMapW;
      v65 = 2048;
      v66 = gradMapH;
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
  v14 = malloc_type_malloc(self->gradMapH * v13, 0x45F7E25AuLL);
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
  v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v23 + 16))(v23);
  v26 = *(int32x2_t **)v24;
  v27 = *(int32x2_t **)(v24 + 8);
  if (*(int32x2_t **)v24 != v27)
  {
    do
    {
      *(float *)&v25 = (float)self->gradMapH;
      v30 = v26[1];
      v28 = (int32x2_t)vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v25, 0), (float32x2_t)vzip2_s32(*v26, v30));
      v29 = (float32x2_t)vzip1_s32(*v26, v28);
      v30.i32[1] = v28.i32[1];
      v31 = vsub_f32(v29, (float32x2_t)v30);
      v32 = (int32x2_t)vbsl_s8((int8x8_t)vcgez_f32(v31), (int8x8_t)v31, (int8x8_t)vneg_f32(v31));
      *(int32x2_t *)&v25 = vcgt_f32((float32x2_t)v32, (float32x2_t)vdup_lane_s32(v32, 1));
      if ((v25 & 1) != 0)
        v33 = &OBJC_IVAR___CIPerspectiveAutoCalcV1_hLines;
      else
        v33 = &OBJC_IVAR___CIPerspectiveAutoCalcV1_vLines;
      v34 = (void **)((char *)&self->super.super.isa + *v33);
      v35 = (float32x2_t *)v34[1];
      v36 = (unint64_t)v34[2];
      if ((unint64_t)v35 >= v36)
      {
        v62 = v30;
        v38 = ((char *)v35 - (_BYTE *)*v34) >> 4;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 60)
          abort();
        v40 = v36 - (_QWORD)*v34;
        if (v40 >> 3 > v39)
          v39 = v40 >> 3;
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0)
          v41 = 0xFFFFFFFFFFFFFFFLL;
        else
          v41 = v39;
        if (v41)
          v42 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)(v34 + 2), v41);
        else
          v42 = 0;
        v43 = (float32x2_t *)&v42[16 * v38];
        DWORD1(v25) = v62.i32[1];
        *v43 = v29;
        v43[1] = (float32x2_t)v62;
        v45 = (char *)*v34;
        v44 = (char *)v34[1];
        v46 = v43;
        if (v44 != *v34)
        {
          do
          {
            v25 = *((_OWORD *)v44 - 1);
            *(_OWORD *)v46[-2].f32 = v25;
            v46 -= 2;
            v44 -= 16;
          }
          while (v44 != v45);
          v44 = (char *)*v34;
        }
        v37 = v43 + 2;
        *v34 = v46;
        v34[1] = &v43[2];
        v34[2] = &v42[16 * v41];
        if (v44)
          operator delete(v44);
      }
      else
      {
        *v35 = v29;
        v35[1] = (float32x2_t)v30;
        v37 = v35 + 2;
      }
      v34[1] = v37;
      v26 += 2;
    }
    while (v26 != v27);
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    img = self->super.img;
    v48 = CGColorCreateSRGB(1.0, 0.0, 1.0, 1.0);
    v49 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(img, v48, (uint64_t **)&self->hLines);
    v50 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
    v51 = (CI::Perspective *)CI::Perspective::plotLines<CI::Perspective::Line>(v49, v50, (uint64_t **)&self->vLines);
    v52 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/PerspectiveV1_%@.png"), CFSTR("6_LineSegments"));
    CI::Perspective::CIImageToFile(v51, v52, v53, *MEMORY[0x1E0C9D628]);
  }
  v54 = ci_signpost_log_perspectiveAC();
  v55 = ci_signpost_log_perspectiveAC();
  v56 = os_signpost_id_make_with_pointer(v55, self);
  if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v57 = v56;
    if (os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v54, OS_SIGNPOST_INTERVAL_END, v57, "EDLines", (const char *)&unk_192520C83, buf, 2u);
    }
  }
  v58 = ci_signpost_log_perspectiveAC();
  v59 = ci_signpost_log_perspectiveAC();
  v60 = os_signpost_id_make_with_pointer(v59, self);
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v61 = v60;
    if (os_signpost_enabled(v58))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v58, OS_SIGNPOST_INTERVAL_END, v61, "ExtractLineSegments", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)clusterLineSegments
{
  float32x2_t *v6;
  float32x2_t *v7;
  float32x2_t v8;
  float32x2_t v9;
  int32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  int32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float v19;
  float v20;
  float v21;
  unint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  unint64_t v25;
  _OWORD *v26;
  _OWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  float32x2_t *v46;
  float32x2_t v47;
  int32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float32x2_t v52;
  int32x2_t v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x2_t v56;
  int32x2_t v57;
  int32x2_t v58;
  float v59;
  int32x2_t v60;
  int32x2_t v61;
  float v62;
  float32x2_t v63;
  int32x2_t v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float v68;
  float v69;
  unint64_t v70;
  _OWORD *v71;
  _OWORD *v72;
  unint64_t v73;
  _OWORD *v74;
  _OWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;

  v6 = *a1;
  if (a2[2].i8[0])
  {
    v7 = a1[1];
    if (v6 != v7)
    {
      v8 = a2[3];
      do
      {
        v9 = vsub_f32(v6[1], *v6);
        v10 = (int32x2_t)vmul_f32(v9, v9);
        v10.i32[0] = vadd_f32((float32x2_t)v10, (float32x2_t)vdup_lane_s32(v10, 1)).u32[0];
        v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
        v12 = vmul_f32(v11, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)));
        v13 = vmul_n_f32(v9, vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
        v14 = vsub_f32(v8, *v6);
        v15 = (int32x2_t)vmul_f32(v14, v14);
        v15.i32[0] = vadd_f32((float32x2_t)v15, (float32x2_t)vdup_lane_s32(v15, 1)).u32[0];
        v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
        v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
        v18 = vmul_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
        v18.f32[0] = vmuls_lane_f32(-v18.f32[0], v13, 1);
        v19 = -(float)(v18.f32[0] + (float)(v13.f32[0] * v18.f32[1]));
        v20 = vmlas_n_f32(v18.f32[0], v18.f32[1], v13.f32[0]);
        if (v20 >= 0.0)
          v21 = v20;
        else
          v21 = v19;
        if (v21 >= 0.01)
        {
          v26 = a4[1];
          v25 = (unint64_t)a4[2];
          if ((unint64_t)v26 >= v25)
          {
            v33 = ((char *)v26 - (_BYTE *)*a4) >> 4;
            v34 = v33 + 1;
            if ((unint64_t)(v33 + 1) >> 60)
              goto LABEL_88;
            v35 = v25 - (_QWORD)*a4;
            if (v35 >> 3 > v34)
              v34 = v35 >> 3;
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
              v36 = 0xFFFFFFFFFFFFFFFLL;
            else
              v36 = v34;
            if (v36)
              v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)(a4 + 2), v36);
            else
              v37 = 0;
            v42 = &v37[16 * v33];
            *(_OWORD *)v42 = *(_OWORD *)v6->f32;
            v44 = (char *)*a4;
            v43 = (char *)a4[1];
            v45 = v42;
            if (v43 != *a4)
            {
              do
              {
                *((_OWORD *)v45 - 1) = *((_OWORD *)v43 - 1);
                v45 -= 16;
                v43 -= 16;
              }
              while (v43 != v44);
              v43 = (char *)*a4;
            }
            v27 = v42 + 16;
            *a4 = v45;
            a4[1] = v42 + 16;
            a4[2] = &v37[16 * v36];
            if (v43)
              operator delete(v43);
          }
          else
          {
            *v26 = *(_OWORD *)v6->f32;
            v27 = v26 + 1;
          }
          a4[1] = v27;
        }
        else
        {
          v23 = a3[1];
          v22 = (unint64_t)a3[2];
          if ((unint64_t)v23 >= v22)
          {
            v28 = ((char *)v23 - (_BYTE *)*a3) >> 4;
            v29 = v28 + 1;
            if ((unint64_t)(v28 + 1) >> 60)
              goto LABEL_88;
            v30 = v22 - (_QWORD)*a3;
            if (v30 >> 3 > v29)
              v29 = v30 >> 3;
            if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
              v31 = 0xFFFFFFFFFFFFFFFLL;
            else
              v31 = v29;
            if (v31)
              v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)(a3 + 2), v31);
            else
              v32 = 0;
            v38 = &v32[16 * v28];
            *(_OWORD *)v38 = *(_OWORD *)v6->f32;
            v40 = (char *)*a3;
            v39 = (char *)a3[1];
            v41 = v38;
            if (v39 != *a3)
            {
              do
              {
                *((_OWORD *)v41 - 1) = *((_OWORD *)v39 - 1);
                v41 -= 16;
                v39 -= 16;
              }
              while (v39 != v40);
              v39 = (char *)*a3;
            }
            v24 = v38 + 16;
            *a3 = v41;
            a3[1] = v38 + 16;
            a3[2] = &v32[16 * v31];
            if (v39)
              operator delete(v39);
          }
          else
          {
            *v23 = *(_OWORD *)v6->f32;
            v24 = v23 + 1;
          }
          a3[1] = v24;
        }
        v6 += 2;
      }
      while (v6 != v7);
    }
  }
  else
  {
    v46 = a1[1];
    if (v6 != v46)
    {
      v47 = vsub_f32(v6[2 * *(_QWORD *)a2 + 1], v6[2 * *(_QWORD *)a2]);
      v48 = (int32x2_t)vmul_f32(v47, v47);
      v48.i32[0] = vadd_f32((float32x2_t)v48, (float32x2_t)vdup_lane_s32(v48, 1)).u32[0];
      v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
      v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
      v51 = vmul_n_f32(v47, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
      v52 = vsub_f32(v6[2 * *(_QWORD *)&a2[1] + 1], v6[2 * *(_QWORD *)&a2[1]]);
      v53 = (int32x2_t)vmul_f32(v52, v52);
      v53.i32[0] = vadd_f32((float32x2_t)v53, (float32x2_t)vdup_lane_s32(v53, 1)).u32[0];
      v54 = vrsqrte_f32((float32x2_t)v53.u32[0]);
      v55 = vmul_f32(v54, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(v54, v54)));
      v56 = vmul_n_f32(v52, vmul_f32(v55, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(v55, v55))).f32[0]);
      v57 = (int32x2_t)vmul_f32(v51, (float32x2_t)1065353216);
      v58 = (int32x2_t)vmul_f32(v56, (float32x2_t)1065353216);
      v59 = 0.5
          * vadd_f32(vadd_f32((float32x2_t)v57, (float32x2_t)vdup_lane_s32(v57, 1)), vadd_f32((float32x2_t)v58, (float32x2_t)vdup_lane_s32(v58, 1))).f32[0];
      v60 = (int32x2_t)vmul_f32(v51, (float32x2_t)0x3F80000000000000);
      v61 = (int32x2_t)vmul_f32(v56, (float32x2_t)0x3F80000000000000);
      v62 = 0.5
          * vadd_f32(vadd_f32((float32x2_t)v60, (float32x2_t)vdup_lane_s32(v60, 1)), vadd_f32((float32x2_t)v61, (float32x2_t)vdup_lane_s32(v61, 1))).f32[0];
      do
      {
        v63 = vsub_f32(v6[1], *v6);
        v64 = (int32x2_t)vmul_f32(v63, v63);
        v64.i32[0] = vadd_f32((float32x2_t)v64, (float32x2_t)vdup_lane_s32(v64, 1)).u32[0];
        v65 = vrsqrte_f32((float32x2_t)v64.u32[0]);
        v66 = vmul_f32(v65, vrsqrts_f32((float32x2_t)v64.u32[0], vmul_f32(v65, v65)));
        v67 = vmul_n_f32(v63, vmul_f32(v66, vrsqrts_f32((float32x2_t)v64.u32[0], vmul_f32(v66, v66))).f32[0]);
        v68 = vaddv_f32(vmul_f32(v67, (float32x2_t)1065353216)) - v59;
        if (v68 < 0.0)
          v68 = -v68;
        if (v68 >= 0.01)
          goto LABEL_54;
        v69 = vaddv_f32(vmul_f32(v67, (float32x2_t)0x3F80000000000000)) - v62;
        if (v69 < 0.0)
          v69 = -v69;
        if (v69 >= 0.01)
        {
LABEL_54:
          v74 = a4[1];
          v73 = (unint64_t)a4[2];
          if ((unint64_t)v74 >= v73)
          {
            v76 = ((char *)v74 - (_BYTE *)*a4) >> 4;
            v77 = v76 + 1;
            if ((unint64_t)(v76 + 1) >> 60)
              goto LABEL_88;
            v78 = v73 - (_QWORD)*a4;
            if (v78 >> 3 > v77)
              v77 = v78 >> 3;
            if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF0)
              v79 = 0xFFFFFFFFFFFFFFFLL;
            else
              v79 = v77;
            if (v79)
              v80 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)(a4 + 2), v79);
            else
              v80 = 0;
            v81 = &v80[16 * v76];
            *(_OWORD *)v81 = *(_OWORD *)v6->f32;
            v83 = (char *)*a4;
            v82 = (char *)a4[1];
            v84 = v81;
            if (v82 != *a4)
            {
              do
              {
                *((_OWORD *)v84 - 1) = *((_OWORD *)v82 - 1);
                v84 -= 16;
                v82 -= 16;
              }
              while (v82 != v83);
              v82 = (char *)*a4;
            }
            v75 = v81 + 16;
            *a4 = v84;
            a4[1] = v81 + 16;
            a4[2] = &v80[16 * v79];
            if (v82)
              operator delete(v82);
          }
          else
          {
            *v74 = *(_OWORD *)v6->f32;
            v75 = v74 + 1;
          }
          a4[1] = v75;
        }
        else
        {
          v71 = a3[1];
          v70 = (unint64_t)a3[2];
          if ((unint64_t)v71 >= v70)
          {
            v85 = ((char *)v71 - (_BYTE *)*a3) >> 4;
            v86 = v85 + 1;
            if ((unint64_t)(v85 + 1) >> 60)
LABEL_88:
              abort();
            v87 = v70 - (_QWORD)*a3;
            if (v87 >> 3 > v86)
              v86 = v87 >> 3;
            if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF0)
              v88 = 0xFFFFFFFFFFFFFFFLL;
            else
              v88 = v86;
            if (v88)
              v89 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::Perspective::Line>>((uint64_t)(a3 + 2), v88);
            else
              v89 = 0;
            v90 = &v89[16 * v85];
            *(_OWORD *)v90 = *(_OWORD *)v6->f32;
            v92 = (char *)*a3;
            v91 = (char *)a3[1];
            v93 = v90;
            if (v91 != *a3)
            {
              do
              {
                *((_OWORD *)v93 - 1) = *((_OWORD *)v91 - 1);
                v93 -= 16;
                v91 -= 16;
              }
              while (v91 != v92);
              v91 = (char *)*a3;
            }
            v72 = v90 + 16;
            *a3 = v93;
            a3[1] = v90 + 16;
            a3[2] = &v89[16 * v88];
            if (v91)
              operator delete(v91);
          }
          else
          {
            *v71 = *(_OWORD *)v6->f32;
            v72 = v71 + 1;
          }
          a3[1] = v72;
        }
        v6 += 2;
      }
      while (v6 != v46);
    }
  }
}

- (void)computeGuides
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  CIImage *v6;
  os_signpost_id_t v7;
  int64_t v8;
  int64_t v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t **p_hLineCluster;
  unint64_t gradMapH;
  double v15;
  float v16;
  float v17;
  float32x2_t v18;
  float32x2_t v19;
  float v20;
  uint64_t *v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  float v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26;
  float v27;
  uint64x2_t v28;
  __n128 v29;
  float v30;
  double v31;
  float32x2_t v32;
  int32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  __int128 v37;
  double v38;
  int32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x2_t v43;
  float32x2_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t v51;
  BOOL v52;
  double v53;
  float32x2_t v54;
  int32x2_t v55;
  float32x2_t v56;
  float32x2_t v57;
  float32x2_t v58;
  __int128 v59;
  double v60;
  int32x2_t v61;
  float32x2_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float32x2_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v72;
  float32x2_t v73;
  Class isa;
  void *v75;
  CGColor *v76;
  void *v77;
  CGColor *v78;
  __int128 v79;
  uint64_t *v80;
  __int128 v81;
  CGColor *v82;
  void *v83;
  CGColor *v84;
  __int128 v85;
  uint64_t *v86;
  __int128 v87;
  CIImage *v88;
  NSString *v89;
  NSObject *v90;
  NSObject *v91;
  os_signpost_id_t v92;
  os_signpost_id_t v93;
  __int128 v94;
  float v95;
  float v96;
  __n128 v97;
  uint64_t *v98;
  char *v99;
  char *v100;
  _BYTE buf[32];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v3 = ci_signpost_log_perspectiveAC();
  v4 = ci_signpost_log_perspectiveAC();
  v5 = os_signpost_id_make_with_pointer(v4, self);
  if (v5 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v7 = v5;
    if (os_signpost_enabled(v3))
    {
      v8 = (self->vLineCluster.__end_ - self->vLineCluster.__begin_) >> 4;
      v9 = (self->hLineCluster.__end_ - self->hLineCluster.__begin_) >> 4;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v9;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v7, "computeGuides", "vLineClusterSize: %lu hLineClusterSize: %lu", buf, 0x16u);
    }
  }
  self->vGuidesValid = 1;
  self->hGuidesValid = 1;
  self->yawCorrectionAreaCoverage = 0.0;
  LODWORD(self->minimumPitchCorrectionAreaCoverage) = 0;
  begin = self->vLineCluster.__begin_;
  end = self->vLineCluster.__end_;
  if ((unint64_t)(end - begin) <= 0x1F)
  {
    self->super.pitchFailureReason = 2;
    self->vGuidesValid = 0;
  }
  p_hLineCluster = (uint64_t **)&self->hLineCluster;
  if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(self->hLineCluster.__end_ - self->hLineCluster.__begin_) <= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)0x1F)
  {
    self->super.yawFailureReason = 2;
    self->hGuidesValid = 0;
  }
  gradMapH = self->gradMapH;
  if (self->vGuidesValid && begin != end)
  {
    v15 = (float)((float)self->gradMapW * -0.5);
    v16 = -INFINITY;
    v17 = INFINITY;
    do
    {
      v18 = *(float32x2_t *)((char *)begin + 8);
      v19 = vsub_f32(v18, *(float32x2_t *)begin);
      v18.f32[0] = v15 + vadd_f32(v18, *(float32x2_t *)begin).f32[0] * 0.5;
      v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19))) * v18.f32[0];
      if (v20 < v17)
      {
        *(_OWORD *)&self->_anon_1e8[4] = *(_OWORD *)begin;
        v17 = v20;
      }
      if (v20 > v16)
      {
        *(_OWORD *)&self->_anon_1f8[4] = *(_OWORD *)begin;
        v16 = v20;
      }
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
    }
    while (begin != end);
  }
  if (self->hGuidesValid)
  {
    v21 = *p_hLineCluster;
    v22 = self->hLineCluster.__end_;
    if (*p_hLineCluster != (uint64_t *)v22)
    {
      v23 = -INFINITY;
      v24 = INFINITY;
      do
      {
        v25 = (float32x2_t)v21[1];
        v26 = vsub_f32(v25, *(float32x2_t *)v21);
        v25.f32[0] = COERCE_FLOAT(vadd_f32(v25, *(float32x2_t *)v21).i32[1]) * 0.5 - (float)((float)gradMapH * 0.5);
        v27 = sqrtf(vaddv_f32(vmul_f32(v26, v26))) * v25.f32[0];
        if (v27 < v24)
        {
          *(_OWORD *)&self->_anon_208[4] = *(_OWORD *)v21;
          v24 = v27;
        }
        if (v27 > v23)
        {
          *(_OWORD *)&self->_anon_218[4] = *(_OWORD *)v21;
          v23 = v27;
        }
        v21 += 2;
      }
      while (v21 != (uint64_t *)v22);
    }
  }
  v28 = *(uint64x2_t *)&self->gradMapW;
  v29 = (__n128)vcvt_hight_f32_f64(0, vcvtq_f64_u64(v28));
  v30 = (float)(unint64_t)(v28.i64[1] * v28.i64[0]);
  v97 = v29;
  if (self->vGuidesValid)
  {
    v31 = *(double *)&self->_anon_1e8[4];
    v32 = vsub_f32(*(float32x2_t *)&self->_anon_1e8[12], *(float32x2_t *)&v31);
    v33 = (int32x2_t)vmul_f32(v32, v32);
    v33.i32[0] = vadd_f32((float32x2_t)v33, (float32x2_t)vdup_lane_s32(v33, 1)).u32[0];
    v34 = vrsqrte_f32((float32x2_t)v33.u32[0]);
    v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v34, v34)));
    v36 = vmul_n_f32(v32, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v35, v35))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v31, *(double *)&v36, v29);
    LODWORD(v37) = *(_DWORD *)buf;
    v94 = v37;
    v95 = *(float *)&v98;
    v38 = *(double *)&self->_anon_1f8[4];
    *(float32x2_t *)&v37 = vsub_f32(*(float32x2_t *)&self->_anon_1f8[12], *(float32x2_t *)&v38);
    v39 = (int32x2_t)vmul_f32(*(float32x2_t *)&v37, *(float32x2_t *)&v37);
    v39.i32[0] = vadd_f32((float32x2_t)v39, (float32x2_t)vdup_lane_s32(v39, 1)).u32[0];
    v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
    v41 = vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40)));
    v42 = vmul_n_f32(*(float32x2_t *)&v37, vmul_f32(v41, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v41, v41))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v38, *(double *)&v42, v97);
    v43 = vmla_n_f32(*(float32x2_t *)&v31, v36, *(float *)&v94);
    v44 = vmla_n_f32(*(float32x2_t *)&v31, v36, v95);
    v45 = vmla_n_f32(*(float32x2_t *)&v38, v42, *(float *)buf);
    v46 = vmla_n_f32(*(float32x2_t *)&v38, v42, *(float *)&v98);
    v47 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v43, v44), (int8x8_t)v43, (int8x8_t)v44);
    v48 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v45, v46), (int8x8_t)v45, (int8x8_t)v46);
    v49 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v44, v43), (int8x8_t)v43, (int8x8_t)v44);
    v50 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v46, v45), (int8x8_t)v45, (int8x8_t)v46);
    v51 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v47, v48), (int8x8_t)v47, (int8x8_t)v48), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v50, v49), (int8x8_t)v49, (int8x8_t)v50));
    v51.f32[0] = vmul_lane_f32(v51, v51, 1).f32[0];
    LODWORD(self->vGuidesAOE) = v51.i32[0];
    v51.f32[0] = v51.f32[0] / v30;
    v52 = self->minimumYawCorrectionAreaCoverage < v51.f32[0];
    self->vGuidesValid = v52;
    LODWORD(self->yawCorrectionAreaCoverage) = v51.i32[0];
    v29 = v97;
    if (!v52)
      self->super.pitchFailureReason = 3;
  }
  if (self->hGuidesValid)
  {
    v53 = *(double *)&self->_anon_208[4];
    v54 = vsub_f32(*(float32x2_t *)&self->_anon_208[12], *(float32x2_t *)&v53);
    v55 = (int32x2_t)vmul_f32(v54, v54);
    v55.i32[0] = vadd_f32((float32x2_t)v55, (float32x2_t)vdup_lane_s32(v55, 1)).u32[0];
    v56 = vrsqrte_f32((float32x2_t)v55.u32[0]);
    v57 = vmul_f32(v56, vrsqrts_f32((float32x2_t)v55.u32[0], vmul_f32(v56, v56)));
    v58 = vmul_n_f32(v54, vmul_f32(v57, vrsqrts_f32((float32x2_t)v55.u32[0], vmul_f32(v57, v57))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v53, *(double *)&v58, v29);
    LODWORD(v59) = *(_DWORD *)buf;
    v94 = v59;
    v96 = *(float *)&v98;
    v60 = *(double *)&self->_anon_218[4];
    *(float32x2_t *)&v59 = vsub_f32(*(float32x2_t *)&self->_anon_218[12], *(float32x2_t *)&v60);
    v61 = (int32x2_t)vmul_f32(*(float32x2_t *)&v59, *(float32x2_t *)&v59);
    v61.i32[0] = vadd_f32((float32x2_t)v61, (float32x2_t)vdup_lane_s32(v61, 1)).u32[0];
    v62 = vrsqrte_f32((float32x2_t)v61.u32[0]);
    v63 = vmul_f32(v62, vrsqrts_f32((float32x2_t)v61.u32[0], vmul_f32(v62, v62)));
    v64 = vmul_n_f32(*(float32x2_t *)&v59, vmul_f32(v63, vrsqrts_f32((float32x2_t)v61.u32[0], vmul_f32(v63, v63))).f32[0]);
    *(_DWORD *)buf = 0;
    LODWORD(v98) = 0;
    CI::Perspective::intersect((float *)buf, &v98, v60, *(double *)&v64, v97);
    v65 = vmla_n_f32(*(float32x2_t *)&v53, v58, *(float *)&v94);
    v66 = vmla_n_f32(*(float32x2_t *)&v53, v58, v96);
    v67 = vmla_n_f32(*(float32x2_t *)&v60, v64, *(float *)buf);
    v68 = vmla_n_f32(*(float32x2_t *)&v60, v64, *(float *)&v98);
    v69 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v65, v66), (int8x8_t)v65, (int8x8_t)v66);
    v70 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v67, v68), (int8x8_t)v67, (int8x8_t)v68);
    v71 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v66, v65), (int8x8_t)v65, (int8x8_t)v66);
    v72 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v68, v67), (int8x8_t)v67, (int8x8_t)v68);
    v73 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v69, v70), (int8x8_t)v69, (int8x8_t)v70), (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v72, v71), (int8x8_t)v71, (int8x8_t)v72));
    v73.f32[0] = vmul_lane_f32(v73, v73, 1).f32[0];
    LODWORD(self->hGuidesAOE) = v73.i32[0];
    v73.f32[0] = v73.f32[0] / v30;
    isa = self[1].super.super.isa;
    self->hGuidesValid = *(double *)&isa < v73.f32[0];
    LODWORD(self->minimumPitchCorrectionAreaCoverage) = v73.i32[0];
    if (*(double *)&isa >= v73.f32[0])
      self->super.yawFailureReason = 3;
  }
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken != -1)
    dispatch_once(&CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::onceToken, &__block_literal_global_53);
  if (CI::Perspective::CI_AUTOPERSPECTIVE_DEBUG(void)::dump)
  {
    v75 = CI::Perspective::gradMagImage((CI::Perspective *)self->gradMap, v6);
    if (self->vGuidesValid)
    {
      v76 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v77 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v75, v76, (uint64_t **)&self->vLineCluster);
      v78 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      v79 = *(_OWORD *)&self->_anon_1f8[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_1e8[4];
      *(_OWORD *)&buf[16] = v79;
      v80 = (uint64_t *)operator new(0x20uLL);
      v98 = v80;
      v100 = (char *)(v80 + 4);
      v81 = *(_OWORD *)&buf[16];
      *(_OWORD *)v80 = *(_OWORD *)buf;
      *((_OWORD *)v80 + 1) = v81;
      v99 = (char *)(v80 + 4);
      v75 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v77, v78, &v98);
      operator delete(v80);
    }
    if (self->hGuidesValid)
    {
      v82 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
      v83 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v75, v82, p_hLineCluster);
      v84 = CGColorCreateSRGB(0.0, 1.0, 1.0, 1.0);
      v85 = *(_OWORD *)&self->_anon_218[4];
      *(_OWORD *)buf = *(_OWORD *)&self->_anon_208[4];
      *(_OWORD *)&buf[16] = v85;
      v86 = (uint64_t *)operator new(0x20uLL);
      v98 = v86;
      v100 = (char *)(v86 + 4);
      v87 = *(_OWORD *)&buf[16];
      *(_OWORD *)v86 = *(_OWORD *)buf;
      *((_OWORD *)v86 + 1) = v87;
      v99 = (char *)(v86 + 4);
      v75 = (void *)CI::Perspective::plotLines<CI::Perspective::Line>(v83, v84, &v98);
      operator delete(v86);
    }
    v88 = (CIImage *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/tmp/guides.png"), v94);
    CI::Perspective::CIImageToFile((CI::Perspective *)v75, v88, v89, *MEMORY[0x1E0C9D628]);
  }
  v90 = ci_signpost_log_perspectiveAC();
  v91 = ci_signpost_log_perspectiveAC();
  v92 = os_signpost_id_make_with_pointer(v91, self);
  if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v93 = v92;
    if (os_signpost_enabled(v90))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v90, OS_SIGNPOST_INTERVAL_END, v93, "computeGuides", (const char *)&unk_192520C83, buf, 2u);
    }
  }
}

- (void)computeTransform
{
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  float32x4_t v11;
  double v12;
  uint64_t v13;
  float32x4_t v14;
  double v15;
  uint64_t v16;
  float32x4_t v17;
  double v18;
  int32x4_t v19;
  uint64_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  float32x4_t v28;
  double v29;
  uint64_t v30;
  float32x4_t v31;
  double v32;
  uint64_t v33;
  float32x4_t v34;
  double v35;
  int32x4_t v36;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  float v38;
  float v39;
  float32x2_t v40;
  float32x2_t v41;
  float32x2_t v42;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v43;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float vGuidesAOE;
  float hGuidesAOE;
  double rZ;
  double pitch;
  double v52;
  double v53;
  float v54;
  float v55;
  float v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  float32x4_t v65;
  double v66;
  uint64_t v67;
  float32x4_t v68;
  double v69;
  uint64_t v70;
  float32x4_t v71;
  double v72;
  int32x4_t v73;
  float v74;
  float v75;
  float v76;
  uint64_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  float32x4_t v85;
  double v86;
  uint64_t v87;
  float32x4_t v88;
  double v89;
  uint64_t v90;
  float32x4_t v91;
  double v92;
  int32x4_t v93;
  float v94;
  float v95;
  float v96;
  double v97;
  BOOL v98;
  double v99;
  int *v100;
  uint64_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  float32x4_t v109;
  double v110;
  uint64_t v111;
  float32x4_t v112;
  double v113;
  uint64_t v114;
  float32x4_t v115;
  double v116;
  int32x4_t v117;
  float v118;
  float v119;
  float v120;
  double v121;
  BOOL v122;
  double v123;
  uint64_t v124;
  float32x4_t v125;
  double v126;
  uint64_t v127;
  float32x4_t v128;
  double v129;
  uint64_t v130;
  float32x4_t v131;
  double v132;
  int32x4_t v133;
  float v134;
  float v135;
  double v136;
  BOOL v137;
  double v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;

  if (self->vGuidesValid)
  {
    v3 = 0;
    v4 = *(float32x4_t *)self->_anon_c0;
    v5 = *(float32x4_t *)&self->_anon_c0[16];
    v6 = *(float32x4_t *)&self->_anon_c0[32];
    v7 = *(_OWORD *)self->_anon_120;
    v8 = *(_OWORD *)&self->_anon_120[16];
    v9 = *(_OWORD *)&self->_anon_120[32];
    v139 = v7;
    v140 = v8;
    v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v3) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v3))), v5, *(float32x2_t *)((char *)&v139 + v3), 1), v6, *(float32x4_t *)((char *)&v139 + v3), 2);
      v3 += 16;
    }
    while (v3 != 48);
    v10 = 0;
    v11 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1e8[4])), v143, *(float32x2_t *)&self->_anon_1e8[4], 1));
    *(_QWORD *)&v12 = vdivq_f32(v11, (float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2)).u64[0];
    v139 = v7;
    v140 = v8;
    v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v10) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v10))), v5, *(float32x2_t *)((char *)&v139 + v10), 1), v6, *(float32x4_t *)((char *)&v139 + v10), 2);
      v10 += 16;
    }
    while (v10 != 48);
    v13 = 0;
    v14 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1e8[12])), v143, *(float32x2_t *)&self->_anon_1e8[12], 1));
    *(_QWORD *)&v15 = vdivq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2)).u64[0];
    v139 = v7;
    v140 = v8;
    v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v13) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v13))), v5, *(float32x2_t *)((char *)&v139 + v13), 1), v6, *(float32x4_t *)((char *)&v139 + v13), 2);
      v13 += 16;
    }
    while (v13 != 48);
    v16 = 0;
    v17 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1f8[4])), v143, *(float32x2_t *)&self->_anon_1f8[4], 1));
    *(_QWORD *)&v18 = vdivq_f32(v17, (float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2)).u64[0];
    v139 = v7;
    v140 = v8;
    v141 = v9;
    do
    {
      *(float32x4_t *)((char *)&v142 + v16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v16))), v5, *(float32x2_t *)((char *)&v139 + v16), 1), v6, *(float32x4_t *)((char *)&v139 + v16), 2);
      v16 += 16;
    }
    while (v16 != 48);
    v19 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1f8[12])), v143, *(float32x2_t *)&self->_anon_1f8[12], 1));
    self->rY = CI::Perspective::keystoneV(v12, v15, v18, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 2))));
  }
  if (self->hGuidesValid)
  {
    v20 = 0;
    v21 = *(float32x4_t *)self->_anon_c0;
    v22 = *(float32x4_t *)&self->_anon_c0[16];
    v23 = *(float32x4_t *)&self->_anon_c0[32];
    v24 = *(_OWORD *)self->_anon_120;
    v25 = *(_OWORD *)&self->_anon_120[16];
    v26 = *(_OWORD *)&self->_anon_120[32];
    v139 = v24;
    v140 = v25;
    v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v20) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v20))), v22, *(float32x2_t *)((char *)&v139 + v20), 1), v23, *(float32x4_t *)((char *)&v139 + v20), 2);
      v20 += 16;
    }
    while (v20 != 48);
    v27 = 0;
    v28 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_208[4])), v143, *(float32x2_t *)&self->_anon_208[4], 1));
    *(_QWORD *)&v29 = vdivq_f32(v28, (float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2)).u64[0];
    v139 = v24;
    v140 = v25;
    v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v27) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v27))), v22, *(float32x2_t *)((char *)&v139 + v27), 1), v23, *(float32x4_t *)((char *)&v139 + v27), 2);
      v27 += 16;
    }
    while (v27 != 48);
    v30 = 0;
    v31 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_208[12])), v143, *(float32x2_t *)&self->_anon_208[12], 1));
    *(_QWORD *)&v32 = vdivq_f32(v31, (float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2)).u64[0];
    v139 = v24;
    v140 = v25;
    v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v30) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v30))), v22, *(float32x2_t *)((char *)&v139 + v30), 1), v23, *(float32x4_t *)((char *)&v139 + v30), 2);
      v30 += 16;
    }
    while (v30 != 48);
    v33 = 0;
    v34 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_218[4])), v143, *(float32x2_t *)&self->_anon_218[4], 1));
    *(_QWORD *)&v35 = vdivq_f32(v34, (float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2)).u64[0];
    v139 = v24;
    v140 = v25;
    v141 = v26;
    do
    {
      *(float32x4_t *)((char *)&v142 + v33) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v33))), v22, *(float32x2_t *)((char *)&v139 + v33), 1), v23, *(float32x4_t *)((char *)&v139 + v33), 2);
      v33 += 16;
    }
    while (v33 != 48);
    v36 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_218[12])), v143, *(float32x2_t *)&self->_anon_218[12], 1));
    self->rZ = CI::Perspective::keystoneH(v29, v32, v35, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v36.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v36, 2))));
  }
  begin = self->vLineCluster.__begin_;
  v38 = 0.0;
  v39 = 0.0;
  while (begin != self->vLineCluster.__end_)
  {
    v40 = *(float32x2_t *)begin;
    v41 = *(float32x2_t *)((char *)begin + 8);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 16);
    v42 = vsub_f32(v40, v41);
    v39 = v39 + sqrtf(vaddv_f32(vmul_f32(v42, v42)));
  }
  v43 = self->hLineCluster.__begin_;
  end = self->hLineCluster.__end_;
  if (v43 != end)
  {
    v38 = 0.0;
    do
    {
      v45 = *(float32x2_t *)v43;
      v46 = *(float32x2_t *)((char *)v43 + 8);
      v43 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v43 + 16);
      v47 = vsub_f32(v45, v46);
      v38 = v38 + sqrtf(vaddv_f32(vmul_f32(v47, v47)));
    }
    while (v43 != end);
  }
  vGuidesAOE = self->vGuidesAOE;
  hGuidesAOE = self->hGuidesAOE;
  self->super.pitch = self->rY;
  rZ = self->rZ;
  self->super.yaw = rZ;
  pitch = self->super.pitch;
  if (pitch != 0.0)
  {
    v52 = -pitch;
    if (pitch >= 0.0)
      v52 = self->super.pitch;
    if (v52 > self->super.config.pitchLimit)
    {
      self->super.pitch = 0.0;
      self->super.pitchFailureReason = 1;
      rZ = self->super.yaw;
      pitch = 0.0;
    }
  }
  if (rZ == 0.0)
    goto LABEL_38;
  v53 = -rZ;
  if (rZ >= 0.0)
    v53 = rZ;
  if (v53 <= self->super.config.yawLimit)
  {
LABEL_38:
    if (pitch == 0.0)
    {
      if (rZ == 0.0)
        return;
      v101 = 0;
      v102 = *(float32x4_t *)self->_anon_c0;
      v103 = *(float32x4_t *)&self->_anon_c0[16];
      v104 = *(float32x4_t *)&self->_anon_c0[32];
      v105 = *(_OWORD *)self->_anon_120;
      v106 = *(_OWORD *)&self->_anon_120[16];
      v107 = *(_OWORD *)&self->_anon_120[32];
      v139 = v105;
      v140 = v106;
      v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v101) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v101))), v103, *(float32x2_t *)((char *)&v139 + v101), 1), v104, *(float32x4_t *)((char *)&v139 + v101), 2);
        v101 += 16;
      }
      while (v101 != 48);
      v108 = 0;
      v109 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_208[4])), v143, *(float32x2_t *)&self->_anon_208[4], 1));
      *(_QWORD *)&v110 = vdivq_f32(v109, (float32x4_t)vdupq_laneq_s32((int32x4_t)v109, 2)).u64[0];
      v139 = v105;
      v140 = v106;
      v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v108) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v108))), v103, *(float32x2_t *)((char *)&v139 + v108), 1), v104, *(float32x4_t *)((char *)&v139 + v108), 2);
        v108 += 16;
      }
      while (v108 != 48);
      v111 = 0;
      v112 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_208[12])), v143, *(float32x2_t *)&self->_anon_208[12], 1));
      *(_QWORD *)&v113 = vdivq_f32(v112, (float32x4_t)vdupq_laneq_s32((int32x4_t)v112, 2)).u64[0];
      v139 = v105;
      v140 = v106;
      v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v111) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v111))), v103, *(float32x2_t *)((char *)&v139 + v111), 1), v104, *(float32x4_t *)((char *)&v139 + v111), 2);
        v111 += 16;
      }
      while (v111 != 48);
      v114 = 0;
      v115 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_218[4])), v143, *(float32x2_t *)&self->_anon_218[4], 1));
      *(_QWORD *)&v116 = vdivq_f32(v115, (float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2)).u64[0];
      v139 = v105;
      v140 = v106;
      v141 = v107;
      do
      {
        *(float32x4_t *)((char *)&v142 + v114) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v102, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v114))), v103, *(float32x2_t *)((char *)&v139 + v114), 1), v104, *(float32x4_t *)((char *)&v139 + v114), 2);
        v114 += 16;
      }
      while (v114 != 48);
      v117 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_218[12])), v143, *(float32x2_t *)&self->_anon_218[12], 1));
      v118 = pitch;
      v119 = rZ;
      v120 = CI::Perspective::horizonH((CI::Perspective *)self, v110, v113, v116, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v117.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v117, 2))), v118, v119);
      self->pitchCorrectionAreaCoverage = v120;
      v121 = v120;
      self->super.roll = v120;
      v122 = v120 < 0.0;
      if (v120 == 0.0)
        return;
      v123 = -v121;
      if (!v122)
        v123 = v121;
      if (v123 <= self->super.config.rollLimit)
        return;
      self->super.yaw = 0.0;
      self->super.roll = 0.0;
    }
    else
    {
      if (rZ == 0.0)
        goto LABEL_50;
      v54 = v39 * vGuidesAOE;
      v55 = v39 + v38;
      v56 = (float)(v38 * hGuidesAOE) / v55;
      v57 = *(float32x4_t *)self->_anon_c0;
      v58 = *(float32x4_t *)&self->_anon_c0[16];
      v59 = *(float32x4_t *)&self->_anon_c0[32];
      v61 = *(_OWORD *)self->_anon_120;
      v60 = *(_OWORD *)&self->_anon_120[16];
      v62 = *(_OWORD *)&self->_anon_120[32];
      v63 = 0;
      if ((float)(v54 / v55) <= v56)
      {
        v139 = *(_OWORD *)self->_anon_120;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v63) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v63))), v58, *(float32x2_t *)((char *)&v139 + v63), 1), v59, *(float32x4_t *)((char *)&v139 + v63), 2);
          v63 += 16;
        }
        while (v63 != 48);
        v124 = 0;
        v125 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_208[4])), v143, *(float32x2_t *)&self->_anon_208[4], 1));
        *(_QWORD *)&v126 = vdivq_f32(v125, (float32x4_t)vdupq_laneq_s32((int32x4_t)v125, 2)).u64[0];
        v139 = v61;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v124) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v124))), v58, *(float32x2_t *)((char *)&v139 + v124), 1), v59, *(float32x4_t *)((char *)&v139 + v124), 2);
          v124 += 16;
        }
        while (v124 != 48);
        v127 = 0;
        v128 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_208[12])), v143, *(float32x2_t *)&self->_anon_208[12], 1));
        *(_QWORD *)&v129 = vdivq_f32(v128, (float32x4_t)vdupq_laneq_s32((int32x4_t)v128, 2)).u64[0];
        v139 = v61;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v127) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v127))), v58, *(float32x2_t *)((char *)&v139 + v127), 1), v59, *(float32x4_t *)((char *)&v139 + v127), 2);
          v127 += 16;
        }
        while (v127 != 48);
        v130 = 0;
        v131 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_218[4])), v143, *(float32x2_t *)&self->_anon_218[4], 1));
        *(_QWORD *)&v132 = vdivq_f32(v131, (float32x4_t)vdupq_laneq_s32((int32x4_t)v131, 2)).u64[0];
        v139 = v61;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v130) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v130))), v58, *(float32x2_t *)((char *)&v139 + v130), 1), v59, *(float32x4_t *)((char *)&v139 + v130), 2);
          v130 += 16;
        }
        while (v130 != 48);
        v133 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_218[12])), v143, *(float32x2_t *)&self->_anon_218[12], 1));
        v134 = pitch;
        v135 = rZ;
        v76 = CI::Perspective::horizonH((CI::Perspective *)self, v126, v129, v132, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v133.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v133, 2))), v134, v135);
      }
      else
      {
        v139 = *(_OWORD *)self->_anon_120;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v63) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v63))), v58, *(float32x2_t *)((char *)&v139 + v63), 1), v59, *(float32x4_t *)((char *)&v139 + v63), 2);
          v63 += 16;
        }
        while (v63 != 48);
        v64 = 0;
        v65 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1e8[4])), v143, *(float32x2_t *)&self->_anon_1e8[4], 1));
        *(_QWORD *)&v66 = vdivq_f32(v65, (float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2)).u64[0];
        v139 = v61;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v64) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v64))), v58, *(float32x2_t *)((char *)&v139 + v64), 1), v59, *(float32x4_t *)((char *)&v139 + v64), 2);
          v64 += 16;
        }
        while (v64 != 48);
        v67 = 0;
        v68 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1e8[12])), v143, *(float32x2_t *)&self->_anon_1e8[12], 1));
        *(_QWORD *)&v69 = vdivq_f32(v68, (float32x4_t)vdupq_laneq_s32((int32x4_t)v68, 2)).u64[0];
        v139 = v61;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v67) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v67))), v58, *(float32x2_t *)((char *)&v139 + v67), 1), v59, *(float32x4_t *)((char *)&v139 + v67), 2);
          v67 += 16;
        }
        while (v67 != 48);
        v70 = 0;
        v71 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1f8[4])), v143, *(float32x2_t *)&self->_anon_1f8[4], 1));
        *(_QWORD *)&v72 = vdivq_f32(v71, (float32x4_t)vdupq_laneq_s32((int32x4_t)v71, 2)).u64[0];
        v139 = v61;
        v140 = v60;
        v141 = v62;
        do
        {
          *(float32x4_t *)((char *)&v142 + v70) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v70))), v58, *(float32x2_t *)((char *)&v139 + v70), 1), v59, *(float32x4_t *)((char *)&v139 + v70), 2);
          v70 += 16;
        }
        while (v70 != 48);
        v73 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1f8[12])), v143, *(float32x2_t *)&self->_anon_1f8[12], 1));
        v74 = pitch;
        v75 = rZ;
        v76 = CI::Perspective::horizonV((CI::Perspective *)self, v66, v69, v72, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v73, 2))), v74, v75);
      }
      self->pitchCorrectionAreaCoverage = v76;
      v136 = v76;
      self->super.roll = v76;
      v137 = v76 < 0.0;
      if (v76 == 0.0)
        return;
      v138 = -v136;
      if (!v137)
        v138 = v136;
      if (v138 <= self->super.config.rollLimit)
        return;
      self->super.pitch = 0.0;
      self->super.yaw = 0.0;
      self->super.roll = 0.0;
      self->super.pitchFailureReason = 4;
    }
    v100 = &OBJC_IVAR___CIPerspectiveAutoCalc_yawFailureReason;
    goto LABEL_92;
  }
  self->super.yaw = 0.0;
  self->super.yawFailureReason = 1;
  pitch = self->super.pitch;
  rZ = 0.0;
  if (pitch == 0.0)
    return;
LABEL_50:
  v77 = 0;
  v78 = *(float32x4_t *)self->_anon_c0;
  v79 = *(float32x4_t *)&self->_anon_c0[16];
  v80 = *(float32x4_t *)&self->_anon_c0[32];
  v81 = *(_OWORD *)self->_anon_120;
  v82 = *(_OWORD *)&self->_anon_120[16];
  v83 = *(_OWORD *)&self->_anon_120[32];
  v139 = v81;
  v140 = v82;
  v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v77) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v77))), v79, *(float32x2_t *)((char *)&v139 + v77), 1), v80, *(float32x4_t *)((char *)&v139 + v77), 2);
    v77 += 16;
  }
  while (v77 != 48);
  v84 = 0;
  v85 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1e8[4])), v143, *(float32x2_t *)&self->_anon_1e8[4], 1));
  *(_QWORD *)&v86 = vdivq_f32(v85, (float32x4_t)vdupq_laneq_s32((int32x4_t)v85, 2)).u64[0];
  v139 = v81;
  v140 = v82;
  v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v84) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v84))), v79, *(float32x2_t *)((char *)&v139 + v84), 1), v80, *(float32x4_t *)((char *)&v139 + v84), 2);
    v84 += 16;
  }
  while (v84 != 48);
  v87 = 0;
  v88 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1e8[12])), v143, *(float32x2_t *)&self->_anon_1e8[12], 1));
  *(_QWORD *)&v89 = vdivq_f32(v88, (float32x4_t)vdupq_laneq_s32((int32x4_t)v88, 2)).u64[0];
  v139 = v81;
  v140 = v82;
  v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v87) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v87))), v79, *(float32x2_t *)((char *)&v139 + v87), 1), v80, *(float32x4_t *)((char *)&v139 + v87), 2);
    v87 += 16;
  }
  while (v87 != 48);
  v90 = 0;
  v91 = vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1f8[4])), v143, *(float32x2_t *)&self->_anon_1f8[4], 1));
  *(_QWORD *)&v92 = vdivq_f32(v91, (float32x4_t)vdupq_laneq_s32((int32x4_t)v91, 2)).u64[0];
  v139 = v81;
  v140 = v82;
  v141 = v83;
  do
  {
    *(float32x4_t *)((char *)&v142 + v90) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(__int128 *)((char *)&v139 + v90))), v79, *(float32x2_t *)((char *)&v139 + v90), 1), v80, *(float32x4_t *)((char *)&v139 + v90), 2);
    v90 += 16;
  }
  while (v90 != 48);
  v93 = (int32x4_t)vaddq_f32(v144, vmlaq_lane_f32(vmulq_n_f32(v142, COERCE_FLOAT(*(_QWORD *)&self->_anon_1f8[12])), v143, *(float32x2_t *)&self->_anon_1f8[12], 1));
  v94 = pitch;
  v95 = rZ;
  v96 = CI::Perspective::horizonV((CI::Perspective *)self, v86, v89, v92, COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2))), v94, v95);
  self->pitchCorrectionAreaCoverage = v96;
  v97 = v96;
  self->super.roll = v96;
  v98 = v96 < 0.0;
  if (v96 != 0.0)
  {
    v99 = -v97;
    if (!v98)
      v99 = v97;
    if (v99 > self->super.config.rollLimit)
    {
      self->super.pitch = 0.0;
      self->super.roll = 0.0;
      v100 = &OBJC_IVAR___CIPerspectiveAutoCalc_pitchFailureReason;
LABEL_92:
      *(Class *)((char *)&self->super.super.isa + *v100) = (Class)4;
    }
  }
}

- (double)minimumPitchCorrectionAreaCoverage
{
  return self->minimumYawCorrectionAreaCoverage;
}

- (void)setMinimumPitchCorrectionAreaCoverage:(double)a3
{
  self->minimumYawCorrectionAreaCoverage = a3;
}

- (double)minimumYawCorrectionAreaCoverage
{
  return *(double *)&self[1].super.super.isa;
}

- (void)setMinimumYawCorrectionAreaCoverage:(double)a3
{
  *(double *)&self[1].super.super.isa = a3;
}

- (float)pitchCorrectionAreaCoverage
{
  return self->yawCorrectionAreaCoverage;
}

- (float)yawCorrectionAreaCoverage
{
  return *(float *)&self->minimumPitchCorrectionAreaCoverage;
}

- (void).cxx_destruct
{
  vector<CI::Perspective::Line, std::allocator<CI::Perspective::Line>> *p_hLineCluster;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v7;

  p_hLineCluster = &self->hLineCluster;
  begin = self->hLineCluster.__begin_;
  if (begin)
  {
    p_hLineCluster->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->vLineCluster.__begin_;
  if (v5)
  {
    self->vLineCluster.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->hLines.__begin_;
  if (v6)
  {
    self->hLines.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->vLines.__begin_;
  if (v7)
  {
    self->vLines.__end_ = v7;
    operator delete(v7);
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
  *((_QWORD *)self + 69) = 0x100000001;
  return self;
}

- (_QWORD)clusterLineSegments
{
  char *v7;
  char *v8;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x666666666666667)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v7 = (char *)operator new(40 * a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[40 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[40 * a2];
  return a1;
}

@end
