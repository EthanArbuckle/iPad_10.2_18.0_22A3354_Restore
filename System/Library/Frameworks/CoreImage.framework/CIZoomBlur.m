@implementation CIZoomBlur

+ (id)customAttributes
{
  int v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v2 = dyld_program_sdk_at_least();
  v13[0] = CFSTR("CIAttributeFilterCategories");
  v12[0] = CFSTR("CICategoryBlur");
  v12[1] = CFSTR("CICategoryStillImage");
  v12[2] = CFSTR("CICategoryVideo");
  v12[3] = CFSTR("CICategoryBuiltIn");
  v14[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v14[1] = CFSTR("8.3");
  v13[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v13[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v14[2] = CFSTR("10.4");
  v13[3] = CFSTR("inputAmount");
  if (v2)
  {
    v10[0] = CFSTR("CIAttributeSliderMin");
    v10[1] = CFSTR("CIAttributeSliderMax");
    v11[0] = &unk_1E2F1A4B0;
    v11[1] = &unk_1E2F1A4C0;
    v10[2] = CFSTR("CIAttributeDefault");
    v10[3] = CFSTR("CIAttributeIdentity");
    v11[2] = &unk_1E2F1A4A0;
    v11[3] = &unk_1E2F1A480;
    v10[4] = CFSTR("CIAttributeType");
    v11[4] = CFSTR("CIAttributeTypeDistance");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = v11;
    v5 = v10;
    v6 = 5;
  }
  else
  {
    v8[0] = CFSTR("CIAttributeMin");
    v8[1] = CFSTR("CIAttributeSliderMin");
    v9[0] = &unk_1E2F1A480;
    v9[1] = &unk_1E2F1A480;
    v8[2] = CFSTR("CIAttributeSliderMax");
    v8[3] = CFSTR("CIAttributeDefault");
    v9[2] = &unk_1E2F1A4C0;
    v9[3] = &unk_1E2F1A4A0;
    v8[4] = CFSTR("CIAttributeIdentity");
    v8[5] = CFSTR("CIAttributeType");
    v9[4] = &unk_1E2F1A480;
    v9[5] = CFSTR("CIAttributeTypeDistance");
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = v9;
    v5 = v8;
    v6 = 6;
  }
  v14[3] = objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v4, v5, v6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_super v7;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("inputRadius")))
  {
    -[CIZoomBlur setInputAmount:](self, "setInputAmount:", a3);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CIZoomBlur;
    -[CIFilter setValue:forUndefinedKey:](&v7, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("inputRadius")))
    return -[CIZoomBlur inputAmount](self, "inputAmount");
  v6.receiver = self;
  v6.super_class = (Class)CIZoomBlur;
  return -[CIFilter valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_zoomBlur);
}

- (id)_kernelNew
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_zoom);
}

- (id)_blur:(id)a3 pass:(int)a4 weightsFactor:(float)a5
{
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  CIVector *v14;
  double v15;
  double v16;
  CIVector *v17;
  CIVector *v18;
  uint64_t v19;
  double x;
  double y;
  double width;
  double height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  id v36;
  _QWORD v38[5];
  _QWORD v39[6];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v39[5] = *MEMORY[0x1E0C80C00];
  v8 = pow(0.995, (float)(1 << a4));
  -[CIVector X](self->inputCenter, "X");
  v10 = v9;
  -[CIVector Y](self->inputCenter, "Y");
  v12 = v11;
  v13 = (float)((float)(v8 * v8) * (float)(v8 * v8));
  v14 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v8, (float)(v8 * v8), (float)((float)(v8 * v8) * v8), v13);
  v15 = v10;
  v16 = v12;
  v17 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v15, v12, v13);
  v18 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", a5 * 0.1, a5 * 0.15, a5 * 0.2, a5 * 0.25);
  v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (float)(1.0 - a5) + a5 * 0.3);
  objc_msgSend(a3, "extent");
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  if (CGRectIsInfinite(v40))
  {
    v24 = *MEMORY[0x1E0C9D5E0];
    v25 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    goto LABEL_26;
  }
  v28 = y + height;
  v29 = (x - v15) / v13 + v15;
  v30 = (y - v16) / v13 + v16;
  v31 = (x + width - v15) / v13 + v15;
  if (v31 >= v29)
  {
    if (v31 <= v29)
      v34 = (x - v15) / v13 + v15;
    else
      v34 = (x + width - v15) / v13 + v15;
    v32 = (v28 - v16) / v13 + v16;
    v33 = (x - v15) / v13 + v15;
LABEL_10:
    if (v34 >= v29)
      v29 = v34;
    goto LABEL_12;
  }
  v32 = (v28 - v16) / v13 + v16;
  v33 = (x + width - v15) / v13 + v15;
  v34 = (x - v15) / v13 + v15;
  if (v31 <= v29)
    goto LABEL_10;
  v33 = (x - v15) / v13 + v15;
