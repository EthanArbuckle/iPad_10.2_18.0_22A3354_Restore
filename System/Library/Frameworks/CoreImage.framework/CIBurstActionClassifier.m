@implementation CIBurstActionClassifier

- (CIBurstActionClassifier)init
{
  CIBurstActionClassifier *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIBurstActionClassifier;
  result = -[CIBurstActionClassifier init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->testMinRegionOfInterestSize = 2139095039;
    *(_OWORD *)&result->testAverageCameraTravelDistance = 0u;
    *(_OWORD *)&result->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix = 0u;
    result->hasBeenScaled = 0;
  }
  return result;
}

- (CIBurstActionClassifier)initWithVersion:(int)a3
{
  CIBurstActionClassifier *v4;
  CIBurstActionClassifier *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CIBurstActionClassifier;
  v4 = -[CIBurstActionClassifier init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 <= 1)
      v6 = &g_svmParameters_v1;
    else
      v6 = &g_svmParameters_v2;
    -[CIBurstActionClassifier setSvmParameters:](v4, "setSvmParameters:", v6);
  }
  return v5;
}

- (void)scaleVector
{
  __SVMParameters *v3;
  long double v4;
  uint64_t v5;
  double v6;
  float32x2_t v7;

  if (!self->hasBeenScaled)
  {
    v3 = -[CIBurstActionClassifier svmParameters](self, "svmParameters");
    v4 = log((float)(self->testAverageCameraTravelDistance + 1.0));
    v5 = 0;
    *(float *)&v4 = v4;
    self->testAverageCameraTravelDistance = *(float *)&v4;
    self->testVector[0] = *(float *)&v4;
    v6 = (float)(self->testMeanPeakRegistrationError / self->testMaxPeakRegistrationError);
    self->testVector[1] = self->testMaxRegistrationErrorIntegral;
    self->testVector[2] = v6;
    v7 = *(float32x2_t *)&self->testMaxInnerDistance;
    *(float64x2_t *)&self->testVector[3] = vcvtq_f64_f32(*(float32x2_t *)&self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix);
    *(float64x2_t *)&self->testVector[5] = vcvtq_f64_f32(v7);
    do
    {
      self->testVector[v5] = (self->testVector[v5] - v3->var0[v5].var1) / v3->var0[v5].var0;
      ++v5;
    }
    while (v5 != 7);
    BurstLoggingMessage("\tscaled Average Camera Travel Distance = %f\n", self->testVector[0]);
    BurstLoggingMessage("\tscaled Max Registration Error Integral = %f\n", self->testVector[1]);
    BurstLoggingMessage("\tscaled Mean peak registration error / Max peak registration error = %f\n", self->testVector[2]);
    BurstLoggingMessage("\tscaled Beginning vs. End AEMatrix difference vs. Average of Adjacent AE Matrix Differences = %f\n", self->testVector[3]);
    BurstLoggingMessage("\tscaled In-out ratio = %f\n", self->testVector[4]);
    BurstLoggingMessage("\tscaled Max inner distance = %f\n", self->testVector[5]);
    BurstLoggingMessage("\tscaled Average registration error skewness = %f\n", self->testVector[6]);
    self->hasBeenScaled = 1;
  }
}

- (double)computeKernelValueWithSupportVector:(const CIBurstSupportVector *)a3
{
  uint64_t v3;
  double v4;
  double v5;
  double var0;

  if (!self->hasBeenScaled)
    return 0.0;
  v3 = 0;
  v4 = 0.0;
  do
  {
    v5 = a3->var1[v3] - self->testVector[v3];
    v4 = v4 + v5 * v5;
    ++v3;
  }
  while (v3 != 7);
  var0 = a3->var0;
  return var0 * exp(-((double)-[CIBurstActionClassifier svmParameters](self, "svmParameters")[56] * v4));
}

- (float)predictResult
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t i;
  double v7;

  v3 = 0;
  v4 = 0.0 - (double)-[CIBurstActionClassifier svmParameters](self, "svmParameters")[64];
  do
  {
    -[CIBurstActionClassifier computeKernelValueWithSupportVector:](self, "computeKernelValueWithSupportVector:", (_QWORD)-[CIBurstActionClassifier svmParameters](self, "svmParameters")[80] + v3);
    v4 = v4 + v5;
    v3 += 64;
  }
  while (v3 != 2880);
  for (i = 0; i != 2816; i += 64)
  {
    -[CIBurstActionClassifier computeKernelValueWithSupportVector:](self, "computeKernelValueWithSupportVector:", (_QWORD)-[CIBurstActionClassifier svmParameters](self, "svmParameters")[88] + i);
    v4 = v4 + v7;
  }
  return v4;
}

