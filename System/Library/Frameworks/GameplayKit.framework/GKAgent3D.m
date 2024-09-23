@implementation GKAgent3D

- (GKAgent3D)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKAgent3D;
  return -[GKAgent init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAgent3D)initWithCoder:(id)a3
{
  id v4;
  GKAgent3D *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKAgent3D;
  v5 = -[GKAgent initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation00"));
    v18 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation10"));
    v17 = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation20"));
    v16 = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation01"));
    v15 = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation11"));
    v14 = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation21"));
    v13 = v11;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation02"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation12"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rotation22"));
    -[GKAgent3D setRotation:](v5, "setRotation:", COERCE_DOUBLE(__PAIR64__(v15, v18)), COERCE_DOUBLE(__PAIR64__(v14, v17)), COERCE_DOUBLE(__PAIR64__(v13, v16)));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  double v5;
  int v6;
  double v7;
  double v8;
  int v9;
  double v10;
  int v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  int v17;
  double v18;
  id v19;

  v19 = a3;
  -[GKAgent3D rotation](self, "rotation");
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation00"));
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v5) = v4;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation10"), v5);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v7) = v6;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation20"), v7);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v8) = HIDWORD(v8);
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation01"), v8);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v10) = v9;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation11"), v10);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v12) = v11;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation21"), v12);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v14) = v13;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation02"), v14);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v16) = v15;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation12"), v16);
  -[GKAgent3D rotation](self, "rotation");
  LODWORD(v18) = v17;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("rotation22"), v18);

}

- (vector_float3)position
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  vector_float3 result;

  v3 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v3 + 48))(v3);
  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v4 + 48))(v4);
  v5 = -[GKAgent vehicle](self, "vehicle");
  v6 = (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 48))(v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (void)setPosition:(vector_float3)position
{
  __n128 v3;
  void *v4;
  __n128 v5;

  v5 = v3;
  v4 = -[GKAgent vehicle](self, "vehicle", position.i64[0], position.i64[1]);
  (*(void (**)(void *, __n128, float, float))(*(_QWORD *)v4 + 56))(v4, v5, v5.n128_f32[1], v5.n128_f32[2]);
}

- (vector_float3)velocity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  vector_float3 result;

  v3 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v3 + 192))(v3);
  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *))(*(_QWORD *)v4 + 192))(v4);
  v5 = -[GKAgent vehicle](self, "vehicle");
  v6 = (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 192))(v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (BOOL)rightHanded
{
  return *(_BYTE *)(-[GKAgent vehicle](self, "vehicle") + 172);
}

- (void)setRightHanded:(BOOL)rightHanded
{
  _QWORD *v4;
  uint64_t v5;

  *(_BYTE *)(-[GKAgent vehicle](self, "vehicle") + 172) = rightHanded;
  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(_QWORD *))(*v4 + 72))(v4);
  v4[7] = 0;
  *((_BYTE *)v4 + 88) = 0;
  (*(void (**)(_QWORD *, float))(*v4 + 168))(v4, 1.0);
  (*(void (**)(_QWORD *, float))(*v4 + 208))(v4, 0.0);
  (*(void (**)(_QWORD *, float))(*v4 + 184))(v4, 0.5);
  (*(void (**)(_QWORD *, float))(*v4 + 232))(v4, 1.0);
  (*(void (**)(_QWORD *, float))(*v4 + 248))(v4, 1.0);
  v4[18] = _static_vec3_zero;
  *((_DWORD *)v4 + 38) = dword_25591E708;
  v4[15] = _static_vec3_zero;
  *((_DWORD *)v4 + 32) = dword_25591E708;
  *(_QWORD *)((char *)v4 + 132) = _static_vec3_zero;
  *((_DWORD *)v4 + 35) = dword_25591E708;
  *((_DWORD *)v4 + 29) = 0;
  *((_DWORD *)v4 + 39) = 0;
  v5 = _static_vec3_zero;
  *((_DWORD *)v4 + 42) = dword_25591E708;
  v4[20] = v5;
}

- (void)setRotation:(matrix_float3x3)rotation
{
  void *v4;
  void *v5;
  void *v6;

  v4 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *, simd_float3, float, float))(*(_QWORD *)v4 + 40))(v4, rotation.columns[0], rotation.columns[0].f32[1], rotation.columns[0].f32[2]);
  v5 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *, simd_float3, float, float))(*(_QWORD *)v5 + 24))(v5, rotation.columns[1], rotation.columns[1].f32[1], rotation.columns[1].f32[2]);
  v6 = -[GKAgent vehicle](self, "vehicle");
  (*(void (**)(void *, simd_float3, float, float))(*(_QWORD *)v6 + 8))(v6, rotation.columns[2], rotation.columns[2].f32[1], rotation.columns[2].f32[2]);
}

- (matrix_float3x3)rotation
{
  void *v3;
  __int32 v4;
  __int32 v5;
  void *v6;
  __int32 v7;
  __int32 v8;
  float (***v9)(_QWORD);
  simd_float3 v10;
  simd_float3 v11;
  simd_float3 v12;
  __int32 v13;
  __int32 v14;
  simd_float3 v15;
  simd_float3 v16;
  __int32 v17;
  simd_float3 v18;
  __int32 v19;
  __int32 v20;
  simd_float3 v21;
  __int32 v22;
  matrix_float3x3 result;

  v3 = -[GKAgent vehicle](self, "vehicle");
  v21.i64[0] = (*(double (**)(void *))(*(_QWORD *)v3 + 32))(v3);
  v20 = v4;
  v22 = v5;
  v6 = -[GKAgent vehicle](self, "vehicle");
  v18.i64[0] = (*(double (**)(void *))(*(_QWORD *)v6 + 16))(v6);
  v17 = v7;
  v19 = v8;
  v9 = -[GKAgent vehicle](self, "vehicle");
  v10.i32[0] = (**v9)(v9);
  v11 = v21;
  v11.i32[1] = v20;
  v11.i32[2] = v22;
  v12 = v18;
  v12.i32[1] = v17;
  v12.i32[2] = v19;
  v10.i32[1] = v13;
  v10.i32[2] = v14;
  v15 = v12;
  v16 = v10;
  result.columns[2] = v16;
  result.columns[1] = v15;
  result.columns[0] = v11;
  return result;
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

  -[GKAgent3D applySteeringForce:deltaTime:](self, "applySteeringForce:deltaTime:", *(double *)&v29, seconds);
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
