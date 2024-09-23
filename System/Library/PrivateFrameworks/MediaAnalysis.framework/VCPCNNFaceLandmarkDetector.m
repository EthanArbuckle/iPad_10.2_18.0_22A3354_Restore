@implementation VCPCNNFaceLandmarkDetector

+ (id)detector
{
  unsigned __int8 v2;

  {
    +[VCPCNNFaceLandmarkDetector detector]::analyzerClass = objc_opt_class();
  }
  if (+[VCPCNNFaceLandmarkDetector detector]::once != -1)
    dispatch_once(&+[VCPCNNFaceLandmarkDetector detector]::once, &__block_literal_global_50);
  return objc_alloc_init((Class)+[VCPCNNFaceLandmarkDetector detector]::analyzerClass);
}

uint64_t __38__VCPCNNFaceLandmarkDetector_detector__block_invoke()
{
  uint64_t result;

  result = DeviceHasANE();
  if ((_DWORD)result)
  {
    result = objc_opt_class();
    +[VCPCNNFaceLandmarkDetector detector]::analyzerClass = result;
  }
  return result;
}

- (float)getInputBuffer
{
  return 0;
}

- (int)computeLandmarks:(float *)a3
{
  return -4;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withFaceBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  int v10;
  int v11;
  float v12;
  float v13;
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
  size_t BytesPerRowOfPlane;
  _BYTE *BaseAddressOfPlane;
  float *v28;
  int v29;
  float v30;
  float v31;
  uint64_t i;
  unsigned int v33;
  NSMutableArray *v34;
  NSMutableArray *landmarks;
  uint64_t v36;
  double v37;
  double v38;
  float *v39;
  float v40;
  float v41;
  NSMutableArray *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v58;
  double v59;
  double v60;
  double v61;
  int v62;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  _QWORD v65[3];
  _OWORD v66[3];
  uint64_t v67;
  uint8_t buf[4];
  __CVBuffer *v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_landmarks, "removeAllObjects");
  v10 = CVPixelBufferGetWidth(a3);
  v11 = CVPixelBufferGetHeight(a3);
  v12 = (float)(v10 - 1);
  v60 = width;
  v61 = x;
  v13 = x;
  if (v13 < v12)
    v12 = x;
  if (v13 <= 0.0)
    v14 = 0.0;
  else
    v14 = v12;
  v15 = (float)(v11 - 1);
  v58 = y;
  v59 = height;
  v16 = y;
  if (v16 < v15)
    v15 = y;
  if (v16 <= 0.0)
    v17 = 0.0;
  else
    v17 = v15;
  v18 = (float)v10;
  v19 = width;
  if ((float)((float)v10 - v14) > v19)
    v20 = width;
  else
    v20 = (float)v10 - v14;
  v21 = (float)v11;
  v22 = height;
  v67 = 0;
  memset(&v66[1], 0, 32);
  if ((float)((float)v11 - v17) > v22)
    v23 = height;
  else
    v23 = (float)v11 - v17;
  v66[0] = 0uLL;
  v62 = 0;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v24 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v62 = v24;
    if (!v24
      || (v25 = v24, os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      && (*(_DWORD *)buf = 134218240,
          v69 = a3,
          v70 = 1024,
          v71 = v25,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v25 = v62) == 0))
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v28 = -[VCPCNNFaceLandmarkDetector getInputBuffer](self, "getInputBuffer");
      v29 = 0;
      v30 = v19 <= 0.0 ? 0.0 : v20 / 40.0;
      v31 = v22 <= 0.0 ? 0.0 : v23 / 40.0;
      do
      {
        for (i = 0; i != 40; ++i)
        {
          *(float *)&v33 = v30 * (float)(int)i;
          LOBYTE(v33) = BaseAddressOfPlane[BytesPerRowOfPlane * (int)v17
                                         + (int)v14
                                         + BytesPerRowOfPlane * (int)(float)(v31 * (float)v29)
                                         + (int)*(float *)&v33];
          v28[i] = (float)v33;
        }
        ++v29;
        v28 += 40;
      }
      while (v29 != 40);
      v25 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v62);
      if (!v25)
      {
        v25 = -[VCPCNNFaceLandmarkDetector computeLandmarks:](self, "computeLandmarks:", v66);
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          landmarks = self->_landmarks;
          self->_landmarks = v34;

          v36 = 0;
          v37 = v58 / v21;
          v38 = v59 / v21;
          v39 = (float *)v66 + 1;
          do
          {
            v41 = *(v39 - 1);
            v40 = *v39;
            v42 = self->_landmarks;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LandmarkIndex[v36], *(_QWORD *)&v58, *(_QWORD *)&v59);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v61 / v18 + v41 * (v60 / v18);
            *(float *)&v44 = v44;
            v65[0] = v43;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v37 + v40 * v38;
            *(float *)&v46 = v46;
            v65[1] = v45;
            *(float *)&v46 = 1.0 - *(float *)&v46;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v65[2] = v47;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v42, "addObject:", v48);

            ++v36;
            v39 += 2;
          }
          while (v36 != 7);
          v25 = 0;
        }
      }
    }
  }
  else
  {
    v49 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v49)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);
    v25 = -50;
    v62 = -50;
  }
  if (pixelBuffer
    && !v62
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
  }
  return v25;
}

- (id)landmarks
{
  return self->_landmarks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarks, 0);
}

@end