LABEL_12:
  if (v32 >= v30)
  {
    if (v32 <= v30)
      v35 = (y - v16) / v13 + v16;
    else
      v35 = v32;
  }
  else
  {
    v35 = (y - v16) / v13 + v16;
    v30 = v32;
  }
  if (v33 <= v31)
  {
    if (v29 < v31)
      v29 = (x + width - v15) / v13 + v15;
  }
  else
  {
    v33 = (x + width - v15) / v13 + v15;
  }
  if (v30 <= v32)
  {
    if (v35 < v32)
      v35 = v32;
  }
  else
  {
    v30 = v32;
  }
  v44.origin.x = v33;
  v44.origin.y = v30;
  v44.size.width = (float)(v29 - v33);
  v44.size.height = (float)(v35 - v30);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v42 = CGRectUnion(v41, v44);
  v43 = CGRectIntegral(v42);
  v24 = v43.origin.x;
  v25 = v43.origin.y;
  v26 = v43.size.width;
  v27 = v43.size.height;
LABEL_26:
  v36 = -[CIZoomBlur _kernel](self, "_kernel");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __39__CIZoomBlur__blur_pass_weightsFactor___block_invoke;
  v38[3] = &unk_1E2EC3588;
  v38[4] = v17;
  v39[0] = a3;
  v39[1] = self->inputCenter;
  v39[2] = v14;
  v39[3] = v18;
  v39[4] = v19;
  return (id)objc_msgSend(v36, "applyWithExtent:roiCallback:arguments:", v38, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 5), v24, v25, v26, v27);
}

double __39__CIZoomBlur__blur_pass_weightsFactor___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "X");
  v5 = v4;
  objc_msgSend(v3, "Y");
  objc_msgSend(v3, "Z");
  *(float *)&v6 = v6;
  v7 = a2;
  v8 = v5 + (v7 - v5) * *(float *)&v6;
  if (v8 <= v7)
    return (float)v8;
  else
    return (float)a2;
}

- (BOOL)_isIdentity
{
  int v3;
  float v4;
  float v5;

  v3 = dyld_program_sdk_at_least();
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  v5 = fabsf(v4);
  if (v3)
    v4 = v5;
  return v4 < 0.001;
}

