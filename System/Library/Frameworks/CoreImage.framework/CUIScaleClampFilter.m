@implementation CUIScaleClampFilter

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_scaleClamp);
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1B2D0;
  v4[1] = &unk_1E2F1B2D0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1B2E0;
  v4[3] = &unk_1E2F1B2F0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1B300;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v6[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
}

- (id)outputImage
{
  double v3;
  id result;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputScale, "doubleValue");
  result = 0;
  if (self->inputImage)
  {
    v5 = fmin(fmax(v3, 0.01), 100.0);
    if (v5 != 0.0)
    {
      v6 = -[CUIScaleClampFilter _kernel](self, "_kernel");
      -[CIImage extent](self->inputImage, "extent");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15[0] = self->inputImage;
      v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
      return (id)objc_msgSend(v6, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2), v8, v10, v12, v14);
    }
  }
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

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
