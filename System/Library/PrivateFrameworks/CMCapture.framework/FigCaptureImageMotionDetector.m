@implementation FigCaptureImageMotionDetector

- (FigCaptureImageMotionDetector)init
{
  char *v2;
  FigCaptureImageMotionDetector *v3;
  __int128 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureImageMotionDetector;
  v2 = -[FigCaptureImageMotionDetector init](&v6, sel_init);
  v3 = (FigCaptureImageMotionDetector *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 5) = 0;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *((_OWORD *)v2 + 4) = 0u;
    *((_OWORD *)v2 + 5) = 0u;
    *((_QWORD *)v2 + 12) = 0;
    v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *((_OWORD *)v2 + 7) = *MEMORY[0x1E0C9D648];
    *((_OWORD *)v2 + 8) = v4;
    *((_QWORD *)v2 + 18) = 1065017672;
    objc_msgSend(v2, "resetProcessingState");
  }
  return v3;
}

- (FigCaptureImageMotionDetector)initWithWidth:(int)a3 height:(int)a4
{
  return -[FigCaptureImageMotionDetector initWithWidth:height:maximumSearchRange:frameRingSize:](self, "initWithWidth:height:maximumSearchRange:frameRingSize:");
}

- (FigCaptureImageMotionDetector)initWithWidth:(int)a3 height:(int)a4 maximumSearchRange:(int)a5 frameRingSize:(int)a6
{
  FigCaptureImageMotionDetector *v6;
  size_t v9;
  FigCaptureImageMotionDetector *v11;
  FigCaptureImageMotionDetector *v12;

  v6 = self;
  if (a3 < 2
    || a4 <= 1
    || a5 < 0
    || (v9 = *(_QWORD *)&a6, v11 = -[FigCaptureImageMotionDetector init](self, "init"), (v6 = v11) != 0)
    && ((v11->_width = a3,
         v11->_height = a4,
         v11->_maximumSearchRange = a5,
         -[FigCaptureImageMotionDetector _allocateArrays:height:frameRingSize:]((uint64_t)v11, a3, a4, v9))
     || -[FigCaptureImageMotionDetector setCentralROIAndGetRect:](v6, "setCentralROIAndGetRect:", 0)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
  }
  else
  {
    v6 = v6;
    v12 = v6;
  }

  return v12;
}

- (uint64_t)_allocateArrays:(int)a3 height:(size_t)count frameRingSize:
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  size_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  if (result)
  {
    v6 = result;
    *(_DWORD *)(result + 88) = 0;
    *(_DWORD *)(result + 92) = a3;
    *(_DWORD *)(result + 96) = 0;
    *(_DWORD *)(result + 100) = a2;
    *(_DWORD *)(result + 56) = count;
    v7 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
    *(_QWORD *)(v6 + 32) = v7;
    if (!v7)
      goto LABEL_19;
    v8 = malloc_type_calloc(*(unsigned int *)(v6 + 56), 8uLL, 0x80040B8603338uLL);
    *(_QWORD *)(v6 + 40) = v8;
    if (!v8)
      goto LABEL_19;
    v9 = 8 * a3;
    v10 = 8 * a2;
    if (*(_DWORD *)(v6 + 56))
    {
      v11 = 0;
      do
      {
        *(_QWORD *)(*(_QWORD *)(v6 + 32) + 8 * v11) = malloc_type_malloc(v9, 0x214B32CAuLL);
        if (!*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8 * v11))
          goto LABEL_19;
        *(_QWORD *)(*(_QWORD *)(v6 + 40) + 8 * v11) = malloc_type_malloc(v10, 0x24D2D518uLL);
        if (!*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8 * v11))
          goto LABEL_19;
      }
      while (++v11 < (unint64_t)*(unsigned int *)(v6 + 56));
    }
    v12 = v10 <= v9 ? 8 * a3 : 8 * a2;
    v13 = v12;
    *(_QWORD *)(v6 + 64) = malloc_type_malloc(v12, 0xB32DF264uLL);
    v14 = malloc_type_malloc(v13, 0xC59264B1uLL);
    *(_QWORD *)(v6 + 72) = v14;
    if (!*(_QWORD *)(v6 + 64)
      || !v14
      || (v15 = malloc_type_malloc((16 * *(_DWORD *)(v6 + 148)) | 8, 0xC7B020F8uLL), (*(_QWORD *)(v6 + 80) = v15) == 0)
      || (v16 = 4 * *(_DWORD *)(v6 + 100),
          *(_QWORD *)(v6 + 16) = malloc_type_malloc(4 * *(_DWORD *)(v6 + 92), 0xAA9D45CFuLL),
          v17 = malloc_type_malloc(v16, 0x1BE9BD36uLL),
          *(_QWORD *)(v6 + 24) = v17,
          !*(_QWORD *)(v6 + 16))
      || !v17)
    {
LABEL_19:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294954510;
    }
    return 0;
  }
  return result;
}

