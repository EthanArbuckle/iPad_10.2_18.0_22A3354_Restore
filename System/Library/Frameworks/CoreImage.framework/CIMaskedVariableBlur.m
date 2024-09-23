@implementation CIMaskedVariableBlur

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryStillImage");
  v5[2] = CFSTR("CICategoryVideo");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("8");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.10");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A290;
  v4[3] = &unk_1E2F1A2A0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F1A280;
  v4[1] = &unk_1E2F1A280;
  v4[4] = &unk_1E2F1A280;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (BOOL)_isIdentity
{
  float v2;

  -[NSNumber floatValue](self->inputRadius, "floatValue");
  return v2 < 0.16;
}

- (id)_kernelD2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_betterDown2);
}

- (id)_kernelCombine
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maskedVariableBlur);
}

- (id)downTwo:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  double var0;
  double var1;
  double var3;
  double var2;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v23;
  double v24;
  float64x2_t v25;
  Rectangle v26;
  Rectangle v27;
  Rectangle v28;
  _QWORD v29[2];
  CGRect v30;
  CGRect v31;

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (CGRectIsInfinite(v30))
  {
    *(int64x2_t *)&v28.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v28.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (CGRectIsNull(v31))
    {
      *(int64x2_t *)&v28.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v28.var2 = 0.0;
      v28.var3 = 0.0;
    }
    else
    {
      v28.var0 = x;
      v28.var1 = y;
      v28.var2 = width;
      v28.var3 = height;
    }
  }
  Rectangle::inset(&v28, -1.0, -1.0, (uint64_t)&v23);
  if (fabs(v23) == INFINITY || fabs(v24) == INFINITY)
  {
    *(int64x2_t *)&v26.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v26.var2 = 0.0;
    v26.var3 = 0.0;
  }
  else
  {
    v15.f64[0] = v24;
    v15.f64[1] = v23;
    v16 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v17 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v15, v17), (int32x4_t)vceqq_f64(v25, v16))))) & 1) != 0)
    {
      __asm { FMOV            V3.2D, #0.5 }
      v26.var0 = v23 * 0.5;
      v26.var1 = v24 * 0.5;
      *(float64x2_t *)&v26.var2 = vmulq_f64(v25, _Q3);
    }
    else
    {
      *(float64x2_t *)&v26.var0 = v17;
      *(float64x2_t *)&v26.var2 = v16;
    }
  }
  Rectangle::integralize(&v26, 0.0001, (uint64_t)&v27);
  v28 = v27;
  v9 = -[CIMaskedVariableBlur _kernelD2](self, "_kernelD2");
  var1 = v28.var1;
  var0 = v28.var0;
  var3 = v28.var3;
  var2 = v28.var2;
  if (v28.var0 == -8.98846567e307
    && v28.var1 == -8.98846567e307
    && v28.var2 == 1.79769313e308
    && v28.var3 == 1.79769313e308)
  {
    var0 = *MEMORY[0x1E0C9D5E0];
    var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  v29[0] = a3;
  return (id)objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_48, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1), var0, var1, var2, var3);
}

void __32__CIMaskedVariableBlur_downTwo___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL IsNull;
  double v13;
  Rectangle v18;
  Rectangle v19;
  uint64_t v20;
  CGRect v21;

  if (CGRectIsInfinite(*(CGRect *)&a1))
  {
    v8 = -8.98846567e307;
    v9 = 1.79769313e308;
    v10 = 1.79769313e308;
    v11 = -8.98846567e307;
  }
  else
  {
    v21.origin.x = a1;
    v21.origin.y = a2;
    v21.size.width = a3;
    v21.size.height = a4;
    IsNull = CGRectIsNull(v21);
    v11 = INFINITY;
    if (IsNull)
      v9 = 0.0;
    else
      v9 = a3;
    if (IsNull)
      v10 = 0.0;
    else
      v10 = a4;
    if (IsNull)
      v8 = INFINITY;
    else
      v8 = a2;
    if (!IsNull)
      v11 = a1;
  }
  v13 = fabs(v8);
  if (fabs(v11) == INFINITY || v13 == INFINITY)
  {
    *(int64x2_t *)&v18.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(_OWORD *)&v18.var2 = 0uLL;
  }
  else if (v11 == -8.98846567e307 && v8 == -8.98846567e307 && v9 == 1.79769313e308 && v10 == 1.79769313e308)
  {
    *(int64x2_t *)&v18.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v18.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v18.var0 = v11 + v11;
    v18.var1 = v8 + v8;
    v18.var2 = v9 + v9;
    v18.var3 = v10 + v10;
  }
  Rectangle::inset(&v18, -1.0, -1.0, (uint64_t)&v19);
  Rectangle::integralize(&v19, 0.0001, (uint64_t)&v20);
}

