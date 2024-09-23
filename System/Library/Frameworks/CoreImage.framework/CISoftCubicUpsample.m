@implementation CISoftCubicUpsample

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryGeometryAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v5[4] = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v6[1] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1AC60;
  v4[3] = &unk_1E2F1ACB0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F1AC70;
  v4[1] = &unk_1E2F1AC70;
  v4[4] = &unk_1E2F1AC70;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v7[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
}

- (int32x2_t)_scale
{
  double v2;
  double v3;
  int32x2_t result;
  void *v5;
  double v6;
  float64x2_t v7;
  float64_t v8;
  float64_t v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 88), "doubleValue");
    v3 = fmax(v2, 1.0);
    *(float *)&v3 = v3;
    return vdup_lane_s32(*(int32x2_t *)&v3, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *(void **)(a1 + 88);
      objc_msgSend(v5, "X");
      v14 = v6;
      objc_msgSend(v5, "Y");
      v7.f64[0] = v14;
      v7.f64[1] = v8;
      __asm { FMOV            V0.2D, #1.0 }
      return (int32x2_t)vcvt_f32_f64(vmaxnmq_f64(v7, _Q0));
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
    }
  }
  return result;
}

- (BOOL)_isIdentity
{
  float v2;
  float v3;

  -[CISoftCubicUpsample _scale](self, "_scale");
  return v3 <= 1.0 && v2 <= 1.0;
}

- (id)outputImage
{
  float32x2_t v9;
  double x;
  double y;
  double width;
  double height;
  float v14;
  float v15;
  _BOOL4 v16;
  float v17;
  _BOOL4 v18;
  float v19;
  CIKernel *v20;
  double var0;
  double var1;
  double var3;
  double var2;
  double v25;
  CIKernel *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CIKernel *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float64x2_t v36;
  float64x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  float v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  float64x2_t v44;
  float64x2_t v45;
  Rectangle v46;
  Rectangle v47;
  Rectangle v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v51[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CISoftCubicUpsample _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[CISoftCubicUpsample _scale](self, "_scale");
  __asm { FMOV            V1.2S, #1.0 }
  v39 = v9;
  v38 = vdiv_f32(_D1, v9);
  -[CIImage extent](self->inputImage, "extent");
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  if (CGRectIsInfinite(v52))
  {
    *(int64x2_t *)&v48.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v48.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v15 = v39.f32[1];
    v14 = v39.f32[0];
    v16 = v39.f32[1] == 1.0;
    if (v39.f32[1] == 1.0)
      v17 = 0.0;
    else
      v17 = 2.0;
    v18 = v39.f32[0] == 1.0;
    if (v39.f32[0] == 1.0)
      v19 = 0.0;
    else
      v19 = 2.0;
    y = -8.98846567e307;
    height = 1.79769313e308;
    width = 1.79769313e308;
    goto LABEL_28;
  }
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  if (CGRectIsNull(v53))
  {
    *(int64x2_t *)&v48.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v48.var2 = 0.0;
    v48.var3 = 0.0;
    v15 = v39.f32[1];
    v14 = v39.f32[0];
    v16 = v39.f32[1] == 1.0;
    if (v39.f32[1] == 1.0)
      v17 = 0.0;
    else
      v17 = 2.0;
    v18 = v39.f32[0] == 1.0;
    if (v39.f32[0] == 1.0)
      v19 = 0.0;
    else
      v19 = 2.0;
    width = 0.0;
    y = INFINITY;
    height = 0.0;
    x = INFINITY;
  }
  else
  {
    v48.var0 = x;
    v48.var1 = y;
    v48.var2 = width;
    v48.var3 = height;
    v15 = v39.f32[1];
    v14 = v39.f32[0];
    v16 = v39.f32[1] == 1.0;
    if (v39.f32[1] == 1.0)
      v17 = 0.0;
    else
      v17 = 2.0;
    v18 = v39.f32[0] == 1.0;
    if (v39.f32[0] == 1.0)
      v19 = 0.0;
    else
      v19 = 2.0;
    if (x == -8.98846567e307)
    {
LABEL_28:
      x = -8.98846567e307;
      if (y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
        goto LABEL_32;
    }
  }
  v40 = v14;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  if (!CGRectIsInfinite(v54))
  {
    Rectangle::inset(&v48, -v17, -v19, (uint64_t)&v44);
    if (fabs(v44.f64[0]) == INFINITY || fabs(v44.f64[1]) == INFINITY)
    {
      *(int64x2_t *)&v46.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v46.var2 = 0.0;
      v46.var3 = 0.0;
    }
    else
    {
      v36 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      v37 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v44, v37), (int32x4_t)vceqq_f64(v45, v36))))) & 1) != 0)
      {
        v46.var0 = v44.f64[0] * v40;
        v46.var1 = v44.f64[1] * v15;
        v46.var2 = v40 * v45.f64[0];
        v46.var3 = vmuld_lane_f64(v15, v45, 1);
      }
      else
      {
        *(float64x2_t *)&v46.var0 = v37;
        *(float64x2_t *)&v46.var2 = v36;
      }
    }
    Rectangle::integralize(&v46, 0.0001, (uint64_t)&v47);
    v48 = v47;
    if (v18)
      goto LABEL_33;
    goto LABEL_43;
  }
