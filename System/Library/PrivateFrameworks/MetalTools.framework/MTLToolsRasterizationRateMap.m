@implementation MTLToolsRasterizationRateMap

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A screenSize](result, "screenSize");
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A physicalGranularity](result, "physicalGranularity");
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- (unint64_t)layerCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "layerCount");
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  unint64_t v2;
  unint64_t v3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v2 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parameterBufferSizeAndAlign");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;

  result = -[MTLToolsObject baseObject](self, "baseObject");
  if (result)
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A physicalSizeForLayer:](result, "physicalSizeForLayer:", a4);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapScreenToPhysicalCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  float var1;
  float var0;
  id v7;
  double v8;
  double v9;
  float v10;
  float v11;
  $94F468A8D4C62B317260615823C2B210 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v8 = var0;
  *(float *)&v9 = var1;
  objc_msgSend(v7, "mapScreenToPhysicalCoordinates:forLayer:", a4, v8, v9);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)mapPhysicalToScreenCoordinates:(id)a3 forLayer:(unint64_t)a4
{
  float var1;
  float var0;
  id v7;
  double v8;
  double v9;
  float v10;
  float v11;
  $94F468A8D4C62B317260615823C2B210 result;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v8 = var0;
  *(float *)&v9 = var1;
  objc_msgSend(v7, "mapPhysicalToScreenCoordinates:forLayer:", a4, v8, v9);
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (float)minFactor
{
  float result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "minFactor");
  return result;
}

- (unint64_t)mutability
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "mutability");
}

- (void)copyParameterDataToBuffer:(id)a3 offset:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyParameterDataToBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)resetUsingDescriptor:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resetUsingDescriptor:", a3);
}

- (id)formattedDescription:(unint64_t)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
}

@end
