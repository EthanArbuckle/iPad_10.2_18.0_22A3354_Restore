@implementation CIFalseColor

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_falseColor);
}

- (id)outputImage
{
  CIColor *v3;
  CIImage *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CIColor *inputColor0;
  CIColor *inputColor1;
  CIColor *v16;
  uint64_t v17;
  CIImage *v19;
  CIColor *v20;
  CIColor *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputColor0 && !self->inputColor1)
    return 0;
  v3 = +[CIColor clearColor](CIColor, "clearColor");
  v4 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v5 = -[CIFalseColor _kernel](self, "_kernel");
  -[CIImage extent](v4, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  inputColor0 = self->inputColor0;
  if (!inputColor0)
    inputColor0 = v3;
  inputColor1 = self->inputColor1;
  v19 = v4;
  v20 = inputColor0;
  if (inputColor1)
    v16 = inputColor1;
  else
    v16 = v3;
  v21 = v16;
  v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 3);
  return (id)objc_msgSend(v5, "applyWithExtent:arguments:", v17, v7, v9, v11, v13, v19, v20);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[7];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryInterlaced");
  v7[3] = CFSTR("CICategoryNonSquarePixels");
  v7[4] = CFSTR("CICategoryStillImage");
  v7[5] = CFSTR("CICategoryHighDynamicRange");
  v7[6] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v9[1] = CFSTR("5");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputColor0");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.3, 0.0, 0.0);
  v6[1] = CFSTR("CIAttributeTypeColor");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v8[4] = CFSTR("inputColor1");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 0.9, 0.8, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