- (BOOL)isBurstAction
{
  float testMaxPeakRegistrationError;
  BOOL v3;
  float v5;
  const char *v6;

  testMaxPeakRegistrationError = self->testMaxPeakRegistrationError;
  if (testMaxPeakRegistrationError >= 7250.0)
  {
    BurstLoggingMessage("Non-Linear SVM Action classifier called with:\n", a2);
    BurstLoggingMessage("\tAverage Camera Travel Distance = %f\n", self->testAverageCameraTravelDistance);
    BurstLoggingMessage("\tMax Registration Error Integral = %f\n", self->testMaxRegistrationErrorIntegral);
    BurstLoggingMessage("\tMean peak registration error / Max peak registration error = %f\n", (float)(self->testMeanPeakRegistrationError / self->testMaxPeakRegistrationError));
    BurstLoggingMessage("\tBeginning vs. End AEMatrix difference vs. Average of Adjacent AE Matrix Differences = %f\n", self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix);
    BurstLoggingMessage("\tIn-out ratio = %f\n", self->testInOutRatio);
    BurstLoggingMessage("\tMax inner distance = %f\n", self->testMaxInnerDistance);
    BurstLoggingMessage("\tAverage registration error skewness = %f\n", self->testAverageRegistrationErrorSkewness);
    -[CIBurstActionClassifier scaleVector](self, "scaleVector");
    -[CIBurstActionClassifier predictResult](self, "predictResult");
    v3 = v5 >= 0.0;
    v6 = "NON-ACTION";
    if (v5 >= 0.0)
      v6 = "ACTION";
    BurstLoggingMessage("PREDICTION: --- %s --- (value = %f)\n", v6, v5);
  }
  else
  {
    BurstLoggingMessage("Sequence classified as NON-ACTION due to complete lack of local motion (%f, threshold %f)\n", testMaxPeakRegistrationError, 7250.0);
    return 0;
  }
  return v3;
}

- (float)testAverageCameraTravelDistance
{
  return self->testAverageCameraTravelDistance;
}

- (void)setTestAverageCameraTravelDistance:(float)a3
{
  self->testAverageCameraTravelDistance = a3;
}

- (float)testMaxRegistrationErrorIntegral
{
  return self->testMaxRegistrationErrorIntegral;
}

- (void)setTestMaxRegistrationErrorIntegral:(float)a3
{
  self->testMaxRegistrationErrorIntegral = a3;
}

- (float)testMaxPeakRegistrationError
{
  return self->testMaxPeakRegistrationError;
}

- (void)setTestMaxPeakRegistrationError:(float)a3
{
  self->testMaxPeakRegistrationError = a3;
}

- (float)testMeanPeakRegistrationError
{
  return self->testMeanPeakRegistrationError;
}

- (void)setTestMeanPeakRegistrationError:(float)a3
{
  self->testMeanPeakRegistrationError = a3;
}

- (float)testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix
{
  return self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix;
}

- (void)setTestBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix:(float)a3
{
  self->testBeginningVsEndAEMatrixVsAverageAdjacentAEMatrix = a3;
}

- (float)testInOutRatio
{
  return self->testInOutRatio;
}

- (void)setTestInOutRatio:(float)a3
{
  self->testInOutRatio = a3;
}

- (float)testMaxInnerDistance
{
  return self->testMaxInnerDistance;
}

- (void)setTestMaxInnerDistance:(float)a3
{
  self->testMaxInnerDistance = a3;
}

- (float)testAverageRegistrationErrorSkewness
{
  return self->testAverageRegistrationErrorSkewness;
}

- (void)setTestAverageRegistrationErrorSkewness:(float)a3
{
  self->testAverageRegistrationErrorSkewness = a3;
}

- (float)testMinRegionOfInterestSize
{
  return self->testMinRegionOfInterestSize;
}

- (void)setTestMinRegionOfInterestSize:(float)a3
{
  self->testMinRegionOfInterestSize = a3;
}

- (float)testMaxRegistrationErrorSkewness
{
  return self->testMaxRegistrationErrorSkewness;
}

- (void)setTestMaxRegistrationErrorSkewness:(float)a3
{
  self->testMaxRegistrationErrorSkewness = a3;
}

- (__SVMParameters)svmParameters
{
  return self->_svmParameters;
}

- (void)setSvmParameters:(__SVMParameters *)a3
{
  self->_svmParameters = a3;
}

@end
