@implementation CIMix

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryHighDynamicRange");
  v5[4] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("12");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.14");
  v6[3] = CFSTR("inputAmount");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F18CC0;
  v4[1] = &unk_1E2F18CD0;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F18CD0;
  v4[3] = &unk_1E2F18CD0;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_mix);
}

- (id)outputImage
{
  CIImage *inputImage;
  float v5;
  float v6;
  CIImage *v7;
  float v8;
  CIImage *inputBackgroundImage;
  CIImage *v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  _QWORD v28[4];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v28[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage && !self->inputBackgroundImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v29))
  {
    -[CIImage extent](self->inputBackgroundImage, "extent");
    if (CGRectIsEmpty(v30))
      return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  v6 = fmaxf(v5, 0.0);
  v7 = self->inputImage;
  if (!v7)
    v7 = +[CIImage emptyImage](CIImage, "emptyImage");
  v8 = fminf(v6, 1.0);
  inputBackgroundImage = self->inputBackgroundImage;
  if (!inputBackgroundImage)
    inputBackgroundImage = +[CIImage emptyImage](CIImage, "emptyImage");
  if (v8 == 0.0)
  {
    v10 = inputBackgroundImage;
    return v10;
  }
  if (v8 == 1.0)
  {
    v10 = v7;
    return v10;
  }
  v11 = -[CIMix _kernel](self, "_kernel");
  -[CIImage extent](v7, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CIImage extent](inputBackgroundImage, "extent");
  v33.origin.x = v20;
  v33.origin.y = v21;
  v33.size.width = v22;
  v33.size.height = v23;
  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  v32 = CGRectUnion(v31, v33);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  *(float *)&v32.origin.x = v8;
  v28[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32.origin.x, v7, inputBackgroundImage);
  return (id)objc_msgSend(v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3), x, y, width, height);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputBackgroundImage
{
  return self->inputBackgroundImage;
}

- (void)setInputBackgroundImage:(id)a3
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
