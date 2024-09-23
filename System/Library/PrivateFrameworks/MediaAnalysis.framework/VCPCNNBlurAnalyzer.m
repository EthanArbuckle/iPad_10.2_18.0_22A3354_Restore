@implementation VCPCNNBlurAnalyzer

+ (VCPCNNBlurAnalyzer)analyzerWithRevision:(unint64_t)a3
{
  unsigned __int8 v4;
  uint64_t *v5;
  int v7;

  v5 = &qword_1ED261000;
  if ((v4 & 1) == 0)
  {
    v5 = &qword_1ED261000;
    if (v7)
    {
      +[VCPCNNBlurAnalyzer analyzerWithRevision:]::analyzerClass = objc_opt_class();
      v5 = &qword_1ED261000;
    }
  }
  return (VCPCNNBlurAnalyzer *)(id)objc_msgSend(objc_alloc((Class)v5[86]), "initWithRevision:", a3);
}

+ (id)analyzer
{
  return (id)objc_msgSend(a1, "analyzerWithRevision:", 1);
}

- (VCPCNNBlurAnalyzer)initWithRevision:(unint64_t)a3
{
  VCPCNNBlurAnalyzer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VCPCNNBlurAnalyzer;
  result = -[VCPCNNBlurAnalyzer init](&v5, sel_init);
  if (result)
    result->_revision = a3;
  return result;
}

- (VCPCNNBlurAnalyzer)init
{
  return -[VCPCNNBlurAnalyzer initWithRevision:](self, "initWithRevision:", 1);
}

- (unint64_t)getRevision
{
  return self->_revision;
}

- (int)prepareModelForSourceWidth:(int)a3 andSourceHeight:(int)a4
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6
{
  return 0;
}

- (int)computeSharpnessScore:(float *)a3 textureness:(char *)a4 contrast:(float)a5 imgWidth:(int)a6 cancel:(id)a7
{
  return -4;
}

- (void)copyBufferFrom:(char *)a3 fromStride:(int64_t)a4 toPtr:(float *)a5 toStride:(int64_t)a6 toWidth:(int)a7 toHeight:(int)a8
{
  float v8;
  int i;
  uint64_t j;

  if (a8 >= 1)
  {
    for (i = 0; i != a8; ++i)
    {
      if (a7 >= 1)
      {
        for (j = 0; j != a7; a5[j++] = v8)
        {
          LOBYTE(v8) = a3[j];
          v8 = (float)LODWORD(v8) / 255.0;
        }
      }
      a3 += a4;
      a5 += a6;
    }
  }
}

- (int)scaleRegion:(CGRect *)a3 ofImage:(__CVBuffer *)a4 toData:(float *)a5 withWidth:(int)a6 andHeight:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t BytesPerRowOfPlane;
  int Width;
  int Height;
  OSType PixelFormatType;
  BOOL v16;
  CGRect *v18;
  CFTypeRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v35;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CFTypeRef cf;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  BytesPerRowOfPlane = (uint64_t)a4;
  cf = 0;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)BytesPerRowOfPlane);
  PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)BytesPerRowOfPlane);
  if (Width == (_DWORD)v8 && Height == (_DWORD)v7)
  {
    v16 = (int)v8 == 299 && (_DWORD)v8 == (_DWORD)v7;
    if (v16 && PixelFormatType == 1278226488)
    {
      cf = CFRetain((CFTypeRef)BytesPerRowOfPlane);
      v35 = 0;
      CF<opaqueCMSampleBuffer *>::~CF(&v35);
LABEL_15:
      v19 = cf;
      pixelBuffer = (CVPixelBufferRef)cf;
      unlockFlags = 1;
      if (cf)
      {
        BytesPerRowOfPlane = CVPixelBufferLockBaseAddress((CVPixelBufferRef)cf, 1uLL);
        LODWORD(v35) = BytesPerRowOfPlane;
        if ((_DWORD)BytesPerRowOfPlane)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)v19, BytesPerRowOfPlane, v20, v21, v22, v23, v24, v25);
        }
        else
        {
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane((CVPixelBufferRef)cf, 0);
          -[VCPCNNBlurAnalyzer copyBufferFrom:fromStride:toPtr:toStride:toWidth:toHeight:](self, "copyBufferFrom:fromStride:toPtr:toStride:toWidth:toHeight:", CVPixelBufferGetBaseAddressOfPlane((CVPixelBufferRef)cf, 0), BytesPerRowOfPlane, a5, (int)v8, v8, v7);
          LODWORD(BytesPerRowOfPlane) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v35);
          if (pixelBuffer
            && !(_DWORD)v35
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
          }
        }
      }
      else
      {
        v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v26)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
        LODWORD(BytesPerRowOfPlane) = -50;
      }
      goto LABEL_22;
    }
  }
  v18 = (CGRect *)MEMORY[0x1E0C9D648];
  if (a3)
    v18 = a3;
  LODWORD(BytesPerRowOfPlane) = Scaler::ScaleCropped(&self->_scaler, *v18, (__CVBuffer *)BytesPerRowOfPlane, (__CVBuffer **)&cf, v8, v7, 875704438);
  if (!(_DWORD)BytesPerRowOfPlane)
    goto LABEL_15;
