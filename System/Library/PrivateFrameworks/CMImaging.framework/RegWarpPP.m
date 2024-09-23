@implementation RegWarpPP

+ (unsigned)computeExternalMemoryBlockSize:(id *)a3 imageWidth:(unsigned int)a4 imageHeight:(unsigned int)a5 imageFormat:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[7];
  unsigned int v16;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v16 = 0;
  v14 = 0u;
  memset(v15, 0, sizeof(v15));
  v12 = 0u;
  v13 = 0u;
  if (a3)
  {
    if (rwppRegEngine_checkDefaults((uint64_t)a3))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    v10 = *(_OWORD *)&a3->var4;
    v12 = *(_OWORD *)&a3->var0;
    v13 = v10;
    v14 = *(_OWORD *)&a3->var8;
  }
  else
  {
    rwppRegEngine_getDefaults((uint64_t)&v12);
  }
  if (+[RegWarpPP CheckParameters:imageWidth:imageHeight:imageFormat:](RegWarpPP, "CheckParameters:imageWidth:imageHeight:imageFormat:", &v12, v8, v7, v6))
  {
    return 0;
  }
  rwppRegEngine_computeMemoryBlockSize((uint64_t)&v12, v8 >> 1, v7 >> 1, (uint64_t)v15);
  return v16;
}

+ (int)CheckParameters:(id *)a3 imageWidth:(unsigned int)a4 imageHeight:(unsigned int)a5 imageFormat:(unsigned int)a6
{
  unsigned int var4;
  int result;
  int v8;

  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  if (HIWORD(a4) || (var4 = a3->var4, 8 * a3->var1 + 2 * var4 > a4) || HIWORD(a5) || 2 * var4 + 8 * a3->var2 > a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -1;
  }
  result = 0;
  if ((int)a6 > 1882468911)
  {
    if ((int)a6 > 2016686639)
    {
      if (a6 == 2016686640)
        return result;
      v8 = 2019963440;
    }
    else
    {
      if (a6 == 1882468912)
        return result;
      v8 = 1885745712;
    }
LABEL_15:
    if (a6 == v8)
      return result;
    return -1;
  }
  if (a6 != 875704422 && a6 != 875704438)
  {
    v8 = 1278226488;
    goto LABEL_15;
  }
  return result;
}

+ (unsigned)getMaxNumCorners
{
  return 1024;
}

- (RegWarpPP)initWithConfig:(id *)a3
{
  RegWarpPP *v4;
  rwppRegistrationEngineS *v5;
  OS_dispatch_queue *mtQueue;
  dispatch_group_t v7;
  OS_dispatch_group *mtGroup;
  RegWarpPP *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RegWarpPP;
  v4 = -[RegWarpPP init](&v11, sel_init);
  if (v4)
  {
    v5 = (rwppRegistrationEngineS *)rwppRegEngine_init((__int128 *)a3);
    v4->_regEng = v5;
    if (!v5
      || (mtQueue = v4->_mtQueue,
          v4->_mtQueue = 0,
          mtQueue,
          v7 = dispatch_group_create(),
          mtGroup = v4->_mtGroup,
          v4->_mtGroup = (OS_dispatch_group *)v7,
          mtGroup,
          !v4->_mtGroup))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v9 = 0;
      goto LABEL_6;
    }
    v4->_applyGDC = 0;
  }
  v9 = v4;
LABEL_6:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_resourcesAllocated = 0;
  rwppRegEngine_destroy(self->_regEng);
  v3.receiver = self;
  v3.super_class = (Class)RegWarpPP;
  -[RegWarpPP dealloc](&v3, sel_dealloc);
}

