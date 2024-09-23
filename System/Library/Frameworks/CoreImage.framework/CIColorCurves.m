@implementation CIColorCurves

- (void)dealloc
{
  objc_super v3;

  self->_curvesImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIColorCurves;
  -[CIFilter dealloc](&v3, sel_dealloc);
}

- (void)setInputCurvesData:(id)a3
{
  NSData *v5;

  self->_curvesImage = 0;
  v5 = self->inputCurvesData;
  self->inputCurvesData = (NSData *)a3;
}

+ (id)customAttributes
{
  uint64_t v2;
  const __CFString *v4;
  CIVector *v5;
  const __CFString *v6;
  uint64_t v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("CIAttributeFilterCategories");
  v8[0] = CFSTR("CICategoryColorEffect");
  v8[1] = CFSTR("CICategoryVideo");
  v8[2] = CFSTR("CICategoryInterlaced");
  v8[3] = CFSTR("CICategoryNonSquarePixels");
  v8[4] = CFSTR("CICategoryStillImage");
  v8[5] = CFSTR("CICategoryBuiltIn");
  v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
  v10[1] = CFSTR("11");
  v9[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v9[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v10[2] = CFSTR("10.13");
  v9[3] = CFSTR("inputCurvesData");
  v6 = CFSTR("CIAttributeDefault");
  if (defaultTable(void)::onceToken != -1)
    dispatch_once(&defaultTable(void)::onceToken, &__block_literal_global_7);
  v7 = defaultTable(void)::data;
  v10[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v9[4] = CFSTR("inputCurvesDomain");
  v4 = CFSTR("CIAttributeDefault");
  v5 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 1.0);
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1);
  v9[5] = CFSTR("inputColorSpace");
  v10[4] = v2;
  v10[5] = MEMORY[0x1E0C9AA70];
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
}

- (id)curvesImage
{
  id result;
  NSUInteger v4;
  NSData *inputCurvesData;
  unint64_t v6;
  uint64_t v7;
  CIImage *v8;
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  result = self->_curvesImage;
  if (!result)
  {
    v4 = -[NSData length](self->inputCurvesData, "length");
    inputCurvesData = self->inputCurvesData;
    v6 = v4 / 0xC;
    v10[0] = CFSTR("kCIImageProviderContentDigest");
    v10[1] = CFSTR("kCIImageProviderName");
    v11[0] = inputCurvesData;
    v11[1] = CFSTR("CIColorCurves");
    v10[2] = CFSTR("CIImageFlipped");
    v10[3] = CFSTR("CIImageClampToEdge");
    v11[2] = MEMORY[0x1E0C9AAA0];
    v11[3] = MEMORY[0x1E0C9AAB0];
    v10[4] = CFSTR("kCIImageCacheHint");
    v10[5] = CFSTR("kCIImageAlphaOne");
    v11[4] = MEMORY[0x1E0C9AAB0];
    v11[5] = MEMORY[0x1E0C9AAB0];
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
    v8 = [CIImage alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__CIColorCurves_curvesImage__block_invoke;
    v9[3] = &unk_1E2EC2FA8;
    v9[4] = inputCurvesData;
    result = -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](v8, "initWithImageProvider:width:height:format:colorSpace:options:", v9, v6, 1, 2056, 0, v7);
    self->_curvesImage = (CIImage *)result;
  }
  return result;
}

vImage_Error __28__CIColorCurves_curvesImage__block_invoke(uint64_t a1, void *__b, size_t a3, uint64_t a4, uint64_t a5, vImagePixelCount a6)
{
  vImage_Buffer v10;
  vImage_Buffer src;

  memset_pattern8(__b, &unk_1924920A8, a3);
  src.data = (void *)objc_msgSend(*(id *)(a1 + 32), "bytes");
  src.height = a6;
  *(_OWORD *)&src.width = xmmword_1924920B0;
  v10.data = __b;
  v10.height = a6;
  *(_OWORD *)&v10.width = xmmword_1924920C0;
  return vImageConvert_PlanarFtoPlanar16F(&src, &v10, 0);
}

- (BOOL)_checkInputs
{
  NSUInteger v3;
  double v5;
  double v6;
  double v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[NSData length](self->inputCurvesData, "length");
    if (v3 >= 0x18 && v3 % 0xC == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && -[CIVector count](self->inputCurvesDomain, "count") == 2)
      {
        -[CIVector X](self->inputCurvesDomain, "X");
        v6 = v5;
        -[CIVector Y](self->inputCurvesDomain, "Y");
        if (v6 < v7)
          return 1;
        NSLog(CFSTR("CIColorCurves inputCurvesDomain X must be less than Y."));
      }
      else
      {
        NSLog(CFSTR("CIColorCurves inputCurvesDomain must be of type CIVector and count 2."));
      }
    }
    else
    {
      NSLog(CFSTR("CIColorCurves inputCurvesData is not of the expected length."));
    }
  }
  else
  {
    NSLog(CFSTR("CIColorCurves inputCurvesData must be of type NSData."));
  }
  return 0;
}

- (id)outputImage
{
  id inputColorSpace;
  id v4;
  CFTypeID v5;
  CIImage *inputImage;
  char v7;
  uint64_t v8;
  id v9;
  NSUInteger v10;
  CIVector *v11;
  CIColorKernel *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id result;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !-[CIColorCurves _checkInputs](self, "_checkInputs"))
    return 0;
  inputColorSpace = self->inputColorSpace;
  if (inputColorSpace != (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
  {
    v4 = self->inputColorSpace;
    if (v4)
    {
      v5 = CFGetTypeID(v4);
      if (v5 == CGColorSpaceGetTypeID() && CGColorSpaceGetModel((CGColorSpaceRef)v4) == kCGColorSpaceModelRGB)
      {
        inputImage = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v4);
        v7 = 0;
        goto LABEL_9;
      }
      NSLog(CFSTR("CIColorCurves inputColorSpace must be an RGB CGColorSpaceRef"));
      return 0;
    }
  }
  v4 = 0;
  inputImage = self->inputImage;
  v7 = 1;
LABEL_9:
  v8 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v9 = -[CIColorCurves curvesImage](self, "curvesImage");
  v10 = -[NSData length](self->inputCurvesData, "length");
  v11 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)((float)((float)(v10 / 0xC) + -1.0) / (float)(v10 / 0xC)), (float)(0.5 / (float)(v10 / 0xC)));
  v12 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorcurves);
  -[CIImage extent](self->inputImage, "extent");
  v18[0] = v8;
  v18[1] = v9;
  v18[2] = self->inputCurvesDomain;
  v18[3] = v11;
  result = -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v12, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4), v13, v14, v15, v16), "imageByPremultiplyingAlpha");
  if ((v7 & 1) == 0)
    return (id)objc_msgSend(result, "imageByColorMatchingColorSpaceToWorkingSpace:", v4);
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

- (CIVector)inputCurvesDomain
{
  return self->inputCurvesDomain;
}

- (void)setInputCurvesDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSData)inputCurvesData
{
  return self->inputCurvesData;
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
