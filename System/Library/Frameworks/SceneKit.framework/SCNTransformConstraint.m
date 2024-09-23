@implementation SCNTransformConstraint

- (id)initTransformInWorld:(BOOL)a3 withBlock:(id)a4
{
  SCNTransformConstraint *v6;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNTransformConstraint;
  v6 = -[SCNConstraint init](&v10, sel_init);
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SCNTransformConstraint_initTransformInWorld_withBlock___block_invoke;
    v8[3] = &unk_1EA5A50D8;
    v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(v8, CFSTR("transform"));
  }
  return v6;
}

void *__57__SCNTransformConstraint_initTransformInWorld_withBlock___block_invoke(uint64_t a1, float a2, uint64_t a3, float32x4_t *a4, uint64_t a5)
{
  float32x4_t *WorldMatrix;
  void (*v10)(SCNMatrix4 *__return_ptr);
  void *result;
  float32x4_t *Parent;
  simd_float4x4 *v13;
  float32x4_t *TargetAddress;
  float32x4_t *v15;
  const void *Target;
  size_t v17;
  SCNMatrix4 v18;
  SCNMatrix4 a;
  SCNMatrix4 v20;
  SCNMatrix4 v21;

  memset(&v21, 0, sizeof(v21));
  if (*(_BYTE *)(a1 + 40))
  {
    WorldMatrix = C3DNodeGetWorldMatrix(a4);
  }
  else
  {
    memset(&v20, 0, sizeof(v20));
    C3DNodeGetMatrix((uint64_t)a4, (uint64_t)&v20);
    WorldMatrix = (float32x4_t *)&v20;
  }
  +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a4, C3DMatrix4x4ToSCNMatrix4((uint64_t)WorldMatrix, &v21).n128_f64[0]);
  memset(&v20, 0, sizeof(v20));
  v10 = *(void (**)(SCNMatrix4 *__return_ptr))(*(_QWORD *)(a1 + 32) + 16);
  a = v21;
  v10(&v20);
  a = v21;
  v18 = v20;
  result = (void *)SCNMatrix4EqualToMatrix4(&a, &v18);
  if ((result & 1) == 0)
  {
    memset(&a, 0, sizeof(a));
    C3DMatrix4x4FromSCNMatrix4(&a, (uint64_t)&v20);
    if (*(_BYTE *)(a1 + 40))
    {
      Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)a4);
      if (Parent)
      {
        memset(&v18, 0, sizeof(v18));
        v13 = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
        C3DMatrix4x4Invert(v13, (simd_float4x4 *)&v18);
        C3DMatrix4x4Mult((uint64_t)&a, (float32x4_t *)&v18, &a);
      }
    }
    TargetAddress = (float32x4_t *)C3DModelTargetGetTargetAddress(a5);
    v15 = TargetAddress;
    if (a2 != 1.0)
      C3DMatrix4x4Interpolate(TargetAddress, (float32x4_t *)&a, (float32x4_t *)&a, a2);
    Target = (const void *)C3DModelTargetGetTarget(a5);
    v17 = C3DSizeOfBaseType(11);
    return C3DSetValue(Target, v15, &a, v17, *(char *)(a5 + 34), *(unsigned __int8 *)(a5 + 35));
  }
  return result;
}

- (id)initPositionInWorld:(BOOL)a3 withBlock:(id)a4
{
  SCNTransformConstraint *v6;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNTransformConstraint;
  v6 = -[SCNConstraint init](&v10, sel_init);
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__SCNTransformConstraint_initPositionInWorld_withBlock___block_invoke;
    v8[3] = &unk_1EA5A50D8;
    v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(v8, CFSTR("translation"));
  }
  return v6;
}

