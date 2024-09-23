@implementation CIDisintegrateWithMaskTransition

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryTransition");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("6");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputShadowRadius");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19490;
  v8[1] = &unk_1E2F19490;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F194A0;
  v8[3] = &unk_1E2F194B0;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[4] = CFSTR("inputShadowDensity");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F19490;
  v6[1] = &unk_1E2F194C0;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F19490;
  v6[3] = &unk_1E2F194C0;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F194D0;
  v6[5] = &unk_1E2F19490;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v10[5] = CFSTR("inputShadowOffset");
  v3[0] = CFSTR("CIAttributeDefault");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, -10.0);
  v3[1] = CFSTR("CIAttributeIdentity");
  v3[2] = CFSTR("CIAttributeType");
  v4[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v4[2] = CFSTR("CIAttributeTypeOffset");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_disintegrateWithMask);
}

- (id)_kernelG
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_disintegrateWithMaskG);
}

- (id)outputImage
{
  float v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  float v21;
  double v22;
  float v23;
  CIVector *v24;
  double v25;
  double v26;
  CIImage *inputMaskImage;
  uint64_t v28;
  CIImage *v29;
  uint64_t v30;
  CIImage *v31;
  uint64_t v32;
  id v33;
  CIImage *inputTargetImage;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  _QWORD v39[8];
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v39[7] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputTargetImage || !self->inputMaskImage)
    return 0;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  if (v3 <= 0.0)
    return self->inputImage;
  if (v3 >= 1.0)
    return self->inputTargetImage;
  v4 = v3;
  -[CIImage extent](self->inputImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CIImage extent](self->inputTargetImage, "extent");
  v42.origin.x = v13;
  v42.origin.y = v14;
  v42.size.width = v15;
  v42.size.height = v16;
  v40.origin.x = v6;
  v40.origin.y = v8;
  v40.size.width = v10;
  v40.size.height = v12;
  v41 = CGRectUnion(v40, v42);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  -[NSNumber floatValue](self->inputShadowRadius, "floatValue");
  v22 = 1.0 / v21;
  -[NSNumber floatValue](self->inputShadowDensity, "floatValue");
  v24 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.25, v22, v23, v4);
  -[CIVector X](self->inputShadowOffset, "X");
  *(float *)&v4 = v25;
  -[CIVector Y](self->inputShadowOffset, "Y");
  *(float *)&v22 = v26;
  inputMaskImage = self->inputMaskImage;
  CGAffineTransformMakeTranslation(&v38, 1.0, 0.0);
  v28 = -[CIImage imageByApplyingTransform:](inputMaskImage, "imageByApplyingTransform:", &v38);
  v29 = self->inputMaskImage;
  CGAffineTransformMakeTranslation(&v37, 0.0, 1.0);
  v30 = -[CIImage imageByApplyingTransform:](v29, "imageByApplyingTransform:", &v37);
  v31 = self->inputMaskImage;
  CGAffineTransformMakeTranslation(&v36, *(float *)&v4, *(float *)&v22);
  v32 = -[CIImage imageByApplyingTransform:](v31, "imageByApplyingTransform:", &v36);
  v33 = -[CIDisintegrateWithMaskTransition _kernel](self, "_kernel");
  inputTargetImage = self->inputTargetImage;
  v39[0] = self->inputImage;
  v39[1] = inputTargetImage;
  v39[2] = self->inputMaskImage;
  v39[3] = v28;
  v39[4] = v30;
  v39[5] = v32;
  v39[6] = v24;
  return (id)objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7), x, y, width, height);
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

- (CIImage)inputMaskImage
{
  return self->inputMaskImage;
}

- (void)setInputMaskImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputShadowRadius
{
  return self->inputShadowRadius;
}

- (void)setInputShadowRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputShadowDensity
{
  return self->inputShadowDensity;
}

- (void)setInputShadowDensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CIVector)inputShadowOffset
{
  return self->inputShadowOffset;
}

- (void)setInputShadowOffset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
