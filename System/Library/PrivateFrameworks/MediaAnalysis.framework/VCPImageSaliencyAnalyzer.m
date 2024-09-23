@implementation VCPImageSaliencyAnalyzer

+ (VCPImageSaliencyAnalyzer)analyzerWith:(int)a3 prune:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if ((v6 & 1) == 0
  {
    +[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass = objc_opt_class();
  }
  if (+[VCPImageSaliencyAnalyzer analyzerWith:prune:]::once != -1)
    dispatch_once(&+[VCPImageSaliencyAnalyzer analyzerWith:prune:]::once, &__block_literal_global_26);
  return (VCPImageSaliencyAnalyzer *)(id)objc_msgSend(objc_alloc((Class)+[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass), "initWithMaxNumRegions:prune:", v5, v4);
}

uint64_t __47__VCPImageSaliencyAnalyzer_analyzerWith_prune___block_invoke()
{
  uint64_t result;

  result = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
  if ((_DWORD)result)
  {
    +[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass = objc_opt_class();
    result = DeviceHasANE();
    if ((_DWORD)result)
    {
      result = objc_opt_class();
      +[VCPImageSaliencyAnalyzer analyzerWith:prune:]::analyzerClass = result;
    }
  }
  return result;
}

- (VCPImageSaliencyAnalyzer)initWithMaxNumRegions:(int)a3 prune:(BOOL)a4
{
  VCPImageSaliencyAnalyzer *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  VCPImageSaliencyAnalyzer *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPImageSaliencyAnalyzer;
  v6 = -[VCPImageSaliencyAnalyzer init](&v12, sel_init);
  if (v6)
  {
    v7 = +[VCPCNNMetalContext supportGPU](VCPCNNMetalContext, "supportGPU");
    if (+[VCPCNNMetalContext supportVectorForward](VCPCNNMetalContext, "supportVectorForward"))
      v8 = 4;
    else
      v8 = 1;
    if (v7)
      v8 = 1;
    v6->_chunk = v8;
    if (a3 >= 5)
      v9 = 5;
    else
      v9 = a3;
    if (v9 <= 1)
      v9 = 1;
    v6->_maxNumRegions = v9;
    v6->_prune = a4;
    v10 = v6;
  }

  return v6;
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChunk:(int)a5
{
  int Width;
  int Height;
  int v10;
  CVReturn v11;
  int v12;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v15;
  int v16;
  float *v17;
  float *v18;
  float *v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v33;
  int v34;
  uint64_t v35;
  float *v36;
  float *v37;
  float *v38;
  uint64_t v39;
  uint64_t i;
  unsigned int v41;
  unsigned int v42;
  CVReturn v43;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t buf[4];
  __CVBuffer *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v24)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    return -50;
  }
  v10 = Height;
  v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v43 = v11;
  if (!v11
    || (v12 = v11, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v47 = a3,
        v48 = 1024,
        v49 = v12,
        _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v12 = v43) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    if (a5 == 4)
    {
      bzero(a4, 16 * Width * v10);
      if (v10 >= 1)
      {
        v16 = 0;
        v17 = a4 + 3;
        v18 = a4 + 2;
        v19 = a4 + 1;
        do
        {
          if (Width >= 1)
          {
            v20 = 0;
            do
            {
              LOBYTE(v15) = BaseAddress[(int)v20 + 2];
              *(float *)&v21 = (float)LODWORD(v15) / 255.0;
              v22 = v20;
              a4[v22] = *(float *)&v21;
              LOBYTE(v21) = BaseAddress[(int)v20 + 1];
              *(float *)&v23 = (float)v21 / 255.0;
              v19[v22] = *(float *)&v23;
              LOBYTE(v23) = BaseAddress[(int)v20];
              v15 = (float)v23 / 255.0;
              v18[v22] = v15;
              v17[v22] = 0.0;
              v20 += 4;
            }
            while (4 * Width != v20);
          }
          a4 += 4 * Width;
          v19 += 4 * Width;
          v18 += 4 * Width;
          BaseAddress += BytesPerRow;
          ++v16;
          v17 += 4 * Width;
        }
        while (v16 != v10);
      }
    }
    else
    {
      bzero(a4, 16 * Width * v10);
      if (v10 >= 1)
      {
        v34 = 0;
        v35 = v10 * (uint64_t)Width;
        v36 = &a4[2 * v35];
        v37 = &a4[3 * v35];
        v38 = &a4[v35];
        v39 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (i = 0; i != Width; ++i)
            {
              LOBYTE(v33) = BaseAddress[(int)(i * 4) + 2];
              *(float *)&v41 = (float)LODWORD(v33) / 255.0;
              a4[i] = *(float *)&v41;
              LOBYTE(v41) = BaseAddress[(int)(i * 4) + 1];
              *(float *)&v42 = (float)v41 / 255.0;
              v38[i] = *(float *)&v42;
              LOBYTE(v42) = BaseAddress[(int)(i * 4)];
              v33 = (float)v42 / 255.0;
              v36[i] = v33;
              v37[i] = 0.0;
            }
          }
          BaseAddress += BytesPerRow;
          ++v34;
          v37 = (float *)((char *)v37 + v39);
          v36 = (float *)((char *)v36 + v39);
          v38 = (float *)((char *)v38 + v39);
          a4 = (float *)((char *)a4 + v39);
        }
        while (v34 != v10);
      }
    }
    v12 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v43);
    if (pixelBuffer
      && !v43
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v12;
}

- (int)scaleImage:(__CVBuffer *)a3 toData:(float *)a4 withWidth:(int)a5 andHeight:(int)a6
{
  int v8;
  int v9;
  CFTypeRef cf;

  if (!a4)
    return -50;
  cf = 0;
  Scaler::Scale(&self->_scaler, a3, (__CVBuffer **)&cf, *(uint64_t *)&a5, *(uint64_t *)&a6, 1111970369);
  v9 = v8;
  if (!v8)
    v9 = -[VCPImageSaliencyAnalyzer copyImage:toData:withChunk:](self, "copyImage:toData:withChunk:", cf, a4, self->_chunk);
  if (cf)
    CFRelease(cf);
  return v9;
}

- (float)computeScore:(float *)a3 width:(int)a4 height:(int)a5 posX:(int)a6 posY:(int)a7
{
  uint64_t v8;
  float v9;
  uint64_t v10;
  float v11;
  float *v12;
  float v13;
  unsigned int v14;
  uint64_t v15;
  float *v16;
  int v17;
  float v18;
  unsigned int v19;
  float v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  float *v28;
  int v29;
  int v30;
  float *v31;
  float v32;
  int v33;
  int v34;
  float v35;
  unsigned int v36;
  int v37;
  float v38;
  float v39;
  BOOL v40;
  float result;
  int v44;
  int v45;
  uint64_t v46;
  _OWORD v48[16];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  memset(v48, 0, sizeof(v48));
  v44 = a5 - 1;
  if (a5 < 1)
  {
    v13 = 0.0;
    v11 = 0.0;
  }
  else
  {
    v8 = 0;
    v9 = (float)(a4 * a4 + a5 * a5);
    v10 = a5;
    v46 = a4;
    v45 = -a6;
    v11 = 0.0;
    v12 = a3;
    v13 = 0.0;
    do
    {
      if (a4 >= 1)
      {
        if ((int)v8 - a7 >= 0)
          v14 = v8 - a7;
        else
          v14 = a7 - v8;
        v15 = v46;
        v16 = v12;
        v17 = v45;
        do
        {
          v18 = *v16;
          if (v17 >= 0)
            v19 = v17;
          else
            v19 = -v17;
          if (v14 > 2 || v19 >= 3)
          {
            v20 = sqrtf((float)((v8 - a7) * (v8 - a7) + v17 * v17));
            v11 = v11
                + (float)((float)((float)(1.0
                                        - expf((float)((float)((float)(v20 + -2.0) * (float)(v20 + -2.0)) * -5.0) / v9))
                                * v18)
                        * v18);
          }
          else
          {
            v13 = v13 + (float)(v18 * v18);
          }
          ++v17;
          ++v16;
          --v15;
        }
        while (v15);
      }
      ++v8;
      v12 += a4;
    }
    while (v8 != v10);
  }
  if (a7 <= 2)
    v21 = 2;
  else
    v21 = a7;
  v22 = a7 + 2;
  if (v44 < a7 + 2)
    v22 = v44;
  if ((int)v21 - 2 <= v22)
  {
    if (a6 <= 2)
      v23 = 2;
    else
      v23 = a6;
    v24 = v23 - 2;
    v25 = a6 + 2;
    if (a4 - 1 < a6 + 2)
      v25 = a4 - 1;
    v26 = v21 - 2;
    v27 = v22 + 1;
    v28 = &a3[v26 * a4 - 2 + v23];
    v29 = v25 - v23 + 3;
    do
    {
      v30 = v29;
      v31 = v28;
      if (v24 <= v25)
      {
        do
        {
          v32 = *v31++;
          v33 = (int)(float)(v32 * 255.0);
          if (v33 >= 255)
            v33 = 255;
          ++*((_BYTE *)v48 + (v33 & ~(v33 >> 31)));
          --v30;
        }
        while (v30);
      }
      ++v26;
      v28 += a4;
    }
    while (v27 != (_DWORD)v26);
  }
  v34 = 0;
  v35 = 0.0;
  v36 = 255;
  do
  {
    v37 = 12 - v34;
    if (12 - v34 >= *((unsigned __int8 *)v48 + v36))
      v37 = *((unsigned __int8 *)v48 + v36);
    v35 = v35 + (float)(int)(v36 * v36 * v37);
    v34 += v37;
    if (!v36)
      break;
    --v36;
  }
  while (v34 < 12);
  if (v34 >= 1)
    v35 = sqrtf(v35 / (float)v34) / 255.0;
  v38 = (float)((float)(v13 / (float)((float)(v13 + v11) + 0.001)) + 0.2) * (float)(v35 * 2.5);
  v39 = 1.0;
  if (v38 < 1.0)
    v39 = v38;
  v40 = v38 > 0.0;
  result = 0.0;
  if (v40)
    return v39;
  return result;
}

- (float)outputScaling
{
  return 1.0;
}

- (int)generateSalientRegion:(float *)a3 outHeight:(int)a4 outWidth:(int)a5
{
  uint64_t v5;
  float v9;
  float v10;
  size_t v11;
  size_t v12;
  const std::nothrow_t *v13;
  void *v14;
  char *v15;
  char *v16;
  BOOL v17;
  int v18;
  float v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  uint64x2_t v24;
  float v25;
  uint64_t v26;
  int v27;
  float *v28;
  uint64_t chunk;
  float *v30;
  uint64_t v31;
  uint64_t v32;
  float *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  int v48;
  int v49;
  float v50;
  BOOL v51;
  float v52;
  int v53;
  float v54;
  int v55;
  float v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double *p_x;
  double v66;
  int v67;
  int v68;
  size_t v69;
  int v70;
  int v71;
  float v73;
  float v74;
  char *v75;
  void *v76;
  VCPImageSaliencyAnalyzer *v77;
  uint64_t v78;
  uint64_t v79;
  int64x2_t v80;
  int v81;
  uint64x2_t v82;
  float v83;
  char *v84;
  unsigned __int8 v85;
  int v86;
  int64x2_t v87;
  _DWORD v88[9];
  uint64_t v89;

  v5 = *(_QWORD *)&a5;
  v89 = *MEMORY[0x1E0C80C00];
  -[VCPImageSaliencyAnalyzer outputScaling](self, "outputScaling");
  if (!a3)
    return -18;
  v10 = v9;
  v11 = 4 * (int)v5 * a4;
  if ((int)v5 * a4 < 0)
    v12 = -1;
  else
    v12 = 4 * (int)v5 * a4;
  v13 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
  v14 = operator new[](v12, MEMORY[0x1E0DE4E10]);
  v15 = (char *)operator new[](v12, v13);
  v16 = v15;
  if (v14)
    v17 = v15 == 0;
  else
    v17 = 1;
  if (!v17)
  {
    v77 = self;
    v79 = v5;
    v19 = (float)(a4 * a4 + v5 * v5);
    bzero(v14, v11);
    v20 = 0;
    v21 = v88;
    v82 = (uint64x2_t)vdupq_n_s64(3uLL);
    v80 = vdupq_n_s64(2uLL);
    do
    {
      v22 = 0;
      v23 = v20 * v20;
      v24 = (uint64x2_t)xmmword_1B6FBCE90;
      do
      {
        v85 = vmovn_s64((int64x2_t)vcgtq_u64(v82, v24)).u8[0];
        v87 = (int64x2_t)v24;
        v83 = expf((float)((float)(v23 + (v22 + 1) * (v22 + 1)) * -2.0) * 0.25);
        v25 = expf((float)((float)(v23 + v22 * v22) * -2.0) * 0.25);
        if ((v85 & 1) != 0)
          *(float *)&v21[v22] = v25;
        if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(3uLL), *(uint64x2_t *)&v87)).i32[1] & 1) != 0)
          *(float *)&v21[v22 + 1] = v83;
        v22 += 2;
        v24 = (uint64x2_t)vaddq_s64(v87, v80);
      }
      while (v22 != 4);
      ++v20;
      v21 += 3;
    }
    while (v20 != 3);
    if (a4 >= 1)
    {
      v26 = 0;
      v27 = 0;
      v28 = (float *)v14;
      do
      {
        if ((int)v79 >= 1)
        {
          chunk = self->_chunk;
          v30 = &a3[(int)chunk * (uint64_t)v27];
          v31 = 4 * chunk;
          v27 += v79;
          v32 = v79;
          v33 = v28;
          do
          {
            *v33++ = *v30 / v10;
            v30 = (float *)((char *)v30 + v31);
            --v32;
          }
          while (v32);
        }
        ++v26;
        v28 += (int)v79;
      }
      while (v26 != a4);
    }
    memcpy(v16, v14, v11);
    if (self->_maxNumRegions >= 1)
    {
      v34 = 0;
      v35 = v79;
      if ((int)v79 >= 0)
        v36 = v79;
      else
        v36 = v79 + 1;
      v86 = -(v36 >> 1);
      if (a4 >= 0)
        v37 = a4;
      else
        v37 = a4 + 1;
      v81 = -(v37 >> 1);
      v73 = 5.0 / (float)a4;
      v74 = 5.0 / (float)(int)v79;
      v38 = 4 * (int)v79;
      v75 = v16;
      v76 = v14;
      while (a4 >= 5)
      {
        v78 = v34;
        v39 = 0;
        v40 = 0;
        v41 = 0.0;
        v42 = 2;
        do
        {
          v84 = v16;
          if (v35 >= 5)
          {
            v43 = 2;
            do
            {
              v44 = 0.0;
              v45 = -2;
              v46 = v16;
              do
              {
                v47 = 0;
                if ((int)v45 >= 0)
                  v48 = v45;
                else
                  v48 = -(int)v45;
                do
                {
                  v49 = v47 - 2;
                  if ((int)v47 - 2 < 0)
                    v49 = 2 - v47;
                  v44 = v44
                      + (float)((float)(*(float *)&v46[4 * v47] * *(float *)&v88[3 * v48 + v49])
                              * *(float *)&v46[4 * v47]);
                  ++v47;
                }
                while (v47 != 5);
                ++v45;
                v46 += v38;
              }
              while (v45 != 3);
              v50 = expf((float)((float)((v81 + v42) * (v81 + v42) + (v86 + v43) * (v86 + v43)) * -2.0) / v19) * v44;
              v51 = v41 < v50;
              if (v41 >= v50)
              {
                v40 = v40;
              }
              else
              {
                v41 = v50;
                v40 = v43;
              }
              if (v51)
                v39 = v42;
              else
                v39 = v39;
              ++v43;
              v16 += 4;
            }
            while (v43 != (_DWORD)v79 - 2);
          }
          ++v42;
          v16 = &v84[v38];
          v35 = v79;
        }
        while (v42 != a4 - 2);
        if (v41 == 0.0)
        {
          v18 = 0;
          v16 = v75;
          v14 = v76;
          if (v76)
            goto LABEL_85;
          goto LABEL_86;
        }
        v14 = v76;
        -[VCPImageSaliencyAnalyzer computeScore:width:height:posX:posY:](v77, "computeScore:width:height:posX:posY:", v76, v79, a4, v40, v39);
        v77->_score[v78] = v52;
        if (v52 == 0.0)
        {
          v55 = v39 - 2;
          v53 = v40 - 2;
        }
        else
        {
          v53 = v40 - 2;
          v54 = (float)(v40 - 2) / (float)(int)v79;
          v55 = v39 - 2;
          v56 = (float)(v39 - 2) / (float)a4;
          v57 = v54;
          v58 = v56;
          if (v54 < 1.0)
            v59 = v54;
          else
            v59 = 1.0;
          if (v54 <= 0.0)
            v60 = 0.0;
          else
            v60 = v59;
          if (v58 < 1.0)
            v61 = v56;
          else
            v61 = 1.0;
          if (v56 <= 0.0)
            v62 = 0.0;
          else
            v62 = v61;
          v63 = 1.0 - v57;
          if (v63 > v74)
            v63 = v74;
          if (v74 <= 0.0)
            v63 = 0.0;
          v64 = 1.0 - v58;
          if (v64 > v73)
            v64 = v73;
          p_x = &v77->_region[v78].origin.x;
          *p_x = v60;
          p_x[1] = v62;
          if (v73 <= 0.0)
            v66 = 0.0;
          else
            v66 = v64;
          p_x[2] = v63;
          p_x[3] = v66;
        }
        v16 = v75;
        v67 = v39 + 2;
        v68 = v40 + 2;
        if (v53 > (int)v40 + 2)
          v68 = v53;
        v69 = 4 * (v68 - v40 + 2) + 4;
        v70 = v53 + v55 * v79;
        v71 = v55 - 1;
        do
        {
          bzero(&v75[4 * v70], v69);
          v35 = v79;
          v70 += v79;
          ++v71;
        }
        while (v71 < v67);
        v34 = v78 + 1;
        if (v78 + 1 >= v77->_maxNumRegions)
          break;
      }
    }
    v18 = 0;
    if (!v14)
      goto LABEL_86;
    goto LABEL_85;
  }
  v18 = -108;
  if (v14)
