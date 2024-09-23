@implementation GESSAlgCollapseShortEdgesOptions

- (GESSAlgCollapseShortEdgesOptions)init
{
  GESSAlgCollapseShortEdgesOptions *v2;
  double v3;
  GESSAlgCollapseShortEdgesOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GESSAlgCollapseShortEdgesOptions;
  v2 = -[GESSAlgCollapseShortEdgesOptions init](&v6, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1061997773;
    -[GESSAlgCollapseShortEdgesOptions setRatio:](v2, "setRatio:", v3);
    -[GESSAlgCollapseShortEdgesOptions setIterations:](v4, "setIterations:", 1);
  }
  return v4;
}

- (float)ratio
{
  return self->ratio;
}

- (void)setRatio:(float)a3
{
  self->ratio = a3;
}

- (unsigned)iterations
{
  return self->iterations;
}

- (void)setIterations:(unsigned int)a3
{
  self->iterations = a3;
}

@end
