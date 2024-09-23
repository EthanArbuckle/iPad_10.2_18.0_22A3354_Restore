@implementation CUIHueSaturationFilter

- (float)centerAngleDegrees
{
  float v2;
  float result;

  -[NSNumber floatValue](self->inputCenterAngle, "floatValue");
  result = v2 * 57.2957795;
  if (result < 0.0)
    result = result + 360.0;
  if (result > 360.0)
    return result + -360.0;
  return result;
}

- (float)angleWidthDegrees
{
  float v2;
  float result;

  -[NSNumber floatValue](self->inputAngleWidth, "floatValue");
  result = v2 * 57.2957795;
  if (result < 0.0)
    result = 0.0;
  if (result > 360.0)
    return 360.0;
  return result;
}

- (HSV)tintColorToHSV
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  HSV result;

  -[CIColor red](self->inputTintColor, "red");
  v4 = v3;
  -[CIColor green](self->inputTintColor, "green");
  v6 = v5;
  -[CIColor blue](self->inputTintColor, "blue");
  v8 = v7;
  -[CIColor alpha](self->inputTintColor, "alpha");
  v9 = v4;
  v10 = v6;
  v11 = v8;
  v12 = fminf(v9, fminf(v10, v11));
  v13 = fmaxf(v9, fmaxf(v10, v11));
  v14 = v13 - v12;
  v15 = v14 / v13;
  v16 = 0.0;
  if (v13 == 0.0)
    v15 = 0.0;
  if (v15 != 0.0)
  {
    v17 = v14;
    if (v4 == v13)
    {
      v18 = (v6 - v8) / v17;
    }
    else
    {
      v19 = (v4 - v6) / v17 + 4.0;
      v18 = (v8 - v4) / v17 + 2.0;
      if (v6 != v13)
        v18 = v19;
    }
    v20 = v18;
    v16 = v20 / 6.0;
    if (v16 < 0.0)
      v16 = v16 + 1.0;
  }
  v21 = v16 * 360.0;
  if (v21 < 0.0)
    v21 = v21 + 360.0;
  if (v21 > 360.0)
    v21 = v21 + -360.0;
  v22 = 1.0 - (float)(v15 + v15);
  v23 = 1.0 - (float)(v13 + v13);
  result.var2 = v23;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (CGColor)_newColorByProcessingColor:(CGColor *)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float32x2_t v11;
  float32x2_t v12;
  CGColorSpace *ColorSpace;
  uint64_t *v14;
  size_t NumberOfComponents;
  float64x2_t v17;
  float32x4_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  int8x16_t v31;
  double v32;
  float v33;
  float v34;
  int v35;
  float v36;
  float64x2_t v37;
  float64x2_t v39;
  float v40;
  int32x2_t v41;
  float32x2_t v42;
  float v43;
  float32x2_t v45;
  float32x2_t v46;
  CGFloat components[2];
  float64x2_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[CUIHueSaturationFilter centerAngleDegrees](self, "centerAngleDegrees");
  v6 = v5;
  -[CUIHueSaturationFilter angleWidthDegrees](self, "angleWidthDegrees");
  v8 = v7;
  -[CUIHueSaturationFilter tintColorToHSV](self, "tintColorToHSV");
  v10 = v9;
  v46 = v11;
  v45 = v12;
  ColorSpace = CGColorGetColorSpace(a3);
  v14 = (uint64_t *)CGColorGetComponents(a3);
  NumberOfComponents = CGColorGetNumberOfComponents(a3);
  _Q1 = (float64x2_t)xmmword_1924948F0;
  v17 = 0uLL;
  switch(NumberOfComponents)
  {
    case 0uLL:
      break;
    case 1uLL:
      __asm { FMOV            V1.2D, #1.0 }
      *(_QWORD *)&_Q1.f64[0] = *v14;
      v17 = (float64x2_t)vdupq_lane_s64(*v14, 0);
      break;
    case 2uLL:
      _Q1 = *(float64x2_t *)v14;
      v17 = (float64x2_t)vdupq_lane_s64(*v14, 0);
      break;
    case 3uLL:
      v17 = *(float64x2_t *)v14;
      __asm { FMOV            V1.2D, #1.0 }
      *(_QWORD *)&_Q1.f64[0] = v14[2];
      break;
    default:
      v17 = *(float64x2_t *)v14;
      _Q1 = *((float64x2_t *)v14 + 1);
      break;
  }
  v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), _Q1);
  if (v8 > 0.0)
  {
    *(float *)_Q1.f64 = fminf(v22.f32[0], fminf(v22.f32[1], v22.f32[2]));
    v23 = fmaxf(v22.f32[0], fmaxf(v22.f32[1], v22.f32[2]));
    v24 = v23 - *(float *)_Q1.f64;
    v25 = (float)(v23 - *(float *)_Q1.f64) / v23;
    v26 = 0.0;
    if (v23 == 0.0)
      v25 = 0.0;
    if (v25 != 0.0)
    {
      v27 = (float)((float)(v22.f32[0] - v22.f32[1]) / v24) + 4.0;
      if (v23 == v22.f32[1])
        v27 = (float)((float)(v22.f32[2] - v22.f32[0]) / v24) + 2.0;
      v28 = (float)(v22.f32[1] - v22.f32[2]) / v24;
      if (v23 != v22.f32[0])
        v28 = v27;
      v26 = v28 / 6.0;
      if ((float)(v28 / 6.0) < 0.0)
        v26 = v26 + 1.0;
    }
    v29 = (float)((float)(v26 * 360.0) - v6) / 6.0;
    v30 = v29 + 360.0;
    if (v29 >= 0.0)
      v30 = (float)((float)(v26 * 360.0) - v6) / 6.0;
    if (v8 * 0.5 > v30)
    {
      if (v25 == 0.0)
      {
        v31.i64[0] = 0;
        v31.i32[2] = 0;
        v31.i32[3] = v22.i32[3];
      }
      else
      {
        v32 = v25;
        v33 = v10 + v30;
        if (v33 < 0.0)
          v33 = v33 + 360.0;
        if (v33 > 360.0)
          v33 = v33 + -360.0;
        v34 = v33 / 60.0;
        v35 = (int)v34;
        v36 = v34 - floorf(v34);
        v37.f64[0] = v25;
        v37.f64[1] = (float)(v25 * v36);
        __asm { FMOV            V3.2D, #1.0 }
        v39 = vmulq_n_f64(vsubq_f64(_Q3, v37), v23);
        *(float32x2_t *)&v39.f64[0] = vcvt_f32_f64(v39);
        v40 = (1.0 - v32 * (1.0 - v36)) * v23;
        switch(v35)
        {
          case 0:
            v22.i64[0] = __PAIR64__(LODWORD(v40), LODWORD(v23));
            v22.i32[2] = LODWORD(v39.f64[0]);
            goto LABEL_30;
          case 1:
            v31 = (int8x16_t)vtrn2q_s32((int32x4_t)v39, (int32x4_t)v22);
            *(float *)&v31.i32[1] = v23;
            v31.i32[2] = LODWORD(v39.f64[0]);
            break;
          case 2:
            HIDWORD(v39.f64[1]) = vextq_s8(*(int8x16_t *)&v22, *(int8x16_t *)&v22, 8uLL).i32[1];
            *((float *)v39.f64 + 1) = v23;
            *(float *)&v39.f64[1] = v40;
            goto LABEL_33;
          case 3:
            HIDWORD(v39.f64[1]) = vextq_s8(*(int8x16_t *)&v22, *(int8x16_t *)&v22, 8uLL).i32[1];
            *(float *)&v39.f64[1] = v23;
LABEL_33:
            v31 = (int8x16_t)v39;
            break;
          case 4:
            v22.i64[0] = __PAIR64__(LODWORD(v39.f64[0]), LODWORD(v40));
            v22.f32[2] = v23;
            goto LABEL_30;
          default:
            v22.i64[0] = __PAIR64__(LODWORD(v39.f64[0]), LODWORD(v23));
            v22.i32[2] = HIDWORD(v39.f64[0]);
LABEL_30:
            v31 = (int8x16_t)v22;
            break;
        }
      }
      v41 = (int32x2_t)vsub_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&_Q1.f64[0], 0));
      v42 = vmls_lane_f32(*(float32x2_t *)v31.i8, (float32x2_t)v41, v45, 0);
      v43 = *(float *)&v31.i32[2] - (float)((float)(*(float *)&v31.i32[2] - *(float *)_Q1.f64) * v45.f32[0]);
      *(float *)v41.i32 = (float)(v43 + vaddv_f32(v42)) / 3.0;
      *(float32x2_t *)v22.f32 = vmls_lane_f32(v42, vsub_f32(v42, (float32x2_t)vdup_lane_s32(v41, 0)), v46, 0);
      v22.i32[3] = vextq_s8(v31, v31, 8uLL).i32[1];
      v22.f32[2] = v43 - (float)((float)(v43 - *(float *)v41.i32) * v46.f32[0]);
    }
  }
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v22.f32);
  v48 = vcvt_hight_f64_f32(v22);
  return CGColorCreate(ColorSpace, components);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[3];
  _QWORD v10[5];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("inputCenterAngle");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1B2D0;
  v8[1] = &unk_1E2F1B2D0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1B340;
  v8[3] = &unk_1E2F1B340;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1B370;
  v8[5] = CFSTR("CIAttributeTypeAngle");
  v10[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v9[1] = CFSTR("inputAngleWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1B2D0;
  v6[1] = &unk_1E2F1B2D0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F1B340;
  v6[3] = &unk_1E2F1B380;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B350;
  v6[5] = CFSTR("CIAttributeTypeAngle");
  v10[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v9[2] = CFSTR("inputTintColor");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor redColor](CIColor, "redColor", CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v10[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
}

- (id)outputImage
{
  int v3;
  int v4;
  float v5;
  float v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  CIColorKernel *v13;
  CIColorKernel *v14;
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
  double v27;
  _QWORD v28[7];
  CGRect v29;

  v28[6] = *MEMORY[0x1E0C80C00];
  -[CUIHueSaturationFilter centerAngleDegrees](self, "centerAngleDegrees");
  v4 = v3;
  -[CUIHueSaturationFilter angleWidthDegrees](self, "angleWidthDegrees");
  v6 = v5;
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v29))
    return self->inputImage;
  if (v6 == 0.0)
    return self->inputImage;
  -[CUIHueSaturationFilter tintColorToHSV](self, "tintColorToHSV");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cui_hueSaturation);
  if (!v13)
    return self->inputImage;
  v14 = v13;
  -[CIImage extent](self->inputImage, "extent");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v27 = v21;
  v28[0] = self->inputImage;
  LODWORD(v15) = v4;
  v28[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  *(float *)&v22 = v6;
  v28[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  LODWORD(v23) = v8;
  v28[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  LODWORD(v24) = v10;
  v28[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  LODWORD(v25) = v12;
  v28[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  return -[CIColorKernel applyWithExtent:arguments:](v14, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6), v16, v18, v20, v27);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputCenterAngle
{
  return self->inputCenterAngle;
}

- (void)setInputCenterAngle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputAngleWidth
{
  return self->inputAngleWidth;
}

- (void)setInputAngleWidth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CIColor)inputTintColor
{
  return self->inputTintColor;
}

- (void)setInputTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
