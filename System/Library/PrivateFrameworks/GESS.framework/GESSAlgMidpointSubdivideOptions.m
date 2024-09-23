@implementation GESSAlgMidpointSubdivideOptions

- (GESSAlgMidpointSubdivideOptions)init
{
  GESSAlgMidpointSubdivideOptions *v2;
  GESSAlgMidpointSubdivideOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GESSAlgMidpointSubdivideOptions;
  v2 = -[GESSAlgMidpointSubdivideOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GESSAlgMidpointSubdivideOptions setIterations:](v2, "setIterations:", 1);
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

@end
