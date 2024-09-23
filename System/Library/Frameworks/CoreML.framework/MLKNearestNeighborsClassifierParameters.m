@implementation MLKNearestNeighborsClassifierParameters

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (void)setNumberOfDimensions:(unint64_t)a3
{
  self->_numberOfDimensions = a3;
}

- (int64_t)weightingScheme
{
  return self->_weightingScheme;
}

- (void)setWeightingScheme:(int64_t)a3
{
  self->_weightingScheme = a3;
}

- (int64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(int64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)leafSize
{
  return self->_leafSize;
}

- (void)setLeafSize:(unint64_t)a3
{
  self->_leafSize = a3;
}

- (NSObject)defaultLabel
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDefaultLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)nearestLabelsFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNearestLabelsFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)nearestDistancesFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNearestDistancesFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearestDistancesFeatureName, 0);
  objc_storeStrong((id *)&self->_nearestLabelsFeatureName, 0);
  objc_storeStrong((id *)&self->_defaultLabel, 0);
}

@end
