@implementation GKClampNoiseModifier

- (GKClampNoiseModifier)init
{
  return -[GKClampNoiseModifier initWithLowerBound:upperBound:](self, "initWithLowerBound:upperBound:", -1.0, 1.0);
}

- (GKClampNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKClampNoiseModifier initWithLowerBound:upperBound:](self, "initWithLowerBound:upperBound:", a3, -1.0, 1.0);
}

- (GKClampNoiseModifier)initWithLowerBound:(double)a3 upperBound:(double)a4
{
  GKClampNoiseModifier *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKClampNoiseModifier;
  result = -[GKNoiseModifier initWithInputModuleCount:](&v7, sel_initWithInputModuleCount_, 1);
  if (result)
  {
    result->_lowerBound = a3;
    result->_upperBound = a4;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKClampNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  double v5;
  double v6;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];

  v8 = v2[1];
  v9 = *v2;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v9;
  v10[1] = v8;
  objc_msgSend(v4, "valueAt:", v10);
  v6 = v5;

  return fmin(fmax(v6, self->_lowerBound), self->_upperBound);
}

- (id)cloneModule
{
  return -[GKClampNoiseModifier initWithLowerBound:upperBound:]([GKClampNoiseModifier alloc], "initWithLowerBound:upperBound:", self->_lowerBound, self->_upperBound);
}

@end