- (int)allocateResources:(unsigned int)a3 imageHeight:(unsigned int)a4 imageFormat:(unsigned int)a5 externalMemory:(void *)a6 externalMemorySize:(unsigned int)a7
{
  uint64_t v7;
  rwppRegistrationEngineS *regEng;
  int v14;
  unsigned int v15;
  unsigned int v16;
  rwppRegistrationEngineS *v17;
  int v18;

  v7 = *(_QWORD *)&a3;
  regEng = self->_regEng;
  if (regEng)
  {
    v14 = +[RegWarpPP CheckParameters:imageWidth:imageHeight:imageFormat:](RegWarpPP, "CheckParameters:imageWidth:imageHeight:imageFormat:", regEng, v7, *(_QWORD *)&a4, *(_QWORD *)&a5);
    if (!v14)
    {
      if ((a6 || !self->_usesExternalMemory) && (!a6 || self->_usesExternalMemory))
      {
        v15 = v7 >> 1;
        v16 = a4 >> 1;
        v17 = self->_regEng;
        if (self->_resourcesAllocated && v17->var2.var1 >= v15 && v17->var2.var2 >= v16 && v17->var2.var3 == a5)
          goto LABEL_10;
      }
      else
      {
        v15 = v7 >> 1;
        v16 = a4 >> 1;
        v17 = self->_regEng;
      }
      *(_WORD *)&self->_resourcesAllocated = 0;
      v17->var2.var1 = v15;
      v17->var2.var2 = v16;
      v17->var2.var3 = a5;
      v14 = rwppRegEngine_reallocResources((uint64_t)v17, (uint64_t)a6, a7);
      if (!v14)
      {
        self->_resourcesAllocated = 1;
        self->_usesExternalMemory = a6 != 0;
        v17 = self->_regEng;
LABEL_10:
        v18 = 0;
        v17->var2.var4 = self->_applyGDC;
        return v18;
      }
    }
    v18 = v14;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v18;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (void)releaseResources
{
  rwppRegistrationEngineS *regEng;

  regEng = self->_regEng;
  if (regEng)
  {
    *(_WORD *)&self->_resourcesAllocated = 0;
    rwppRegEngine_freeResources((uint64_t)regEng, 1);
  }
}

- (int)calculateHistEqLUT:(id *)a3 fromHistogram:(id *)a4
{
  uint64_t v4;
  int32x4_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  if (!a3)
    goto LABEL_9;
  if (!a4)
    goto LABEL_9;
  v4 = 0;
  v5 = 0uLL;
  do
  {
    v5 = vaddq_s32(*(int32x4_t *)&a4->var0[v4], v5);
    v4 += 4;
  }
  while (v4 != 256);
  v6 = vaddvq_s32(v5);
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v8 += a4->var0[v7];
      a3->var0[v7++] = vcvtms_s32_f32((float)((float)v8 * (float)(255.0 / (float)v6)) + 0.5);
    }
    while (v7 != 256);
    return 0;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)calculateTotalCornerStrength:(__CVBuffer *)a3 regionOfInterest:(CGRect *)a4 mapping:(id *)a5 outTotalCornerStrength:(float *)a6
{
  _DWORD *v11;
  int v12;
  CVReturn v13;
  int v14;

  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!a6)
    goto LABEL_20;
  v12 = -[RegWarpPP processParameters:inputImage:](self, "processParameters:inputImage:", a4, a3);
  if (v12)
  {
    v14 = v12;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  if (*v11 == 1)
    kdebug_trace();
  v13 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (*v11 == 1)
    kdebug_trace();
  if (v13)
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = FigSignalErrorAt();
  }
  else
  {
    -[RegWarpPP constructPyramid:selector:mapping:level0Only:](self, "constructPyramid:selector:mapping:level0Only:", a3, 1, a5, 1);
    if (*v11 == 1)
      kdebug_trace();
    rwppCnrDet_execute(&self->_regEng->var0.var0, 1u, 0, self->_mtQueue, self->_mtGroup);
    if (*v11 == 1)
      kdebug_trace();
    *a6 = (float)LODWORD(self->_regEng[27].var6.var0[1]);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    v14 = 0;
  }
LABEL_15:
  if (*v11 == 1)
    kdebug_trace();
  return v14;
}

- (int)processReference:(__CVBuffer *)a3 regionOfInterest:(CGRect *)a4 numKeypoints:(unsigned int *)a5
{
  return -[RegWarpPP processReference:gdcParams:regionOfInterest:numKeypoints:mapping:](self, "processReference:gdcParams:regionOfInterest:numKeypoints:mapping:", a3, 0, a4, a5, 0);
}

- (int)processReference:(__CVBuffer *)a3 regionOfInterest:(CGRect *)a4 numKeypoints:(unsigned int *)a5 mapping:(id *)a6
{
  return -[RegWarpPP processReference:gdcParams:regionOfInterest:numKeypoints:mapping:](self, "processReference:gdcParams:regionOfInterest:numKeypoints:mapping:", a3, 0, a4, a5, a6);
}

- (int)processReference:(__CVBuffer *)a3 gdcParams:(id *)a4 regionOfInterest:(CGRect *)a5 numKeypoints:(unsigned int *)a6
{
  return -[RegWarpPP processReference:gdcParams:regionOfInterest:numKeypoints:mapping:](self, "processReference:gdcParams:regionOfInterest:numKeypoints:mapping:", a3, a4, a5, a6, 0);
}

