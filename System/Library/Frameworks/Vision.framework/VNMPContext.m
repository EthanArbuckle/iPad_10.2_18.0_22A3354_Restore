@implementation VNMPContext

- (int)debugMode
{
  return self->_debugMode;
}

- (void)setDebugMode:(int)a3
{
  self->_debugMode = a3;
}

- (int)timerMode
{
  return self->_timerMode;
}

- (void)setTimerMode:(int)a3
{
  self->_timerMode = a3;
}

- (int)clusterSplitDistanceType
{
  return self->_clusterSplitDistanceType;
}

- (void)setClusterSplitDistanceType:(int)a3
{
  self->_clusterSplitDistanceType = a3;
}

- (NSArray)qualityCriteriaList
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQualityCriteriaList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)useTimestampAdjustedDistances
{
  return self->_useTimestampAdjustedDistances;
}

- (void)setUseTimestampAdjustedDistances:(BOOL)a3
{
  self->_useTimestampAdjustedDistances = a3;
}

- (BOOL)performClustersPostprocessing
{
  return self->_performClustersPostprocessing;
}

- (void)setPerformClustersPostprocessing:(BOOL)a3
{
  self->_performClustersPostprocessing = a3;
}

- (BOOL)performSceneClassification
{
  return self->_performSceneClassification;
}

- (void)setPerformSceneClassification:(BOOL)a3
{
  self->_performSceneClassification = a3;
}

- (float)roiAreaThreshold
{
  return self->_roiAreaThreshold;
}

- (void)setRoiAreaThreshold:(float)a3
{
  self->_roiAreaThreshold = a3;
}

- (float)inliersRatioThreshold
{
  return self->_inliersRatioThreshold;
}

- (void)setInliersRatioThreshold:(float)a3
{
  self->_inliersRatioThreshold = a3;
}

- (int)numberOfKeypointsToConsider
{
  return self->_numberOfKeypointsToConsider;
}

- (void)setNumberOfKeypointsToConsider:(int)a3
{
  self->_numberOfKeypointsToConsider = a3;
}

- (float)naturalClusteringDistanceThreshold
{
  return self->_naturalClusteringDistanceThreshold;
}

- (void)setNaturalClusteringDistanceThreshold:(float)a3
{
  self->_naturalClusteringDistanceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualityCriteriaList, 0);
}

@end
