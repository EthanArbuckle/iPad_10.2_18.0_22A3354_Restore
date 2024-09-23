@implementation AVTMassSpringDamperSystem

- (AVTMassSpringDamperSystem)init
{
  AVTMassSpringDamperSystem *v2;
  AVTMassSpringDamperSystem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTMassSpringDamperSystem;
  v2 = -[AVTMassSpringDamperSystem init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_mass = 0x42C8000000000000;
    v2->_damping = 10.0;
    v2->_allowsOverdamping = 0;
    -[AVTMassSpringDamperSystem _updateParameters](v2, "_updateParameters");
  }
  return v3;
}

- (float)initWithMass:(float)a3 stiffness:(float)a4 damping:
{
  float *v7;
  float *v8;
  float v9;
  float v10;
  float v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)AVTMassSpringDamperSystem;
  v7 = (float *)objc_msgSendSuper2(&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = 0.0;
    if (a2 >= 0.0)
      v9 = a2;
    v10 = 100.0;
    if (a3 >= 0.0)
      v10 = a3;
    v7[2] = v9;
    v7[3] = v10;
    v11 = 10.0;
    if (a4 >= 0.0)
      v11 = a4;
    v7[4] = v11;
    *((_BYTE *)v7 + 24) = 1;
    objc_msgSend(v7, "_updateParameters");
  }
  return v8;
}

- (_DWORD)initWithPerceptualDuration:(float)a3 bounce:
{
  _DWORD *v5;
  _DWORD *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)AVTMassSpringDamperSystem;
  v5 = objc_msgSendSuper2(&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[2] = 1065353216;
    if (a2 <= 0.0)
    {
      v8 = INFINITY;
    }
    else
    {
      v7 = 6.28318531 / a2;
      v8 = v7 * v7;
    }
    *((float *)v5 + 3) = v8;
    if (a3 >= 0.0)
      v9 = 1.0 - a3;
    else
      v9 = 1.0 / (float)(a3 + 1.0);
    v10 = v9 * 12.5663706 / a2;
    *((float *)v5 + 4) = v10;
    *((_BYTE *)v5 + 24) = 1;
    objc_msgSend(v5, "_updateParameters");
  }
  return v6;
}

- (void)_updateParameters
{
  float stiffness;
  float mass;
  double v4;
  float v5;
  double v6;
  double v7;

  mass = self->_mass;
  stiffness = self->_stiffness;
  v4 = sqrtf(stiffness / mass);
  v5 = sqrtf(stiffness * mass);
  v6 = self->_damping / (v5 + v5);
  self->w0 = v4;
  self->zeta = v6;
  if (v6 < 1.0)
  {
    v7 = 1.0 - v6 * v6;
LABEL_6:
    self->wd = sqrt(v7) * v4;
    return;
  }
  if (v6 > 1.0 && self->_allowsOverdamping)
  {
    v7 = v6 * v6 + -1.0;
    goto LABEL_6;
  }
}

- (double)float3ValueAtTime:(float32x4_t)a3 initialValue:(float32x4_t)a4 initialVelocity:(float32x4_t)a5 targetValue:
{
  float32x4_t v5;
  float32x4_t v7;
  float32x4_t v8;
  uint32x4_t v9;
  float32x4_t v10;
  double v11;
  double v12;
  double v13;
  float32x4_t v14;
  double v15;
  float v16;
  __double2 v17;
  float cosval;
  float sinval;
  float32x4_t v20;
  double v21;
  double v22;
  double v23;
  float v24;
  float32x4_t v25;
  double v26;
  float32x4_t v27;
  float32x4_t v28;
  float v29;
  float v30;
  double v31;
  float v32;
  float32x4_t v33;
  float v34;
  float v35;
  float v37;
  float v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;

  if (a1)
  {
    v5 = a5;
    v7 = vabdq_f32(a3, a5);
    v8.i64[0] = 0x3400000034000000;
    v8.i64[1] = 0x3400000034000000;
    v9 = (uint32x4_t)vcgtq_f32(v8, v7);
    v9.i32[3] = v9.i32[2];
    if ((vminvq_u32(v9) & 0x80000000) == 0)
    {
      v10 = vsubq_f32(a3, v5);
      v11 = *(double *)(a1 + 40);
      v44 = v5;
      if (v11 >= 1.0)
      {
        if (v11 > 1.0 && *(_BYTE *)(a1 + 24))
        {
          v21 = *(double *)(a1 + 48);
          v22 = *(double *)(a1 + 32);
          v23 = v21 - v11 * v22;
          v24 = v23;
          v25 = vmlaq_n_f32(vnegq_f32(a4), v10, v24);
          v26 = v21 + v21;
          *(float *)&v26 = v21 + v21;
          v27 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v26, 0);
          v28 = vdivq_f32(v25, v27);
          v25.f32[0] = v21 + v11 * v22;
          v40 = vdivq_f32(vmlaq_n_f32(a4, v10, v25.f32[0]), v27);
          v42 = v28;
          v29 = exp(-(v21 + v11 * v22) * a2);
          v38 = v29;
          v30 = exp(v23 * a2);
          v20 = vmlaq_n_f32(vmulq_n_f32(v40, v30), v42, v38);
        }
        else
        {
          v31 = *(double *)(a1 + 32);
          v32 = v31;
          v33 = vmlaq_n_f32(a4, v10, v32);
          v34 = a2;
          v43 = vmlaq_n_f32(v10, v33, v34);
          v35 = exp(-(a2 * v31));
          v20 = vmulq_n_f32(v43, v35);
        }
        v5 = v44;
      }
      else
      {
        v12 = *(double *)(a1 + 32);
        v13 = v11 * v12;
        *(float *)&v13 = v11 * v12;
        v14 = vmlaq_n_f32(a4, v10, *(float *)&v13);
        v15 = *(double *)(a1 + 48);
        *(float *)&v13 = v15;
        v39 = vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0));
        v41 = v10;
        v16 = exp(-(a2 * v11) * v12);
        v37 = v16;
        v17 = __sincos_stret(v15 * a2);
        v5 = v44;
        cosval = v17.__cosval;
        sinval = v17.__sinval;
        v20 = vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v39, sinval), v41, cosval), v37);
      }
      v5.i64[0] = vaddq_f32(v5, v20).u64[0];
    }
  }
  else
  {
    v5.i64[0] = 0;
  }
  return *(double *)v5.i64;
}

- (void)float3VelocityAtTime:(float32x4_t)a3 initialValue:(double)a4 initialVelocity:(float32x4_t)a5 targetValue:
{
  float32x4_t v6;
  uint32x4_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (a1)
  {
    v6.i64[0] = 0x3400000034000000;
    v6.i64[1] = 0x3400000034000000;
    v7 = (uint32x4_t)vcgtq_f32(v6, vabdq_f32(a3, a5));
    v7.i32[3] = v7.i32[2];
    if ((vminvq_u32(v7) & 0x80000000) == 0)
    {
      v8 = *(double *)(a1 + 40);
      if (v8 >= 1.0)
      {
        if (v8 > 1.0 && *(_BYTE *)(a1 + 24))
        {
          v10 = *(double *)(a1 + 48);
          v11 = *(double *)(a1 + 32);
          v12 = v10 - v8 * v11;
          exp(-(v10 + v8 * v11) * a2);
          exp(v12 * a2);
        }
        else
        {
          exp(-(a2 * *(double *)(a1 + 32)));
        }
      }
      else
      {
        v9 = *(double *)(a1 + 48);
        exp(-(a2 * v8) * *(double *)(a1 + 32));
        __sincos_stret(v9 * a2);
      }
    }
  }
}

@end
