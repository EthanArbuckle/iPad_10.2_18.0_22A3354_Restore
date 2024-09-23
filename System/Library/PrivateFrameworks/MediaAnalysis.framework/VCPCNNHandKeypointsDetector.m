@implementation VCPCNNHandKeypointsDetector

+ (id)detector:(BOOL)a3 sharedModel:(BOOL)a4 modelName:(id)a5 enableHandObject:(BOOL)a6 options:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a7;
  v13 = -[VCPCNNHandKeypointsDetectorEspresso init:sharedModel:modelName:enableHandObject:options:]([VCPCNNHandKeypointsDetectorEspresso alloc], "init:sharedModel:modelName:enableHandObject:options:", v10, v9, v11, v8, v12);

  return v13;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  int Width;
  int Height;
  int v13;
  CVReturn v14;
  int v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v26;
  int v27;
  float *v28;
  float *v29;
  uint64_t v30;
  uint64_t i;
  unsigned int v32;
  unsigned int v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t v37[16];
  uint8_t buf[8];
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "copyImageToBGRHandKeypointCallFromSPI", ", buf, 2u);
  }

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
    return -50;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v13 = Height;
    v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    *(_DWORD *)buf = v14;
    if (v14)
    {
      v15 = v14;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      bzero(a4, 3 * 4 * Width * v13);
      if (v13 >= 1)
      {
        v27 = 0;
        v28 = &a4[2 * v13 * Width];
        v29 = &a4[v13 * Width];
        v30 = 4 * Width;
        do
        {
          if (Width >= 1)
          {
            for (i = 0; i != Width; ++i)
            {
              LOBYTE(v26) = BaseAddress[(int)(i * 4)];
              *(float *)&v32 = (float)((float)LODWORD(v26) / self->_std) - self->_mean;
              a4[i] = *(float *)&v32;
              LOBYTE(v32) = BaseAddress[(int)(i * 4) + 1];
              *(float *)&v33 = (float)((float)v32 / self->_std) - self->_mean;
              v29[i] = *(float *)&v33;
              LOBYTE(v33) = BaseAddress[(int)(i * 4) + 2];
              v26 = (float)((float)v33 / self->_std) - self->_mean;
              v28[i] = v26;
            }
          }
          BaseAddress += BytesPerRow;
          ++v27;
          v28 = (float *)((char *)v28 + v30);
          v29 = (float *)((char *)v29 + v30);
          a4 = (float *)((char *)a4 + v30);
        }
        while (v27 != v13);
      }
      v15 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (!v15)
      {
        VCPSignPostLog();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_WORD *)v37 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, v8, "copyImageToBGRHandKeypointCallFromSPI", ", v37, 2u);
        }

        v15 = 0;
      }
    }
  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v16)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    v15 = -50;
    *(_DWORD *)buf = -50;
  }
  if (pixelBuffer
    && !*(_DWORD *)buf
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:].cold.1();
  }
  return v15;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 box:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  void *v13;
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
  float v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t v37[16];
  uint8_t buf[8];
  CFTypeRef cf;
  CGRect v40;

  v7 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = v12;
  if (a3)
  {
    cf = 0;
    objc_msgSend(v12, "minX");
    v15 = v14;
    objc_msgSend(v13, "minY");
    v17 = v16;
    objc_msgSend(v13, "maxX");
    v19 = v18;
    objc_msgSend(v13, "minX");
    v21 = v20;
    objc_msgSend(v13, "maxY");
    v23 = v22;
    objc_msgSend(v13, "minY");
    v25 = v24;
    VCPSignPostLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_signpost_id_generate(v26);

    VCPSignPostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = v15;
    v31 = v17;
    v32 = (float)(v19 - v21);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "preProcessingHandKeypointCallFromSPI", ", buf, 2u);
    }

    v40.origin.x = v30;
    v40.origin.y = v31;
    v40.size.width = v32;
    v40.size.height = (float)(v23 - v25);
    v33 = Scaler::ScaleCropped(&self->_scaler, v40, a4, (__CVBuffer **)&cf, v7, v8, 1111970369);
    if (!v33)
    {
      VCPSignPostLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v37 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, v27, "preProcessingHandKeypointCallFromSPI", ", v37, 2u);
      }

      v33 = -[VCPCNNHandKeypointsDetector copyImage:toData:](self, "copyImage:toData:", cf, a3);
    }
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v33 = -108;
  }

  return v33;
}

