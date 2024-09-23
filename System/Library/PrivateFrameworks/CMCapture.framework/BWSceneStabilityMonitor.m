@implementation BWSceneStabilityMonitor

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stableStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)calculateStabilityWithPixelBuffer:(__CVBuffer *)a3 pts:(id *)a4 metadataDictionary:(id)a5 forceSceneMotion:(BOOL)a6
{
  _BOOL4 v6;
  int v11;
  int v12;
  _BOOL4 sceneStable;
  float stabilityMetric;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime v25;

  v6 = a6;
  v11 = -[BWSceneStabilityMonitor _calculateStabilityWithAEMatrixFromMetadata:]((uint64_t)self, a5);
  memset(&v25, 0, sizeof(v25));
  lhs = *(CMTime *)a4;
  rhs = (CMTime)self->_pixelSumStorage.lastPTS;
  CMTimeSubtract(&v25, &lhs, &rhs);
  if ((v11 & 1) == 0)
  {
    CMTimeMakeWithSeconds(&time2, 0.1, 1000);
    lhs = v25;
    if (CMTimeCompare(&lhs, &time2) <= 0 && !v6)
    {
      v12 = 0;
      goto LABEL_7;
    }
LABEL_8:
    v12 = -[BWSceneStabilityMonitor _calculateStabilityWithSceneMotionForPixelBuffer:pts:]((uint64_t)self, a3);
    if ((v11 & v12) == 1)
    {
      sceneStable = self->_aeMatrixStorage.sceneStable;
      if (self->_aeMatrixStorage.sceneStable)
        sceneStable = self->_pixelSumStorage.sceneStable;
      stabilityMetric = self->_aeMatrixStorage.stabilityMetric;
      if (stabilityMetric >= self->_pixelSumStorage.stabilityMetric)
        stabilityMetric = self->_pixelSumStorage.stabilityMetric;
      goto LABEL_18;
    }
    if (v11)
      goto LABEL_15;
    if (v12)
    {
      sceneStable = self->_pixelSumStorage.sceneStable;
      stabilityMetric = self->_pixelSumStorage.stabilityMetric;
LABEL_18:
      v12 = 1;
      goto LABEL_19;
    }
LABEL_7:
    sceneStable = 0;
    goto LABEL_20;
  }
  if (v6)
    goto LABEL_8;
  v12 = 0;
LABEL_15:
  sceneStable = self->_aeMatrixStorage.sceneStable;
  stabilityMetric = self->_aeMatrixStorage.stabilityMetric;
LABEL_19:
  self->_stabilityMetric = stabilityMetric;
LABEL_20:
  if (self->_isLastSceneStable != sceneStable)
  {
    v15 = 40;
    if (sceneStable)
      v16 = 16;
    else
      v16 = 40;
    if (!sceneStable)
      v15 = 16;
    v17 = (char *)self + v16;
    v18 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v17 + 2) = a4->var3;
    *(_OWORD *)v17 = v18;
    v19 = MEMORY[0x1E0CA2E18];
    v20 = (char *)self + v15;
    *(_OWORD *)v20 = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v20 + 2) = *(_QWORD *)(v19 + 16);
    self->_isLastSceneStable = sceneStable;
  }
  v21 = 0;
  if (v12)
    v21 = *(_QWORD *)&self->_pixelSumStorage.offsetX;
  *(_QWORD *)&self->_sceneMotionOffsetX = v21;
  self->_processedSceneMotion = v12;
  -[BWSceneStabilityMonitor _updateAFStatusFromMetadata:](self, a5);
}

- (_BYTE)_updateAFStatusFromMetadata:(_BYTE *)result
{
  _BYTE *v2;

  if (result)
  {
    v2 = result;
    result[64] = 0;
    result = (_BYTE *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]);
    if (result)
    {
      result = (_BYTE *)objc_msgSend(result, "intValue");
      if (*((_DWORD *)v2 + 46) == 2 && (_DWORD)result == 4)
        v2[64] = 1;
      *((_DWORD *)v2 + 46) = (_DWORD)result;
    }
  }
  return result;
}

