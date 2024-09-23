@implementation GKMoveNoiseModifier

- (GKMoveNoiseModifier)init
{
  _QWORD v3[2];
  __int128 v4;

  v3[0] = 0;
  v3[1] = 0;
  v4 = 0u;
  return -[GKMoveNoiseModifier initWithDelta:](self, "initWithDelta:", v3);
}

- (GKMoveNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  _QWORD v4[2];
  __int128 v5;

  v4[0] = 0;
  v4[1] = 0;
  v5 = 0u;
  return -[GKMoveNoiseModifier initWithDelta:](self, "initWithDelta:", v4);
}

- (GKMoveNoiseModifier)initWithDelta:(GKMoveNoiseModifier *)self
{
  __int128 *v2;
  GKMoveNoiseModifier *result;
  __int128 v4;
  __int128 v5;
  objc_super v6;

  v4 = v2[1];
  v5 = *v2;
  v6.receiver = self;
  v6.super_class = (Class)GKMoveNoiseModifier;
  result = -[GKNoiseModifier initWithInputModuleCount:](&v6, sel_initWithInputModuleCount_, 1);
  if (result)
  {
    *(_OWORD *)result->_delta = v5;
    *(_OWORD *)&result->_delta[16] = v4;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKMoveNoiseModifier *)self
{
  float64x2_t *v2;
  double v4;
  void *v5;
  __int128 v6;
  double v7;
  double v8;
  float64x2_t v10;
  _OWORD v11[2];

  v10 = *v2;
  v4 = v2[1].f64[0];
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v6 = *(double *)&self->_delta[16] + v4;
  v11[0] = vaddq_f64(*(float64x2_t *)self->_delta, v10);
  v11[1] = v6;
  objc_msgSend(v5, "valueAt:", v11);
  v8 = v7;

  return v8;
}

- (id)cloneModule
{
  GKMoveNoiseModifier *v3;
  __int128 v4;
  _OWORD v6[2];

  v3 = [GKMoveNoiseModifier alloc];
  v4 = *(_OWORD *)&self->_delta[16];
  v6[0] = *(_OWORD *)self->_delta;
  v6[1] = v4;
  return -[GKMoveNoiseModifier initWithDelta:](v3, "initWithDelta:", v6);
}

@end
