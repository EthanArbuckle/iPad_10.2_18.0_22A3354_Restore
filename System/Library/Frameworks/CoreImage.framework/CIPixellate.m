@implementation CIPixellate

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryStylize");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryHighDynamicRange");
  v7[4] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputCenter");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v8[4] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A750;
  v4[1] = &unk_1E2F1A750;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A760;
  v4[3] = &unk_1E2F1A770;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_pixellate);
}

- (id)outputImage
{
  float v3;
  float v4;
  CIVector *v5;
  double v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  id v13;
  CIImage *inputImage;
  unint64_t v16;
  float v17;
  float v18;
  _QWORD v19[5];
  float v20;
  _QWORD v21[3];
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v4 = v3;
  v5 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)(1.0 / v3), v3);
  -[CIVector X](self->inputCenter, "X");
  *(float *)&v6 = v6;
  v18 = *(float *)&v6;
  -[CIVector Y](self->inputCenter, "Y");
  *(float *)&v7 = v7;
  v16 = __PAIR64__(LODWORD(v7), LODWORD(v18));
  v17 = *(float *)&v7;
  -[CIImage extent](self->inputImage, "extent");
  v8 = -floor(v4 * 0.5);
  v23 = CGRectInset(v22, v8, v8);
  v24 = CGRectIntegral(v23);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v13 = -[CIPixellate _kernel](self, "_kernel");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __26__CIPixellate_outputImage__block_invoke;
  v19[3] = &__block_descriptor_44_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v19[4] = v16;
  v20 = v4;
  inputImage = self->inputImage;
  v21[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v18, v17);
  v21[1] = v5;
  return (id)objc_msgSend(v13, "applyWithExtent:roiCallback:inputImage:arguments:", v19, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2), x, y, width, height);
}

double __26__CIPixellate_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  float v6;
  float v7;
  double v8;
  double result;
  float v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v5 = *(_QWORD *)(a1 + 32);
  v10 = *(float *)&v5;
  v6 = *(float *)(a1 + 40);
  v7 = *((float *)&v5 + 1);
  v11 = CGRectOffset(*(CGRect *)&a2, (float)-*(float *)&v5, (float)-*((float *)&v5 + 1));
  v8 = v6;
  v11.origin.x = v11.origin.x / v8;
  v11.origin.y = v11.origin.y / v8;
  v11.size.width = v11.size.width / v8;
  v11.size.height = v11.size.height / v8;
  v12 = CGRectOffset(v11, 0.5, 0.5);
  v13 = CGRectIntegral(v12);
  v13.origin.x = v13.origin.x * v8;
  v13.origin.y = v13.origin.y * v8;
  v13.size.width = v13.size.width * v8;
  v13.size.height = v13.size.height * v8;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v13, v10, v7);
  return result;
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

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
