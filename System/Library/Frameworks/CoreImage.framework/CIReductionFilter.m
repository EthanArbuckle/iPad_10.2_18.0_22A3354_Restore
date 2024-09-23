@implementation CIReductionFilter

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryReduction");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryHighDynamicRange");
  v3[4] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("9");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.5");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)_reduceCrop
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_reduceCrop);
}

- (id)offsetAndCrop
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  double v19;
  double v20;
  CIImage *inputImage;
  CGAffineTransform v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[CIImage extent](self->inputImage, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v32.origin.x = v11;
  v32.origin.y = v12;
  v32.size.width = v13;
  v32.size.height = v14;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v26 = CGRectIntersection(v25, v32);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  if (!CGRectIsInfinite(v26))
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    if (!CGRectIsEmpty(v27))
    {
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v29 = CGRectStandardize(v28);
      x = ceil(v29.origin.x);
      y = ceil(v29.origin.y);
      v19 = floor(v29.origin.x + v29.size.width);
      v20 = floor(v29.origin.y + v29.size.height);
      if (v19 > x && v20 > y)
      {
        width = v19 - x;
        height = v20 - y;
      }
      else
      {
        x = *MEMORY[0x1E0C9D628];
        y = *(double *)(MEMORY[0x1E0C9D628] + 8);
        width = *(double *)(MEMORY[0x1E0C9D628] + 16);
        height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
    }
  }
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  if (CGRectIsEmpty(v30))
    return 0;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  if (CGRectIsInfinite(v31))
    return 0;
  inputImage = self->inputImage;
  CGAffineTransformMakeTranslation(&v24, -x, -y);
  return -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v24), "imageByCroppingToRect:", 0.0, 0.0, width, height);
}

- (id)outputImage
{
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

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