LABEL_85:
    MEMORY[0x1BCCA128C](v14, 0x1000C8052888210);
LABEL_86:
  if (v16)
    MEMORY[0x1BCCA128C](v16, 0x1000C8052888210);
  return v18;
}

- (int)getSalientRegions:(id)a3
{
  return -4;
}

- (int)saliencyDetection:(__CVBuffer *)a3 salientRegions:(id)a4 cancel:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  float *score;
  CGPoint *v12;
  CGRect *v13;
  CGSize v14;
  void *v15;
  size_t Width;
  size_t Height;
  size_t v18;
  int v19;
  int v20;
  int v21;
  float *v22;
  uint64_t v23;
  CGSize *p_size;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = 0;
  score = self->_score;
  v12 = (CGPoint *)MEMORY[0x1E0C9D648];
  do
  {
    v13 = &self->_region[v10];
    v14 = (CGSize)v12[1];
    v13->origin = *v12;
    v13->size = v14;
    score[v10++] = 0.0;
  }
  while (v10 != 5);
  v15 = (void *)MEMORY[0x1BCCA1B2C]();
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v18 = Height;
  if ((int)Width <= (int)Height)
    v19 = Height;
  else
    v19 = Width;
  v30 = 0;
  if (v19 >= 225)
  {
    Width = (224 * (int)Width / v19) & 0xFFFFFFFE;
    v18 = (224 * (int)Height / v19) & 0xFFFFFFFE;
  }
  if ((int)v18 >= (int)Width)
    v20 = Width;
  else
    v20 = v18;
  if (v20 < 112)
    goto LABEL_12;
  v21 = -[VCPImageSaliencyAnalyzer prepareModelForSourceWidth:andSourceHeight:](self, "prepareModelForSourceWidth:andSourceHeight:", Width, v18);
  if (!v21)
  {
    v22 = -[VCPImageSaliencyAnalyzer getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:](self, "getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:", v18, Width, &v30, (char *)&v30 + 4);
    v21 = -[VCPImageSaliencyAnalyzer scaleImage:toData:withWidth:andHeight:](self, "scaleImage:toData:withWidth:andHeight:", a3, v22, HIDWORD(v30), v30);
    if (!v21)
    {
      v21 = -[VCPImageSaliencyAnalyzer getSalientRegions:](self, "getSalientRegions:", v9);
      if (!v21)
      {
        if (self->_maxNumRegions < 1)
        {
LABEL_12:
          v21 = 0;
          goto LABEL_21;
        }
        v23 = 0;
        p_size = &self->_region[0].size;
        do
        {
          if (!CGRectIsEmpty(*(CGRect *)&p_size[-1].width))
          {
            v31[0] = CFSTR("salientRegion");
            NSStringFromRect(*(NSRect *)&p_size[-1].width);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v31[1] = CFSTR("salientScore");
            v32[0] = v25;
            *(float *)&v26 = score[v23];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v32[1] = v27;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v28);

          }
          v21 = 0;
          ++v23;
          p_size += 2;
        }
        while (v23 < self->_maxNumRegions);
      }
    }
  }