void *__56__SCNTransformConstraint_initPositionInWorld_withBlock___block_invoke(uint64_t a1, float a2, uint64_t a3, float32x4_t *a4, uint64_t a5)
{
  __n128 *WorldMatrix;
  float v9;
  float v10;
  float32x4_t v11;
  __int32 v12;
  __int32 v13;
  void *result;
  float32x4_t v15;
  float32x4_t *Parent;
  simd_float4x4 *v17;
  float32x4_t v18;
  float32x4_t v19;
  const void *Target;
  void *TargetAddress;
  size_t v22;
  __int32 v23;
  __int32 v24;
  float32x4_t v26;
  float32x4_t v27;
  double b;
  float32x4_t v29[4];
  simd_float4x4 v30;
  float32x4_t v31;
  SCNVector3 v32;

  if (*(_BYTE *)(a1 + 40))
  {
    WorldMatrix = (__n128 *)C3DNodeGetWorldMatrix(a4);
    v30.columns[0].i32[2] = 0;
    v30.columns[0].i64[0] = 0;
    C3DMatrix4x4GetTranslation(WorldMatrix, (__n128 *)&v30);
    b = *(double *)v30.columns[0].i64;
    v9 = v30.columns[0].f32[2];
  }
  else
  {
    b = C3DNodeGetPosition((__n128 *)a4);
    v9 = v10;
  }
  +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a4);
  *(double *)v11.i64 = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v26 = v11;
  v23 = v12;
  v24 = v13;
  *(double *)&v32.x = b;
  v32.z = v9;
  result = (void *)SCNVector3EqualToVector3(*(SCNVector3 *)v11.f32, v32);
  if ((result & 1) == 0)
  {
    v15 = v26;
    v15.i32[1] = v23;
    v15.i32[2] = v24;
    v27 = v15;
    v31 = v15;
    if (*(_BYTE *)(a1 + 40))
    {
      Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)a4);
      if (Parent)
      {
        memset(&v30, 0, sizeof(v30));
        v17 = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
        C3DMatrix4x4Invert(v17, &v30);
        v29[0] = (float32x4_t)v30.columns[0];
        v29[1] = (float32x4_t)v30.columns[1];
        v29[2] = (float32x4_t)v30.columns[2];
        v29[3] = (float32x4_t)v30.columns[3];
        *(double *)v18.i64 = C3DVector3MultMatrix4x4(v29, v27);
        v27 = v18;
        v31 = v18;
      }
    }
    if (a2 != 1.0)
    {
      *(double *)v19.i64 = C3DNodeGetPosition((__n128 *)a4);
      v31 = vmlaq_n_f32(v19, vsubq_f32(v27, v19), a2);
    }
    Target = (const void *)C3DModelTargetGetTarget(a5);
    TargetAddress = (void *)C3DModelTargetGetTargetAddress(a5);
    v22 = C3DSizeOfBaseType(9);
    return C3DSetValue(Target, TargetAddress, &v31, v22, *(char *)(a5 + 34), *(unsigned __int8 *)(a5 + 35));
  }
  return result;
}

- (id)initOrientationInWorldSpace:(BOOL)a3 withBlock:(id)a4
{
  SCNTransformConstraint *v6;
  _QWORD v8[5];
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNTransformConstraint;
  v6 = -[SCNConstraint init](&v10, sel_init);
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__SCNTransformConstraint_initOrientationInWorldSpace_withBlock___block_invoke;
    v8[3] = &unk_1EA5A50D8;
    v9 = a3;
    v8[4] = a4;
    v6->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(v8, CFSTR("quaternion"));
  }
  return v6;
}