- (int)setRoi:(CGRect)a3 actualROI:(CGRect *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int width;
  int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  int result;
  CGRect v32;
  CGRect v33;

  if (self->_imgProj.count)
    goto LABEL_25;
  v6 = pixelSumComputeCompatibleROI(self->_width, a3.origin.x);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  pixelSumComputeCompatibleROI(self->_width, 0.0);
  v15 = (2 * self->_maximumSearchRange) | 1;
  if (v15 < (int)v12)
  {
    if (v15 < (int)v10)
      goto LABEL_20;
    goto LABEL_12;
  }
  v16 = (v15 + (int)v14 - 1) / (int)v14 * (int)v14;
  if (v16 >= 0)
    v17 = (v15 + (int)v14 - 1) / (int)v14 * (int)v14;
  else
    v17 = v16 + 1;
  v18 = ((int)(v8 + v12 * 0.5) - (v17 >> 1)) & ~(((int)(v8 + v12 * 0.5) - (v17 >> 1)) >> 31);
  if (v18 >= self->_height + ~v16)
    v18 = self->_height + ~v16;
  v8 = (double)v18;
  v12 = (double)v16;
  if (v15 >= (int)v10)
  {
LABEL_12:
    v20 = (int)v13;
    v21 = (v15 + v20 - 1) / v20 * v20;
    if (v21 >= 0)
      v22 = v21;
    else
      v22 = v21 + 1;
    v23 = ((int)(v6 + v10 * 0.5) - (v22 >> 1)) & ~(((int)(v6 + v10 * 0.5) - (v22 >> 1)) >> 31);
    width = self->_width;
    if (v23 + v21 > width)
      v23 = (width + ~v21) / v20 * v20;
    v6 = (double)v23;
    v10 = (double)v21;
    goto LABEL_18;
  }
  width = self->_width;
LABEL_18:
  v24 = pixelSumComputeCompatibleROI(width, v6);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  v33.origin.x = v24;
  v33.origin.y = v26;
  v33.size.width = v28;
  v33.size.height = v30;
  if (!CGRectEqualToRect(v32, v33))
  {
LABEL_25:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12782;
  }
  v15 = (2 * self->_maximumSearchRange) | 1;
  v12 = v30;
  v10 = v28;
  v8 = v26;
  v6 = v24;
LABEL_20:
  if (v15 >= (int)v12 || v15 >= (int)v10)
    goto LABEL_25;
  if (a4)
  {
    a4->origin.x = v6;
    a4->origin.y = v8;
    a4->size.width = v10;
    a4->size.height = v12;
  }
  result = 0;
  self->_sumROI.origin.x = v6;
  self->_sumROI.origin.y = v8;
  self->_sumROI.size.width = v10;
  self->_sumROI.size.height = v12;
  self->_rowSumLength = (int)v12;
  self->_colSumLength = (int)v10;
  return result;
}

