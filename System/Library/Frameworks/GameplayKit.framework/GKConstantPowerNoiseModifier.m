@implementation GKConstantPowerNoiseModifier

- (GKConstantPowerNoiseModifier)init
{
  return -[GKConstantPowerNoiseModifier initWithConstantPower:](self, "initWithConstantPower:", 1.0);
}

- (GKConstantPowerNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKConstantPowerNoiseModifier initWithConstantPower:](self, "initWithConstantPower:", a3, 1.0);
}

- (GKConstantPowerNoiseModifier)initWithConstantPower:(double)a3
{
  GKConstantPowerNoiseModifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKConstantPowerNoiseModifier;
  result = -[GKNoiseModifier initWithInputModuleCount:](&v5, sel_initWithInputModuleCount_, 1);
  if (result)
    result->_power = a3;
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKConstantPowerNoiseModifier *)self
{
  __int128 *v2;
  void *v4;
  double v5;
  long double v6;
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

  return pow(v6, self->_power);
}

- (id)cloneModule
{
  return -[GKConstantPowerNoiseModifier initWithConstantPower:]([GKConstantPowerNoiseModifier alloc], "initWithConstantPower:", self->_power);
}

@end
