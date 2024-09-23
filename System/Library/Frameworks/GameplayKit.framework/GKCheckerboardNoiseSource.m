@implementation GKCheckerboardNoiseSource

+ (GKCheckerboardNoiseSource)checkerboardNoiseWithSquareSize:(double)squareSize
{
  return (GKCheckerboardNoiseSource *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSquareSize:", squareSize);
}

- (GKCheckerboardNoiseSource)init
{
  return -[GKCheckerboardNoiseSource initWithSquareSize:](self, "initWithSquareSize:", 1.0);
}

- (GKCheckerboardNoiseSource)initWithSquareSize:(double)squareSize
{
  GKCheckerboardNoiseSource *v4;
  GKCheckerboardNoiseSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKCheckerboardNoiseSource;
  v4 = -[GKCheckerboardNoiseSource init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[GKCheckerboardNoiseSource setSquareSize:](v4, "setSquareSize:", squareSize);
  return v5;
}

- (double)valueAt:(GKCheckerboardNoiseSource *)self
{
  double *v2;
  double v4;
  double v5;
  unsigned int v6;
  double v7;
  unsigned int v8;
  double v9;
  unsigned int v10;
  double result;
  __int128 v12;

  v12 = *(_OWORD *)v2;
  v4 = v2[2];
  -[GKCheckerboardNoiseSource squareSize](self, "squareSize");
  v6 = vcvtmd_s64_f64(*(double *)&v12 / v5);
  -[GKCheckerboardNoiseSource squareSize](self, "squareSize");
  v8 = vcvtmd_s64_f64(*((double *)&v12 + 1) / v7);
  -[GKCheckerboardNoiseSource squareSize](self, "squareSize");
  v10 = v8 + v6 + vcvtmd_s64_f64(v4 / v9);
  result = -1.0;
  if ((v10 & 1) == 0)
    return 1.0;
  return result;
}

- (id)cloneModule
{
  -[GKCheckerboardNoiseSource squareSize](self, "squareSize");
  return +[GKCheckerboardNoiseSource checkerboardNoiseWithSquareSize:](GKCheckerboardNoiseSource, "checkerboardNoiseWithSquareSize:");
}

- (double)squareSize
{
  return self->_squareSize;
}

- (void)setSquareSize:(double)squareSize
{
  self->_squareSize = squareSize;
}

@end