- (int)processReference:(__CVBuffer *)a3 gdcParams:(id *)a4 regionOfInterest:(CGRect *)a5 numKeypoints:(unsigned int *)a6 mapping:(id *)a7
{
  _DWORD *v13;
  int v14;
  CMIDistortionModel *v15;
  rwppRegistrationEngineS *regEng;
  void *v17;
  CVReturn v18;
  rwppRegistrationEngineS *v19;
  unsigned int v20;
  int v21;

  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v14 = -[RegWarpPP processParameters:inputImage:](self, "processParameters:inputImage:", a5, a3);
  if (v14)
  {
    v21 = v14;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (self->_regEng->var2.var4)
    {
      if (!a4)
        goto LABEL_26;
      v15 = -[CMIDistortionModel initWithGDCParams:]([CMIDistortionModel alloc], "initWithGDCParams:", a4);
      regEng = self->_regEng;
      v17 = *(void **)&regEng[27].var6.var1.var0;
      *(_QWORD *)&regEng[27].var6.var1.var0 = v15;

      if (!*(_QWORD *)&self->_regEng[27].var6.var1.var0)
        goto LABEL_26;
    }
    if (*v13 == 1)
      kdebug_trace();
    v18 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    if (*v13 == 1)
      kdebug_trace();
    if (v18)
    {
LABEL_26:
      fig_log_get_emitter();
      FigDebugAssert3();
      v21 = FigSignalErrorAt();
    }
    else
    {
      -[RegWarpPP constructPyramid:selector:mapping:level0Only:](self, "constructPyramid:selector:mapping:level0Only:", a3, 0, a7, 0);
      if (*v13 == 1)
        kdebug_trace();
      v19 = self->_regEng;
      if (v19->var4)
      {
        v20 = 0;
        do
        {
          rwppCnrDet_execute(&v19->var0.var0, 0, v20++, self->_mtQueue, self->_mtGroup);
          v19 = self->_regEng;
        }
        while (v20 < v19->var4);
      }
      if (*v13 == 1)
        kdebug_trace();
      if (a6)
        *a6 = self->_regEng->var10[0].var0;
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      v21 = 0;
    }
  }
  if (*v13 == 1)
    kdebug_trace();
  return v21;
}

