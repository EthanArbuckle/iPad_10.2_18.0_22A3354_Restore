@implementation GKScaleNoiseModifier

- (GKScaleNoiseModifier)init
{
  _OWORD v8[2];

  __asm { FMOV            V0.2D, #1.0 }
  v8[0] = _Q0;
  v8[1] = _Q0;
  return -[GKScaleNoiseModifier initWithFactor:](self, "initWithFactor:", v8);
}

- (GKScaleNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  _OWORD v9[2];

  __asm { FMOV            V0.2D, #1.0 }
  v9[0] = _Q0;
  v9[1] = _Q0;
  return -[GKScaleNoiseModifier initWithFactor:](self, "initWithFactor:", v9);
}

- (GKScaleNoiseModifier)initWithFactor:(GKScaleNoiseModifier *)self
{
  __int128 *v2;
  GKScaleNoiseModifier *result;
  __int128 v4;
  __int128 v5;
  objc_super v6;

  v4 = v2[1];
  v5 = *v2;
  v6.receiver = self;
  v6.super_class = (Class)GKScaleNoiseModifier;
  result = -[GKNoiseModifier initWithInputModuleCount:](&v6, sel_initWithInputModuleCount_, 1);
  if (result)
  {
    *(_OWORD *)result->_factor = v5;
    *(_OWORD *)&result->_factor[16] = v4;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKScaleNoiseModifier *)self
{
  float64x2_t *v2;
  void *v3;
  double v4;
  double v5;
  float64x2_t v7;
  float64x2_t v8;
  _OWORD v9[2];

  v7 = vmulq_f64(*(float64x2_t *)&self->_factor[16], v2[1]);
  v8 = vmulq_f64(*(float64x2_t *)self->_factor, *v2);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v8;
  v9[1] = v7;
  objc_msgSend(v3, "valueAt:", v9);
  v5 = v4;

  return v5;
}

- (id)cloneModule
{
  GKScaleNoiseModifier *v3;
  __int128 v4;
  _OWORD v6[2];

  v3 = [GKScaleNoiseModifier alloc];
  v4 = *(_OWORD *)&self->_factor[16];
  v6[0] = *(_OWORD *)self->_factor;
  v6[1] = v4;
  return -[GKScaleNoiseModifier initWithFactor:](v3, "initWithFactor:", v6);
}

@end
