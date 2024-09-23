@implementation GESSAlgIsometricParameterizeOptions

- (GESSAlgIsometricParameterizeOptions)init
{
  GESSAlgIsometricParameterizeOptions *v2;
  GESSAlgIsometricParameterizeOptions *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GESSAlgIsometricParameterizeOptions;
  v2 = -[GESSAlgParameterizeOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GESSAlgIsometricParameterizeOptions setTargetNumOfCharts:](v2, "setTargetNumOfCharts:", 10);
    LODWORD(v4) = 1036831949;
    -[GESSAlgIsometricParameterizeOptions setMaximumStretchRatio:](v3, "setMaximumStretchRatio:", v4);
    -[GESSAlgIsometricParameterizeOptions setEnableParallel:](v3, "setEnableParallel:", 1);
    -[GESSAlgIsometricParameterizeOptions setSkipInitialStretchOptimization:](v3, "setSkipInitialStretchOptimization:", 0);
    -[GESSAlgIsometricParameterizeOptions setOptimizeBoundaryIfFaceNumberLessThan:](v3, "setOptimizeBoundaryIfFaceNumberLessThan:", 100000);
    -[GESSAlgIsometricParameterizeOptions setRepairUVSelfIntersection:](v3, "setRepairUVSelfIntersection:", 0);
  }
  return v3;
}

- (unsigned)targetNumOfCharts
{
  return self->targetNumOfCharts;
}

- (void)setTargetNumOfCharts:(unsigned int)a3
{
  self->targetNumOfCharts = a3;
}

- (float)maximumStretchRatio
{
  return self->maximumStretchRatio;
}

- (void)setMaximumStretchRatio:(float)a3
{
  self->maximumStretchRatio = a3;
}

- (BOOL)enableParallel
{
  return self->enableParallel;
}

- (void)setEnableParallel:(BOOL)a3
{
  self->enableParallel = a3;
}

- (BOOL)skipInitialStretchOptimization
{
  return self->skipInitialStretchOptimization;
}

- (void)setSkipInitialStretchOptimization:(BOOL)a3
{
  self->skipInitialStretchOptimization = a3;
}

- (unsigned)optimizeBoundaryIfFaceNumberLessThan
{
  return self->optimizeBoundaryIfFaceNumberLessThan;
}

- (void)setOptimizeBoundaryIfFaceNumberLessThan:(unsigned int)a3
{
  self->optimizeBoundaryIfFaceNumberLessThan = a3;
}

- (BOOL)repairUVSelfIntersection
{
  return self->repairUVSelfIntersection;
}

- (void)setRepairUVSelfIntersection:(BOOL)a3
{
  self->repairUVSelfIntersection = a3;
}

@end