- (int)getReferenceKeypoints:(id *)a3
{
  rwppRegistrationEngineS *regEng;
  uint64_t var0;
  unsigned int *v5;
  float *p_var0;
  float *p_var2;
  float v8;
  unsigned int v9;

  regEng = self->_regEng;
  if (regEng && self->_resourcesAllocated && a3)
  {
    var0 = regEng->var10[0].var0;
    if ((_DWORD)var0)
    {
      v5 = &regEng[2].var1[2].var6.var3.var0[192];
      p_var0 = (float *)&regEng->var10[3].var0;
      p_var2 = &a3->var2;
      do
      {
        *(p_var2 - 2) = COERCE_FLOAT(*(_QWORD *)(p_var0 - 1)) + COERCE_FLOAT(*(_QWORD *)(p_var0 - 1));
        v8 = *p_var0;
        p_var0 += 2;
        *(p_var2 - 1) = v8 + v8;
        v9 = *(unsigned __int16 *)v5;
        v5 = (unsigned int *)((char *)v5 + 2);
        *p_var2 = (float)v9;
        p_var2 += 3;
        --var0;
      }
      while (var0);
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)processNonReference:(__CVBuffer *)a3 outputTransform:(id *)a4
{
  return -[RegWarpPP processNonReference:seedTransform:outputTransform:mapping:](self, "processNonReference:seedTransform:outputTransform:mapping:", a3, 0, a4, 0);
}

- (int)processNonReference:(__CVBuffer *)a3 seedTransform:(id *)a4 outputTransform:(id *)a5 mapping:(id *)a6
{
  return -[RegWarpPP processNonReference:gdcParams:seedTransform:outputTransform:mapping:](self, "processNonReference:gdcParams:seedTransform:outputTransform:mapping:", a3, 0, a4, a5, a6);
}

- (int)processNonReference:(__CVBuffer *)a3 gdcParams:(id *)a4 outputTransform:(id *)a5
{
  return -[RegWarpPP processNonReference:gdcParams:seedTransform:outputTransform:mapping:](self, "processNonReference:gdcParams:seedTransform:outputTransform:mapping:", a3, a4, 0, a5, 0);
}

- (int)processNonReference:(__CVBuffer *)a3 gdcParams:(id *)a4 seedTransform:(id *)a5 outputTransform:(id *)a6 mapping:(id *)a7
{
  _DWORD *v13;
  rwppRegistrationEngineS *regEng;
  CMIDistortionModel *v15;
  rwppRegistrationEngineS *v16;
  void *v17;
  int Width;
  int Height;
  OSType PixelFormatType;
  rwppRegistrationEngineS *v21;
  CVReturn v22;
  int32x2_t v23;
  float32x4_t v24;
  float32x4_t v25;
  simd_float3 v26;
  uint32x2_t *v27;
  uint64_t v28;
  float32x2_t v29;
  float v30;
  float32x4_t v31;
  float v32;
  float32x4_t v33;
  float32x2_t v34;
  float v40;
  float32x4_t v41;
  uint64_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  int v47;
  int32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float v51;
  float32x2_t v52;
  float32_t v53;
  float v54;
  float32_t v55;
  float v56;
  float32x2_t v57;
  float32x2_t v58;
  float v59;
  float32x2_t v60;
  simd_float3 v62;
  simd_float3 v63;
  simd_float3 v64;
  __int128 v65;
  simd_float3x3 v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  simd_float3x3 v73;

  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v65 = 0u;
  memset(&v66, 0, sizeof(v66));
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  regEng = self->_regEng;
  if (!regEng)
    goto LABEL_37;
  if (!self->_resourcesAllocated)
    goto LABEL_37;
  if (!a3)
    goto LABEL_37;
  if (regEng->var2.var4)
  {
    if (!a4)
      goto LABEL_37;
    v15 = -[CMIDistortionModel initWithGDCParams:]([CMIDistortionModel alloc], "initWithGDCParams:", a4);
    v16 = self->_regEng;
    v17 = *(void **)&v16[27].var6.var1.var2;
    *(_QWORD *)&v16[27].var6.var1.var2 = v15;

    regEng = self->_regEng;
    if (!*(_QWORD *)&regEng[27].var6.var1.var2)
      goto LABEL_37;
  }
  if (!regEng->var4)
  {
    v47 = 0;
    *(_OWORD *)a6->var0 = xmmword_1D3304DE0;
    *(_OWORD *)&a6->var0[4] = xmmword_1D3304DE0;
    a6->var0[8] = 1.0;
    return v47;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v21 = self->_regEng;
  if (v21->var7 != Width || v21->var8 != Height || PixelFormatType != v21->var2.var3)
    goto LABEL_37;
  if (*v13 == 1)
    kdebug_trace();
  v22 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (*v13 == 1)
    kdebug_trace();
  if (!v22)
  {
    -[RegWarpPP constructPyramid:selector:mapping:level0Only:](self, "constructPyramid:selector:mapping:level0Only:", a3, 1, a7, 0);
    LODWORD(v65) = 2;
    v26 = *(simd_float3 *)(MEMORY[0x1E0C83FE8] + 16);
    v66.columns[0] = (simd_float3)*MEMORY[0x1E0C83FE8];
    v66.columns[1] = v26;
    v66.columns[2] = *(simd_float3 *)(MEMORY[0x1E0C83FE8] + 32);
    v62 = v66.columns[0];
    v63 = v26;
    v64 = v66.columns[2];
    v27 = (uint32x2_t *)self->_regEng;
    if (a5)
    {
      v28 = 0;
      v29 = vcvt_f32_u32(v27[557]);
      *(float *)v23.i32 = fmaxf(v29.f32[0], v29.f32[1]);
      v30 = v29.f32[0] + v29.f32[0];
      v31.i32[1] = 0;
      v31.i64[1] = 0;
      v31.f32[0] = (float)(v29.f32[0] + v29.f32[0]) / *(float *)v23.i32;
      v32 = v29.f32[1] + v29.f32[1];
      v33.i32[0] = 0;
      v33.i64[1] = 0;
      v33.f32[1] = (float)(v29.f32[1] + v29.f32[1]) / *(float *)v23.i32;
      v34 = vdiv_f32(vneg_f32(v29), (float32x2_t)vdup_lane_s32(v23, 0));
      __asm { FMOV            V2.4S, #1.0 }
      *(float32x2_t *)_Q2.f32 = v34;
      v40 = *(float *)v23.i32 / v30;
      v41.i32[0] = LODWORD(a5->var0[0]);
      v41.i32[1] = LODWORD(a5->var0[3]);
      v41.i64[1] = LODWORD(a5->var0[6]);
      v24.i32[0] = LODWORD(a5->var0[1]);
      v24.i32[1] = LODWORD(a5->var0[4]);
      v24.i32[2] = LODWORD(a5->var0[7]);
      v25.i32[0] = LODWORD(a5->var0[2]);
      v25.i32[1] = LODWORD(a5->var0[5]);
      v25.i32[2] = LODWORD(a5->var0[8]);
      v67 = v41;
      v68 = v24;
      v69 = v25;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      *(float *)v23.i32 = *(float *)v23.i32 / v32;
      do
      {
        *(float32x4_t *)((char *)&v70 + v28 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)((char *)&v67 + v28 * 4))), v33, *(float32x2_t *)&v67.f32[v28], 1), _Q2, *(float32x4_t *)((char *)&v67 + v28 * 4), 2);
        v28 += 4;
      }
      while (v28 != 12);
      v42 = 0;
      v43.i32[0] = 0;
      v43.i64[1] = 0;
      v43.i32[1] = v23.i32[0];
      v67 = v70;
      v68 = v71;
      v69 = v72;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v70 + v42 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)LODWORD(v40), COERCE_FLOAT(*(_OWORD *)((char *)&v67 + v42 * 4))), v43, *(float32x2_t *)&v67.f32[v42], 1), (float32x4_t)xmmword_1D33057B0, *(float32x4_t *)((char *)&v67 + v42 * 4), 2);
        v42 += 4;
      }
      while (v42 != 12);
      if (fabsf(v72.f32[2]) >= 1.0e-10)
      {
        v44 = vmulq_laneq_f32(v70, v72, 2);
        v45 = vmulq_laneq_f32(v71, v72, 2);
        v46 = vmulq_laneq_f32(v72, v72, 2);
        v66.columns[0].i32[2] = v44.i32[2];
        v66.columns[1].i32[2] = v45.i32[2];
        v66.columns[0].i64[0] = v44.i64[0];
        v66.columns[1].i64[0] = v45.i64[0];
        v66.columns[2].i32[2] = v46.i32[2];
        v66.columns[2].i64[0] = v46.i64[0];
        v73 = __invert_f3(v66);
        v62.i32[2] = v73.columns[0].i32[2];
        v63.i32[2] = v73.columns[1].i32[2];
        v62.i64[0] = v73.columns[0].i64[0];
        v63.i64[0] = v73.columns[1].i64[0];
        v64.i32[2] = v73.columns[2].i32[2];
        v64.i64[0] = v73.columns[2].i64[0];
        v27 = (uint32x2_t *)self->_regEng;
      }
    }
    v27[553].i32[1] = 0;
    if (*v13 == 1)
    {
      kdebug_trace();
      v27 = (uint32x2_t *)self->_regEng;
    }
    v47 = rwppRegEngine_execute(v27, (uint64_t)&v65, (uint64_t)&v62, self->_mtQueue, self->_mtGroup);
    if (*v13 == 1)
      kdebug_trace();
    if (v47)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else if (a6)
    {
      v49.i32[1] = v66.columns[1].i32[1];
      v50.i32[0] = v66.columns[0].i32[0];
      v51 = v66.columns[1].f32[1];
      v52 = vcvt_f32_u32(*(uint32x2_t *)&self->_regEng->var6.var1.var2);
      *(float *)v48.i32 = fmaxf(v52.f32[0], v52.f32[1]);
      v53 = vmuls_lane_f32(v66.columns[1].f32[0], v52, 1) / v52.f32[0];
      v54 = (float)(*(float *)v48.i32 * v66.columns[2].f32[0]) / v52.f32[0];
      v55 = (float)(v66.columns[0].f32[1] * v52.f32[0]) / v52.f32[1];
      v56 = vmuls_lane_f32(*(float *)v48.i32, *(float32x2_t *)v66.columns[2].f32, 1) / v52.f32[1];
      v57 = (float32x2_t)vdup_laneq_s32((int32x4_t)v66.columns[1], 2);
      v57.i32[0] = v66.columns[0].i32[2];
      v58 = vdiv_f32(vmul_f32(v57, v52), (float32x2_t)vdup_lane_s32(v48, 0));
      v59 = v66.columns[0].f32[0] + (float)(v53 - v54);
      v50.f32[1] = v53;
      v57.f32[0] = 1.0 / (float)((float)(1.0 - v58.f32[0]) - v58.f32[1]);
      *(float32x2_t *)a6->var0 = vmul_n_f32(vadd_f32(v50, v58), v57.f32[0]);
      a6->var0[2] = v57.f32[0] * (float)((float)((float)(v58.f32[1] + (float)(v58.f32[0] + v59)) + -1.0) * -0.5);
      v49.f32[0] = v55;
      *(float32x2_t *)&a6->var0[3] = vmul_n_f32(vadd_f32(v49, v58), v57.f32[0]);
      v60 = (float32x2_t)vdup_lane_s32((int32x2_t)v58, 0);
      v60.f32[0] = (float)(v58.f32[1] + (float)(v58.f32[0] + (float)((float)(v51 + v55) - v56))) + -1.0;
      *(float32x2_t *)&a6->var0[5] = vmul_n_f32(vmul_f32(v60, (float32x2_t)0x40000000BF000000), v57.f32[0]);
      a6->var0[7] = (float)(v58.f32[1] + v58.f32[1]) * v57.f32[0];
      a6->var0[8] = 1.0;
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  else
  {
LABEL_37:
    fig_log_get_emitter();
    FigDebugAssert3();
    v47 = FigSignalErrorAt();
  }
  if (*v13 == 1)
    kdebug_trace();
  return v47;
}