- (id)upCubic:(id)a3 scale:(float)a4
{
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("inputScale");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  return (id)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CISoftCubicUpsample"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (id)outputImage
{
  double v4;
  float v5;
  int v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  CIImage *inputImage;
  _QWORD v26[10];
  CGRect v27;
  CGRect v28;

  v26[9] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[CIImage extent](self->inputMask, "extent");
  if (CGRectIsEmpty(v27))
    return self->inputImage;
  if (-[CIMaskedVariableBlur _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[CIImage extent](self->inputMask, "extent");
  if (CGRectIsEmpty(v28))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  *(float *)&v4 = v4;
  v5 = floorf(fmaxf(log2f((float)(*(float *)&v4 * 4.0) / 3.0), 0.0));
  if (v5 <= 0.5)
    v6 = 1;
  else
    v6 = 2;
  if (v5 > 1.5)
    v6 = 3;
  if (v5 > 2.5)
    v6 = 4;
  if (v5 > 3.5)
    v6 = 5;
  if (v5 <= 4.5)
    v7 = v6;
  else
    v7 = 6;
  v8 = -[CIMaskedVariableBlur downTwo:](self, "downTwo:", self->inputImage);
  v9 = -[CIMaskedVariableBlur downTwo:](self, "downTwo:", v8);
  v10 = -[CIMaskedVariableBlur downTwo:](self, "downTwo:", v9);
  v11 = -[CIMaskedVariableBlur downTwo:](self, "downTwo:", v10);
  v12 = -[CIMaskedVariableBlur downTwo:](self, "downTwo:", v11);
  v13 = -[CIMaskedVariableBlur downTwo:](self, "downTwo:", v12);
  LODWORD(v14) = 1115684864;
  objc_msgSend(-[CIMaskedVariableBlur upCubic:scale:](self, "upCubic:scale:", v13, v14), "extent");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  if (v7 < 2)
    v9 = v8;
  if (v7 < 3)
    v10 = v9;
  if (v7 < 4)
    v11 = v10;
  if (v7 < 5)
    v12 = v11;
  if (v7 >= 6)
    v23 = v13;
  else
    v23 = v12;
  v24 = -[CIMaskedVariableBlur _kernelCombine](self, "_kernelCombine");
  inputImage = self->inputImage;
  v26[0] = self->inputMask;
  v26[1] = inputImage;
  v26[2] = v8;
  v26[3] = v9;
  v26[4] = v10;
  v26[5] = v11;
  v26[6] = v12;
  v26[7] = v23;
  v26[8] = self->inputRadius;
  return (id)objc_msgSend(v24, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_23, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 9), v16, v18, v20, v22);
}

double __35__CIMaskedVariableBlur_outputImage__block_invoke(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, unsigned int a6)
{
  double v9;
  float32x2_t v16;
  float32x2_t v17;
  float v19;
  double v20[4];
  Rectangle v21;
  float64x2_t v22[2];
  CGRect v23;

  v9 = a1;
  if (a6 > 1)
  {
    v19 = flt_1924960BC[a6];
    if (CGRectIsInfinite(*(CGRect *)&a1))
    {
      *(int64x2_t *)&v21.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v21.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v23.origin.x = v9;
      v23.origin.y = a2;
      v23.size.width = a3;
      v23.size.height = a4;
      if (CGRectIsNull(v23))
      {
        *(int64x2_t *)&v21.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
        v21.var2 = 0.0;
        v21.var3 = 0.0;
      }
      else
      {
        v21.var0 = v9;
        v21.var1 = a2;
        v21.var2 = a3;
        v21.var3 = a4;
      }
    }
    Rectangle::inset(&v21, 0.5, 0.5, (uint64_t)v22);
    _Q1 = vaddq_f64(v22[0], v22[1]);
    __asm { FMOV            V5.2S, #-1.0 }
    v16 = vadd_f32(vadd_f32(vrndm_f32(vadd_f32(vmul_n_f32(vcvt_f32_f64(vminnmq_f64(v22[0], _Q1)), v19), (float32x2_t)0xBF000000BF000000)), (float32x2_t)0x3F0000003F000000), _D5);
    v17 = vadd_f32(vrndm_f32(vadd_f32(vmul_n_f32(vcvt_f32_f64(vmaxnmq_f64(v22[0], _Q1)), v19), (float32x2_t)0xBF000000BF000000)), (float32x2_t)0x3F0000003F000000);
    __asm { FMOV            V1.2S, #1.0 }
    *(float64x2_t *)&v21.var0 = vcvtq_f64_f32(v16);
    *(float64x2_t *)&v21.var2 = vcvtq_f64_f32(vsub_f32(vadd_f32(v17, *(float32x2_t *)&_Q1.f64[0]), v16));
    Rectangle::integralize(&v21, 0.0001, (uint64_t)v20);
    v9 = v20[0];
    if (v20[0] == -8.98846567e307 && v20[1] == -8.98846567e307 && v20[2] == 1.79769313e308 && v20[3] == 1.79769313e308)
      return *MEMORY[0x1E0C9D5E0];
  }
  return v9;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputMask
{
  return self->inputMask;
}

- (void)setInputMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
