@implementation VCPImageExposurePreAnalyzer

- (float)computeRegionNoise:(char *)a3 blockTextureness:(char *)a4 average:(char *)a5 width:(int)a6 height:(int)a7 stride:(int64_t)a8
{
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float result;

  v8 = a7 * a6;
  if (a7 < 1)
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    if ((_DWORD)v8)
    {
LABEL_10:
      v15 = (float)(int)v8;
      v16 = (float)v11 / (float)(int)v8;
      v8 = v12 / v8;
      v17 = (float)v12 / v15;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      if (a6 >= 1)
      {
        for (i = 0; i != a6; ++i)
        {
          v14 = a3[i];
          v12 += v14;
          v11 += (v14 * v14);
          if (a4[i])
            ++v10;
        }
      }
      a3 += a8;
      a4 += a6;
      ++v9;
    }
    while (v9 != a7);
    if ((_DWORD)v8)
      goto LABEL_10;
  }
  v17 = 0.0;
  v16 = 0.0;
LABEL_13:
  result = v16 - (float)(v17 * v17);
  *a5 = v8;
  if (v10 > 0)
    return -1.0;
  return result;
}

- (float)computeNoiseLevel:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6 textureness:(char *)a7
{
  int v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int v15;
  float result;
  float v17;
  unsigned __int8 v19;

  v11 = 0;
  v12 = (a4 / 20);
  v13 = (a5 / 20);
  v14 = (int)v13 * a6;
  v15 = v13 * a4;
  result = -1.0;
  do
  {
    v17 = result;
    v19 = 0;
    -[VCPImageExposurePreAnalyzer computeRegionNoise:blockTextureness:average:width:height:stride:](self, "computeRegionNoise:blockTextureness:average:width:height:stride:", &a3[v14 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))], &a7[v15 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))], &v19, v12, v13, a6);
    if (result < 0.0 || v19 > 0x1Du)
    {
      result = v17;
    }
    else if (v17 >= 0.0 && v17 < result)
    {
      result = v17;
    }
    ++v11;
  }
  while (v11 != 400);
  return result;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  id v9;
  CVReturn v10;
  size_t Width;
  size_t Height;
  size_t BytesPerRowOfPlane;
  unsigned __int8 *BaseAddressOfPlane;
  int v15;
  const std::nothrow_t *v16;
  _BYTE *v17;
  size_t v18;
  float *v19;
  float *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  float *v23;
  uint64_t v24;
  unsigned __int8 *v25;
  float *v26;
  unsigned int v27;
  _BYTE *v28;
  double v29;
  uint64_t v30;
  int v31;
  float v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float v59;
  BOOL v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _BYTE *v72;
  int v73;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  const __CFString *v76;
  void *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  void *v80;
  const __CFString *v81;
  void *v82;
  uint8_t buf[4];
  _BYTE v84[10];
  CVReturn v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v73 = 0;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v73 = v10;
    if (v10)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v84 = pixelBuffer;
      *(_WORD *)&v84[8] = 1024;
      v85 = v10;
      _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
      v10 = v73;
      if (v73)
        goto LABEL_50;
    }
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    v15 = Height * Width;
    v16 = (const std::nothrow_t *)MEMORY[0x1E0DE4E10];
    v17 = operator new[]((int)Height * (int)Width, MEMORY[0x1E0DE4E10]);
    if ((int)Height * (int)Width < 0)
      v18 = -1;
    else
      v18 = 4 * v15;
    v19 = (float *)operator new[](v18, v16);
    v20 = v19;
    v72 = v17;
    if (!v17 || !v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v84 = Width;
        *(_WORD *)&v84[4] = 1024;
        *(_DWORD *)&v84[6] = Height;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to allocate textureness or dst buffer for image resolution %dx%d", buf, 0xEu);
      }
      v10 = -108;
      goto LABEL_46;
    }
    if ((int)Height >= 1)
    {
      v21 = 0;
      v22 = BaseAddressOfPlane;
      v23 = v19;
      do
      {
        v24 = Width;
        v25 = v22;
        v26 = v23;
        if ((int)Width >= 1)
        {
          do
          {
            v27 = *v25++;
            *v26++ = (float)v27 / 255.0;
            --v24;
          }
          while (v24);
        }
        ++v21;
        v23 += (int)Width;
        v22 += BytesPerRowOfPlane;
      }
      while (v21 != Height);
    }
    v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v73);
    if (!v10)
    {
      v10 = -[VCPImageAnalyzer calculateTextureness:height:width:sdof:result:](self, "calculateTextureness:height:width:sdof:result:", v20, Height, Width, 0, v72);
      if (v10)
      {
LABEL_46:
        if (v72)
          MEMORY[0x1BCCA128C](v72, 0x1000C8077774924);
        if (v20)
          MEMORY[0x1BCCA128C](v20, 0x1000C8052888210);
        goto LABEL_50;
      }
      v28 = v72;
      -[VCPImageExposurePreAnalyzer computeNoiseLevel:width:height:stride:textureness:](self, "computeNoiseLevel:width:height:stride:textureness:", BaseAddressOfPlane, Width, Height, BytesPerRowOfPlane, v72);
      if ((int)Height <= 0)
      {
        v31 = 0;
        v32 = 0.0;
        v48 = 0.0 / (float)v15;
        v39 = 1.0;
        v36 = 0.0;
        v37 = 0.0;
        v38 = 0.0;
        v49 = 0.0;
      }
      else
      {
        v30 = 0;
        v31 = 0;
        v32 = 0.0;
        v33 = v20;
        v34 = 0.0;
        v35 = 0.0;
        v36 = 0.0;
        v37 = 0.0;
        v38 = 0.0;
        v39 = 1.0;
        do
        {
          if ((int)Width >= 1)
          {
            v40 = 0;
            v41 = fabsf((float)((float)(int)v30 / (float)(int)Height) + -0.5);
            do
            {
              v42 = fmaxf(1.0 - sqrtf(v41 + fabsf((float)((float)(int)v40 / (float)(int)Width) + -0.5)), 0.0);
              v32 = v32 + v42;
              v43 = v33[v40];
              if (v43 < 0.98039)
                v44 = 0.0;
              else
                v44 = 1.0;
              v37 = v37 + (float)(v44 * v42);
              if (v43 > 0.11765)
                v45 = 0.0;
              else
                v45 = 1.0;
              v35 = v35 + v43;
              v36 = v36 + (float)(v45 * v42);
              v46 = v34 + v43;
              if (v43 >= v38)
                v47 = v33[v40];
              else
                v47 = v38;
              if (v39 < v43)
                v43 = v39;
              if (v28[v40])
              {
                v39 = v43;
                v38 = v47;
                ++v31;
                v34 = v46;
              }
              ++v40;
            }
            while (Width != v40);
          }
          ++v30;
          v33 += (int)Width;
          v28 += (int)Width;
        }
        while (v30 != Height);
        v48 = v35 / (float)v15;
        v49 = 0.0;
        if (v31)
          v49 = v34 / (float)v31;
        else
          v31 = 0;
      }
      v59 = v37 / v32;
      v60 = v32 == 0.0;
      if (v32 == 0.0)
        v59 = 0.0;
      v61 = v36 / v32;
      if (v60)
        v62 = 0.0;
      else
        v62 = v61;
      v63 = fabsf(v48 + -0.5);
      if (v31 >= 1)
      {
        v64 = (float)(v39 + -0.3) + (float)(v39 + -0.3);
        if (v64 < (float)(0.7 - v38))
          v64 = 0.7 - v38;
        if (v63 < v64)
          v63 = v64;
      }
      v65 = (float)((float)(v63 * -4.0) * v63) + 1.0;
      if (v59 < 0.15 && (v62 < 0.4 || (float)(vabds_f32(v48, v49) / v48) < 0.1))
      {
        self->_exposureScore = v65;
        *(float *)&v29 = v65;
LABEL_79:
        self->_exposureScore = roundf(*(float *)&v29 * 100.0) / 100.0;
        v81 = CFSTR("ExposureResults");
        v78[0] = CFSTR("quality");
        *(float *)&v29 = v65;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = v66;
        v78[1] = CFSTR("attributes");
        v76 = CFSTR("underExpose");
        *(float *)&v67 = v62;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v79[1] = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v70;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v71;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v10 = 0;
        goto LABEL_46;
      }
      if (v59 < 0.15)
      {
        if ((float)((float)((float)(int)Width * 0.5) * (float)(int)Height) <= (float)v31)
        {
          *(float *)&v29 = fmaxf((float)(fabsf(v49 + -0.5) * -2.0) + 1.0, 0.0);
LABEL_78:
          self->_exposureScore = *(float *)&v29;
          goto LABEL_79;
        }
        if (*(float *)&v29 <= 0.5
          && (float)((float)((float)(int)Width * 0.001) * (float)(int)Height) <= (float)v31
          && *(float *)&v29 >= 0.0)
        {
          *(float *)&v29 = fmaxf(fmaxf((float)(fabsf((float)((float)(v39 + v38) * 0.5) + -0.5) * -2.0) + 1.0, 0.0)+ (float)(*(float *)&v29 * -0.5), 0.0);
          goto LABEL_78;
        }
      }
      if ((float)((float)((float)(v59 * -2.6) + 1.0) - v62) >= v65)
        *(float *)&v29 = v65;
      else
        *(float *)&v29 = (float)((float)(v59 * -2.6) + 1.0) - v62;
      goto LABEL_78;
    }
  }
  else
  {
    v50 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v50)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v50, v51, v52, v53, v54, v55, v56, v57);
    v10 = -50;
    v73 = -50;
  }
LABEL_50:
  if (pixelBuffer
    && !v73
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
  }

  return v10;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)analyzePixelBuffer:flags:results:cancel:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
