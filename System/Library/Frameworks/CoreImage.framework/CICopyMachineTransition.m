@implementation CICopyMachineTransition

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryTransition");
  v15[1] = CFSTR("CICategoryVideo");
  v15[2] = CFSTR("CICategoryStillImage");
  v15[3] = CFSTR("CICategoryBuiltIn");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v17[1] = CFSTR("6");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.4");
  v16[3] = CFSTR("inputTime");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F192A0;
  v14[1] = &unk_1E2F192A0;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeDefault");
  v14[2] = &unk_1E2F192B0;
  v14[3] = &unk_1E2F192A0;
  v13[4] = CFSTR("CIAttributeType");
  v14[4] = CFSTR("CIAttributeTypeTime");
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v16[4] = CFSTR("inputAngle");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F192A0;
  v12[1] = &unk_1E2F192A0;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F192C0;
  v12[3] = &unk_1E2F192A0;
  v11[4] = CFSTR("CIAttributeIdentity");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F192A0;
  v12[5] = CFSTR("CIAttributeTypeAngle");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v16[5] = CFSTR("inputWidth");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F192D0;
  v10[1] = &unk_1E2F192D0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F192E0;
  v10[3] = &unk_1E2F192F0;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F192F0;
  v10[5] = CFSTR("CIAttributeTypeDistance");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v16[6] = CFSTR("inputOpacity");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F192A0;
  v8[1] = &unk_1E2F192A0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19300;
  v8[3] = &unk_1E2F19310;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F19310;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v16[7] = CFSTR("inputExtent");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeRectangle");
  v5[0] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v16[8] = CFSTR("inputColor");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.6, 1.0, 0.8);
  v4[1] = CFSTR("CIAttributeTypeOpaqueColor");
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_copyMachineTransition);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  int32x2_t v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  unsigned int v12;
  float32x2_t v13;
  double v14;
  __float2 v15;
  float32x2_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double x;
  double y;
  double width;
  double height;
  CIVector *v50;
  CIVector *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CIVector *v59;
  CIVector *v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CIImage *inputTargetImage;
  double v67;
  double v68;
  float v69;
  double v70;
  float32x2_t v71;
  float v72;
  float32x2_t v73;
  float v74;
  int32x2_t v75;
  int32x2_t v76;
  float v77;
  __int32 v78;
  float32x2_t v79;
  float v80;
  float v81;
  float32x2_t v82;
  double v83;
  _QWORD v84[7];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v84[6] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputTargetImage)
    return 0;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  *(double *)&v6 = fmax(v5, 0.1);
  *(float *)v6.i32 = *(double *)v6.i32;
  v75 = v6;
  -[NSNumber floatValue](self->inputOpacity, "floatValue");
  v77 = v7;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v9 = v8;
  -[CIVector X](self->inputExtent, "X");
  *(float *)&v10 = v10;
  v81 = *(float *)&v10;
  -[CIVector X](self->inputExtent, "X");
  *(float *)&v12 = v11;
  v69 = *(float *)&v12;
  v73 = (float32x2_t)__PAIR64__(v12, LODWORD(v81));
  -[CIVector Z](self->inputExtent, "Z");
  v13.f32[0] = *(double *)&v13 + v81;
  v78 = v13.i32[0];
  v13.f32[1] = v69;
  v71 = v13;
  -[CIVector W](self->inputExtent, "W");
  *(float *)&v14 = v14 + v69;
  v82 = (float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v81));
  v79 = (float32x2_t)__PAIR64__(LODWORD(v14), v78);
  v15 = __sincosf_stret(v4);
  v16 = vdiv_f32((float32x2_t)__PAIR64__(LODWORD(v15.__sinval), LODWORD(v15.__cosval)), (float32x2_t)vdup_lane_s32(v75, 0));
  v17 = vaddv_f32(vmul_f32(v16, v73));
  v18 = vaddv_f32(vmul_f32(v16, v71));
  v19 = fminf(v17, v18);
  v20 = fmaxf(v17, v18);
  v21 = vaddv_f32(vmul_f32(v16, v82));
  v22 = fminf(v19, v21);
  v23 = fmaxf(v20, v21);
  v76 = (int32x2_t)v16;
  v24 = vaddv_f32(vmul_f32(v16, v79));
  v74 = fminf(v22, v24);
  v72 = (float)(v74 - fmaxf(v23, v24)) + -1.0;
  if (v9 >= 0.65)
  {
    v80 = 1.0 - (float)((float)((float)(v9 + -0.65) / 0.35) * (float)((float)(v9 + -0.65) / 0.35));
    v83 = 1.0;
    v70 = -5.88235235;
    -[CIVector X](self->inputExtent, "X", 0x3FF346F0A0000000, 0x4017878760000000);
  }
  else
  {
    v83 = 0.0;
    v70 = -1.20481932;
    v80 = v9 / 0.65;
    -[CIVector X](self->inputExtent, "X", 0x4017878760000000, 0x3FF346F0A0000000);
  }
  v27 = v25;
  -[CIVector Y](self->inputExtent, "Y");
  v29 = v28;
  -[CIVector Z](self->inputExtent, "Z");
  v31 = v30;
  -[CIVector W](self->inputExtent, "W");
  v33 = v32;
  -[CIImage extent](self->inputImage, "extent");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  -[CIImage extent](self->inputTargetImage, "extent");
  v88.origin.x = v42;
  v88.origin.y = v43;
  v88.size.width = v44;
  v88.size.height = v45;
  v85.origin.x = v35;
  v85.origin.y = v37;
  v85.size.width = v39;
  v85.size.height = v41;
  v86 = CGRectUnion(v85, v88);
  v89.origin.x = v27;
  v89.origin.y = v29;
  v89.size.width = v31;
  v89.size.height = v33;
  v87 = CGRectUnion(v86, v89);
  x = v87.origin.x;
  y = v87.origin.y;
  width = v87.size.width;
  height = v87.size.height;
  v50 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v70, v68, v67);
  v51 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)-*(float *)v76.i32, (float)-*(float *)&v76.i32[1], (float)-v72, (float)((float)(v74 + -1.0) + 1.0));
  -[CIColor red](self->inputColor, "red");
  v53 = v52;
  -[CIColor green](self->inputColor, "green");
  v55 = v54;
  -[CIColor blue](self->inputColor, "blue");
  v57 = v56;
  -[CIColor alpha](self->inputColor, "alpha");
  v59 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v53, v55, v57, v58);
  v60 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v80, v77, v83);
  v61 = -[CICopyMachineTransition _kernel](self, "_kernel");
  v62 = *MEMORY[0x1E0C9D5E0];
  v63 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v64 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v65 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  inputTargetImage = self->inputTargetImage;
  v84[0] = self->inputImage;
  v84[1] = inputTargetImage;
  v84[2] = v50;
  v84[3] = v51;
  v84[4] = v59;
  v84[5] = v60;
  return (id)objc_msgSend((id)objc_msgSend(v61, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 6), v62, v63, v64, v65), "imageByCroppingToRect:", x, y, width, height);
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
