@implementation GKAgent2D

- (GKAgent2D)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAgent2D;
  return -[GKAgent init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAgent2D)initWithCoder:(id)a3
{
  id v4;
  GKAgent2D *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKAgent2D;
  v5 = -[GKAgent initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation"));
    -[GKAgent2D setRotation:](v5, "setRotation:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[GKAgent2D rotation](self, "rotation");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("rotation"));

}

- (vector_float2)position
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v7;

  v3 = -[GKAgent vehicle](self, "vehicle");
  v7 = COERCE_UNSIGNED_INT64((*(double (**)(void *))(*(_QWORD *)v3 + 48))(v3));
  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v4 + 48))(v4);
  return (vector_float2)__PAIR64__(v5, v7);
}

- (vector_float2)velocity
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v7;

  v3 = -[GKAgent vehicle](self, "vehicle");
  v7 = COERCE_UNSIGNED_INT64((*(double (**)(void *))(*(_QWORD *)v3 + 192))(v3));
  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v4 + 192))(v4);
  return (vector_float2)__PAIR64__(v5, v7);
}

- (void)setPosition:(vector_float2)position
{
  char *v3;

  v3 = -[GKAgent vehicle](self, "vehicle");
  *(_QWORD *)(v3 + 44) = position.u32[0];
  *((_DWORD *)v3 + 13) = position.i32[1];
}

- (void)setPosition_:(float2)a3
{
  float var1;
  float var0;
  _DWORD *v5;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = -[GKAgent vehicle](self, "vehicle");
  *((float *)v5 + 11) = var0;
  v5[12] = 0;
  *((float *)v5 + 13) = var1;
}

- (float2)position_
{
  void *v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float2 result;

  v3 = -[GKAgent vehicle](self, "vehicle");
  v4 = (*(float (**)(void *))(*(_QWORD *)v3 + 48))(v3);
  v5 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v5 + 48))(v5);
  v7 = v6;
  v8 = v4;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

- (float2)velocity_
{
  void *v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float2 result;

  v3 = -[GKAgent vehicle](self, "vehicle");
  v4 = (*(float (**)(void *))(*(_QWORD *)v3 + 192))(v3);
  v5 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v5 + 192))(v5);
  v7 = v6;
  v8 = v4;
  result.var1 = v7;
  result.var0 = v8;
  return result;
}

- (float)rotation
{
  void *v3;
  void *v4;
  unsigned int v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float result;
  unsigned int v11;

  v3 = -[GKAgent vehicle](self, "vehicle");
  v11 = COERCE_UNSIGNED_INT64((*(double (**)(void *))(*(_QWORD *)v3 + 32))(v3));
  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v4 + 32))(v4);
  v6 = vmul_f32((float32x2_t)__PAIR64__(v5, v11), (float32x2_t)__PAIR64__(v5, v11));
  v6.i32[0] = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
  v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
  v8 = vmul_n_f32((float32x2_t)__PAIR64__(v5, v11), vmul_f32(vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)), v7).f32[0]);
  result = atan2f(v8.f32[1], v8.f32[0]);
  if (result < 0.0)
    return result + 6.28318531;
  return result;
}

- (void)setRotation:(float)rotation
{
  __float2 v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _DWORD v10[3];

  v4 = __sincosf_stret(rotation);
  v5 = -[GKAgent vehicle](self, "vehicle");
  v5[8] = LODWORD(v4.__cosval);
  v5[9] = 0;
  v5[10] = LODWORD(v4.__sinval);
  v6 = -[GKAgent vehicle](self, "vehicle");
  v7 = -[GKAgent vehicle](self, "vehicle");
  v10[0] = (*(float (**)(void *))(*(_QWORD *)v7 + 32))(v7);
  v10[1] = v8;
  v10[2] = v9;
  (*(void (**)(void *, _DWORD *))(*(_QWORD *)v6 + 120))(v6, v10);
}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  void *v5;
  char v6;
  __int128 v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  __n128 v26;
  void *v27;
  char v28;
  __int128 v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  -[GKAgent delegate](self, "delegate");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[GKAgent delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[GKAgent delegate](self, "delegate");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "agentWillUpdate:", self);

    }
  }
  -[GKAgent behavior](self, "behavior");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "getTotalForce:agent:", self, seconds);
  v29 = v7;

  -[GKAgent2D applySteeringForce:deltaTime:](self, "applySteeringForce:deltaTime:", *(double *)&v29, seconds);
  for (i = 0; ; ++i)
  {
    -[GKAgent behavior](self, "behavior", v29);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v33, "goalCount");

    if (v9 <= i)
      break;
    -[GKAgent behavior](self, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", i);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    -[GKAgent behavior](self, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "weightForGoal:", v34);
    v13 = v12;

    if (objc_msgSend(v34, "isTargetSpeedGoal"))
    {
      objc_msgSend(v34, "speed");
      if (v14 < 1.0)
      {
        objc_msgSend(v34, "speed");
        v16 = v15;
        -[GKAgent speed](self, "speed");
        v18 = v17;
        -[GKAgent maxAcceleration](self, "maxAcceleration");
        v19 = v16 - v18;
        v20 = v13 * seconds * v19;
        if (fabsf(v20) > v21)
        {
          -[GKAgent maxAcceleration](self, "maxAcceleration");
          v20 = v22 * (float)(int)((__PAIR64__(v20 > 0.0, LODWORD(v20)) - COERCE_UNSIGNED_INT(0.0)) >> 32);
        }
        -[GKAgent speed](self, "speed");
        v24 = v23;
        v25 = -[GKAgent vehicle](self, "vehicle");
        if ((float)(int)((__PAIR64__(v19 > 0.0, LODWORD(v19)) - COERCE_UNSIGNED_INT(0.0)) >> 32) == (float)(int)((__PAIR64__((float)(v16 - (float)(v24 + v20)) > 0.0, v16 - (float)(v24 + v20)) - COERCE_UNSIGNED_INT(0.0)) >> 32))
          v26.n128_f32[0] = v24 + v20;
        else
          v26.n128_f32[0] = v16;
        (*(void (**)(void *, __n128))(*(_QWORD *)v25 + 208))(v25, v26);
      }
    }

  }
  -[GKAgent delegate](self, "delegate");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[GKAgent delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) != 0)
    {
      -[GKAgent delegate](self, "delegate");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "agentDidUpdate:", self);

    }
  }
}

- (void)applySteeringForce:(double)a3 deltaTime:
{
  double v3;
  double v4;
  float32x2_t *v5;
  float v6;
  __int128 v7;
  Vec3 v8;

  v4 = v3;
  v7 = *(_OWORD *)&a3;
  v5 = -[GKAgent vehicle](self, "vehicle");
  v8 = (Vec3)v7;
  v6 = v4;
  OpenSteer::SimpleVehicle::applySteeringForce(v5, &v8, v6);
}

- (void)applyBrakingForce:(float)a3 deltaTime:(double)a4
{
  OpenSteer::SimpleVehicle *v6;
  float v7;

  v6 = -[GKAgent vehicle](self, "vehicle");
  v7 = a4;
  OpenSteer::SimpleVehicle::applyBrakingForce(v6, a3, v7);
}

@end