- (uint64_t)_calculateStabilityWithAEMatrixFromMetadata:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  uint16x4_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint16x4_t *v7;
  uint64_t i;
  char *v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint16x4_t *v13;
  uint64_t v14;
  uint16x4_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;

  if (result)
  {
    v2 = result;
    result = objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06798]);
    if (result)
    {
      v3 = (void *)result;
      if (objc_msgSend((id)result, "length") == 512)
      {
        v24 = 0;
        v4 = (uint16x4_t *)malloc_type_malloc(0x200uLL, 0x1000040BDFB0063uLL);
        *(_OWORD *)v4->i8 = 0u;
        *(_OWORD *)v4[2].i8 = 0u;
        *(_OWORD *)v4[4].i8 = 0u;
        *(_OWORD *)v4[6].i8 = 0u;
        *(_OWORD *)v4[8].i8 = 0u;
        *(_OWORD *)v4[10].i8 = 0u;
        *(_OWORD *)v4[12].i8 = 0u;
        *(_OWORD *)v4[14].i8 = 0u;
        *(_OWORD *)v4[16].i8 = 0u;
        *(_OWORD *)v4[18].i8 = 0u;
        *(_OWORD *)v4[20].i8 = 0u;
        *(_OWORD *)v4[22].i8 = 0u;
        *(_OWORD *)v4[24].i8 = 0u;
        *(_OWORD *)v4[26].i8 = 0u;
        *(_OWORD *)v4[28].i8 = 0u;
        *(_OWORD *)v4[30].i8 = 0u;
        *(_OWORD *)v4[32].i8 = 0u;
        *(_OWORD *)v4[34].i8 = 0u;
        *(_OWORD *)v4[36].i8 = 0u;
        *(_OWORD *)v4[38].i8 = 0u;
        *(_OWORD *)v4[40].i8 = 0u;
        *(_OWORD *)v4[42].i8 = 0u;
        *(_OWORD *)v4[44].i8 = 0u;
        *(_OWORD *)v4[46].i8 = 0u;
        *(_OWORD *)v4[48].i8 = 0u;
        *(_OWORD *)v4[50].i8 = 0u;
        *(_OWORD *)v4[52].i8 = 0u;
        *(_OWORD *)v4[54].i8 = 0u;
        *(_OWORD *)v4[56].i8 = 0u;
        *(_OWORD *)v4[58].i8 = 0u;
        *(_OWORD *)v4[60].i8 = 0u;
        *(_OWORD *)v4[62].i8 = 0u;
        v5 = objc_msgSend(v3, "bytes");
        v6 = 0;
        v7 = v4;
        do
        {
          for (i = 0; i != 16; ++i)
            v7->i16[i] = *(_WORD *)(v5 + i * 2);
          ++v6;
          v7 += 4;
          v5 += 32;
        }
        while (v6 != 16);
        v9 = (char *)malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
        v10 = malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
        v11 = (uint64_t)v10;
        v12 = 0;
        v13 = v4 + 2;
        do
        {
          *(_DWORD *)&v9[v12] = vaddvq_s32(vaddq_s32((int32x4_t)vaddl_u16(v13[-2], *v13), (int32x4_t)vaddl_high_u16(*(uint16x8_t *)v13[-2].i8, *(uint16x8_t *)v13->i8)));
          v13 += 4;
          v12 += 4;
        }
        while (v12 != 64);
        v14 = 0;
        v15 = v4;
        do
        {
          v16 = 0;
          v17 = 0;
          do
          {
            v17 += v15[v16].u16[0];
            v16 += 4;
          }
          while (v16 != 64);
          v10[v14++] = v17;
          v15 = (uint16x4_t *)((char *)v15 + 2);
        }
        while (v14 != 16);
        v18 = *(_QWORD *)(v2 + 80);
        if (v18)
        {
          v19 = *(_QWORD *)(v2 + 88);
          if (v19)
          {
            AEMatrix_FindQualityFromSums((uint64_t)v9, v18, (float *)&v24);
            AEMatrix_FindQualityFromSums(v11, v19, (float *)&v24 + 1);
            v20 = *((float *)&v24 + 1);
            v21 = *(float *)&v24;
            *(_DWORD *)(v2 + 96) = HIDWORD(v24);
            *(float *)(v2 + 100) = v21;
            if (v20 >= v21)
              v20 = v21;
            *(_BYTE *)(v2 + 104) = v20 > 0.8;
            *(float *)(v2 + 108) = v20;
          }
        }
        free(v4);
        v22 = *(void **)(v2 + 80);
        if (v22)
        {
          *(_QWORD *)(v2 + 80) = 0;
          free(v22);
        }
        v23 = *(void **)(v2 + 88);
        if (v23)
        {
          *(_QWORD *)(v2 + 88) = 0;
          free(v23);
        }
        *(_QWORD *)(v2 + 80) = v9;
        *(_QWORD *)(v2 + 88) = v11;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)processedSceneMotion
{
  return self->_processedSceneMotion;
}

- (BWSceneStabilityMonitor)init
{
  BWSceneStabilityMonitor *v2;
  BWSceneStabilityMonitor *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWSceneStabilityMonitor;
  v2 = -[BWSceneStabilityMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BWSceneStabilityMonitor reset](v2, "reset");
    v4 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&v3->_pixelSumStorage.lastPTS.value = *MEMORY[0x1E0CA2E68];
    v3->_pixelSumStorage.lastPTS.epoch = *(_QWORD *)(v4 + 16);
    v5 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v3->_stableStartTime.value = *MEMORY[0x1E0CA2E18];
    v3->_stableStartTime.epoch = *(_QWORD *)(v5 + 16);
  }
  return v3;
}

