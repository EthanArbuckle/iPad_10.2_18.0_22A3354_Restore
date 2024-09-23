@implementation AGXA10FamilyRasterizationRateMap

- (void)dealloc
{
  WarpFunction *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
  {
    free(impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyRasterizationRateMap;
  -[_MTLRasterizationRateMap dealloc](&v4, sel_dealloc);
}

- (const)getImpl
{
  return self->_impl;
}

- (MTLDevice)device
{
  return 0;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 1;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 1;
  return self;
}

- (unint64_t)layerCount
{
  return 0;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  unint64_t v2;
  unint64_t v3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v2 = 0;
  v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (AGXA10FamilyRasterizationRateMap)initWithDevice:(id)a3 descriptor:(id)a4
{
  AGXA10FamilyRasterizationRateMap *v5;
  AGXA10FamilyRasterizationRateMap *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AGXA10FamilyRasterizationRateMap;
  v5 = -[_MTLRasterizationRateMap initWithDevice:descriptor:](&v12, sel_initWithDevice_descriptor_, a3);
  if (v5)
  {
    v6 = v5;
    v11 = 0;
    objc_msgSend(a4, "layerPointer:", &v11);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    if (a4)
      objc_msgSend(a4, "screenSize", 0, 0, 0);
    objc_msgSend(a4, "skipSampleValidationAndApplySampleAtTileGranularity", v8, v9, v10);
    objc_msgSend(a4, "skipSampleValidationAndInterpolation");
    objc_msgSend(a4, "mutability");
    objc_msgSend(a4, "minFactor");
    v6->_impl = (WarpFunction *)malloc_type_calloc(1uLL, 1uLL, 0xD66272D0uLL);

  }
  return 0;
}

- (void)resetUsingDescriptor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(a3, "layerPointer:", &v7);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  if (a3)
    objc_msgSend(a3, "screenSize", 0, 0, 0);
  objc_msgSend(a3, "skipSampleValidationAndApplySampleAtTileGranularity", v4, v5, v6);
  objc_msgSend(a3, "skipSampleValidationAndInterpolation");
}

- (void)copyParameterDataToBuffer:(id)a3 atOffset:(unint64_t)a4
{
  objc_msgSend(a3, "contents");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 1;
  return self;
}

- ($94F468A8D4C62B317260615823C2B210)physicalCoordinate:(id)a3 forLayer:(unint64_t)a4
{
  float v4;
  float v5;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = 0.0;
  v5 = 0.0;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)screenCoordinate:(id)a3 forLayer:(unint64_t)a4
{
  float v4;
  float v5;
  $94F468A8D4C62B317260615823C2B210 result;

  v4 = 0.0;
  v5 = 0.0;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

@end
