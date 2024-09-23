@implementation CINinePartTiled

- (id)_kernelAlt
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_ninePartTiledAlt);
}

- (id)outputImage
{
  CIVector *inputGrowAmount;
  double v4;
  float64x2_t v5;
  float64_t v6;
  float32x2_t v7;
  double v8;
  float v9;
  double v10;
  _BOOL4 v12;
  CIVector *inputBreakpoint0;
  float64_t v14;
  float64x2_t v15;
  float64_t v16;
  CIVector *inputBreakpoint1;
  double v18;
  __int128 v19;
  float32x2_t v20;
  unsigned int v21;
  int8x8_t v22;
  float v23;
  __int32 v24;
  double x;
  double y;
  double width;
  double height;
  _BOOL4 IsInfinite;
  double v30;
  double v31;
  double v32;
  double v33;
  CIVector *v34;
  int8x8_t v35;
  unsigned int v36;
  id v37;
  CIImage *inputImage;
  __int128 v39;
  float v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x2_t v43;
  int8x8_t v44;
  float64_t v45;
  float64_t v46;
  int8x8_t v47;
  _QWORD v48[7];
  BOOL v49;
  _QWORD v50[4];
  CGRect v51;

  v50[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputGrowAmount = self->inputGrowAmount;
  -[CIVector X](inputGrowAmount, "X");
  v45 = v4;
  -[CIVector Y](inputGrowAmount, "Y");
  v5.f64[0] = v45;
  v5.f64[1] = v6;
  v7 = vmaxnm_f32(vcvt_f32_f64(v5), 0);
  v8 = v7.f32[0];
  v9 = v7.f32[1];
  v10 = v7.f32[1];
  if (v7.f32[0] < 0.001 && v10 < 0.001)
    return self->inputImage;
  v41 = v7;
  v12 = -[NSNumber BOOLValue](self->inputFlipYTiles, "BOOLValue");
  inputBreakpoint0 = self->inputBreakpoint0;
  -[CIVector X](inputBreakpoint0, "X");
  v46 = v14;
  -[CIVector Y](inputBreakpoint0, "Y");
  v15.f64[0] = v46;
  v15.f64[1] = v16;
  v43 = vcvt_f32_f64(v15);
  inputBreakpoint1 = self->inputBreakpoint1;
  -[CIVector X](inputBreakpoint1, "X");
  *(float *)&v18 = v18;
  LODWORD(v46) = LODWORD(v18);
  -[CIVector Y](inputBreakpoint1, "Y");
  *(float *)&v19 = *(double *)&v19;
  v39 = v19;
  v20 = vminnm_f32(v43, (float32x2_t)__PAIR64__(v19, LODWORD(v46)));
  *(float32x2_t *)&v19 = vmaxnm_f32(v43, (float32x2_t)__PAIR64__(v19, LODWORD(v46)));
  *(float *)&v21 = *(float *)&v19 + 0.001;
  v22 = vbsl_s8((int8x8_t)vcgtd_f64(0.001, vsub_f32(*(float32x2_t *)&v19, v20).f32[0]), (int8x8_t)__PAIR64__(DWORD1(v19), v21), *(int8x8_t *)&v19);
  v42 = v20;
  v23 = v20.f32[1];
  if ((float)(*(float *)&v22.i32[1] - v20.f32[1]) < 0.001)
  {
    *(float *)&v24 = *(float *)&v22.i32[1] + 0.001;
    v22.i32[1] = v24;
  }
  v47 = v22;
  -[CIImage extent](self->inputImage, "extent", v39);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  IsInfinite = CGRectIsInfinite(v51);
  v30 = -0.0;
  if (IsInfinite)
    v31 = -0.0;
  else
    v31 = v10;
  v32 = height + v31;
  if (!IsInfinite)
    v30 = v8;
  v33 = width + v30;
  v34 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v42.f32[0], v23, *(float *)v47.i32, *(float *)&v47.i32[1]);
  v35.i32[0] = v43.i32[0];
  if (v12)
    v36 = -1;
  else
    v36 = 0;
  *(float *)&v35.i32[1] = v9 + v40;
  v44 = vbsl_s8((int8x8_t)vdup_n_s32(v36), v35, (int8x8_t)v43);
  v37 = -[CINinePartTiled _kernelAlt](self, "_kernelAlt");
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __30__CINinePartTiled_outputImage__block_invoke;
  v48[3] = &__block_descriptor_57_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v48[4] = v42;
  v48[5] = v47;
  v48[6] = v41;
  v49 = v12;
  inputImage = self->inputImage;
  v50[0] = v34;
  v50[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v8, v10);
  v50[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(float *)v44.i32, *(float *)&v44.i32[1]);
  return (id)objc_msgSend(v37, "applyWithExtent:roiCallback:inputImage:arguments:", v48, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3), x, y, v33, v32);
}

double __30__CINinePartTiled_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v7;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v7 = a3 + a5;
  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  LODWORD(v10) = HIDWORD(*(_QWORD *)(a1 + 40));
  LODWORD(v11) = HIDWORD(*(_QWORD *)(a1 + 32));
  LODWORD(v9) = HIDWORD(*(_QWORD *)(a1 + 48));
  minMax(a2, a2 + a4, COERCE_FLOAT(*(_QWORD *)(a1 + 32)), COERCE_FLOAT(*(_QWORD *)(a1 + 40)), COERCE_FLOAT(*(_QWORD *)(a1 + 48)), 0, &v15, &v14);
  minMax(a3, v7, v11, v10, v9, *(unsigned __int8 *)(a1 + 56), &v13, &v12);
  return v15;
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryDistortionEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("10");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.12");
  v12[3] = CFSTR("inputBreakpoint0");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeDefault");
  v10[0] = CFSTR("CIAttributeTypePosition");
  v10[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 50.0, 50.0);
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputBreakpoint1");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v7[0] = CFSTR("CIAttributeType");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputGrowAmount");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeOffset");
  v5[0] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 100.0, 100.0);
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputFlipYTiles");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputBreakpoint0
{
  return self->inputBreakpoint0;
}

- (void)setInputBreakpoint0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputBreakpoint1
{
  return self->inputBreakpoint1;
}

- (void)setInputBreakpoint1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputGrowAmount
{
  return self->inputGrowAmount;
}

- (void)setInputGrowAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputFlipYTiles
{
  return self->inputFlipYTiles;
}

- (void)setInputFlipYTiles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