- (id)outputImage
{
  int v4;
  double v5;
  float v6;
  float v7;
  CIVector *inputCenter;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double x;
  double y;
  double width;
  double height;
  int64x2_t v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  float v22;
  uint64_t v23;
  CIImage *inputImage;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float32x2_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double var0;
  double var1;
  double var3;
  double var2;
  uint64_t v41;
  float32x2_t v42;
  float v43;
  _QWORD v44[6];
  Rectangle v45;
  Rectangle v46;
  Rectangle v47;
  _QWORD v48[4];
  CGRect v49;
  CGRect v50;

  v48[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIZoomBlur _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  v4 = dyld_program_sdk_at_least();
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  if (!v4)
  {
    v18 = *(float *)&v5 * *(float *)&v5;
    v19 = 1.0833;
    v20 = 0;
    if (v18 <= 1.0833)
    {
      inputImage = self->inputImage;
      v25 = v18 / 1.0833;
    }
    else
    {
      v21 = 1.0;
      do
      {
        v22 = v19;
        v20 = (v20 + 1);
        v21 = v21 * 4.0;
        v19 = v19 + v21;
      }
      while (v18 > v19);
      v23 = 0;
      inputImage = self->inputImage;
      v25 = (float)(v18 - v22) / (float)(v19 - v22);
      do
      {
        LODWORD(v5) = 1.0;
        inputImage = -[CIZoomBlur _blur:pass:weightsFactor:](self, "_blur:pass:weightsFactor:", inputImage, v23, v5);
        v23 = (v23 + 1);
      }
      while ((_DWORD)v20 != (_DWORD)v23);
    }
    *(float *)&v5 = v25;
    return -[CIZoomBlur _blur:pass:weightsFactor:](self, "_blur:pass:weightsFactor:", inputImage, v20, v5);
  }
  v6 = 1000.0;
  if (*(float *)&v5 <= 1000.0)
    v6 = *(float *)&v5;
  if (*(float *)&v5 >= -1000.0)
    v7 = v6;
  else
    v7 = -1000.0;
  inputCenter = self->inputCenter;
  -[CIVector X](inputCenter, "X");
  *(float *)&v9 = v9;
  v43 = *(float *)&v9;
  -[CIVector Y](inputCenter, "Y");
  *(float *)&v11 = v10;
  v41 = v11;
  v42 = (float32x2_t)__PAIR64__(v11, LODWORD(v43));
  v12 = pow(0.98, v7);
  -[CIImage extent](self->inputImage, "extent");
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  if (CGRectIsInfinite(v49))
  {
    v17 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v47.var0 = v17;
    *(int64x2_t *)&v47.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    y = -8.98846567e307;
    height = 1.79769313e308;
    width = 1.79769313e308;
  }
  else
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    if (!CGRectIsNull(v50))
    {
      v47.var0 = x;
      v47.var1 = y;
      v47.var2 = width;
      v47.var3 = height;
      goto LABEL_25;
    }
    v17 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v47.var0 = v17;
    v47.var2 = 0.0;
    v47.var3 = 0.0;
    height = 0.0;
    y = INFINITY;
    width = 0.0;
  }
  x = y;
LABEL_25:
  v17.i64[0] = 0;
  v26 = INFINITY;
  v27 = 0.0;
  v28 = 0.0;
  v29 = INFINITY;
  if (fabs(x) != INFINITY)
  {
    v26 = INFINITY;
    v29 = INFINITY;
    if (fabs(y) != INFINITY)
    {
      v26 = -8.98846567e307;
      if (x == -8.98846567e307 && y == -8.98846567e307 && width == 1.79769313e308 && height == 1.79769313e308)
      {
        v27 = 1.79769313e308;
        v28 = 1.79769313e308;
        v29 = -8.98846567e307;
      }
      else
      {
        v30 = vneg_f32(v42);
        v29 = x + v30.f32[0];
        v26 = y + v30.f32[1];
        v27 = width;
        v28 = height;
      }
    }
  }
  v31 = INFINITY;
  if (fabs(v29) == INFINITY)
  {
    v32 = 0.0;
LABEL_41:
    v33 = v31;
    goto LABEL_42;
  }
  v31 = INFINITY;
  v32 = 0.0;
  v33 = INFINITY;
  if (fabs(v26) == INFINITY)
    goto LABEL_42;
  v31 = -8.98846567e307;
  if (v29 == -8.98846567e307 && v26 == -8.98846567e307 && v27 == 1.79769313e308 && v28 == 1.79769313e308)
  {
    v17.i64[0] = 0x7FEFFFFFFFFFFFFFLL;
    v32 = 1.79769313e308;
    goto LABEL_41;
  }
  v33 = 1.0 / v12 * v29;
  v31 = 1.0 / v12 * v26;
  *(double *)v17.i64 = 1.0 / v12 * v27;
  v32 = 1.0 / v12 * v28;
LABEL_42:
  v34 = v43;
  v35 = *(float *)&v41;
  if (fabs(v33) == INFINITY || fabs(v31) == INFINITY)
  {
    v17 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v46.var0 = v17;
    v46.var2 = 0.0;
    v46.var3 = 0.0;
  }
  else if (v33 == -8.98846567e307
         && v31 == -8.98846567e307
         && *(double *)v17.i64 == 1.79769313e308
         && v32 == 1.79769313e308)
  {
    v17 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v46.var0 = v17;
    *(int64x2_t *)&v46.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v46.var0 = v33 + v34;
    v46.var1 = v31 + v35;
    *(_QWORD *)&v46.var2 = v17.i64[0];
    v46.var3 = v32;
  }
  Rectangle::Union(&v46, &v47, (uint64_t)&v45, v17);
  v46 = v45;
  v36 = -[CIZoomBlur _kernelNew](self, "_kernelNew");
  var1 = v46.var1;
  var0 = v46.var0;
  var3 = v46.var3;
  var2 = v46.var2;
  if (v46.var0 == -8.98846567e307
    && v46.var1 == -8.98846567e307
    && v46.var2 == 1.79769313e308
    && v46.var3 == 1.79769313e308)
  {
    var0 = *MEMORY[0x1E0C9D5E0];
    var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __25__CIZoomBlur_outputImage__block_invoke;
  v44[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v44[4] = v42;
  *(double *)&v44[5] = v12;
  v48[0] = self->inputImage;
  v48[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v34, v35, v41);
  v48[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  return (id)objc_msgSend(v36, "applyWithExtent:roiCallback:arguments:", v44, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3), var0, var1, var2, var3);
}

void __25__CIZoomBlur_outputImage__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  int64x2_t v10;
  float32x2_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float32x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  uint64_t v25;
  Rectangle v26;
  Rectangle v27;
  CGRect v28;

  v8 = a2;
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    v10 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v27.var0 = v10;
    *(int64x2_t *)&v27.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    a3 = -8.98846567e307;
    a5 = 1.79769313e308;
    a4 = 1.79769313e308;
  }
  else
  {
    v28.origin.x = v8;
    v28.origin.y = a3;
    v28.size.width = a4;
    v28.size.height = a5;
    if (!CGRectIsNull(v28))
    {
      v27.var0 = v8;
      v27.var1 = a3;
      v27.var2 = a4;
      v27.var3 = a5;
      goto LABEL_7;
    }
    v10 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v27.var0 = v10;
    v27.var2 = 0.0;
    v27.var3 = 0.0;
    a5 = 0.0;
    a3 = INFINITY;
    a4 = 0.0;
  }
  v8 = a3;
LABEL_7:
  v11 = *(float32x2_t *)(a1 + 32);
  v12 = 0.0;
  v13 = INFINITY;
  v14 = 0.0;
  v15 = 0.0;
  v16 = INFINITY;
  if (fabs(v8) != INFINITY)
  {
    v13 = INFINITY;
    v16 = INFINITY;
    if (fabs(a3) != INFINITY)
    {
      v13 = -8.98846567e307;
      if (v8 == -8.98846567e307 && a3 == -8.98846567e307 && a4 == 1.79769313e308 && a5 == 1.79769313e308)
      {
        v14 = 1.79769313e308;
        v15 = 1.79769313e308;
        v16 = -8.98846567e307;
      }
      else
      {
        v17 = vneg_f32(v11);
        v16 = v8 + v17.f32[0];
        v13 = a3 + v17.f32[1];
        v14 = a4;
        v15 = a5;
      }
    }
  }
  v18 = INFINITY;
  if (fabs(v16) == INFINITY)
  {
    v19 = 0.0;
LABEL_23:
    v20 = v18;
    goto LABEL_24;
  }
  v18 = INFINITY;
  v19 = 0.0;
  v20 = INFINITY;
  if (fabs(v13) == INFINITY)
    goto LABEL_24;
  v21 = *(double *)(a1 + 40);
  v18 = -8.98846567e307;
  if (v16 == -8.98846567e307 && v13 == -8.98846567e307 && v14 == 1.79769313e308 && v15 == 1.79769313e308)
  {
    v12 = 1.79769313e308;
    v19 = 1.79769313e308;
    goto LABEL_23;
  }
  v20 = v16 * v21;
  v18 = v13 * v21;
  v12 = v14 * v21;
  v19 = v15 * v21;
LABEL_24:
  v22 = fabs(v18);
  if (fabs(v20) == INFINITY || v22 == INFINITY)
  {
    v10 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v26.var0 = v10;
    v26.var2 = 0.0;
    v26.var3 = 0.0;
  }
  else if (v20 == -8.98846567e307 && v18 == -8.98846567e307 && v12 == 1.79769313e308 && v19 == 1.79769313e308)
  {
    v10 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v26.var0 = v10;
    *(int64x2_t *)&v26.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v24 = v20 + v11.f32[0];
    *(double *)v10.i64 = v18 + v11.f32[1];
    v26.var0 = v24;
    *(_QWORD *)&v26.var1 = v10.i64[0];
    v26.var2 = v12;
    v26.var3 = v19;
  }
  Rectangle::Union(&v26, &v27, (uint64_t)&v25, v10);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
