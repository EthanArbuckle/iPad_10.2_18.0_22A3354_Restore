@implementation VCPImageExposureAnalyzer

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
    -[VCPImageExposureAnalyzer computeRegionNoise:blockTextureness:average:width:height:stride:](self, "computeRegionNoise:blockTextureness:average:width:height:stride:", &a3[v14 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))], &a7[v15 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))], &v19, v12, v13, a6);
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
  void *v10;
  CVReturn v11;
  size_t Width;
  size_t Height;
  size_t BytesPerRowOfPlane;
  unsigned __int8 *BaseAddressOfPlane;
  unint64_t v16;
  uint64_t v17;
  float *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  float *v22;
  unsigned int v23;
  float v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  _BYTE *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  float v55;
  BOOL v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *__p[3];
  CVReturn v70;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  const __CFString *v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  void *v77;
  const __CFString *v78;
  void *v79;
  _BYTE buf[18];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = v9;
  if (v9 && ((*((uint64_t (**)(id))v9 + 2))(v9) & 1) != 0)
  {
    v11 = -128;
    goto LABEL_40;
  }
  v70 = 0;
  pixelBuffer = a3;
  unlockFlags = 1;
  if (a3)
  {
    v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    v70 = v11;
    if (v11)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = pixelBuffer;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
      v11 = v70;
      if (v70)
        goto LABEL_40;
    }
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    v16 = (int)Height * (int)Width;
    std::vector<float>::vector(buf, v16);
    if ((int)Height >= 1)
    {
      v17 = 0;
      v18 = *(float **)buf;
      v19 = BaseAddressOfPlane;
      do
      {
        v20 = Width;
        v21 = v19;
        v22 = v18;
        if ((int)Width >= 1)
        {
          do
          {
            v23 = *v21++;
            *v22++ = (float)v23 / 255.0;
            --v20;
          }
          while (v20);
        }
        ++v17;
        v18 += (int)Width;
        v19 += BytesPerRowOfPlane;
      }
      while (v17 != Height);
    }
    v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v70);
    if (v11)
      goto LABEL_64;
    std::vector<unsigned char>::vector(__p, v16);
    v11 = -[VCPImageAnalyzer calculateTextureness:height:width:sdof:result:](self, "calculateTextureness:height:width:sdof:result:", *(_QWORD *)buf, Height, Width, 0, __p[0]);
    if (v11)
    {
LABEL_62:
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
LABEL_64:
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      if (pixelBuffer
        && !v70
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
      }
      goto LABEL_40;
    }
    -[VCPImageExposureAnalyzer computeNoiseLevel:width:height:stride:textureness:](self, "computeNoiseLevel:width:height:stride:textureness:", BaseAddressOfPlane, Width, Height, BytesPerRowOfPlane, __p[0]);
    if ((int)Height <= 0)
    {
      v26 = 0;
      v29 = 0.0;
      v44 = 0.0 / (float)(int)v16;
      v35 = 1.0;
      v32 = 0.0;
      v33 = 0.0;
      v34 = 0.0;
      v45 = 0.0;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v27 = *(_QWORD *)buf;
      v28 = __p[0];
      v29 = 0.0;
      v30 = 0.0;
      v31 = 0.0;
      v32 = 0.0;
      v33 = 0.0;
      v34 = 0.0;
      v35 = 1.0;
      do
      {
        if ((int)Width >= 1)
        {
          v36 = 0;
          v37 = fabsf((float)((float)(int)v25 / (float)(int)Height) + -0.5);
          do
          {
            v38 = fmaxf(1.0 - sqrtf(v37 + fabsf((float)((float)(int)v36 / (float)(int)Width) + -0.5)), 0.0);
            v29 = v29 + v38;
            v39 = *(float *)(v27 + 4 * v36);
            if (v39 < 0.98039)
              v40 = 0.0;
            else
              v40 = 1.0;
            v33 = v33 + (float)(v40 * v38);
            if (v39 > 0.11765)
              v41 = 0.0;
            else
              v41 = 1.0;
            v31 = v31 + v39;
            v32 = v32 + (float)(v41 * v38);
            v42 = v30 + v39;
            if (v39 >= v34)
              v43 = *(float *)(v27 + 4 * v36);
            else
              v43 = v34;
            if (v35 < v39)
              v39 = v35;
            if (v28[v36])
            {
              v35 = v39;
              v34 = v43;
              ++v26;
              v30 = v42;
            }
            ++v36;
          }
          while (Width != v36);
        }
        ++v25;
        v27 += 4 * (int)Width;
        v28 += (int)Width;
      }
      while (v25 != Height);
      v44 = v31 / (float)(int)v16;
      v45 = 0.0;
      if (v26)
        v45 = v30 / (float)v26;
      else
        v26 = 0;
    }
    v55 = v33 / v29;
    v56 = v29 == 0.0;
    if (v29 == 0.0)
      v55 = 0.0;
    v57 = v32 / v29;
    if (v56)
      v58 = 0.0;
    else
      v58 = v57;
    v59 = fabsf(v44 + -0.5);
    v60 = (float)(v35 + -0.3) * 4.0;
    if (v60 < (float)(0.7 - v34))
      v60 = 0.7 - v34;
    if (v59 < v60)
      v59 = v60;
    v61 = fmaxf((float)((float)(v59 * -4.0) * v59) + 1.0, 0.0);
    if (v55 >= 0.15 || v58 >= 0.4 && (float)(vabds_f32(v44, v45) / v44) >= 0.1)
    {
      v62 = fmaxf((float)((float)(v55 * -2.6) + 1.0) - v58, 0.0);
      if (v55 >= 0.15)
        goto LABEL_57;
      if ((float)((float)((float)(int)Width * 0.5) * (float)(int)Height) > (float)v26)
      {
        if (v24 <= 0.5 && (float)((float)((float)(int)Width * 0.001) * (float)(int)Height) <= (float)v26 && v24 >= 0.0)
        {
          v61 = fmaxf(fmaxf((float)(fabsf((float)((float)(v35 + v34) * 0.5) + -0.5) * -2.0) + 1.0, 0.0)+ (float)(v24 * -0.5), 0.0);
          goto LABEL_61;
        }
LABEL_57:
        if (v62 < v61)
          v61 = v62;
        goto LABEL_61;
      }
      v61 = fmaxf((float)(fabsf(v45 + -0.5) * -2.0) + 1.0, 0.0);
    }
LABEL_61:
    self->_exposureScore = v61;
    self->_exposureScore = roundf(v61 * 100.0) / 100.0;
    v78 = CFSTR("ExposureResults");
    v75[0] = CFSTR("quality");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v63;
    v75[1] = CFSTR("attributes");
    v73 = CFSTR("underExpose");
    *(float *)&v64 = v58;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v65;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v68;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    goto LABEL_62;
  }
  v46 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v46)
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v46, v47, v48, v49, v50, v51, v52, v53);
  v11 = -50;
LABEL_40:

  return v11;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

@end
