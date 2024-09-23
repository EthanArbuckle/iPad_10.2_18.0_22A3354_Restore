@implementation GKRotateNoiseModifier

- (GKRotateNoiseModifier)init
{
  _QWORD v3[2];
  __int128 v4;

  v3[0] = 0;
  v3[1] = 0;
  v4 = 0u;
  return -[GKRotateNoiseModifier initWithRadians:](self, "initWithRadians:", v3);
}

- (GKRotateNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  _QWORD v4[2];
  __int128 v5;

  v4[0] = 0;
  v4[1] = 0;
  v5 = 0u;
  return -[GKRotateNoiseModifier initWithRadians:](self, "initWithRadians:", v4);
}

- (GKRotateNoiseModifier)initWithRadians:(GKRotateNoiseModifier *)self
{
  __int128 *v2;
  GKRotateNoiseModifier *result;
  __int128 v4;
  __int128 v5;
  objc_super v6;

  v4 = v2[1];
  v5 = *v2;
  v6.receiver = self;
  v6.super_class = (Class)GKRotateNoiseModifier;
  result = -[GKNoiseModifier initWithInputModuleCount:](&v6, sel_initWithInputModuleCount_, 1);
  if (result)
  {
    *(_OWORD *)result->_radians = v5;
    *(_OWORD *)&result->_radians[16] = v4;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKRotateNoiseModifier *)self
{
  float64x2_t *v2;
  double v4;
  __double2 v5;
  __double2 v6;
  __double2 v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  void *v12;
  double v13;
  double v14;
  __int128 v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  _OWORD v21[2];

  v17 = *v2;
  v19 = v2[1];
  v16 = *(_OWORD *)self->_radians;
  v4 = *(double *)&self->_radians[8];
  v5 = __sincos_stret(*(double *)&self->_radians[16]);
  v6 = __sincos_stret(*(double *)&v16);
  v7 = __sincos_stret(v4);
  v8.f64[0] = v6.__cosval * v7.__cosval;
  v8.f64[1] = -(v6.__sinval * v5.__cosval - v6.__cosval * v7.__sinval * v5.__sinval);
  v9.f64[0] = v6.__sinval * v7.__cosval;
  v9.f64[1] = v6.__cosval * v5.__cosval + v6.__sinval * v7.__sinval * v5.__sinval;
  v10.f64[0] = -v7.__sinval;
  v10.f64[1] = v7.__cosval * v5.__sinval;
  v11 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)COERCE_UNSIGNED_INT64(v6.__sinval * v5.__sinval + v6.__cosval * v7.__sinval * v5.__cosval), v17.f64[0]), (float64x2_t)COERCE_UNSIGNED_INT64(-(v6.__cosval * v5.__sinval - v6.__sinval * v7.__sinval * v5.__cosval)), v17, 1), (float64x2_t)COERCE_UNSIGNED_INT64(v7.__cosval * v5.__cosval), v19.f64[0]);
  v18 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v8, v17.f64[0]), v9, v17, 1), v10, v19.f64[0]);
  v20 = v11;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputModules, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  v21[1] = v20;
  objc_msgSend(v12, "valueAt:", v21);
  v14 = v13;

  return v14;
}

- (id)cloneModule
{
  GKRotateNoiseModifier *v3;
  __int128 v4;
  _OWORD v6[2];

  v3 = [GKRotateNoiseModifier alloc];
  v4 = *(_OWORD *)&self->_radians[16];
  v6[0] = *(_OWORD *)self->_radians;
  v6[1] = v4;
  return -[GKRotateNoiseModifier initWithRadians:](v3, "initWithRadians:", v6);
}

@end