LABEL_21:
  objc_autoreleasePoolPop(v15);

  return v21;
}

- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7
{
  _BOOL4 v8;
  double height;
  double width;
  double v11;
  double v12;
  double y;
  double x;
  id v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  float v20;
  float v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSString *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _BYTE v46[128];
  uint64_t v47;
  NSRect v48;
  NSRect v49;

  v8 = a6;
  height = a5.height;
  width = a5.width;
  v11 = a4.size.height;
  v12 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v47 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v39 = a7;
  if (v8)
  {
    v16 = v12 / width;
    v17 = x / width;
  }
  else
  {
    v16 = v11 / height;
    v17 = y / height;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v19)
  {
    v20 = v16;
    v21 = v17;
    v22 = *(_QWORD *)v41;
    v23 = v20;
    v24 = v21;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v18);
        v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("salientRegion"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("salientScore"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28 == 0;

          if (!v29)
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("salientRegion"));
            v30 = (NSString *)objc_claimAutoreleasedReturnValue();
            v48 = NSRectFromString(v30);
            v31 = v48.origin.x;
            v32 = v48.origin.y;
            v33 = v48.size.width;
            v34 = v48.size.height;

            if (v8)
            {
              v31 = v24 + v31 * v23;
              v33 = v33 * v23;
            }
            else
            {
              v32 = v24 + v32 * v23;
              v34 = v34 * v23;
            }
            v44[0] = CFSTR("salientRegion");
            v49.origin.x = v31;
            v49.origin.y = v32;
            v49.size.width = v33;
            v49.size.height = v34;
            NSStringFromRect(v49);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v44[1] = CFSTR("salientScore");
            v45[0] = v35;
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("salientScore"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v45[1] = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v37);

          }
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v19);
  }

  return 0;
}

