@implementation VCPCNNPoseEstimator

+ (id)estimator
{
  unsigned __int8 v2;

  {
    +[VCPCNNPoseEstimator estimator]::analyzerClass = objc_opt_class();
  }
  if (+[VCPCNNPoseEstimator estimator]::once != -1)
    dispatch_once(&+[VCPCNNPoseEstimator estimator]::once, &__block_literal_global_53);
  return objc_alloc_init((Class)+[VCPCNNPoseEstimator estimator]::analyzerClass);
}

uint64_t __32__VCPCNNPoseEstimator_estimator__block_invoke()
{
  uint64_t result;

  result = DeviceHasANE();
  if ((_DWORD)result)
  {
    result = objc_opt_class();
    +[VCPCNNPoseEstimator estimator]::analyzerClass = result;
  }
  return result;
}

- (float)getInputBuffer
{
  return 0;
}

- (int)computePoseScore:(float *)a3
{
  return -4;
}

- (int)detectPoseForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 yaw:(int64_t *)a5
{
  double height;
  double width;
  double y;
  double x;
  int v12;
  int v13;
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
  CVReturn v24;
  int v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t BytesPerRowOfPlane;
  _BYTE *BaseAddressOfPlane;
  float *v36;
  int v37;
  float v38;
  float v39;
  uint64_t i;
  unsigned int v41;
  int v42;
  float v43;
  uint64_t j;
  BOOL v45;
  int v47;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  _QWORD v50[2];
  int v51;
  uint64_t v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v52 = *MEMORY[0x1E0C80C00];
  v12 = CVPixelBufferGetWidth(a4);
  v13 = CVPixelBufferGetHeight(a4);
  v14 = (float)(v12 - 1);
  v15 = x;
  if (v15 < v14)
    v14 = x;
  v16 = (float)(v13 - 1);
  if (v15 <= 0.0)
    v17 = 0.0;
  else
    v17 = v14;
  v18 = y;
  if (v18 < v16)
    v16 = y;
  if (v18 <= 0.0)
    v19 = 0.0;
  else
    v19 = v16;
  v20 = width;
  if ((float)((float)v12 - v17) > v20)
    v21 = v20;
  else
    v21 = (float)v12 - v17;
  v22 = height;
  if ((float)((float)v13 - v19) > v22)
    v23 = v22;
  else
    v23 = (float)v13 - v19;
  v50[0] = 0;
  v50[1] = 0;
  v51 = 0;
  pixelBuffer = a4;
  unlockFlags = 1;
  if (a4)
  {
    v24 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    v47 = v24;
    if (v24)
    {
      v25 = v24;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      v36 = -[VCPCNNPoseEstimator getInputBuffer](self, "getInputBuffer");
      v37 = 0;
      if (v20 <= 0.0)
        v38 = 0.0;
      else
        v38 = v21 / 40.0;
      if (v22 <= 0.0)
        v39 = 0.0;
      else
        v39 = v23 / 40.0;
      do
      {
        for (i = 0; i != 40; ++i)
        {
          *(float *)&v41 = v38 * (float)(int)i;
          LOBYTE(v41) = BaseAddressOfPlane[BytesPerRowOfPlane * (int)v19
                                         + (int)v17
                                         + BytesPerRowOfPlane * (int)(float)(v39 * (float)v37)
                                         + (int)*(float *)&v41];
          v36[i] = (float)v41;
        }
        ++v37;
        v36 += 40;
      }
      while (v37 != 40);
      v25 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v47);
      if (!v25)
      {
        v25 = -[VCPCNNPoseEstimator computePoseScore:](self, "computePoseScore:", v50);
        if (!v25)
        {
          v42 = 0;
          v43 = *(float *)v50;
          for (j = 1; j != 5; ++j)
          {
            if (*((float *)v50 + j) > v43)
            {
              v42 = j;
              v43 = *((float *)v50 + j);
            }
          }
          v25 = 0;
          *a5 = v42;
        }
      }
    }
  }
  else
  {
    v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v26)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    v25 = -50;
    v47 = -50;
  }
  if (pixelBuffer)
    v45 = v47 == 0;
  else
    v45 = 0;
  if (v45
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:].cold.1();
  }
  return v25;
}

@end