LABEL_22:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return BytesPerRowOfPlane;
}

- (float)calculateScoreFromNetworkOutput:(float *)a3 outChannel:(int)a4 outHeight:(int)a5 outWidth:(int)a6 textureness:(char *)a7 contrast:(float)a8 imgWidth:(int)a9
{
  unint64_t v12;
  float *v13;
  int v14;
  uint64_t v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  float *v20;
  uint64_t v21;
  float *v22;
  float v23;
  unint64_t v24;
  int v25;
  char v26;
  float v27;
  float v28;
  float v29;
  float v31;
  int v32;
  int v33;
  uint64_t i;
  int v35;
  float v36;
  int v37;
  float v38;
  float v39;
  BOOL v40;
  float result;
  uint64_t v43;
  int v46;
  uint64_t v47;
  _OWORD v49[9];
  float v50[31];
  __int128 v51;
  int v52;
  float v53[36];
  uint64_t v54;

  v12 = 0;
  v54 = *MEMORY[0x1E0C80C00];
  v50[0] = 0.0;
  do
  {
    if (v12 <= 0x1D)
    {
      v13 = &v50[v12];
      v13[1] = (float)(char)(v12
                           - 5 * ((((103 * (char)v12) & 0x8000) != 0) + (((103 * (char)v12) >> 8) >> 1))
                           + 1);
      v13[2] = (float)(char)((v12 | 1)
                           - 5
                           * ((((103 * (char)(v12 | 1)) & 0x8000) != 0)
                            + (((103 * (char)(v12 | 1)) >> 8) >> 1))
                           + 1);
    }
    v12 += 2;
  }
  while (v12 != 30);
  v51 = xmmword_1B6FBF430;
  v52 = 1077936128;
  memset(v49, 0, sizeof(v49));
  if (a5 < 1)
  {
    v47 = 0;
    v17 = 0.0;
    v16 = 0.0;
  }
  else
  {
    v14 = 0;
    v47 = 0;
    v43 = 4 * a9;
    v15 = 4 * a6 * a5;
    v16 = 0.0;
    v17 = 0.0;
    do
    {
      v46 = v14;
      if (a6 >= 1)
      {
        v18 = 0;
        do
        {
          if (a4 >= 1)
          {
            v19 = 0.0;
            v20 = v53;
            v21 = a4;
            v22 = a3;
            do
            {
              v23 = expf(*v22);
              *v20++ = v23;
              v19 = v19 + v23;
              v22 = (float *)((char *)v22 + v15);
              --v21;
            }
            while (v21);
            v24 = 0;
            v25 = 0;
            v26 = 0;
            v27 = 0.0;
            v28 = 0.0;
            do
            {
              v29 = v53[v24] / v19;
              v53[v24] = v29;
              if (v29 > v28)
              {
                v26 |= v24 > 0x1E;
                v28 = v29;
                v25 = v24;
              }
              v27 = v27 + (float)(v50[v24++] * v29);
            }
            while (a4 != v24);
            if (v28 > 0.85 && a7[4 * (int)v18] != 0)
            {
              v17 = v17 + v27;
              ++HIDWORD(v47);
              ++*((_DWORD *)v49 + v25);
              if ((v26 & 1) == 0)
              {
                v16 = v16 + v27;
                LODWORD(v47) = v47 + 1;
              }
            }
          }
          ++a3;
          ++v18;
        }
        while (v18 != a6);
      }
      a7 += v43;
      v14 = v46 + 1;
    }
    while (v46 + 1 != a5);
  }
  v31 = (float)(int)v47 / (float)SHIDWORD(v47);
  if (self->_sdof && v31 > 0.6)
  {
    v32 = 0;
    v33 = 0;
    for (i = 4; i != 124; i += 4)
    {
      v35 = *(_DWORD *)((char *)v49 + i);
      v32 += v35;
      if (v35 > v33)
        v33 = *(_DWORD *)((char *)v49 + i);
    }
    if (v32)
    {
      v36 = (float)((float)v33 / (float)v32) + 0.5;
      if (v36 > 1.0)
        v36 = 1.0;
      v16 = v16 * v36;
    }
  }
  if (v31 < 0.3)
    v37 = HIDWORD(v47);
  else
    v37 = v47;
  v38 = 0.0;
  if (v37 >= 40)
  {
    v39 = v17 + (float)((float)(v17 - v16) * 0.5);
    if (v31 >= 0.3)
      v39 = v16;
    v38 = fmax((float)((float)(1.2 - (float)(v39 / (float)v37)) / 1.2), 0.0);
  }
  v40 = self->_sdof && v31 < 0.3;
  result = v38 + (float)((float)(1.0 - v38) * a8);
  if (!v40)
    return v38;
  return result;
}

