@implementation GESSAlgIsotropicRemeshOptions

- (GESSAlgIsotropicRemeshOptions)init
{
  GESSAlgIsotropicRemeshOptions *v2;
  GESSAlgIsotropicRemeshOptions *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GESSAlgIsotropicRemeshOptions;
  v2 = -[GESSAlgIsotropicRemeshOptions init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GESSAlgIsotropicRemeshOptions setIterations:](v2, "setIterations:", 5);
    LODWORD(v4) = 1068149419;
    -[GESSAlgIsotropicRemeshOptions setSplitRatio:](v3, "setSplitRatio:", v4);
    LODWORD(v5) = 1061997773;
    -[GESSAlgIsotropicRemeshOptions setCollapseRatio:](v3, "setCollapseRatio:", v5);
    LODWORD(v6) = 1045220557;
    -[GESSAlgIsotropicRemeshOptions setSmoothLambda:](v3, "setSmoothLambda:", v6);
    LODWORD(v7) = 2.0;
    -[GESSAlgIsotropicRemeshOptions setSmoothIterations:](v3, "setSmoothIterations:", v7);
  }
  return v3;
}

- (unsigned)iterations
{
  return self->iterations;
}

- (void)setIterations:(unsigned int)a3
{
  self->iterations = a3;
}

- (float)splitRatio
{
  return self->splitRatio;
}

- (void)setSplitRatio:(float)a3
{
  self->splitRatio = a3;
}

- (float)collapseRatio
{
  return self->collapseRatio;
}

- (void)setCollapseRatio:(float)a3
{
  self->collapseRatio = a3;
}

- (float)smoothLambda
{
  return self->smoothLambda;
}

- (void)setSmoothLambda:(float)a3
{
  self->smoothLambda = a3;
}

- (float)smoothIterations
{
  return self->smoothIterations;
}

- (void)setSmoothIterations:(float)a3
{
  self->smoothIterations = a3;
}

@end
