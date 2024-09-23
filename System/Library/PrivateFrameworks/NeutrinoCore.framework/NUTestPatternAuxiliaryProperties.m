@implementation NUTestPatternAuxiliaryProperties

- (id)auxiliaryCoreGraphicsInfoDictionary:(id *)a3
{
  return 0;
}

- (id)auxiliaryImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  return 0;
}

- (id)auxiliaryImage:(id *)a3
{
  return 0;
}

- (id)depthCameraCalibrationData
{
  return 0;
}

- (CGImageMetadata)auxiliaryDataInfoMetadata
{
  return 0;
}

- (NUColorSpace)colorSpace
{
  return 0;
}

- (CGImageMetadata)compatibilityMetadata
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUTestPatternAuxiliaryProperties *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = +[NUTestPatternAuxiliaryProperties allocWithZone:](NUTestPatternAuxiliaryProperties, "allocWithZone:", a3);
  v5 = -[NUTestPatternAuxiliaryProperties size](self, "size");
  -[NUTestPatternAuxiliaryProperties setSize:](v4, "setSize:", v5, v6);
  -[NUTestPatternAuxiliaryProperties auxiliaryImageTypeCGIdentifier](self, "auxiliaryImageTypeCGIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTestPatternAuxiliaryProperties setAuxiliaryImageTypeCGIdentifier:](v4, "setAuxiliaryImageTypeCGIdentifier:", v7);

  return v4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (NSString)auxiliaryImageTypeCGIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAuxiliaryImageTypeCGIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypeCGIdentifier, 0);
}

@end
