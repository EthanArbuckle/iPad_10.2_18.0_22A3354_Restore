@implementation CIFlashTransition

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[11];
  _QWORD v21[12];

  v21[11] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("CIAttributeFilterCategories");
  v19[0] = CFSTR("CICategoryTransition");
  v19[1] = CFSTR("CICategoryVideo");
  v19[2] = CFSTR("CICategoryStillImage");
  v19[3] = CFSTR("CICategoryBuiltIn");
  v21[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v21[1] = CFSTR("6");
  v20[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v20[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v21[2] = CFSTR("10.4");
  v20[3] = CFSTR("inputCenter");
  v17[0] = CFSTR("CIAttributeDefault");
  v17[1] = CFSTR("CIAttributeType");
  v18[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v18[1] = CFSTR("CIAttributeTypePosition");
  v21[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v20[4] = CFSTR("inputExtent");
  v15[1] = CFSTR("CIAttributeDefault");
  v16[0] = CFSTR("CIAttributeTypeRectangle");
  v15[0] = CFSTR("CIAttributeType");
  v16[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v21[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v20[5] = CFSTR("inputColor");
  v13[0] = CFSTR("CIAttributeDefault");
  v13[1] = CFSTR("CIAttributeType");
  v14[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 0.8, 0.6);
  v14[1] = CFSTR("CIAttributeTypeColor");
  v21[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v20[6] = CFSTR("inputTime");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F19B90;
  v12[1] = &unk_1E2F19B90;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F19BA0;
  v12[3] = &unk_1E2F19B90;
  v11[4] = CFSTR("CIAttributeType");
  v12[4] = CFSTR("CIAttributeTypeTime");
  v21[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v20[7] = CFSTR("inputMaxStriationRadius");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F19B90;
  v10[1] = &unk_1E2F19B90;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F19BB0;
  v10[3] = &unk_1E2F19BC0;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeScalar");
  v21[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v20[8] = CFSTR("inputStriationStrength");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19B90;
  v8[1] = &unk_1E2F19B90;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19BD0;
  v8[3] = &unk_1E2F19BE0;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v21[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v20[9] = CFSTR("inputStriationContrast");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19B90;
  v6[1] = &unk_1E2F19B90;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19BF0;
  v6[3] = &unk_1E2F19C00;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v21[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v20[10] = CFSTR("inputFadeThreshold");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F19B90;
  v4[1] = &unk_1E2F19BA0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19B90;
  v4[3] = &unk_1E2F19BA0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19C10;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v21[10] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 11);
}

- (id)_colorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flashColor);
}

- (id)_geomKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_flashGeom);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  double v17;
  double v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CIVector *v53;
  CIVector *v54;
  id v55;
  id v56;
  double *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  BOOL v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CIImage *inputTargetImage;
  CIColor *inputColor;
  float v86;
  unsigned int v87;
  float v88;
  id v89;
  float v90;
  float32x2_t v91;
  double v92;
  float32x2_t v93;
  double v94;
  float32x2_t v95;
  double v96;
  float rect1a;
  double rect1;
  float v99;
  _QWORD v100[7];
  _QWORD v101[3];
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v101[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputTargetImage)
    return 0;
  -[NSNumber floatValue](self->inputMaxStriationRadius, "floatValue");
  v88 = v3;
  -[NSNumber floatValue](self->inputStriationStrength, "floatValue");
  v5 = v4;
  -[NSNumber floatValue](self->inputStriationContrast, "floatValue");
  v7 = v6;
  -[NSNumber floatValue](self->inputFadeThreshold, "floatValue");
  v9 = v8;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v11 = v10;
  -[CIVector X](self->inputCenter, "X");
  *(float *)&v12 = v12;
  v99 = *(float *)&v12;
  -[CIVector Y](self->inputCenter, "Y");
  *(float *)&v13 = v13;
  v90 = *(float *)&v13;
  v95 = (float32x2_t)__PAIR64__(LODWORD(v13), LODWORD(v99));
  -[CIVector X](self->inputExtent, "X");
  *(float *)&v14 = v14;
  rect1a = *(float *)&v14;
  -[CIVector X](self->inputExtent, "X");
  *(float *)&v16 = v15;
  LODWORD(v86) = v16;
  v93 = (float32x2_t)__PAIR64__(v16, LODWORD(rect1a));
  -[CIVector Z](self->inputExtent, "Z");
  *(float *)&v17 = v17 + rect1a;
  v87 = LODWORD(v17);
  v91 = (float32x2_t)__PAIR64__(LODWORD(v86), LODWORD(v17));
  -[CIVector W](self->inputExtent, "W");
  *(float *)&v18 = v18 + v86;
  v19 = (float32x2_t)__PAIR64__(LODWORD(v18), LODWORD(rect1a));
  v20 = (float32x2_t)__PAIR64__(LODWORD(v18), v87);
  v21 = vsub_f32(v93, v95);
  v22 = vsub_f32(v91, v95);
  v21.f32[0] = fmaxf(sqrtf(vaddv_f32(vmul_f32(v21, v21))), sqrtf(vaddv_f32(vmul_f32(v22, v22))));
  v23 = vsub_f32(v19, v95);
  v21.f32[0] = fmaxf(v21.f32[0], sqrtf(vaddv_f32(vmul_f32(v23, v23))));
  v24 = vsub_f32(v20, v95);
  v25 = fmaxf(v21.f32[0], sqrtf(vaddv_f32(vmul_f32(v24, v24))));
  v26 = (float)(v11 - v9) / (1.0 - v9);
  v27 = v26;
  if (v11 >= 1.0)
    v27 = 1.0;
  if (v11 >= v9)
    v28 = v27;
  else
    v28 = 0.0;
  v29 = log10f(v25) + 1.0;
  if (v9 == 0.0)
    v30 = v11 / 0.000001;
  else
    v30 = (float)(v11 / v9);
  v32 = __exp10(v30 * v29 + -1.0);
  -[CIImage extent](self->inputImage, "extent");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  -[CIImage extent](self->inputTargetImage, "extent");
  v110.origin.x = v41;
  v110.origin.y = v42;
  v110.size.width = v43;
  v110.size.height = v44;
  v102.origin.x = v34;
  v102.origin.y = v36;
  v102.size.width = v38;
  v102.size.height = v40;
  v103 = CGRectUnion(v102, v110);
  x = v103.origin.x;
  y = v103.origin.y;
  width = v103.size.width;
  height = v103.size.height;
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v111.origin.x = v49;
  v111.origin.y = v50;
  v111.size.width = v51;
  v111.size.height = v52;
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = width;
  v104.size.height = height;
  v105 = CGRectUnion(v104, v111);
  v92 = v105.origin.x;
  v94 = v105.origin.y;
  v96 = v105.size.width;
  rect1 = v105.size.height;
  v53 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 100.0, (float)(v32 * v32), 1.0 / (float)(v88 * v32), v28);
  v54 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)(v5 * v7), (1.0 - v7) * v5 * 0.5);
  v55 = -[CIFlashTransition _geomKernel](self, "_geomKernel");
  v89 = -[CIFlashTransition _colorKernel](self, "_colorKernel");
  v56 = +[CIImage noiseImage](CIImage, "noiseImage");
  v57 = (double *)MEMORY[0x1E0C9D5E0];
  v58 = *MEMORY[0x1E0C9D5E0];
  v59 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v60 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v61 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v101[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v99, v90);
  v62 = objc_msgSend(v55, "applyWithExtent:roiCallback:inputImage:arguments:", &__block_literal_global_31, v56, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 1), v58, v59, v60, v61);
  -[CIVector Z](v53, "Z");
  v64 = 1.0 / v63;
  v65 = v99 - v64;
  v66 = v90 - v64;
  v67 = v64 + v64;
  v69 = v64 + v64 == 1.79769313e308 && v65 == -8.98846567e307 && v66 == -8.98846567e307;
  v70 = v64 + v64;
  if (v69)
  {
    v67 = v57[2];
    v70 = v57[3];
    v65 = *v57;
    v66 = v57[1];
  }
  -[CIImage extent](self->inputImage, "extent");
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v78 = v77;
  -[CIImage extent](self->inputTargetImage, "extent");
  v112.origin.x = v79;
  v112.origin.y = v80;
  v112.size.width = v81;
  v112.size.height = v82;
  v106.origin.x = v72;
  v106.origin.y = v74;
  v106.size.width = v76;
  v106.size.height = v78;
  v107 = CGRectUnion(v106, v112);
  v113.origin.x = v65;
  v113.origin.y = v66;
  v113.size.width = v67;
  v113.size.height = v70;
  v108 = CGRectUnion(v107, v113);
  inputTargetImage = self->inputTargetImage;
  v100[0] = self->inputImage;
  v100[1] = inputTargetImage;
  inputColor = self->inputColor;
  v100[2] = self->inputCenter;
  v100[3] = inputColor;
  v100[4] = v62;
  v100[5] = v53;
  v100[6] = v54;
  v31 = (void *)objc_msgSend(v89, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 7), v108.origin.x, v108.origin.y, v108.size.width, v108.size.height);
  v109.origin.x = v92;
  v109.origin.y = v94;
  v109.size.width = v96;
  v109.size.height = rect1;
  v114.origin.x = v65;
  v114.origin.y = v66;
  v114.size.width = v67;
  v114.size.height = v70;
  if (!CGRectContainsRect(v109, v114))
    return (id)objc_msgSend(v31, "imageByCroppingToRect:", v92, v94, v96, rect1);
  return v31;
}

double __32__CIFlashTransition_outputImage__block_invoke()
{
  return 26.0;
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

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputMaxStriationRadius
{
  return self->inputMaxStriationRadius;
}

- (void)setInputMaxStriationRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputStriationStrength
{
  return self->inputStriationStrength;
}

- (void)setInputStriationStrength:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputStriationContrast
{
  return self->inputStriationContrast;
}

- (void)setInputStriationContrast:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)inputFadeThreshold
{
  return self->inputFadeThreshold;
}

- (void)setInputFadeThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

@end