- (int)computeHomography:(id *)a3 referenceKeypoints:(id *)a4 nonReferenceKeypoints:(id *)a5 keypointsCount:(unsigned int)a6
{
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned __int16 *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned __int16 *v20;
  int v21;
  unsigned int v22;
  float *p_var2;
  float *v24;
  uint64_t i;
  int v26;
  __int128 v27;
  int32x4_t v28;
  int32x4_t v29;
  unint64_t v30;
  int32x4_t v32;
  int32x4_t v33;
  __int128 v34;

  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  if (!a3 || !a6 || !a4 || !a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v11 = 0;
    v12 = 0;
    v20 = 0;
    v26 = -1;
    goto LABEL_22;
  }
  v11 = malloc_type_malloc(8 * a6, 0x100004000313F17uLL);
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
    v12 = 0;
LABEL_28:
    v20 = 0;
    goto LABEL_22;
  }
  v12 = malloc_type_malloc(8 * a6, 0x100004000313F17uLL);
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
    goto LABEL_28;
  }
  v13 = a6;
  v14 = (unsigned __int16 *)malloc_type_malloc(2 * a6, 0x1000040BDFB0063uLL);
  v20 = v14;
  if (!v14)
    goto LABEL_29;
  v21 = 0;
  v22 = 0;
  p_var2 = &a4->var2;
  v24 = &a5->var2;
  do
  {
    if (*p_var2 > 0.0)
    {
      *(float *)&v15 = *(p_var2 - 2);
      v11[2 * v22] = LODWORD(v15);
      *((float *)&v15 + 1) = *(p_var2 - 1);
      *(double *)&v11[2 * v22++] = v15;
    }
    *(float *)&v15 = *v24;
    if (*v24 > 0.0)
    {
      *(float *)&v15 = *(v24 - 2);
      v12[2 * v21] = LODWORD(v15);
      *((float *)&v15 + 1) = *(v24 - 1);
      *(double *)&v12[2 * v21++] = v15;
    }
    p_var2 += 3;
    v24 += 3;
    --v13;
  }
  while (v13);
  if (v22 == v21)
  {
    if (v22)
    {
      for (i = 0; i != v22; ++i)
        v14[i] = i;
    }
    if (!rwppGeomTrans_estimateHomographyTransform((uint64_t)&v32, (uint64_t)v12, (uint64_t)v11, v14, v22, v15, v16, v17, v18, v19))
    {
      v26 = 0;
      v28 = v33;
      v27 = v34;
      *((_DWORD *)a3 + 6) = DWORD1(v34);
      *((_DWORD *)a3 + 10) = DWORD2(v27);
      v29 = v32;
      v30 = vzip1q_s32(v32, v28).u64[0];
      *((_DWORD *)a3 + 2) = v27;
      *(_QWORD *)a3 = v30;
      LODWORD(v27) = vdupq_lane_s32(*(int32x2_t *)v29.i8, 1).u32[0];
      DWORD1(v27) = v28.i32[1];
      *((_QWORD *)a3 + 2) = v27;
      LODWORD(v27) = vdupq_laneq_s32(v29, 2).u32[0];
      DWORD1(v27) = v28.i32[2];
      *((_QWORD *)a3 + 4) = v27;
      goto LABEL_22;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
LABEL_29:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  v26 = FigSignalErrorAt();
LABEL_22:
  free(v11);
  free(v12);
  free(v20);
  if (*v10 == 1)
    kdebug_trace();
  return v26;
}

- (int)getNonReferenceKeypoints:(id *)a3
{
  rwppRegistrationEngineS *regEng;
  uint64_t var0;
  unsigned int *v5;
  float *v6;
  float *p_var2;
  float v8;
  int v9;

  regEng = self->_regEng;
  if (regEng && self->_resourcesAllocated && a3)
  {
    var0 = regEng->var10[0].var0;
    if ((_DWORD)var0)
    {
      v5 = &regEng[23].var1[1].var6.var3.var0[222];
      v6 = (float *)&regEng[18].var1[2].var6.var3.var0[207];
      p_var2 = &a3->var2;
      do
      {
        *(p_var2 - 2) = COERCE_FLOAT(*(_QWORD *)(v6 - 1)) + COERCE_FLOAT(*(_QWORD *)(v6 - 1));
        v8 = *v6;
        v6 += 2;
        *(p_var2 - 1) = v8 + v8;
        v9 = *v5++;
        *(_DWORD *)p_var2 = v9;
        p_var2 += 3;
        --var0;
      }
      while (var0);
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)getNormalizedPoints:(id *)a3 numPairs:(unsigned int *)a4
{
  rwppRegistrationEngineS *regEng;
  uint64_t v5;
  unsigned int var5;
  unsigned int v7;
  unsigned int *v8;
  uint64_t v9;
  $94F468A8D4C62B317260615823C2B210 *p_var1;
  int v11;

  regEng = self->_regEng;
  if (regEng)
  {
    v5 = regEng[25].var1[3].var6.var3.var0[194];
    var5 = regEng->var5;
    v7 = *a4;
    if (var5 <= *a4)
    {
      *a4 = var5;
      v7 = var5;
    }
    if (v7)
    {
      v8 = &regEng[25].var1[3].var6.var3.var0[512 * v5 + 195];
      v9 = v7;
      p_var1 = &a3->var1;
      do
      {
        v11 = *(unsigned __int16 *)v8;
        v8 = (unsigned int *)((char *)v8 + 2);
        p_var1[-1].var0 = vmlas_n_f32(0.5, 0.5, COERCE_FLOAT(*(_QWORD *)&regEng[20].var1[0].var6.var3.var0[2 * v11 + 238]));
        p_var1[-1].var1 = (float)(*(float *)&regEng[20].var1[0].var6.var3.var0[2 * v11 + 239] * 0.5) + 0.5;
        p_var1->var0 = vmlas_n_f32(0.5, 0.5, COERCE_FLOAT(*(_QWORD *)&regEng[21].var1[3].var6.var3.var0[2 * v11 + 190]));
        p_var1->var1 = (float)(*(float *)&regEng[21].var1[3].var6.var3.var0[2 * v11 + 191] * 0.5) + 0.5;
        p_var1 += 2;
        --v9;
      }
      while (v9);
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

+ (void)getDefaults:(id *)a3
{
  rwppRegEngine_getDefaults((uint64_t)a3);
}

+ (int)convertFromImageSizeToUnity:(id *)a3 inMatrix:(id *)a4 imgWidth:(unint64_t)a5 imgHeight:(unint64_t)a6
{
  if (a3 && a4 && a5 && a6)
  {
    a3->var0[0] = a4->var0[0];
    a3->var0[1] = (float)((float)a6 / (float)a5) * a4->var0[1];
    a3->var0[2] = a4->var0[2] / (float)a5;
    a3->var0[3] = (float)((float)a5 / (float)a6) * a4->var0[3];
    a3->var0[4] = a4->var0[4];
    a3->var0[5] = a4->var0[5] / (float)a6;
    a3->var0[6] = a4->var0[6] * (float)a5;
    a3->var0[7] = a4->var0[7] * (float)a6;
    a3->var0[8] = a4->var0[8];
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

+ (int)convertFromUnityToImageSize:(id *)a3 inMatrix:(id *)a4 imgWidth:(unint64_t)a5 imgHeight:(unint64_t)a6
{
  if (a3 && a4 && a5 && a6)
  {
    a3->var0[0] = a4->var0[0];
    a3->var0[1] = (float)((float)a5 / (float)a6) * a4->var0[1];
    a3->var0[2] = a4->var0[2] * (float)a5;
    a3->var0[3] = (float)((float)a6 / (float)a5) * a4->var0[3];
    a3->var0[4] = a4->var0[4];
    a3->var0[5] = a4->var0[5] * (float)a6;
    a3->var0[6] = a4->var0[6] / (float)a5;
    a3->var0[7] = a4->var0[7] / (float)a6;
    a3->var0[8] = a4->var0[8];
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)processParameters:(CGRect *)a3 inputImage:(__CVBuffer *)a4
{
  _BOOL4 var11;
  unsigned int Width;
  unsigned int Height;
  OSType PixelFormatType;
  rwppRegistrationEngineS *regEng;
  double x;
  double y;
  double v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int var4;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  rwppRegistrationEngineS *v24;

  if (!self->_resourcesAllocated)
    goto LABEL_23;
  if (!a4)
    goto LABEL_23;
  var11 = self->_regEng->var0.var11;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  regEng = self->_regEng;
  if (PixelFormatType != regEng->var2.var3)
    goto LABEL_23;
  if (a3)
  {
    x = a3->origin.x;
    if (a3->origin.x < 0.0)
      goto LABEL_23;
    y = a3->origin.y;
    if (y < 0.0)
      goto LABEL_23;
    v14 = a3->size.width;
    if (v14 < 0.0)
      goto LABEL_23;
    v15 = a3->size.height;
    if (v15 < 0.0 || x >= (double)Width || y >= (double)Height || x + v14 > (double)Width || y + v15 > (double)Height)
      goto LABEL_23;
    v16 = v14;
    v17 = v14 >> !var11;
    var4 = regEng->var0.var4;
    if (v17 < 8 * regEng->var0.var1 + 2 * var4
      || (v19 = 2 * var4, v20 = v15, v21 = v15 >> !var11, v21 < v19 + 8 * regEng->var0.var2))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -1;
    }
    v22 = y;
    v23 = x;
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v17 = Width >> !var11;
    v21 = Height >> !var11;
    v16 = Width;
    v20 = Height;
  }
  if (v17 > regEng->var2.var1 || v21 > regEng->var2.var2)
  {
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  regEng->var7 = Width;
  regEng->var8 = Height;
  regEng->var6.var1.var0 = v23;
  regEng->var6.var1.var1 = v22;
  regEng->var6.var1.var2 = v16;
  regEng->var6.var1.var3 = v20;
  regEng->var6.var2 = 0;
  regEng->var6.var0[0] = 0;
  self->_regEng->var6.var0[1] = 0;
  v24 = self->_regEng;
  if (v24->var9[0].var1.var2 == v17 && v24->var9[0].var1.var3 == v21)
    return 0;
  else
    return rwppRegEngine_updateConfiguration(v24, v17, v21);
}

- (void)constructPyramid:(__CVBuffer *)a3 selector:(unsigned int)a4 mapping:(id *)a5 level0Only:(BOOL)a6
{
  _DWORD *v11;
  unsigned int var0;
  unsigned __int16 BytesPerRowOfPlane;
  unsigned int v14;
  rwppRegistrationEngineS *regEng;
  uint64_t i;
  rwppRegistrationEngineS *v17;
  char *v18;
  void (__cdecl *v19)(void *);
  unsigned int *(*v20)(unsigned int *);
  int var3;
  BOOL v22;
  unsigned int *(*v23)(unsigned int *);
  rwppRegistrationEngineS *v25;
  double v26;
  uint64_t j;
  rwppRegistrationEngineS *v28;
  unint64_t v29;
  uint64_t k;

  v11 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (self->_mtQueue)
    var0 = self->_regEng->var0.var0;
  else
    var0 = 1;
  if (CVPixelBufferGetPlaneCount(a3))
  {
    self->_regEng->var6.var0[a4] = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  }
  else
  {
    self->_regEng->var6.var0[a4] = (char *)CVPixelBufferGetBaseAddress(a3);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
  }
  v14 = BytesPerRowOfPlane;
  regEng = self->_regEng;
  regEng->var6.var2 = v14;
  if (var0)
  {
    for (i = 0; i != var0; ++i)
    {
      self->_regEng->var1[i].var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_regEng->var9;
      v17 = self->_regEng;
      v18 = (char *)v17 + i * 1088;
      *((_DWORD *)v18 + 20) = a4;
      *((_QWORD *)v18 + 11) = &v17->var6;
      self->_regEng->var1[i].var6.var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)a5;
    }
    regEng = self->_regEng;
  }
  if (regEng->var0.var11)
  {
    v19 = (void (__cdecl *)(void *))rwppPyramid_CopyLuma;
  }
  else
  {
    v20 = rwppPyramid_DownscaleLuma;
    var3 = regEng->var2.var3;
    v22 = var3 == 2019963440 || var3 == 2016686640;
    v23 = rwppPyramid_DownscaleLuma10Unpacked;
    if (!v22)
      v23 = rwppPyramid_DownscaleLuma;
    if (var3 == 1882468912 || var3 == 1885745712)
      v20 = rwppPyramid_DownscaleLuma10Packed;
    if (var3 <= 2016686639)
      v19 = (void (__cdecl *)(void *))v20;
    else
      v19 = (void (__cdecl *)(void *))v23;
  }
  rwppRunThreads((uint64_t)regEng, v19, var0, self->_mtQueue, self->_mtGroup);
  if (!a5)
  {
    v25 = self->_regEng;
    if (v25->var2.var0)
    {
      if (*v11 == 1)
      {
        kdebug_trace();
        v25 = self->_regEng;
      }
      rwppRunThreads((uint64_t)v25, (void (__cdecl *)(void *))rwppPyramid_accumSparseHistogram, var0, self->_mtQueue, self->_mtGroup);
      if (*v11 == 1)
        kdebug_trace();
      rwppPyramid_finalizeSparseHistogram((uint64_t)self->_regEng, v26);
      if (var0)
      {
        for (j = 0; j != var0; ++j)
          self->_regEng->var1[j].var6.var2 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_regEng[26].var1[2].var6.var3.var0[211];
      }
      if (*v11 == 1)
        kdebug_trace();
      rwppRunThreads((uint64_t)self->_regEng, (void (__cdecl *)(void *))rwppPyramid_applyHistogram, var0, self->_mtQueue, self->_mtGroup);
      if (*v11 == 1)
        kdebug_trace();
    }
  }
  if (!a6)
  {
    v28 = self->_regEng;
    if (v28->var4 >= 2)
    {
      v29 = 1;
      do
      {
        if (var0)
        {
          for (k = 0; k != var0; ++k)
          {
            self->_regEng->var1[k].var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_regEng->var9[v29];
            self->_regEng->var1[k].var6.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->_regEng->var6.var0[9 * v29 + 1];
            self->_regEng->var1[k].var6.var2 = 0;
          }
          v28 = self->_regEng;
        }
        rwppRunThreads((uint64_t)v28, (void (__cdecl *)(void *))rwppPyramid_DownscaleLuma, var0, self->_mtQueue, self->_mtGroup);
        ++v29;
        v28 = self->_regEng;
      }
      while (v29 < v28->var4);
    }
  }
  if (*v11 == 1)
    kdebug_trace();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_mtQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (FigMetalAllocator)allocator
{
  return self->_allocator;
}

- (void)setAllocator:(id)a3
{
  objc_storeStrong((id *)&self->_allocator, a3);
}

- (BOOL)applyGDC
{
  return self->_applyGDC;
}

- (void)setApplyGDC:(BOOL)a3
{
  self->_applyGDC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_mtQueue, 0);
  objc_storeStrong((id *)&self->_mtGroup, 0);
}

@end