- (int)generateHandKeypoints:(CGPoint *)a3 keypointConfidence:(float *)a4 offset:(float)a5 handHoldsObjectConfidence:(float *)a6
{
  return -4;
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6 offset:(float *)a7
{
  return 0;
}

- (int)cvtHeatmaps2Keypoints:(float *)a3 outHeight:(int)a4 outWidth:(int)a5 inHeight:(int)a6 inWidth:(int)a7 outChannel:(int)a8 keypoints:(CGPoint *)a9 keypointConfidence:(float *)a10 offset:(float)a11
{
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  int result;
  int v23;
  uint64_t v24;
  int v25;
  float v26;
  float v27;
  int v28;
  float v29;
  float v30;
  uint64_t v31;
  float v32;
  CGPoint *v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t v36[16];
  uint8_t buf[16];

  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  VCPSignPostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "postProcessingHandKeypointCallFromSPI", ", buf, 2u);
  }

  result = -50;
  if (a4 && a5)
  {
    if (a8 >= 1)
    {
      v23 = 0;
      v24 = 0;
      do
      {
        if (a4 < 1)
        {
          v30 = 0.0;
          v27 = 1.1755e-38;
          v29 = 0.0;
          v26 = 0.0;
        }
        else
        {
          v25 = 0;
          v26 = 0.0;
          v27 = 1.1755e-38;
          v28 = v23;
          v29 = 0.0;
          v30 = 0.0;
          do
          {
            if (a5 >= 1)
            {
              v31 = 0;
              do
              {
                v32 = a3[v28 + (int)v31];
                if (v32 > 0.1)
                {
                  if (v26 <= v32)
                    v26 = a3[v28 + (int)v31];
                  v30 = v30 + (float)((float)(int)v31 * v32);
                  v29 = v29 + (float)((float)v25 * v32);
                  v27 = v27 + v32;
                }
                ++v31;
              }
              while (a5 != v31);
            }
            ++v25;
            v28 += a5;
          }
          while (v25 != a4);
        }
        v33 = &a9[v24];
        v33->x = (float)((float)((float)(v30 / v27) + a11) * (float)(a6 / a4));
        v33->y = (float)((float)((float)(v29 / v27) + a11) * (float)(a7 / a5));
        a10[v24++] = v26;
        v23 += a5 * a4;
      }
      while (v24 != a8);
    }
    VCPSignPostLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v19 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
    {
      *(_WORD *)v36 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_END, v19, "postProcessingHandKeypointCallFromSPI", ", v36, 2u);
    }

    return 0;
  }
  return result;
}

- (int)handKeypointsDetection:(__CVBuffer *)a3 box:(id)a4 keypoints:(CGPoint)a5[21] keypointConfidence:(float)a6[21] handHoldsObjectConfidence:(float *)a7
{
  id v12;
  void *v13;
  size_t Width;
  float *v15;
  int v16;
  double v17;
  int v18;
  int v19;
  int v21;
  uint64_t v22;

  v12 = a4;
  v13 = (void *)MEMORY[0x1BCCA1B2C]();
  *(_QWORD *)&self->_std = 1065353216;
  Width = CVPixelBufferGetWidth(a3);
  v22 = 0;
  v21 = 0;
  v15 = -[VCPCNNHandKeypointsDetector getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:offset:](self, "getInputBuffer:srcWidth:cnnInputHeight:cnnInputWidth:offset:", CVPixelBufferGetHeight(a3), Width, &v22, (char *)&v22 + 4, &v21);
  v16 = -[VCPCNNHandKeypointsDetector createInput:withBuffer:cnnInputHeight:cnnInputWidth:box:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:box:", v15, a3, v22, HIDWORD(v22), v12);
  if (v16)
  {
    v18 = 4;
  }
  else
  {
    LODWORD(v17) = v21;
    LODWORD(a7) = -[VCPCNNHandKeypointsDetector generateHandKeypoints:keypointConfidence:offset:handHoldsObjectConfidence:](self, "generateHandKeypoints:keypointConfidence:offset:handHoldsObjectConfidence:", a5, a6, a7, v17);
    v18 = (_DWORD)a7 != 0;
  }
  objc_autoreleasePoolPop(v13);
  if ((v18 | 4) == 4)
    v19 = v16;
  else
    v19 = (int)a7;

  return v19;
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
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  return self;
}

@end
