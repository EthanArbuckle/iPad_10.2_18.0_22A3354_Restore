@implementation MLNonMaximumSuppressionParameters

- (id)objectBoundingBoxOutputDescription
{
  MLObjectBoundingBoxOutputDescription *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MLObjectBoundingBoxOutputDescription);
  -[MLNonMaximumSuppressionParameters labelNames](self, "labelNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLObjectBoundingBoxOutputDescription setLabelNames:](v3, "setLabelNames:", v4);

  -[MLNonMaximumSuppressionParameters confidenceOutputFeatureName](self, "confidenceOutputFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLObjectBoundingBoxOutputDescription setConfidenceFeatureName:](v3, "setConfidenceFeatureName:", v5);

  -[MLNonMaximumSuppressionParameters coordinatesOutputFeatureName](self, "coordinatesOutputFeatureName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLObjectBoundingBoxOutputDescription setCoordinatesFeatureName:](v3, "setCoordinatesFeatureName:", v6);

  -[MLObjectBoundingBoxOutputDescription setFormat:](v3, "setFormat:", 0);
  return v3;
}

- (int)suppressionMethod
{
  return self->_suppressionMethod;
}

- (void)setSuppressionMethod:(int)a3
{
  self->_suppressionMethod = a3;
}

- (double)iouThreshold
{
  return self->_iouThreshold;
}

- (void)setIouThreshold:(double)a3
{
  self->_iouThreshold = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (unint64_t)minBoxes
{
  return self->_minBoxes;
}

- (void)setMinBoxes:(unint64_t)a3
{
  self->_minBoxes = a3;
}

- (int64_t)maxBoxes
{
  return self->_maxBoxes;
}

- (void)setMaxBoxes:(int64_t)a3
{
  self->_maxBoxes = a3;
}

- (unint64_t)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(unint64_t)a3
{
  self->_numClasses = a3;
}

- (BOOL)perClass
{
  return self->_perClass;
}

- (void)setPerClass:(BOOL)a3
{
  self->_perClass = a3;
}

- (NSString)confidenceInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConfidenceInputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)coordinatesInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCoordinatesInputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)iouThresholdInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIouThresholdInputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)confidenceThresholdInputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConfidenceThresholdInputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)confidenceOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfidenceOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)coordinatesOutputFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCoordinatesOutputFeatureName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)labelNames
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLabelNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelNames, 0);
  objc_storeStrong((id *)&self->_coordinatesOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_confidenceOutputFeatureName, 0);
  objc_storeStrong((id *)&self->_confidenceThresholdInputFeatureName, 0);
  objc_storeStrong((id *)&self->_iouThresholdInputFeatureName, 0);
  objc_storeStrong((id *)&self->_coordinatesInputFeatureName, 0);
  objc_storeStrong((id *)&self->_confidenceInputFeatureName, 0);
}

@end