LABEL_32:
  *(int64x2_t *)&v48.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
  *(int64x2_t *)&v48.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  if (v18)
  {
LABEL_33:
    v20 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample10v);
    var0 = v48.var0;
    var1 = v48.var1;
    var2 = v48.var2;
    var3 = v48.var3;
    if (v48.var0 == -8.98846567e307
      && v48.var1 == -8.98846567e307
      && v48.var2 == 1.79769313e308
      && v48.var3 == 1.79769313e308)
    {
      var0 = *MEMORY[0x1E0C9D5E0];
      var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __34__CISoftCubicUpsample_outputImage__block_invoke;
    v43[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    HIDWORD(v25) = v38.i32[1];
    v43[4] = v38;
    v51[0] = self->inputImage;
    LODWORD(v25) = v38.i32[1];
    v51[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v20, "applyWithExtent:roiCallback:arguments:", v43, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2), var0, var1, var2, var3);
  }
LABEL_43:
  if (v16)
  {
    v26 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample10h);
    v27 = v48.var0;
    v28 = v48.var1;
    v30 = v48.var2;
    v29 = v48.var3;
    if (v48.var0 == -8.98846567e307
      && v48.var1 == -8.98846567e307
      && v48.var2 == 1.79769313e308
      && v48.var3 == 1.79769313e308)
    {
      v27 = *MEMORY[0x1E0C9D5E0];
      v28 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v30 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v29 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __34__CISoftCubicUpsample_outputImage__block_invoke_2;
    v42[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v42[4] = v38;
    v50[0] = self->inputImage;
    v50[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v26, "applyWithExtent:roiCallback:arguments:", v42, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2), v27, v28, v30, v29);
  }
  else
  {
    v31 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample10);
    v32 = v48.var0;
    v33 = v48.var1;
    v35 = v48.var2;
    v34 = v48.var3;
    if (v48.var0 == -8.98846567e307
      && v48.var1 == -8.98846567e307
      && v48.var2 == 1.79769313e308
      && v48.var3 == 1.79769313e308)
    {
      v32 = *MEMORY[0x1E0C9D5E0];
      v33 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v34 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __34__CISoftCubicUpsample_outputImage__block_invoke_3;
    v41[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v41[4] = v38;
    v49[0] = self->inputImage;
    v49[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v38.f32[0], v38.f32[1]);
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v31, "applyWithExtent:roiCallback:arguments:", v41, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2), v32, v33, v35, v34);
  }
}

float64_t __34__CISoftCubicUpsample_outputImage__block_invoke(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  upsampleRoi(a2, a3, a4, a5, a1[4]);
  return a2;
}

void __34__CISoftCubicUpsample_outputImage__block_invoke_2(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  upsampleRoi(a2, a3, a4, a5, a1[4]);
}

double __34__CISoftCubicUpsample_outputImage__block_invoke_3(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