- (int)computeCNNBasedSharpness:(__CVBuffer *)a3 sharpnessScore:(float *)a4 textureScore:(float *)a5 contrast:(float)a6 cancel:(id)a7
{
  id v12;
  size_t Width;
  size_t Height;
  size_t v15;
  int v16;
  int v17;
  float *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  double v23;
  int v24;
  uint64_t v25;
  unsigned __int8 *v26;
  __int16 v29;
  uint64_t v30;

  v12 = a7;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v15 = Height;
  if ((int)Width <= (int)Height)
    v16 = Height;
  else
    v16 = Width;
  v30 = 0;
  if (v16 >= 401)
  {
    Width = (400 * (int)Width / v16) & 0xFFFFFFFE;
    v15 = (400 * (int)Height / v16) & 0xFFFFFFFE;
  }
  if ((int)Width < 60 || (int)v15 <= 59)
  {
    v17 = 0;
    *a4 = 0.5;
  }
  else
  {
    v17 = -[VCPCNNBlurAnalyzer prepareModelForSourceWidth:andSourceHeight:](self, "prepareModelForSourceWidth:andSourceHeight:", Width, v15);
    if (!v17)
    {
      v18 = -[VCPCNNBlurAnalyzer getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:](self, "getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:", v15, Width, (char *)&v30 + 4, &v30);
      v17 = -[VCPCNNBlurAnalyzer scaleRegion:ofImage:toData:withWidth:andHeight:](self, "scaleRegion:ofImage:toData:withWidth:andHeight:", 0, a3, v18, v30, HIDWORD(v30));
      if (!v17)
      {
        v20 = v30;
        v19 = HIDWORD(v30);
        v21 = (unsigned __int8 *)operator new[]((int)v30 * HIDWORD(v30), MEMORY[0x1E0DE4E10]);
        if (v21)
        {
          v22 = v21;
          -[VCPImageAnalyzer calculateTextureness:height:width:sdof:result:](self, "calculateTextureness:height:width:sdof:result:", v18, v19, v20, self->_sdof, v21);
          if ((int)v30 * HIDWORD(v30) < 1)
          {
            LODWORD(v23) = 0;
          }
          else
          {
            v24 = 0;
            v25 = (v30 * HIDWORD(v30));
            v26 = v22;
            do
            {
              if (*v26++)
                ++v24;
              --v25;
            }
            while (v25);
            *(float *)&v23 = (float)v24;
          }
          *a5 = *(float *)&v23 / (float)(v30 * HIDWORD(v30));
          *(float *)&v23 = a6;
          v17 = -[VCPCNNBlurAnalyzer computeSharpnessScore:textureness:contrast:imgWidth:cancel:](self, "computeSharpnessScore:textureness:contrast:imgWidth:cancel:", a4, v22, v23);
          MEMORY[0x1BCCA128C](v22, 0x1000C8077774924);
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v29 = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to allocate memory", (uint8_t *)&v29, 2u);
          }
          v17 = -108;
        }
      }
    }
  }

  return v17;
}

- (BOOL)sdof
{
  return self->_sdof;
}

- (void)setSdof:(BOOL)a3
{
  self->_sdof = a3;
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
  *((_QWORD *)self + 7) = 0;
  *((_DWORD *)self + 16) = 0;
  return self;
}

@end
