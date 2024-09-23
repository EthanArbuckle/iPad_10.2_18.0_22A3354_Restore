@implementation SGCubicSpline

- (SGCubicSpline)initWithNumberOfControlPoints:(int)a3 isClosed:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  SGCubicSpline *v6;
  SGCubicSpline *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)SGCubicSpline;
  v6 = -[SGCubicSpline init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_length = v5;
    v6->_startIndex = -1;
    v6->_processedPoints = ($1162CC34C1E32B87B4666730FB29695F *)SGSplineVector_new(v5);
    v7->_controlPoints = ($1162CC34C1E32B87B4666730FB29695F *)SGSplineVector_new(v5);
    v7->_workspace = ($1162CC34C1E32B87B4666730FB29695F *)SGSplineVector_new(v5);
    v7->_closed = v4;
    +[SGCubicSplineMatrixCache sharedInstance](SGCubicSplineMatrixCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
      v10 = objc_msgSend(v8, "closedSplineMatrixWithDimension:", v5);
    else
      v10 = objc_msgSend(v8, "openSplineMatrixWithDimension:", v5);
    v7->_splineMatrix = ($6F5639B62F6C861EB4A71773F5DCFA27 *)v10;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  SGSplineVector_destroy((void **)&self->_processedPoints->var0);
  SGSplineVector_destroy((void **)&self->_controlPoints->var0);
  SGSplineVector_destroy((void **)&self->_workspace->var0);
  v3.receiver = self;
  v3.super_class = (Class)SGCubicSpline;
  -[SGCubicSpline dealloc](&v3, sel_dealloc);
}

- ($1162CC34C1E32B87B4666730FB29695F)controlPointsBuffer
{
  return self->_controlPoints;
}

- (int)length
{
  return self->_length;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)_processSpline
{
  const float **controlPoints;
  $1162CC34C1E32B87B4666730FB29695F *workspace;
  int v4;
  float __C;

  controlPoints = (const float **)self->_controlPoints;
  workspace = self->_workspace;
  v4 = *((_DWORD *)controlPoints + 2);
  __C = 3.0;
  vDSP_vsbsm(*controlPoints + 4, 1, *controlPoints, 1, &__C, (float *)workspace->var0 + 2, 1, 2 * v4 - 4);
}

- (void)_processClosedSpline
{
  $1162CC34C1E32B87B4666730FB29695F *controlPoints;
  int var0;

  controlPoints = self->_controlPoints;
  var0 = (int)controlPoints[1].var0;
  __asm { FMOV            V1.2S, #3.0 }
  *(float32x2_t *)self->_workspace->var0 = vmul_f32(vsub_f32(*(float32x2_t *)(controlPoints->var0 + 2), *(float32x2_t *)&controlPoints->var0[2 * var0 - 2]), _D1);
  *(float32x2_t *)&self->_workspace->var0[2 * var0 - 2] = vmul_f32(vsub_f32(*(float32x2_t *)self->_controlPoints->var0, *(float32x2_t *)&self->_controlPoints->var0[2 * var0 - 4]), _D1);
  -[SGCubicSpline _processSpline](self, "_processSpline");
}

- (void)_processOpenSpline
{
  float32x2_t **controlPoints;
  int v3;

  controlPoints = (float32x2_t **)self->_controlPoints;
  v3 = *((_DWORD *)controlPoints + 2);
  __asm { FMOV            V1.2S, #3.0 }
  *(float32x2_t *)self->_workspace->var0 = vmul_f32(vsub_f32((*controlPoints)[1], **controlPoints), _D1);
  *(float32x2_t *)&self->_workspace->var0[2 * v3 - 2] = vmul_f32(vsub_f32(*(float32x2_t *)&self->_controlPoints->var0[2 * v3 - 2], *(float32x2_t *)&self->_controlPoints->var0[2 * v3 - 4]), _D1);
  -[SGCubicSpline _processSpline](self, "_processSpline");
}

- (void)process
{
  if (self->_closed)
    -[SGCubicSpline _processClosedSpline](self, "_processClosedSpline");
  else
    -[SGCubicSpline _processOpenSpline](self, "_processOpenSpline");
  SGSplineVector_zero((uint64_t)self->_processedPoints);
  SGSplineMatrix_times_SGSplineVector_float((uint64_t)self->_splineMatrix, &self->_workspace->var0, &self->_processedPoints->var0);
  self->_startIndex = -1;
}

- (uint64_t)interpolateAt:(void *)a1
{
  return objc_msgSend(a1, "interpolateAt:derivative:", 0);
}

- (float32x2_t)interpolateAt:(double)a3 derivative:(double)a4
{
  int v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v20;
  float32x2_t v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v30;
  float32x2_t v31;
  int32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;

  v9 = (int)a2;
  *(float *)&a3 = a2 - (float)(int)a2;
  if (*(_DWORD *)(a1 + 48) == (int)a2)
  {
    v10 = *(float32x2_t *)(a1 + 56);
    v11 = *(float32x2_t *)(a1 + 64);
    *(float *)&a7 = *(float *)&a3 * *(float *)&a3;
    v13 = *(float32x2_t *)(a1 + 72);
    v12 = *(float32x2_t *)(a1 + 80);
    v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    if (a9)
    {
      __asm { FMOV            V7.2S, #3.0 }
      v20 = vmul_f32(v12, _D7);
      v21 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0);
      *a9 = vmla_n_f32(vmla_n_f32(v11, vadd_f32(v13, v13), *(float *)&a3), v20, *(float *)&a7);
    }
    else
    {
      v21 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0);
    }
    return vmla_n_f32(vmla_f32(vmla_f32(v10, v11, v14), v13, v21), v12, *(float *)&a3 * *(float *)&a7);
  }
  else
  {
    *(_DWORD *)(a1 + 48) = v9;
    v22 = *(uint64_t **)(a1 + 16);
    v23 = (v9 + 1) % *((_DWORD *)v22 + 2);
    v24 = *v22;
    v25 = **(_QWORD **)(a1 + 8);
    v26 = *(float32x2_t *)(v24 + 8 * v9);
    *(float32x2_t *)(a1 + 56) = v26;
    v27 = *(float32x2_t *)(v25 + 8 * v9);
    *(float32x2_t *)(a1 + 64) = v27;
    v28 = vsub_f32(*(float32x2_t *)(v24 + 8 * v23), *(float32x2_t *)(v24 + 8 * v9));
    v32.i32[1] = -1073741824;
    __asm { FMOV            V7.2S, #3.0 }
    v30 = vsub_f32(vmla_f32(vmul_f32(*(float32x2_t *)(v25 + 8 * v9), (float32x2_t)0xC0000000C0000000), _D7, v28), *(float32x2_t *)(v25 + 8 * v23));
    *(float32x2_t *)(a1 + 72) = v30;
    v31 = vadd_f32(vmla_f32(*(float32x2_t *)(v25 + 8 * v9), (float32x2_t)0xC0000000C0000000, v28), *(float32x2_t *)(v25 + 8 * v23));
    *(float32x2_t *)(a1 + 80) = v31;
    *(float *)v32.i32 = *(float *)&a3 * *(float *)&a3;
    v33 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0);
    if (a9)
    {
      v34 = vmul_f32(v31, _D7);
      v35 = (float32x2_t)vdup_lane_s32(v32, 0);
      *a9 = vmla_n_f32(vmla_n_f32(v27, vadd_f32(v30, v30), *(float *)&a3), v34, *(float *)v32.i32);
    }
    else
    {
      v35 = (float32x2_t)vdup_lane_s32(v32, 0);
    }
    return vmla_n_f32(vmla_f32(vmla_f32(v26, v27, v33), v30, v35), v31, *(float *)&a3 * *(float *)v32.i32);
  }
}

- (void)interpolateWithSteps:(int)a3 interpolation:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  float v8;
  int v9;
  long double v10;
  uint64_t v11;

  v6 = (void (**)(id, _QWORD))a4;
  if ((a3 & 0x80000000) == 0)
  {
    v7 = 0;
    v8 = (float)(self->_closed + self->_length - 1) / (float)a3;
    v9 = a3 + 1;
    do
    {
      v10 = fmod((float)(v8 * (float)(int)v7), (double)self->_length);
      *(float *)&v10 = v10;
      v11 = 0;
      -[SGCubicSpline interpolateAt:derivative:](self, "interpolateAt:derivative:", &v11, (double)v10);
      v6[2](v6, v7);
      v7 = (v7 + 1);
    }
    while (v9 != (_DWORD)v7);
  }

}

- (void)getControlPoints:(SGCubicSpline *)self processedPoints:(SEL)a2
{
  int **v2;
  int **v3;

  *v2 = self->_controlPoints->var0;
  *v3 = self->_processedPoints->var0;
}

@end