- (int)setCentralROIAndGetRect:(CGRect *)a3
{
  int v3;

  v3 = -[FigCaptureImageMotionDetector setRoi:actualROI:](self, "setRoi:actualROI:", a3, pixelSumComputeCompatibleROI(self->_width, (float)((float)self->_width * 0.25)));
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

- (uint64_t)processPixelBuffer:(void *)a3 metadataDictionary:
{
  id v5;
  int Width;
  int Height;
  _DWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  int WidthOfPlane;
  int HeightOfPlane;
  int BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  id v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  unint64_t v24;
  _DWORD *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  int v35;
  CVPixelBufferRef pixelBuffer;

  v5 = a3;
  if (!a1)
  {
    v31 = 0;
    goto LABEL_25;
  }
  v35 = *(_DWORD *)(a1 + 52);
  if (a2)
  {
    Width = CVPixelBufferGetWidth(a2);
    Height = CVPixelBufferGetHeight(a2);
    if (*(_DWORD *)(a1 + 8) == Width && *(_DWORD *)(a1 + 12) == Height)
    {
      if (pixelSumForROI(a2, *(int32x4_t **)(a1 + 16), *(int32x4_t **)(a1 + 24), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136)))
      {
        v8 = *(_DWORD **)(a1 + 24);
        if (v8)
        {
          v9 = *(void **)(a1 + 16);
          if (v9)
          {
            v10 = *(unsigned int *)(a1 + 88);
            if ((int)v10 > 0)
            {
              v11 = *(unsigned int *)(a1 + 96);
              if ((int)v11 > 0)
              {
                v13 = *(double *)(a1 + 112);
                v12 = *(double *)(a1 + 120);
                v14 = CVPixelBufferLockBaseAddress(a2, 1uLL);
                if ((_DWORD)v14)
                {
                  v31 = v14;
                  fig_log_get_emitter();
                  FigDebugAssert3();
                }
                else
                {
                  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, 0);
                  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, 0);
                  if ((int)v11 + (int)v13 > WidthOfPlane || (int)v10 + (int)v12 > HeightOfPlane)
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    v31 = FigSignalErrorAt();
                  }
                  else
                  {
                    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
                    pixelBuffer = a2;
                    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
                    v19 = v5;
                    v20 = BaseAddressOfPlane;
                    bzero(v8, 4 * v11);
                    bzero(v9, 4 * v10);
                    v21 = 0;
                    v22 = &v20[(int)v13 + BytesPerRowOfPlane * (uint64_t)(int)v12];
                    v5 = v19;
                    v23 = v22 + 3;
                    do
                    {
                      if (v11 >= 4)
                      {
                        v24 = 0;
                        v25 = v8 + 2;
                        do
                        {
                          v26 = *((_DWORD *)v9 + v21) + v23[v24 - 3];
                          *((_DWORD *)v9 + v21) = v26;
                          v27 = v26 + v23[v24 - 2];
                          *((_DWORD *)v9 + v21) = v27;
                          v28 = v27 + v23[v24 - 1];
                          *((_DWORD *)v9 + v21) = v28;
                          *((_DWORD *)v9 + v21) = v28 + v23[v24];
                          v29 = *(v25 - 1);
                          *(v25 - 2) += v23[v24 - 3];
                          *(v25 - 1) = v29 + v23[v24 - 2];
                          v30 = v25[1];
                          *v25 += v23[v24 - 1];
                          v25[1] = v30 + v23[v24];
                          v24 += 4;
                          v25 += 4;
                        }
                        while (v24 < (v11 & 0xFFFFFFFC));
                      }
                      ++v21;
                      v23 += BytesPerRowOfPlane;
                    }
                    while (v21 != v10);
                    v31 = 0;
                    a2 = pixelBuffer;
                  }
                  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
                  if (!(_DWORD)v31)
                    goto LABEL_20;
                }
LABEL_31:
                fig_log_get_emitter();
LABEL_34:
                FigDebugAssert3();
                goto LABEL_35;
              }
            }
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        v31 = FigSignalErrorAt();
        if ((_DWORD)v31)
          goto LABEL_31;
      }
LABEL_20:
      vDSP_vflt32D(*(const int **)(a1 + 16), 1, *(double **)(*(_QWORD *)(a1 + 32) + 8 * *(unsigned int *)(a1 + 48)), 1, *(int *)(a1 + 88));
      vDSP_vflt32D(*(const int **)(a1 + 24), 1, *(double **)(*(_QWORD *)(a1 + 40) + 8 * *(unsigned int *)(a1 + 48)), 1, *(int *)(a1 + 96));
      v32 = *(_DWORD *)(a1 + 52);
      if (v32 < *(_DWORD *)(a1 + 56))
        *(_DWORD *)(a1 + 52) = ++v32;
      if (v32 < 2)
        goto LABEL_24;
      v33 = -[FigCaptureImageMotionDetector _computeStatistics](a1);
      if (!(_DWORD)v33)
        goto LABEL_24;
      v31 = v33;
      fig_log_get_emitter();
      goto LABEL_34;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  v31 = FigSignalErrorAt();
  if ((_DWORD)v31)
  {
LABEL_35:
    *(_DWORD *)(a1 + 52) = v35;
    *(_BYTE *)(a1 + 209) = 0;
    goto LABEL_25;
  }
LABEL_24:
  v31 = 0;
  *(_DWORD *)(a1 + 48) = (*(_DWORD *)(a1 + 48) + 1) % *(_DWORD *)(a1 + 56);
LABEL_25:

  return v31;
}

- (uint64_t)_computeStatistics
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  signed int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  double *v19;
  uint64_t v20;
  int v21;
  double *v22;
  const double *v23;
  double v24;
  vDSP_Length v25;
  const double *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  BOOL v35;
  __int128 v36;
  uint64_t v37;
  int64x2_t v38;
  float64x2_t v39;
  float64x2_t v43;
  float64x2_t v44;
  unsigned int v45;
  uint64_t v46;
  signed int v48;
  int v49;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  double __C;
  double v56;
  double __StandardDeviation;
  double v58;
  double __Mean;
  _DWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = a1;
  v2 = *(_DWORD *)(a1 + 52);
  if (v2 <= 1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = 4294954514;
    goto LABEL_40;
  }
  v3 = 0;
  v4 = *(int *)(a1 + 48);
  v5 = ((int)v4 + 1) % v2;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(v6 + 8 * v5);
  v48 = v5;
  v9 = *(_QWORD *)(v7 + 8 * v5);
  v10 = *(_QWORD *)(v6 + 8 * v4);
  v49 = *(_DWORD *)(a1 + 48);
  v11 = *(_QWORD *)(v7 + 8 * v4);
  v51 = a1 + 160;
  v52 = a1 + 152;
  v62[0] = v8;
  v62[1] = v9;
  v61[0] = v10;
  v61[1] = v11;
  LODWORD(v11) = *(_DWORD *)(a1 + 88);
  v60[0] = *(_DWORD *)(a1 + 96);
  v60[1] = v11;
  v12 = *(_DWORD *)(a1 + 148);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = 1;
  while (1)
  {
    v15 = v14;
    v16 = v61[v3];
    v17 = v62[v3];
    if (v16)
      _ZF = v17 == 0;
    else
      _ZF = 1;
    if (_ZF || (v19 = *(double **)(v1 + 72)) == 0 || !v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v46 = 4294954516;
      goto LABEL_39;
    }
    if ((v12 & 0x80000000) == 0)
      break;
    v21 = 0;
LABEL_33:
    v14 = 0;
    v33 = *(double *)(v13 + 8 * v21);
    *(float *)(v52 + 4 * v3) = v33;
    *(_DWORD *)(v51 + 4 * v3) = v21 - v12;
    v3 = 1;
    if ((v15 & 1) == 0)
    {
      v34 = *(float *)(v1 + 144);
      v35 = *(float *)(v1 + 152) < v34 || *(float *)(v1 + 156) < v34;
      v46 = 0;
      v36 = *(_OWORD *)(v1 + 128);
      *(_OWORD *)(v1 + 176) = *(_OWORD *)(v1 + 112);
      *(_OWORD *)(v1 + 192) = v36;
      v37 = *(_QWORD *)(v1 + 8);
      v38.i64[0] = (int)v37;
      v38.i64[1] = SHIDWORD(v37);
      v39 = vcvtq_f64_s64(v38);
      __asm { FMOV            V1.2D, #-1.0 }
      v43 = *(float64x2_t *)(v1 + 192);
      v44 = vdivq_f64(*(float64x2_t *)(v1 + 176), vaddq_f64(v39, _Q1));
      *(_BYTE *)(v1 + 208) = v35;
      v45 = *(_DWORD *)(v1 + 52);
      *(float64x2_t *)(v1 + 176) = v44;
      *(float64x2_t *)(v1 + 192) = vdivq_f64(v43, v39);
      *(_DWORD *)(v1 + 168) = v45;
      *(_DWORD *)(v1 + 172) = (v49 - v48 + v45) % v45;
      goto LABEL_40;
    }
  }
  v53 = v15;
  v20 = 0;
  v21 = 0;
  v22 = *(double **)(v1 + 64);
  v54 = v3;
  v23 = (const double *)(v16 + 8 * v12 - 8 * (int)v12);
  v24 = -100.0;
  v25 = v60[v3] - 2 * v12;
  v26 = (const double *)(v17 + 8 * v12);
  v27 = -v12;
  v28 = (2 * v12) | 1;
  while (1)
  {
    if (v27 + v20 < v27 || (int)v25 <= 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v31 = FigSignalErrorAt();
      v29 = 0.0;
      if ((_DWORD)v31)
      {
        v46 = v31;
        goto LABEL_38;
      }
      goto LABEL_24;
    }
    if (v22)
    {
      v58 = 0.0;
      __Mean = 0.0;
      v56 = 0.0;
      __StandardDeviation = 0.0;
      vDSP_normalizeD(v23, 1, v22, 1, &__Mean, &__StandardDeviation, v25);
      vDSP_normalizeD(v26, 1, v19, 1, &v58, &v56, v25);
      __C = 0.0;
      if (__StandardDeviation < 0.0000999999975 || v56 < 0.0000999999975)
      {
        if (v56 < 0.0000999999975 && __StandardDeviation < 0.0000999999975)
          v29 = 1.0;
        else
          v29 = 0.0;
      }
      else
      {
        vDSP_convD(v22, 1, v19, 1, &__C, 1, 1uLL, v25);
        v29 = __C / (double)(int)v25;
      }
      goto LABEL_24;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v32 = FigSignalErrorAt();
    v29 = 0.0;
    if ((_DWORD)v32)
      break;
LABEL_24:
    *(double *)(v13 + 8 * v20) = v29;
    if (v29 > v24)
    {
      v24 = v29;
      v21 = v20;
    }
    ++v20;
    ++v23;
    if (v28 == v20)
    {
      v1 = a1;
      v13 = *(_QWORD *)(a1 + 80);
      v12 = *(_DWORD *)(a1 + 148);
      v3 = v54;
      v15 = v53;
      goto LABEL_33;
    }
  }
  v46 = v32;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_38:
  fig_log_get_emitter();
  FigDebugAssert3();
  v1 = a1;
LABEL_39:
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_40:
  *(_BYTE *)(v1 + 209) = (_DWORD)v46 == 0;
  return v46;
}

- (int)processPixelBuffer:(__CVBuffer *)a3
{
  return -[FigCaptureImageMotionDetector processPixelBuffer:metadataDictionary:]((uint64_t)self, a3, 0);
}

- (void)resetProcessingState
{
  uint64_t v7;
  CGSize v8;

  *(_QWORD *)&self->_imgProj.curIdx = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)self->_motionStatistics.crossCorrelationMaximum = _D0;
  v7 = MEMORY[0x1E0C9D648];
  *(_QWORD *)self->_motionStatistics.maxCorrelationShift = 0;
  *(_QWORD *)&self->_motionStatistics.frameRingBufferCount = 0;
  v8 = *(CGSize *)(v7 + 16);
  self->_motionStatistics.roi.origin = *(CGPoint *)v7;
  self->_motionStatistics.roi.size = v8;
  *(_WORD *)&self->_motionStatistics.isMotionDetected = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[FigCaptureImageMotionDetector _freeAllocatedArrays]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureImageMotionDetector;
  -[FigCaptureImageMotionDetector dealloc](&v3, sel_dealloc);
}

- (void)_freeAllocatedArrays
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    if (*(_DWORD *)(a1 + 56))
    {
      v2 = 0;
      do
      {
        v3 = *(_QWORD *)(a1 + 32);
        if (v3)
        {
          v4 = *(void **)(v3 + 8 * v2);
          if (v4)
          {
            *(_QWORD *)(v3 + 8 * v2) = 0;
            free(v4);
          }
        }
        v5 = *(_QWORD *)(a1 + 40);
        if (v5)
        {
          v6 = *(void **)(v5 + 8 * v2);
          if (v6)
          {
            *(_QWORD *)(v5 + 8 * v2) = 0;
            free(v6);
          }
        }
        ++v2;
      }
      while (v2 < *(unsigned int *)(a1 + 56));
    }
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      *(_QWORD *)(a1 + 32) = 0;
      free(v7);
    }
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      *(_QWORD *)(a1 + 40) = 0;
      free(v8);
    }
    v9 = *(void **)(a1 + 16);
    if (v9)
    {
      *(_QWORD *)(a1 + 16) = 0;
      free(v9);
    }
    v10 = *(void **)(a1 + 24);
    if (v10)
    {
      *(_QWORD *)(a1 + 24) = 0;
      free(v10);
    }
    v11 = *(void **)(a1 + 64);
    if (v11)
    {
      *(_QWORD *)(a1 + 64) = 0;
      free(v11);
    }
    v12 = *(void **)(a1 + 72);
    if (v12)
    {
      *(_QWORD *)(a1 + 72) = 0;
      free(v12);
    }
    v13 = *(void **)(a1 + 80);
    if (v13)
    {
      *(_QWORD *)(a1 + 80) = 0;
      free(v13);
    }
  }
}

- ($5D018791884760D46230C39DEE7E58E3)motionStatistics
{
  CGSize size;
  __int128 v4;

  size = self[2].var4.size;
  *(CGPoint *)retstr->var0 = self[2].var4.origin;
  *(CGSize *)&retstr->var2 = size;
  v4 = *(_OWORD *)self[3].var1;
  *(_OWORD *)&retstr->var4.origin.y = *(_OWORD *)&self[2].var5;
  *(_OWORD *)&retstr->var4.size.height = v4;
  return self;
}

- (float)stationaryThreshold
{
  return self->_stationaryThreshold;
}

- (void)setStationaryThreshold:(float)a3
{
  self->_stationaryThreshold = a3;
}

- (int)maximumSearchRange
{
  return self->_maximumSearchRange;
}

@end