- (id)pruneRegions:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSString *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  void *v28;
  uint64_t v29;
  float v30;
  float v31;
  _QWORD rect[5];
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;
  NSRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  NSRect v45;
  CGRect v46;
  CGRect v47;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_maxNumRegions >= 1)
  {
    v29 = 0;
    do
    {
      if (!objc_msgSend(v28, "count"))
        break;
      v31 = minConfidences[v29];
      v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      rect[0] = *MEMORY[0x1E0C9D648];
      v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      memset(&rect[1], 0, 32);
      v7 = v28;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &rect[1], v37, 16);
      if (v8)
      {
        v9 = *(_QWORD *)rect[3];
        v30 = 0.0;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)rect[3] != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(rect[2] + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("salientRegion"));
            v12 = (NSString *)objc_claimAutoreleasedReturnValue();
            v39 = NSRectFromString(v12);
            x = v39.origin.x;
            y = v39.origin.y;
            width = v39.size.width;
            height = v39.size.height;

            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("salientScore"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "floatValue");
            v19 = v18;

            *(_QWORD *)&v40.origin.x = rect[0];
            v40.origin.y = v3;
            v40.size.width = v4;
            v40.size.height = v5;
            if (CGRectIsEmpty(v40))
            {
              if (v19 > v31)
              {
                objc_msgSend(v6, "addObject:", v11);
                v30 = v19;
                *(CGFloat *)rect = x;
                v3 = y;
                v4 = width;
                v5 = height;
              }
            }
            else if (v19 > 0.3)
            {
              *(_QWORD *)&v41.origin.x = rect[0];
              v41.origin.y = v3;
              v41.size.width = v4;
              v41.size.height = v5;
              v46.origin.x = x;
              v46.origin.y = y;
              v46.size.width = width;
              v46.size.height = height;
              if (CGRectIntersectsRect(v41, v46))
              {
                *(_QWORD *)&v42.origin.x = rect[0];
                v42.origin.y = v3;
                v42.size.width = v4;
                v42.size.height = v5;
                v47.origin.x = x;
                v47.origin.y = y;
                v47.size.width = width;
                v47.size.height = height;
                v43 = CGRectUnion(v42, v47);
                rect[0] = *(_QWORD *)&v43.origin.x;
                v3 = v43.origin.y;
                v4 = v43.size.width;
                v5 = v43.size.height;
                objc_msgSend(v6, "addObject:", v11);
              }
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &rect[1], v37, 16);
        }
        while (v8);
      }
      else
      {
        v30 = 0.0;
      }

      *(_QWORD *)&v44.origin.x = rect[0];
      v44.origin.y = v3;
      v44.size.width = v4;
      v44.size.height = v5;
      if (!CGRectIsEmpty(v44))
      {
        v35[0] = CFSTR("salientScore");
        *(float *)&v20 = v30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v35[1] = CFSTR("salientRegion");
        v36[0] = v21;
        *(_QWORD *)&v45.origin.x = rect[0];
        v45.origin.y = v3;
        v45.size.width = v4;
        v45.size.height = v5;
        NSStringFromRect(v45);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v23);

      }
      objc_msgSend(v7, "removeObjectsInArray:", v6);

      ++v29;
    }
    while (v29 < self->_maxNumRegions);
  }

  return v26;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v8;
  CGPoint *v9;
  CGRect *v10;
  CGSize v11;
  int Width;
  int Height;
  int v14;
  int v15;
  int v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v31;
  id v33;
  void *v34;
  id obj;
  id obja;
  uint64_t v37;
  void *v38;
  CGAffineTransform v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;
  NSRect v52;
  CGRect v53;

  v51 = *MEMORY[0x1E0C80C00];
  v33 = a6;
  v8 = 0;
  *a5 = 0;
  v9 = (CGPoint *)MEMORY[0x1E0C9D648];
  do
  {
    v10 = &self->_region[v8];
    v11 = (CGSize)v9[1];
    v10->origin = *v9;
    v10->size = v11;
    self->_score[v8++] = 0.0;
  }
  while (v8 != 5);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (Height >= Width)
    v14 = Width;
  else
    v14 = Height;
  if (Width <= Height)
    v15 = Height;
  else
    v15 = Width;
  if ((float)((float)v15 / (float)v14) <= 2.0)
    v16 = -[VCPImageSaliencyAnalyzer saliencyDetection:salientRegions:cancel:](self, "saliencyDetection:salientRegions:cancel:", a3, v34, v33);
  else
    v16 = -[VCPImageAnalyzer analyzePixelBufferInTiles:results:cancel:](self, "analyzePixelBufferInTiles:results:cancel:", a3, v34, v33);
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(v34, "sortUsingComparator:", &__block_literal_global_139);
    v18 = v34;
    v19 = v18;
    if (self->_prune)
    {
      -[VCPImageSaliencyAnalyzer pruneRegions:](self, "pruneRegions:", v18);
      v20 = objc_claimAutoreleasedReturnValue();

      obj = (id)v20;
    }
    else
    {
      obj = v18;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obja = obj;
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v21)
    {
      v31 = 0;
      v37 = *(_QWORD *)v41;
LABEL_18:
      v22 = 0;
      v23 = v31;
      v31 += v21;
      while (1)
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(obja);
        if (v23 + (int)v22 >= self->_maxNumRegions)
          break;
        v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v22);
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("salientRegion"));
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        v52 = NSRectFromString(v25);
        v39.a = 1.0;
        v39.b = 0.0;
        v39.c = 0.0;
        *(_OWORD *)&v39.d = xmmword_1B6FBCA30;
        v39.ty = 1.0;
        v53 = CGRectApplyAffineTransform(v52, &v39);
        v48 = CFSTR("attributes");
        v46[0] = CFSTR("saliencyBounds");
        NSStringFromRect(v53);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = CFSTR("saliencyConfidence");
        v47[0] = v26;
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("salientScore"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v29);

        if (v21 == ++v22)
        {
          v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v21)
            goto LABEL_18;
          break;
        }
      }
    }

    if (objc_msgSend(v38, "count"))
    {
      v44 = CFSTR("SaliencyResults");
      v45 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v17 = 0;
  }

  return v17;
}

uint64_t __68__VCPImageSaliencyAnalyzer_analyzePixelBuffer_flags_results_cancel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("salientScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("salientScore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  if (v7 > v10)
    v11 = -1;
  else
    v11 = v7 < v10;

  return v11;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 31) = 0;
  *((_DWORD *)self + 64) = 0;
  return self;
}

@end