- (void)reset
{
  self->_lastAFStatus = 0;
  self->_isLastSceneStable = 0;
  self->_stabilityMetric = 0.0;
  *(_WORD *)&self->_isAFCompletedOnLastFrame = 0;
  self->_sceneMotionOffsetX = 0.0;
  self->_sceneMotionOffsetY = 0.0;
  -[BWSceneStabilityMonitor _resetAEMatrixStorage]((uint64_t)self);
  -[BWSceneStabilityMonitor _resetPixelSumStorage]((uint64_t)self);
}

- (void)_resetPixelSumStorage
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 136);
    if (v2)
    {
      *(_QWORD *)(a1 + 136) = 0;
      free(v2);
    }
    v3 = *(void **)(a1 + 144);
    if (v3)
    {
      *(_QWORD *)(a1 + 144) = 0;
      free(v3);
    }
    *(_BYTE *)(a1 + 152) = 0;
    *(_DWORD *)(a1 + 156) = 0;
    *(_QWORD *)(a1 + 112) = 0;
    *(_QWORD *)(a1 + 120) = 0;
  }
}

- (void)_resetAEMatrixStorage
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 80);
    if (v2)
    {
      *(_QWORD *)(a1 + 80) = 0;
      free(v2);
    }
    v3 = *(void **)(a1 + 88);
    if (v3)
    {
      *(_QWORD *)(a1 + 88) = 0;
      free(v3);
    }
    *(_DWORD *)(a1 + 108) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    *(_BYTE *)(a1 + 104) = 0;
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWSceneStabilityMonitor reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)BWSceneStabilityMonitor;
  -[BWSceneStabilityMonitor dealloc](&v3, sel_dealloc);
}

- (uint64_t)_calculateStabilityWithSceneMotionForPixelBuffer:(uint64_t)a1 pts:(CVPixelBufferRef)pixelBuffer
{
  uint64_t result;
  int WidthOfPlane;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  unsigned int v14;
  int32x4_t *v15;
  int32x4_t *v16;
  int32x4_t *v17;
  int v18;
  float v19;
  float v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  result = 0;
  if (!a1 || !pixelBuffer)
    return result;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  v6 = pixelSumComputeCompatibleROI(WidthOfPlane, 0.0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = v9;
  v14 = v11;
  if (*(_QWORD *)(a1 + 128) != __PAIR64__(v9, v11))
  {
    -[BWSceneStabilityMonitor _resetPixelSumStorage](a1);
    *(_DWORD *)(a1 + 128) = v14;
    *(_DWORD *)(a1 + 132) = v13;
  }
  v23 = 0;
  v24 = 0;
  v15 = (int32x4_t *)malloc_type_malloc(4 * v14, 0xE877BD66uLL);
  v16 = (int32x4_t *)malloc_type_malloc(4 * v13, 0x8D53A875uLL);
  if (pixelSumForROI(pixelBuffer, v15, v16, v6, v8, v10, v12))
  {
    fig_log_get_emitter();
  }
  else
  {
    v17 = *(int32x4_t **)(a1 + 136);
    if (!v17)
    {
LABEL_16:
      v22 = *(void **)(a1 + 144);
      if (v22)
      {
        *(_QWORD *)(a1 + 144) = 0;
        free(v22);
      }
      *(_QWORD *)(a1 + 136) = v15;
      *(_QWORD *)(a1 + 144) = v16;
      return 1;
    }
    if (!*(_QWORD *)(a1 + 144))
    {
LABEL_15:
      *(_QWORD *)(a1 + 136) = 0;
      free(v17);
      goto LABEL_16;
    }
    if (!findOffsetFromSums(v15, v17, v14, 56, 1, 0, (float *)&v24, 0, (float *)&v23)
      && !findOffsetFromSums(v16, *(int32x4_t **)(a1 + 144), v13, 56, 1, 0, (float *)&v24 + 1, 0, (float *)&v23 + 1))
    {
      v18 = v24;
      *(_DWORD *)(a1 + 112) = HIDWORD(v24);
      *(_DWORD *)(a1 + 116) = v18;
      v20 = *((float *)&v23 + 1);
      v19 = *(float *)&v23;
      *(_DWORD *)(a1 + 120) = HIDWORD(v23);
      *(float *)(a1 + 124) = v19;
      v21 = v20 > 0.1;
      if (v19 <= 0.1)
        v21 = 0;
      *(_BYTE *)(a1 + 152) = v21;
      if (v20 < v19)
        v19 = v20;
      *(float *)(a1 + 156) = v19;
      v17 = *(int32x4_t **)(a1 + 136);
      if (!v17)
        goto LABEL_16;
      goto LABEL_15;
    }
    fig_log_get_emitter();
  }
  FigDebugAssert3();
  if (v15)
    free(v15);
  if (v16)
    free(v16);
  return 0;
}

- (BOOL)isStable
{
  return self->_isLastSceneStable;
}

- (float)stabilityMetric
{
  return self->_stabilityMetric;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unstableStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (BOOL)isAFCompleted
{
  return self->_isAFCompletedOnLastFrame;
}

- (float)sceneMotionOffsetX
{
  return self->_sceneMotionOffsetX;
}

- (float)sceneMotionOffsetY
{
  return self->_sceneMotionOffsetY;
}

@end
