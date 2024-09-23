@implementation CIWhitePointAdjust

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_whitepointadjust);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[CIColor red](self->inputColor, "red");
  if (fabs(v3 + -1.0) >= 0.0001)
    return 0;
  -[CIColor green](self->inputColor, "green");
  if (fabs(v4 + -1.0) >= 0.0001)
    return 0;
  -[CIColor blue](self->inputColor, "blue");
  if (fabs(v5 + -1.0) >= 0.0001)
    return 0;
  -[CIColor alpha](self->inputColor, "alpha");
  return fabs(v6 + -1.0) < 0.0001;
}

- (id)outputImage
{
  id v4;
  CIColor *inputColor;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputColor)
    return 0;
  if (-[CIWhitePointAdjust _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  v4 = -[CIWhitePointAdjust _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  inputColor = self->inputColor;
  v10[0] = self->inputImage;
  v10[1] = inputColor;
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2), v6, v7, v8, v9);
}

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[7];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryInterlaced");
  v5[4] = CFSTR("CICategoryNonSquarePixels");
  v5[5] = CFSTR("CICategoryHighDynamicRange");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v7[1] = CFSTR("5");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputColor");
  v4[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0, CFSTR("CIAttributeIdentity"));
  v3[1] = CFSTR("CIAttributeDefault");
  v3[2] = CFSTR("CIAttributeType");
  v4[1] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v4[2] = CFSTR("CIAttributeTypeColor");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
