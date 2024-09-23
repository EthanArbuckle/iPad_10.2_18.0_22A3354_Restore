@implementation MLObjectBoundingBoxOutputDescription

- (int)format
{
  return self->_format;
}

- (void)setFormat:(int)a3
{
  self->_format = a3;
}

- (NSString)confidenceFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfidenceFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)coordinatesFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinatesFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)labelNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLabelNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelNames, 0);
  objc_storeStrong((id *)&self->_coordinatesFeatureName, 0);
  objc_storeStrong((id *)&self->_confidenceFeatureName, 0);
}

@end
