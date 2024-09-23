@implementation CISwipeTransition

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryTransition");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("6");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.4");
  v14[3] = CFSTR("inputWidth");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1AF20;
  v12[1] = &unk_1E2F1AF20;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1AF30;
  v12[3] = &unk_1E2F1AF40;
  v11[4] = CFSTR("CIAttributeType");
  v12[4] = CFSTR("CIAttributeTypeDistance");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v14[4] = CFSTR("inputOpacity");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1AF50;
  v10[1] = &unk_1E2F1AF50;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1AF60;
  v10[3] = &unk_1E2F1AF50;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1AF50;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v14[5] = CFSTR("inputColor");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v8[1] = CFSTR("CIAttributeTypeOpaqueColor");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v14[6] = CFSTR("inputExtent");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeRectangle");
  v5[0] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputAngle");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1AF70;
  v4[1] = &unk_1E2F1AF80;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F1AF50;
  v4[3] = &unk_1E2F1AF50;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeAngle");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_swipeTransition);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  int32x2_t v9;
  float v10;
  double v11;
  double v12;
  unsigned int v13;
  float32x2_t v14;
  double v15;
  __float2 v16;
  float32x2_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  CIVector *v27;
  CIColor *inputColor;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CIImage *inputTargetImage;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  float v49;
  float32x2_t v50;
  float32x2_t v51;
  int32x2_t v52;
  __int32 v53;
  float32x2_t v54;
  float v55;
  float32x2_t v56;
  _QWORD v57[5];
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v57[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputOpacity, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  if (!self->inputImage || !self->inputTargetImage)
    return 0;
  v10 = *(float *)v9.i32;
  *(float *)v9.i32 = fmaxf(v6, 0.1);
  v52 = v9;
  -[CIVector X](self->inputExtent, "X");
  *(float *)&v11 = v11;
  v55 = *(float *)&v11;
  -[CIVector Y](self->inputExtent, "Y");
  *(float *)&v13 = v12;
  v49 = *(float *)&v13;
  v51 = (float32x2_t)__PAIR64__(v13, LODWORD(v55));
  -[CIVector Z](self->inputExtent, "Z");
  v14.f32[0] = *(double *)&v14 + v55;
  v53 = v14.i32[0];
  v14.f32[1] = v49;
  v50 = v14;
  -[CIVector W](self->inputExtent, "W");
  *(float *)&v15 = v15 + v49;
  v56 = (float32x2_t)__PAIR64__(LODWORD(v15), LODWORD(v55));
  v54 = (float32x2_t)__PAIR64__(LODWORD(v15), v53);
  v16 = __sincosf_stret(v4);
  v17 = vdiv_f32((float32x2_t)__PAIR64__(LODWORD(v16.__sinval), LODWORD(v16.__cosval)), (float32x2_t)vdup_lane_s32(v52, 0));
  v18 = vaddv_f32(vmul_f32(v17, v51));
  v19 = vaddv_f32(vmul_f32(v17, v50));
  v20 = fminf(v18, v19);
  v21 = fmaxf(v18, v19);
  v22 = vaddv_f32(vmul_f32(v17, v56));
  v23 = fminf(v20, v22);
  v24 = fmaxf(v21, v22);
  v25 = vaddv_f32(vmul_f32(v17, v54));
  v26 = fminf(v23, v25);
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v17.f32[0], v17.f32[1], (float)((float)(1.0 - v26) + (float)((float)((float)(v26 - fmaxf(v24, v25)) + -1.0) * v10)), fminf(fmaxf(v8, 0.0), 1.0));
  inputColor = self->inputColor;
  if (!inputColor)
    inputColor = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v29 = -[CISwipeTransition _kernel](self, "_kernel");
  v30 = *MEMORY[0x1E0C9D5E0];
  v31 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v32 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v33 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  inputTargetImage = self->inputTargetImage;
  v57[0] = self->inputImage;
  v57[1] = inputTargetImage;
  v57[2] = inputColor;
  v57[3] = v27;
  v35 = (void *)objc_msgSend(v29, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4), v30, v31, v32, v33);
  -[CIImage extent](self->inputImage, "extent");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[CIImage extent](self->inputTargetImage, "extent");
  v60.origin.x = v44;
  v60.origin.y = v45;
  v60.size.width = v46;
  v60.size.height = v47;
  v58.origin.x = v37;
  v58.origin.y = v39;
  v58.size.width = v41;
  v58.size.height = v43;
  v59 = CGRectUnion(v58, v60);
  return (id)objc_msgSend(v35, "imageByCroppingToRect:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputOpacity
{
  return self->inputOpacity;
}

- (void)setInputOpacity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

@end
