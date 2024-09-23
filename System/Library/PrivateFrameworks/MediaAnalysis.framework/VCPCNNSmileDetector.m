@implementation VCPCNNSmileDetector

+ (id)detector
{
  unsigned __int8 v2;

  {
    +[VCPCNNSmileDetector detector]::analyzerClass = objc_opt_class();
  }
  if (+[VCPCNNSmileDetector detector]::once != -1)
    dispatch_once(&+[VCPCNNSmileDetector detector]::once, &__block_literal_global_13);
  return objc_alloc_init((Class)+[VCPCNNSmileDetector detector]::analyzerClass);
}

uint64_t __31__VCPCNNSmileDetector_detector__block_invoke()
{
  uint64_t result;

  result = DeviceHasANE();
  if ((_DWORD)result)
  {
    result = objc_opt_class();
    +[VCPCNNSmileDetector detector]::analyzerClass = result;
  }
  return result;
}

- (float)getInputBuffer
{
  return 0;
}

- (int)computeSmileScore:(float *)a3
{
  return -4;
}

- (int)detectSmileForFace:(CGRect)a3 inBuffer:(__CVBuffer *)a4 smile:(BOOL *)a5
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
  double v37;
  int v38;
  float v39;
  float v40;
  uint64_t i;
  int v43;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  float v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v46 = 0.0;
  v12 = CVPixelBufferGetWidth(a4);
  v13 = CVPixelBufferGetHeight(a4);
  v14 = (float)(v12 - 1);
  v15 = x;
  if (v15 < v14)
    v14 = x;
  if (v15 <= 0.0)
    v16 = 0.0;
  else
    v16 = v14;
  v17 = (float)(v13 - 1);
  v18 = y;
  if (v18 < v17)
    v17 = y;
  if (v18 <= 0.0)
    v19 = 0.0;
  else
    v19 = v17;
  v20 = width;
  if ((float)((float)v12 - v16) > v20)
    v21 = v20;
  else
    v21 = (float)v12 - v16;
  v22 = height;
  if ((float)((float)v13 - v19) > v22)
    v23 = v22;
  else
    v23 = (float)v13 - v19;
  pixelBuffer = a4;
  unlockFlags = 1;
  if (a4)
  {
    v24 = CVPixelBufferLockBaseAddress(a4, 1uLL);
    v43 = v24;
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
      v36 = -[VCPCNNSmileDetector getInputBuffer](self, "getInputBuffer");
      v38 = 0;
      v39 = v21 / 40.0;
      v40 = v23 / 40.0;
      if (v20 <= 0.0)
        v39 = 0.0;
      if (v22 <= 0.0)
        v40 = 0.0;
      do
      {
        for (i = 0; i != 40; ++i)
        {
          *(float *)&v37 = v39 * (float)(int)i;
          LOBYTE(v37) = BaseAddressOfPlane[BytesPerRowOfPlane * (int)v19
                                         + (int)v16
                                         + BytesPerRowOfPlane * (int)(float)(v40 * (float)v38)
                                         + (int)*(float *)&v37];
          v37 = ((double)*(unint64_t *)&v37 / 255.0 + -0.574000001) / 0.166999996;
          *(float *)&v37 = v37;
          v36[i] = *(float *)&v37;
        }
        ++v38;
        v36 += 40;
      }
      while (v38 != 40);
      v25 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v43);
      if (!v25)
      {
        v25 = -[VCPCNNSmileDetector computeSmileScore:](self, "computeSmileScore:", &v46);
        if (!v25)
          *a5 = v46 > 0.5;
      }
    }
  }
  else
  {
    v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v26)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    v25 = -50;
    v43 = -50;
  }
  if (pixelBuffer
    && !v43
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:].cold.1();
  }
  return v25;
}

- (void)detectSmileForFace:inBuffer:smile:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_3();
}

@end
