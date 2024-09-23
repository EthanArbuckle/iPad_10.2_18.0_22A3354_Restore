@implementation CIBlendWithMask

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryStylize");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryHighDynamicRange");
  v3[4] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("6");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_blendWithMask);
}

- (id)_kernelB0
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_blendWithMaskB0);
}

- (float)_maskFillColorValue
{
  float result;

  LODWORD(result) = _fillColor((CIImage *)self[96]).n64_u32[1];
  return result;
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputMaskImage;
  float v6;
  CIImage *v7;
  CIImage *v8;
  CIImage *v9;
  CIImage *inputBackgroundImage;
  CIImage *v11;
  id v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double width;
  double v19;
  double height;
  void *v21;
  CIImage **v22;
  uint64_t v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CIImage *v36;
  CIImage *v37;
  CIImage *v38;
  CIImage *v39;
  CIImage *v40;
  uint64_t v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v41 = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage && !self->inputBackgroundImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v42))
  {
    -[CIImage extent](self->inputBackgroundImage, "extent");
    if (CGRectIsEmpty(v43))
      return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  inputMaskImage = self->inputMaskImage;
  if (!inputMaskImage
    || (-[CIImage extent](inputMaskImage, "extent"), CGRectIsEmpty(v44))
    || (-[CIBlendWithMask _maskFillColorValue](self, "_maskFillColorValue"), fabs(v6) < 1.0e-10))
  {
    v7 = self->inputBackgroundImage;
    return v7;
  }
  v8 = self->inputImage;
  if (fabs(v6 + -1.0) < 1.0e-10)
  {
    v7 = v8;
    return v7;
  }
  -[CIImage extent](self->inputMaskImage, "extent");
  v9 = -[CIImage imageByCroppingToRect:](v8, "imageByCroppingToRect:");
  if (!v9)
    v9 = +[CIImage emptyImage](CIImage, "emptyImage");
  inputBackgroundImage = self->inputBackgroundImage;
  if (!inputBackgroundImage)
    inputBackgroundImage = +[CIImage emptyImage](CIImage, "emptyImage");
  v11 = self->inputMaskImage;
  -[CIImage extent](inputBackgroundImage, "extent");
  if (CGRectIsEmpty(v45))
  {
    v12 = -[CIBlendWithMask _kernelB0](self, "_kernelB0");
    -[CIImage extent](v9, "extent");
    x = v13;
    y = v15;
    width = v17;
    height = v19;
    v39 = v9;
    v40 = v11;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = &v39;
    v23 = 2;
  }
  else
  {
    -[CIImage extent](v9, "extent");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CIImage extent](inputBackgroundImage, "extent");
    v48.origin.x = v32;
    v48.origin.y = v33;
    v48.size.width = v34;
    v48.size.height = v35;
    v46.origin.x = v25;
    v46.origin.y = v27;
    v46.size.width = v29;
    v46.size.height = v31;
    v47 = CGRectUnion(v46, v48);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    v12 = -[CIBlendWithMask _kernel](self, "_kernel");
    v36 = v9;
    v37 = inputBackgroundImage;
    v38 = v11;
    v21 = (void *)MEMORY[0x1E0C99D20];
    v22 = &v36;
    v23 = 3;
  }
  return (id)objc_msgSend(v12, "applyWithExtent:arguments:", objc_msgSend(v21, "arrayWithObjects:count:", v22, v23, v36, v37, v38, v39, v40), x, y, width, height);
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

- (CIImage)inputMaskImage
{
  return self->inputMaskImage;
}

- (void)setInputMaskImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