void *__64__SCNTransformConstraint_initOrientationInWorldSpace_withBlock___block_invoke(uint64_t a1, float a2, uint64_t a3, float32x4_t *a4, uint64_t a5)
{
  simd_float4 v8;
  SCNVector4 v9;
  float v10;
  float v11;
  __int32 v12;
  void *result;
  SCNVector4 v14;
  float32x4_t v15;
  float32x4_t *Parent;
  simd_float4x4 *WorldMatrix;
  float32x4_t v18;
  float32x4_t v19;
  int32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t *TargetAddress;
  float32x4_t *v25;
  float v26;
  float v33;
  float32x4_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  const void *Target;
  size_t v43;
  float v44;
  float v45;
  __int32 v46;
  float v48;
  SCNVector4 v49;
  int32x4_t v50;
  float32x4_t v51;
  SCNVector4 ba;
  SCNVector4 b;
  SCNVector4 bb;
  float32x4_t v55[4];
  simd_float4x4 v56;
  float32x4_t v57;

  if (*(_BYTE *)(a1 + 40))
  {
    v56.columns[0] = 0uLL;
    C3DNodeGetWorldOrientation(a4, &v56);
    v8 = v56.columns[0];
  }
  else
  {
    C3DNodeGetQuaternion((uint64_t)a4);
  }
  ba = (SCNVector4)v8;
  +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", a4);
  *(double *)&v9.x = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v49 = v9;
  v44 = v10;
  v45 = v11;
  v46 = v12;
  result = (void *)SCNVector4EqualToVector4(v9, ba);
  if ((result & 1) == 0)
  {
    v14 = v49;
    v14.y = v44;
    v14.z = v45;
    v15 = (float32x4_t)v14;
    v15.i32[3] = v46;
    v57 = v15;
    b = (SCNVector4)v15;
    if (*(_BYTE *)(a1 + 40))
    {
      v50 = (int32x4_t)v14;
      Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)a4);
      if (Parent)
      {
        memset(&v56, 0, sizeof(v56));
        WorldMatrix = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
        C3DMatrix4x4Invert(WorldMatrix, &v56);
        v55[0] = (float32x4_t)v56.columns[0];
        v55[1] = (float32x4_t)v56.columns[1];
        v55[2] = (float32x4_t)v56.columns[2];
        v55[3] = (float32x4_t)v56.columns[3];
        *(double *)v18.i64 = C3DMatrix4x4GetRotation(v55);
        v19 = v18;
        v19.i32[3] = v18.i32[0];
        v20 = v50;
        v21 = (float32x4_t)vzip1q_s32(v20, v20);
        v21.i32[0] = v50.i32[2];
        v22 = (float32x4_t)vuzp1q_s32(v20, v20);
        v22.i32[0] = v50.i32[1];
        v57 = vmlsq_f32(vmlaq_f32(vmlaq_laneq_f32(vmulq_f32(vmulq_f32(v19, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)b, 3), (int8x16_t)b, 4uLL)), (float32x4_t)xmmword_1DD007D20), (float32x4_t)b, v18, 3), (float32x4_t)xmmword_1DD007D20, vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v18, (int8x16_t)v18, 0xCuLL), (int8x16_t)v18, 8uLL), v21)), v22, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v18, (int32x4_t)v18), (int8x16_t)v18, 0xCuLL));
        b = (SCNVector4)v57;
      }
    }
    TargetAddress = (float32x4_t *)C3DModelTargetGetTargetAddress(a5);
    v25 = TargetAddress;
    v26 = a2;
    if (a2 != 1.0)
    {
      _Q6 = *TargetAddress;
      _Q0 = vmulq_f32(*TargetAddress, (float32x4_t)b);
      _S1 = b.z;
      __asm { FMLA            S0, S1, V6.S[2] }
      _Q2.i32[0] = LODWORD(b.w);
      v33 = -(float)(_Q0.f32[0] + (float)(COERCE_FLOAT(HIDWORD(*(unsigned __int128 *)TargetAddress)) * b.w));
      __asm { FMLA            S0, S2, V6.S[3] }
      _Q2.i32[0] = 0;
      v35 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(_Q2, _Q0), 0), (int8x16_t)vnegq_f32((float32x4_t)b), (int8x16_t)b);
      if (_Q0.f32[0] < 0.0)
        _Q0.f32[0] = v33;
      if (1.0 - _Q0.f32[0] <= 0.00100000005)
      {
        v41 = 1.0 - a2;
      }
      else
      {
        v51 = v35;
        bb = (SCNVector4)*TargetAddress;
        v36 = acosf(_Q0.f32[0]);
        v37 = sinf(v36);
        v38 = sinf((float)(1.0 - a2) * v36);
        v39 = v36 * a2;
        v48 = v38 / v37;
        v40 = sinf(v39);
        v41 = v48;
        v35 = v51;
        _Q6 = (float32x4_t)bb;
        v26 = v40 / v37;
      }
      v57 = vmlaq_n_f32(vmulq_n_f32(v35, v26), _Q6, v41);
    }
    Target = (const void *)C3DModelTargetGetTarget(a5);
    v43 = C3DSizeOfBaseType(10);
    return C3DSetValue(Target, v25, &v57, v43, *(char *)(a5 + 34), *(unsigned __int8 *)(a5 + 35));
  }
  return result;
}

+ (SCNTransformConstraint)transformConstraintInWorldSpace:(BOOL)world withBlock:(void *)block
{
  return (SCNTransformConstraint *)-[SCNTransformConstraint initTransformInWorld:withBlock:]([SCNTransformConstraint alloc], "initTransformInWorld:withBlock:", world, block);
}

+ (SCNTransformConstraint)positionConstraintInWorldSpace:(BOOL)world withBlock:(void *)block
{
  return (SCNTransformConstraint *)-[SCNTransformConstraint initPositionInWorld:withBlock:]([SCNTransformConstraint alloc], "initPositionInWorld:withBlock:", world, block);
}

+ (SCNTransformConstraint)orientationConstraintInWorldSpace:(BOOL)world withBlock:(void *)block
{
  return (SCNTransformConstraint *)-[SCNTransformConstraint initOrientationInWorldSpace:withBlock:]([SCNTransformConstraint alloc], "initOrientationInWorldSpace:withBlock:", world, block);
}

- (SCNTransformConstraint)initWithCoder:(id)a3
{
  SCNTransformConstraint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNTransformConstraint;
  v4 = -[SCNConstraint init](&v6, sel_init);
  if (v4)
  {
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateProcedural(&__block_literal_global_131, CFSTR("transform"));
    -[SCNConstraint finalizeDecodeConstraint:](v4, "finalizeDecodeConstraint:", a3);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  _QWORD *Copy;

  v4 = objc_alloc_init((Class)objc_opt_class());
  Copy = C3DConstraintProceduralCreateCopy((uint64_t)self->super._constraintRef);
  objc_msgSend(v4, "setConstraintRef:", Copy);
  CFRelease(Copy);
  -[SCNConstraint copyTo:](self, "copyTo:", v4);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
