@implementation CIColorAbsoluteDifference

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryNonSquarePixels");
  v3[4] = CFSTR("CICategoryStillImage");
  v3[5] = CFSTR("CICategoryHighDynamicRange");
  v3[6] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v5[1] = CFSTR("14");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("11.0");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  CIColorKernel *v21;
  CIImage *v22;
  CIImage *v23;
  _QWORD v24[3];
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (!self->inputImage2)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CIImage extent](self->inputImage2, "extent");
  v27.origin.x = v12;
  v27.origin.y = v13;
  v27.size.width = v14;
  v27.size.height = v15;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v26 = CGRectIntersection(v25, v27);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  if (CGRectIsEmpty(v26))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v21 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorAbsDiff);
  v22 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v23 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage2, "imageByUnpremultiplyingAlpha");
  v24[0] = v22;
  v24[1] = v23;
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2), x, y, width, height), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputImage2
{
  return self->inputImage2;
}

- (void)setInputImage2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
