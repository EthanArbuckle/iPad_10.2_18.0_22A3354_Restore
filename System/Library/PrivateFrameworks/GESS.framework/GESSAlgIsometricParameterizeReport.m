@implementation GESSAlgIsometricParameterizeReport

- (GESSAlgIsometricParameterizeReport)init
{
  GESSAlgIsometricParameterizeReport *v2;
  GESSAlgIsometricParameterizeReport *v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GESSAlgIsometricParameterizeReport;
  v2 = -[GESSAlgReport init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GESSAlgIsometricParameterizeReport setChartingTime:](v2, "setChartingTime:", 0.0);
    -[GESSAlgIsometricParameterizeReport setInitialParameterizationTime:](v3, "setInitialParameterizationTime:", 0.0);
    -[GESSAlgIsometricParameterizeReport setSplitParameterizationTime:](v3, "setSplitParameterizationTime:", 0.0);
    -[GESSAlgIsometricParameterizeReport setChartMergingTime:](v3, "setChartMergingTime:", 0.0);
    -[GESSAlgIsometricParameterizeReport setFixSelfIntersectionTime:](v3, "setFixSelfIntersectionTime:", 0.0);
    -[GESSAlgIsometricParameterizeReport setPackingTime:](v3, "setPackingTime:", 0.0);
    -[GESSAlgIsometricParameterizeReport setNumOfCharts:](v3, "setNumOfCharts:", 0);
    -[GESSAlgIsometricParameterizeReport setNumOfPackedTextures:](v3, "setNumOfPackedTextures:", 0);
    LODWORD(v4) = 0;
    -[GESSAlgIsometricParameterizeReport setMaximumStretchRatio:](v3, "setMaximumStretchRatio:", v4);
    LODWORD(v5) = 0;
    -[GESSAlgIsometricParameterizeReport setAverageStretchRatio:](v3, "setAverageStretchRatio:", v5);
    LODWORD(v6) = 0;
    -[GESSAlgIsometricParameterizeReport setSelfIntersectionRatio:](v3, "setSelfIntersectionRatio:", v6);
    -[GESSAlgIsometricParameterizeReport setParameterizeStatus:](v3, "setParameterizeStatus:", 3);
  }
  return v3;
}

- (double)chartingTime
{
  return self->chartingTime;
}

- (void)setChartingTime:(double)a3
{
  self->chartingTime = a3;
}

- (double)initialParameterizationTime
{
  return self->initialParameterizationTime;
}

- (void)setInitialParameterizationTime:(double)a3
{
  self->initialParameterizationTime = a3;
}

- (double)splitParameterizationTime
{
  return self->splitParameterizationTime;
}

- (void)setSplitParameterizationTime:(double)a3
{
  self->splitParameterizationTime = a3;
}

- (double)chartMergingTime
{
  return self->chartMergingTime;
}

- (void)setChartMergingTime:(double)a3
{
  self->chartMergingTime = a3;
}

- (double)fixSelfIntersectionTime
{
  return self->fixSelfIntersectionTime;
}

- (void)setFixSelfIntersectionTime:(double)a3
{
  self->fixSelfIntersectionTime = a3;
}

- (double)packingTime
{
  return self->packingTime;
}

- (void)setPackingTime:(double)a3
{
  self->packingTime = a3;
}

- (unsigned)numOfCharts
{
  return self->numOfCharts;
}

- (void)setNumOfCharts:(unsigned int)a3
{
  self->numOfCharts = a3;
}

- (unsigned)numOfPackedTextures
{
  return self->numOfPackedTextures;
}

- (void)setNumOfPackedTextures:(unsigned int)a3
{
  self->numOfPackedTextures = a3;
}

- (float)maximumStretchRatio
{
  return self->maximumStretchRatio;
}

- (void)setMaximumStretchRatio:(float)a3
{
  self->maximumStretchRatio = a3;
}

- (float)averageStretchRatio
{
  return self->averageStretchRatio;
}

- (void)setAverageStretchRatio:(float)a3
{
  self->averageStretchRatio = a3;
}

- (float)selfIntersectionRatio
{
  return self->selfIntersectionRatio;
}

- (void)setSelfIntersectionRatio:(float)a3
{
  self->selfIntersectionRatio = a3;
}

- (int)parameterizeStatus
{
  return self->parameterizeStatus;
}

- (void)setParameterizeStatus:(int)a3
{
  self->parameterizeStatus = a3;
}

@end
