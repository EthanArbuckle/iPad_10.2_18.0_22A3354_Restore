@implementation CIDissolveTransition

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryTransition");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryInterlaced");
  v5[4] = CFSTR("CICategoryNonSquarePixels");
  v5[5] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v7[1] = CFSTR("6");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputTime");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19590;
  v4[1] = &unk_1E2F19590;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F195A0;
  v4[3] = &unk_1E2F19590;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeTime");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_disolve);
}

- (id)_fadeKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_fadeDissolve);
}

- (id)outputImage
{
  float v3;
  float v4;
  CIImage *inputTargetImage;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CIImage *inputImage;
  void *v24;
  CIImage **v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  NSNumber *inputTime;
  CIImage *v49;
  NSNumber *v50;
  _QWORD v51[2];
  _QWORD v52[4];
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v52[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v4 = v3;
  if (v3 <= 0.01)
  {
    v27 = 80;
    return *(id *)((char *)&self->super.super.isa + v27);
  }
  if (v3 >= 0.99)
  {
    v27 = 88;
    return *(id *)((char *)&self->super.super.isa + v27);
  }
  inputTargetImage = self->inputTargetImage;
  if (self->inputImage)
  {
    if (inputTargetImage)
    {
      v6 = -[CIDissolveTransition _kernel](self, "_kernel");
      -[CIImage extent](self->inputImage, "extent");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[CIImage extent](self->inputTargetImage, "extent");
      v55.origin.x = v15;
      v55.origin.y = v16;
      v55.size.width = v17;
      v55.size.height = v18;
      v53.origin.x = v8;
      v53.origin.y = v10;
      v53.size.width = v12;
      v53.size.height = v14;
      v54 = CGRectUnion(v53, v55);
      x = v54.origin.x;
      y = v54.origin.y;
      width = v54.size.width;
      height = v54.size.height;
      inputImage = self->inputImage;
      v52[0] = self->inputTargetImage;
      v52[1] = inputImage;
      v52[2] = self->inputTime;
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = (CIImage **)v52;
      v26 = 3;
    }
    else
    {
      v6 = -[CIDissolveTransition _fadeKernel](self, "_fadeKernel");
      -[CIImage extent](self->inputImage, "extent");
      x = v44;
      y = v45;
      width = v46;
      height = v47;
      inputTime = self->inputTime;
      v49 = self->inputImage;
      v50 = inputTime;
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = &v49;
      v26 = 2;
    }
    v38 = objc_msgSend(v24, "arrayWithObjects:count:", v25, v26, v49, v50);
    v39 = v6;
    v40 = x;
    v41 = y;
    v42 = width;
    v43 = height;
    return (id)objc_msgSend(v39, "applyWithExtent:arguments:", v38, v40, v41, v42, v43);
  }
  if (inputTargetImage)
  {
    v29 = -[CIDissolveTransition _fadeKernel](self, "_fadeKernel");
    -[CIImage extent](self->inputTargetImage, "extent");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v51[0] = self->inputTargetImage;
    v51[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v4);
    v38 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v39 = v29;
    v40 = v31;
    v41 = v33;
    v42 = v35;
    v43 = v37;
    return (id)objc_msgSend(v39, "applyWithExtent:arguments:", v38, v40, v41, v42, v43);
  }
  return 0;
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

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
