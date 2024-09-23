@implementation VCPBlurAnalyzer

- (float)computeRegionSharpness:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6
{
  float v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  int v14;
  int v15;
  char *v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;

  v6 = 1.0;
  if (a5 < 3)
  {
    v12 = 0;
    v11 = 0;
    v27 = 1.0;
LABEL_33:
    v29 = (float)v12;
    goto LABEL_34;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = &a3[a6];
  v14 = a5 - 2;
  v15 = 1;
  v16 = &a3[2 * a6];
  do
  {
    if (a4 >= 3)
    {
      v17 = 1;
      do
      {
        v18 = v13[v17 + 1];
        v19 = v13[v17 - 1];
        v20 = v18 - v19;
        if (v18 - v19 < 0)
          v20 = v19 - v18;
        if (v20 >= 0x15)
        {
          v21 = 2 * v13[v17] - (v19 + v18);
          if (v21 < 0)
            v21 = -v21;
          v7 += v21 >> 2;
          if (v21 > 0x13)
            ++v9;
          ++v11;
        }
        v22 = a3[v17];
        v23 = v16[v17];
        v24 = v22 - v23;
        if (v22 - v23 < 0)
          v24 = v23 - v22;
        if (v24 >= 0x15)
        {
          v25 = 2 * v13[v17] - (v23 + v22);
          if (v25 < 0)
            v25 = -v25;
          v8 += v25 >> 2;
          if (v25 > 0x13)
            ++v10;
          ++v12;
        }
        ++v17;
      }
      while (a4 - 1 != v17);
    }
    v13 += a6;
    a3 += a6;
    v16 += a6;
  }
  while (v15++ != v14);
  v27 = 1.0;
  if (v11 > 50)
  {
    v28 = (float)((float)((float)v7 / (float)v11) * -0.125) + 1.0;
    if (v28 < 0.0)
      v28 = 0.0;
    v27 = (float)(1.0 - (float)((float)v9 / (float)v11)) * v28;
  }
  if (v12 <= 50)
    goto LABEL_33;
  v29 = (float)v12;
  v30 = (float)((float)((float)v8 / (float)v12) * -0.125) + 1.0;
  if (v30 < 0.0)
    v30 = 0.0;
  v6 = (float)(1.0 - (float)((float)v10 / v29)) * v30;
LABEL_34:
  v31 = (float)v11 + 1.0;
  v32 = v29 + 1.0;
  if (v27 <= v6)
    v32 = v32 * 20.0;
  else
    v31 = v31 * 20.0;
  return 1.0 - (float)((float)((float)(v6 * v32) + (float)(v27 * v31)) / (float)(v31 + v32));
}

- (int)computeSharpnessScore:(float *)a3 forObjects:(id)a4 inImage:(__CVBuffer *)a5
{
  id v7;
  CVReturn v8;
  int Width;
  int Height;
  size_t BytesPerRowOfPlane;
  uint64_t v12;
  double v13;
  double v14;
  float v15;
  float v16;
  uint64_t i;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  char *v28;
  int v29;
  int v30;
  unsigned int v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v48;
  id obj;
  uint64_t v51;
  char *BaseAddressOfPlane;
  CGAffineTransform v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t v61[128];
  uint8_t buf[4];
  CVPixelBufferRef v63;
  __int16 v64;
  CVReturn v65;
  uint64_t v66;
  NSRect v67;
  CGRect v68;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  pixelBuffer = a5;
  unlockFlags = 1;
  if (a5)
  {
    v8 = CVPixelBufferLockBaseAddress(a5, 1uLL);
    v58 = v8;
    if (!v8
      || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)buf = 134218240,
          v63 = pixelBuffer,
          v64 = 1024,
          v65 = v8,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v8 = v58) == 0))
    {
      Width = CVPixelBufferGetWidth(a5);
      Height = CVPixelBufferGetHeight(a5);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a5, 0);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v7;
      v48 = v7;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v12)
      {
        v51 = *(_QWORD *)v55;
        v13 = (double)Width;
        v14 = (double)Height;
        v15 = 0.0;
        v16 = 0.0;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v55 != v51)
              objc_enumerationMutation(obj);
            v67 = NSRectFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
            v53.a = 1.0;
            v53.b = 0.0;
            v53.c = 0.0;
            *(_OWORD *)&v53.d = xmmword_1B6FBCA30;
            v53.ty = 1.0;
            v68 = CGRectApplyAffineTransform(v67, &v53);
            v18 = 0;
            v19 = (int)(v68.origin.x * v13);
            if (v19 >= Width)
              v20 = Width;
            else
              v20 = (int)(v68.origin.x * v13);
            if (v19 <= 0)
              v21 = 0;
            else
              v21 = v20;
            v22 = (int)(v68.origin.y * v14);
            if (v22 >= Height)
              v23 = Height;
            else
              v23 = (int)(v68.origin.y * v14);
            if (v22 <= 0)
              v24 = 0;
            else
              v24 = v23;
            v25 = Width - v21;
            v26 = (int)(v68.size.width * v13);
            if (v26 < Width - v21)
              v25 = (int)(v68.size.width * v13);
            v27 = v25 / 2;
            v28 = &BaseAddressOfPlane[BytesPerRowOfPlane * v24 + v21];
            v29 = (int)(v68.size.height * v14);
            if (v29 >= Height - v24)
              v30 = Height - v24;
            else
              v30 = (int)(v68.size.height * v14);
            v31 = v30 / 2;
            v32 = v68.size.width * v68.size.height;
            if (v26 <= 0)
              v33 = 0;
            else
              v33 = v27;
            if (v29 <= 0)
              v34 = 0;
            else
              v34 = v31;
            v35 = 1.0;
            v36 = 0.0;
            v37 = 0.0;
            do
            {
              -[VCPBlurAnalyzer computeRegionSharpness:width:height:stride:](self, "computeRegionSharpness:width:height:stride:", &v28[BytesPerRowOfPlane * (int)((v18 >> 1) * v34) + (int)(((int)(v18 << 31) >> 31) & v33)], v33, v34, BytesPerRowOfPlane);
              if (v35 > v38)
                v35 = v38;
              if (v36 < v38)
                v36 = v38;
              v37 = v37 + v38;
              ++v18;
            }
            while (v18 != 4);
            v16 = v16 + (float)(v32 * (float)((float)((float)(v37 - v35) - v36) * 0.5));
            v15 = v15 + v32;
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        }
        while (v12);
      }
      else
      {
        v15 = 0.0;
        v16 = 0.0;
      }

      v7 = v48;
      v8 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v58);
      if (!v8)
        *a3 = roundf((float)(v16 / v15) * 100.0) / 100.0;
    }
  }
  else
  {
    v39 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v39)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
    v8 = -50;
    v58 = -50;
  }
  if (pixelBuffer
    && !v58
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
  }

  return v8;
}

@end
