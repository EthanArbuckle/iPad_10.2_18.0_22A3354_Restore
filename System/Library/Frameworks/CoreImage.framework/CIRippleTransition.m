@implementation CIRippleTransition

- (id)_CIRippleTransition
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_rippleTransition);
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
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  double v31;
  double v32;
  double v33;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  NSNumber *inputScale;
  double v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  id v75;
  CIImage *inputImage;
  CIImage *inputShadingImage;
  float v79;
  float v80;
  double v81;
  float v82;
  _QWORD v83[5];
  _QWORD v84[8];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  v84[6] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  if (!self->inputImage || !self->inputTargetImage || !self->inputShadingImage)
    return 0;
  v8 = v7;
  v82 = v6;
  v9 = v4 * 0.25;
  v80 = v4 * 0.25;
  -[CIVector X](self->inputCenter, "X");
  v11 = v10;
  -[CIVector Y](self->inputCenter, "Y");
  v13 = v12;
  -[CIVector X](self->inputExtent, "X");
  v15 = v14;
  -[CIVector Y](self->inputExtent, "Y");
  v17 = v16;
  -[CIVector Z](self->inputExtent, "Z");
  v19 = v18 + v15;
  -[CIVector W](self->inputExtent, "W");
  v21 = v20 + v17;
  v22 = v15 - v11;
  v23 = (float)(v17 - v13) * (float)(v17 - v13);
  v24 = sqrtf(v23 + (float)(v22 * v22));
  v25 = v19 - v11;
  v26 = sqrtf(v23 + (float)(v25 * v25));
  if (v26 <= v24)
    v26 = v24;
  v27 = (float)(v21 - v13) * (float)(v21 - v13);
  v28 = sqrtf(v27 + (float)(v22 * v22));
  if (v28 <= v26)
    v28 = v26;
  v29 = sqrtf(v27 + (float)(v25 * v25));
  if (v29 <= v28)
    v29 = v28;
  v30 = v9 * -9.0 + v8 * (v29 + v9 * 9.0);
  v79 = v30;
  -[CIImage extent](self->inputShadingImage, "extent");
  v32 = v31;
  v81 = v33;
  -[CIImage extent](self->inputImage, "extent");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  -[CIImage extent](self->inputTargetImage, "extent");
  v89.origin.x = v42;
  v89.origin.y = v43;
  v89.size.width = v44;
  v89.size.height = v45;
  v85.origin.x = v35;
  v85.origin.y = v37;
  v85.size.width = v39;
  v85.size.height = v41;
  v86 = CGRectUnion(v85, v89);
  x = v86.origin.x;
  y = v86.origin.y;
  width = v86.size.width;
  height = v86.size.height;
  -[CIVector X](self->inputExtent, "X");
  v51 = v50;
  -[CIVector Y](self->inputExtent, "Y");
  v53 = v52;
  -[CIVector Z](self->inputExtent, "Z");
  v55 = v54;
  -[CIVector W](self->inputExtent, "W");
  v90.size.height = v56;
  v87.origin.x = x;
  v87.origin.y = y;
  v87.size.width = width;
  v87.size.height = height;
  v90.origin.x = v51;
  v90.origin.y = v53;
  v90.size.width = v55;
  v88 = CGRectUnion(v87, v90);
  v57 = v88.origin.x;
  v58 = v88.origin.y;
  v59 = v88.size.width;
  v60 = v88.size.height;
  -[CIImage extent](self->inputShadingImage, "extent");
  v62 = v61;
  v64 = v63;
  v65 = (void *)MEMORY[0x1E0C99D20];
  inputScale = self->inputScale;
  *(float *)&v51 = v67;
  LODWORD(v67) = LODWORD(v51);
  v68 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
  LODWORD(v69) = LODWORD(v51);
  v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
  *(float *)&v71 = v62;
  v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
  *(float *)&v73 = v64;
  v74 = objc_msgSend(v65, "arrayWithObjects:", inputScale, v68, v70, v72, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73), 0);
  v75 = -[CIRippleTransition _CIRippleTransition](self, "_CIRippleTransition");
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __33__CIRippleTransition_outputImage__block_invoke;
  v83[3] = &unk_1E2EC3588;
  inputImage = self->inputImage;
  v83[4] = v74;
  v84[0] = inputImage;
  inputShadingImage = self->inputShadingImage;
  v84[1] = self->inputTargetImage;
  v84[2] = inputShadingImage;
  v84[3] = self->inputCenter;
  v84[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v79, (float)(1.0 / v80), 0.333333343, v82);
  v84[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v32, v81);
  return (id)objc_msgSend(v75, "applyWithExtent:roiCallback:arguments:", v83, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 6), v57, v58, v59, v60);
}

double __33__CIRippleTransition_outputImage__block_invoke(uint64_t a1, unsigned int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v6;
  void *v7;
  float v12;
  CGFloat v13;
  float v14;
  CGRect v16;

  v7 = *(void **)(a1 + 32);
  if (a2 >= 2)
  {
    if (a2 == 2)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 1), "floatValue");
      v6 = v14;
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "floatValue");
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 3), "floatValue");
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 4), "floatValue");
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "floatValue");
    if (v12 >= 0.0)
      v12 = -v12;
    v13 = v12;
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    *(_QWORD *)&v6 = (unint64_t)CGRectInset(v16, v13, v13);
  }
  return v6;
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryTransition");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("9");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputTime");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1A9D0;
  v10[1] = &unk_1E2F1A9D0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1A9E0;
  v10[3] = &unk_1E2F1A9D0;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeTime");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v12[4] = CFSTR("inputWidth");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1A9E0;
  v8[1] = &unk_1E2F1A9F0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1AA00;
  v8[3] = &unk_1E2F1AA10;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputScale");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1AA20;
  v6[1] = &unk_1E2F1AA20;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1AA30;
  v6[3] = &unk_1E2F1AA30;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1A9D0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v12[6] = CFSTR("inputExtent");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeRectangle");
  v3[0] = CFSTR("CIAttributeType");
  v4[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
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

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIImage)inputShadingImage
{
  return self->inputShadingImage;
}

- (void)setInputShadingImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
