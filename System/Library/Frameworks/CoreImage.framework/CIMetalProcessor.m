@implementation CIMetalProcessor

+ (void)setFilterParams:(id)a3 arguments:(id)a4 filter:(id)a5
{
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  CIImage *v13;
  CIImage *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CIImage *v18;
  CIImage *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  const __CFString *v22;
  _QWORD v23[3];
  CGRect v24;

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "setValuesForKeysWithDictionary:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("filterParameters")));
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputImages"));
  v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputImageKeys"));
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    do
    {
      v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v10);
      v12 = objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      objc_msgSend(v11, "region");
      if (CGRectIsEmpty(v24))
      {
        v13 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor"));
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v10), "extent");
        objc_msgSend(a5, "setValue:forKey:", -[CIImage imageByCroppingToRect:](v13, "imageByCroppingToRect:"), v12);
      }
      else
      {
        v22 = CFSTR("CIImageColorSpace");
        v23[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = +[CIImage imageWithIOSurface:options:](CIImage, "imageWithIOSurface:options:", objc_msgSend(v11, "surface"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
        memset(&v21, 0, sizeof(v21));
        objc_msgSend(v11, "region");
        v16 = v15;
        objc_msgSend(v11, "region");
        CGAffineTransformMakeTranslation(&v21, v16, v17);
        v20 = v21;
        v18 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingTransform:](v14, "imageByApplyingTransform:", &v20), "imageByClampingToExtent");
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v10), "extent");
        v19 = -[CIImage imageByCroppingToRect:](v18, "imageByCroppingToRect:");
        if (objc_msgSend(v11, "usesSRGBTransferFunction"))
          v19 = -[CIImage imageByApplyingFilter:](v19, "imageByApplyingFilter:", CFSTR("CISRGBToneCurveToLinear"));
        objc_msgSend(a5, "setValue:forKey:", v19, v12);
      }
      ++v10;
    }
    while (v10 < objc_msgSend(v8, "count"));
  }
}

+ (void)setFilterParamsAndImages:(id)a3 arguments:(id)a4 filter:(id)a5
{
  void *v8;
  unint64_t v9;

  objc_msgSend(a5, "setValuesForKeysWithDictionary:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("filterParameters")));
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputImageKeys"));
  if (objc_msgSend(a3, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(a5, "setValue:forKey:", objc_msgSend(a3, "objectAtIndexedSubscript:", v9), objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
      ++v9;
    }
    while (v9 < objc_msgSend(a3, "count"));
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  CIFilter *v10;
  CIFilter *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CIRenderDestination *v24;
  CGAffineTransform v26;
  CGAffineTransform v27;

  v10 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("filterName")));
  if (!v10)
    +[CIMetalProcessor processWithInputs:arguments:output:error:].cold.1();
  v11 = v10;
  objc_msgSend(a1, "setFilterParams:arguments:filter:", a3, a4, v10);
  v12 = -[CIFilter outputImage](v11, "outputImage");
  if (!v12)
    +[CIMetalProcessor processWithInputs:arguments:output:error:].cold.2();
  v13 = (void *)v12;
  v14 = objc_msgSend(a5, "metalContext");
  if (!v14)
    +[CIMetalProcessor processWithInputs:arguments:output:error:].cold.3();
  v15 = (void *)v14;
  memset(&v27, 0, sizeof(v27));
  objc_msgSend(a5, "region");
  v17 = -v16;
  objc_msgSend(a5, "region");
  CGAffineTransformMakeTranslation(&v27, v17, -v18);
  v26 = v27;
  v19 = (void *)objc_msgSend(v13, "imageByApplyingTransform:", &v26);
  if (objc_msgSend(a5, "usesSRGBTransferFunction"))
    v19 = (void *)objc_msgSend(v19, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
  objc_msgSend(a5, "region");
  v21 = v20;
  objc_msgSend(a5, "region");
  v23 = v22;
  v24 = -[CIRenderDestination initWithMTLTexture:commandBuffer:]([CIRenderDestination alloc], "initWithMTLTexture:commandBuffer:", objc_msgSend(a5, "metalTexture"), objc_msgSend(a5, "metalCommandBuffer"));
  -[CIRenderDestination setFlipped:](v24, "setFlipped:", 1);
  objc_msgSend(v15, "startTaskToRender:fromRect:toDestination:atPoint:error:", v19, v24, 0, 0.0, 0.0, v21, v23, 0.0, 0.0);

  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  CIFilter *v13;
  CIFilter *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputImages"));
  v13 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("filterName")));
  if (!v13)
    +[CIMetalProcessor roiForInput:arguments:outputRect:].cold.1();
  v14 = v13;
  objc_msgSend(a1, "setFilterParamsAndImages:arguments:filter:", v12, a4, v13);
  -[CIImage regionOfInterestForImage:inRect:](-[CIFilter outputImage](v14, "outputImage"), "regionOfInterestForImage:inRect:", objc_msgSend(v12, "objectAtIndexedSubscript:", a3), x, y, width, height);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (int)outputFormat
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  __assert_rtn("+[CIMetalProcessor processWithInputs:arguments:output:error:]", "CIMetalWrapper.m", 101, "filter");
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
  __assert_rtn("+[CIMetalProcessor processWithInputs:arguments:output:error:]", "CIMetalWrapper.m", 106, "outputImage");
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  __assert_rtn("+[CIMetalProcessor processWithInputs:arguments:output:error:]", "CIMetalWrapper.m", 111, "ctx");
}

+ (void)roiForInput:arguments:outputRect:.cold.1()
{
  __assert_rtn("+[CIMetalProcessor roiForInput:arguments:outputRect:]", "CIMetalWrapper.m", 154, "filter");
}

@end
