uint64_t readData(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (2 * a3 * a4 == fread(__ptr, 1uLL, 2 * a3 * a4, __stream))
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t writeData(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (2 * a3 * a4 == fwrite(__ptr, 1uLL, 2 * a3 * a4, __stream))
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t readData32(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (4 * a3 * a4 == fread(__ptr, 1uLL, 4 * a3 * a4, __stream))
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t writeData32(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (4 * a3 * a4 == fwrite(__ptr, 1uLL, 4 * a3 * a4, __stream))
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t readBuffer(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char v7;
  char *BaseAddress;
  char *v9;
  size_t v10;
  unsigned int v11;
  uint64_t v13;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (CVPixelBufferGetPixelFormatType(pixelBuffer) == 1278226536)
    v7 = 1;
  else
    v7 = 3;
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    v9 = BaseAddress;
    v10 = Width << v7;
    v11 = 1;
    while (fread(v9, 1uLL, v10, a1) == v10)
    {
      v9 += BytesPerRow;
      if (Height <= v11++)
        goto LABEL_8;
    }
    v13 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_8:
    v13 = 0;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return v13;
}

uint64_t writeBufferWithVerticalOffset(FILE *a1, CVPixelBufferRef pixelBuffer, unint64_t a3, uint64_t a4)
{
  size_t Width;
  size_t BytesPerRow;
  char v10;
  char *BaseAddress;
  size_t v12;
  char *v13;

  if (!pixelBuffer)
    return 0xFFFFFFFFLL;
  Width = CVPixelBufferGetWidth(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (CVPixelBufferGetPixelFormatType(pixelBuffer) == 1380411457)
    v10 = 3;
  else
    v10 = 1;
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a4 + a3 <= a3)
  {
    a4 = 0;
  }
  else
  {
    v12 = Width << v10;
    v13 = &BaseAddress[BytesPerRow * a3];
    while (fwrite(v13, 1uLL, v12, a1) == v12)
    {
      v13 += BytesPerRow;
      if (!--a4)
        goto LABEL_13;
    }
    a4 = 0xFFFFFFFFLL;
  }
LABEL_13:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return a4;
}

uint64_t writeBuffer(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Height;

  Height = CVPixelBufferGetHeight(pixelBuffer);
  return writeBufferWithVerticalOffset(a1, pixelBuffer, 0, Height);
}

uint64_t writeBufferFlt32(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  _DWORD *v8;
  size_t v9;
  uint64_t i;
  uint64_t v17;

  if (!pixelBuffer)
    return 0xFFFFFFFFLL;
  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  v8 = malloc_type_malloc(4 * Width, 0x100004052888210uLL);
  if (Height)
  {
    LODWORD(v9) = 0;
    while (1)
    {
      if (Width)
      {
        for (i = 0; i != Width; ++i)
        {
          _H0 = *(_WORD *)&BaseAddress[2 * i];
          __asm { FCVT            S0, H0 }
          v8[i] = _S0;
        }
      }
      if (fwrite(v8, 1uLL, 4 * Width, a1) != 4 * Width)
        break;
      BaseAddress += BytesPerRow;
      v9 = (v9 + 1);
      if (Height <= v9)
        goto LABEL_9;
    }
    v17 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_9:
    free(v8);
    v17 = 0;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return v17;
}

uint64_t readBufferInterleaved(FILE *a1, CVPixelBufferRef pixelBuffer, unsigned int a3)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v9;
  void *v10;
  unint64_t *BaseAddress;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v9 = 2 * a3 * Width * Height;
  v10 = malloc_type_malloc(v9, 0xF9485E87uLL);
  if (fread(v10, 1uLL, v9, a1) > v9)
    return 0xFFFFFFFFLL;
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (unint64_t *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a3 == 2)
    interleave2((uint64_t)v10, (uint64_t)BaseAddress, Width, Height, BytesPerRow);
  else
    interleave4((unsigned __int16 *)v10, BaseAddress, Width, Height, BytesPerRow);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  free(v10);
  return 0;
}

uint64_t writeBufferInterlaeved(FILE *a1, CVPixelBufferRef pixelBuffer, unsigned int a3, unsigned int a4)
{
  size_t Width;
  size_t v9;
  size_t BytesPerRow;
  size_t v11;
  _WORD *v12;
  void *BaseAddress;
  uint64_t v14;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  v9 = CVPixelBufferGetHeight(pixelBuffer) / a3;
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v11 = (Width * a4 * v9) << (a4 != 3);
  v12 = malloc_type_malloc(v11, 0x220ADB24uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a3)
  {
    v14 = (uint64_t)BaseAddress;
    while (1)
    {
      if (a4 == 2)
      {
        deinterleave2(v14, (uint64_t)v12, Width, v9, BytesPerRow, 2 * Width);
      }
      else if (a4 == 3)
      {
        deinterleave3(v14, (uint64_t)v12, Width, v9, BytesPerRow);
      }
      else
      {
        deinterleave4(v14, v12, Width, v9);
      }
      if (fwrite(v12, 1uLL, v11, a1) != v11)
        return 0xFFFFFFFFLL;
      v14 += BytesPerRow * v9;
      if (!--a3)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    free(v12);
    return 0;
  }
}

uint64_t loadTexture(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unsigned int v9;
  uint64_t result;
  unint64_t v11;
  _QWORD v12[6];

  if (a5)
  {
    v9 = 1;
    do
    {
      memset(v12, 0, 24);
      v12[3] = a3;
      v12[4] = a4;
      v12[5] = 1;
      result = objc_msgSend(a2, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v12, 0);
      v11 = v9++;
    }
    while (v11 < a5);
  }
  return result;
}

void saveTextureBufferFlt32(FILE *a1, void *a2, uint64_t a3, unint64_t a4, float a5)
{
  uint64_t v9;
  uint64_t v10;
  float *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  v14 = objc_retainAutorelease(a2);
  v9 = objc_msgSend(v14, "contents");
  v10 = 4 * a3;
  v11 = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  if (a4)
  {
    LODWORD(v12) = 0;
    while (1)
    {
      if (a3)
      {
        v13 = 0;
        do
        {
          v11[v13] = (float)*(int *)(v9 + 4 * v13) * a5;
          ++v13;
        }
        while (a3 != v13);
      }
      if (fwrite(v11, 1uLL, 4 * a3, a1) != v10)
        break;
      v9 += v10;
      v12 = (v12 + 1);
      if (v12 >= a4)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    free(v11);
  }

}

void saveTextureArray(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  char *v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  FILE *v17;
  char *v18;
  _QWORD v19[6];

  v16 = a1;
  v2 = a2;
  v3 = objc_msgSend(v2, "width");
  v4 = objc_msgSend(v2, "height");
  v5 = objc_msgSend(v2, "arrayLength");
  v6 = objc_msgSend(v2, "width");
  v7 = objc_msgSend(v2, "height") * v6;
  if (objc_msgSend(v2, "pixelFormat") == 55)
    v8 = 2;
  else
    v8 = 1;
  v9 = v7 << v8;
  v18 = (char *)malloc_type_malloc((v7 << v8) * v5, 0x64D580CFuLL);
  if (v5)
  {
    v10 = 0;
    v11 = 1;
    v12 = v18;
    do
    {
      memset(v19, 0, 24);
      v19[3] = v3;
      v19[4] = v4;
      v19[5] = 1;
      objc_msgSend(v2, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v12, v3 << v8, (v4 * v3) << v8, v19, 0, v10, v16);
      v12 += v9;
      v10 = v11;
    }
    while (v5 > v11++);
  }
  v14 = objc_msgSend(v2, "pixelFormat", v16);
  v15 = 1;
  if (v14 == 55)
    v15 = 2;
  fwrite(v18, 1uLL, ((v5 * v4) << v15) * v3, v17);
  free(v18);

}

void loadTextureArray(FILE *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  size_t v9;
  id v10;
  void *v11;

  v9 = 2 * a3 * a4 * a5;
  v10 = a2;
  v11 = malloc_type_malloc(v9, 0x7F1BD4F3uLL);
  fread(v11, 1uLL, v9, a1);
  loadTexture((uint64_t)v11, v10, a3, a4, a5);

  free(v11);
}

void loadTextureInterleaved(FILE *a1, void *a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t *v12;
  uint64_t v13;
  unint64_t *v14;
  unsigned int v15;
  BOOL v16;
  unint64_t *v17;
  _QWORD v18[6];

  v9 = a2;
  v10 = 2 * a4 * a3;
  v11 = malloc_type_malloc(((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) * v10, 0xA787B125uLL);
  v12 = (unint64_t *)malloc_type_malloc(((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) * v10, 0x4C9ADFF8uLL);
  fread(v11, 1uLL, v10 * a5, a1);
  v17 = v12;
  interleave4((unsigned __int16 *)v11, v12, a3, a4, a5);
  if (a5 >= 4)
  {
    v13 = 0;
    v14 = v12;
    v15 = 1;
    do
    {
      memset(v18, 0, 24);
      v18[3] = a3;
      v18[4] = a4;
      v18[5] = 1;
      objc_msgSend(v9, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v18, 0, v13, v14, 8 * a3, 8 * a4 * a3);
      v13 = v15;
      v16 = a5 >> 2 > v15++;
      v14 += a4 * a3;
    }
    while (v16);
  }
  free(v11);
  free(v17);

}

void saveTextureInterleaved(FILE *a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  BOOL v13;
  _WORD *v14;
  char *v16;
  _QWORD v17[6];

  v8 = a2;
  v9 = 8 * a4 * a3;
  v16 = (char *)malloc_type_malloc((((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) * v9) >> 2, 0xED963759uLL);
  v14 = malloc_type_malloc(2 * a4 * a3 * a5, 0x6CB59B14uLL);
  if ((unint64_t)(a5 + 3) >= 4)
  {
    v10 = 0;
    v11 = v16;
    v12 = 1;
    do
    {
      memset(v17, 0, 24);
      v17[3] = a3;
      v17[4] = a4;
      v17[5] = 1;
      objc_msgSend(v8, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v11, 8 * a3, 8 * a4 * a3, v17, 0, v10);
      v10 = v12;
      v13 = (unint64_t)(a5 + 3) >> 2 > v12++;
      v11 += v9;
    }
    while (v13);
  }
  deinterleave4((uint64_t)v16, v14, a3, a4);
  fwrite(v14, 1uLL, 2 * a3 * a4 * a5, a1);

}

uint64_t compareBuffers(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int a6, float a7)
{
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  unint64_t v28;
  float v29;
  float v31;
  unint64_t v32;

  v28 = a4 * a3;
  if (a5)
  {
    v11 = 0;
    v12 = 0;
    v29 = (float)(a4 * a3);
    v31 = 0.0;
    do
    {
      if (a4)
      {
        v13 = 0;
        v14 = 0;
        v32 = v11 * v28;
        v15 = 0.0;
        v16 = 3.4028e38;
        v17 = 0.0;
        v18 = 3.4028e38;
        v19 = 0.0;
        do
        {
          if (a3)
          {
            v20 = 0;
            v21 = 0;
            v22 = v32 + v13 * a3;
            do
            {
              v23 = v22 + v20;
              if (a2)
                v24 = *(float *)(a2 + 4 * v23);
              else
                v24 = 0.0;
              v25 = *(float *)(a1 + 4 * v23);
              v26 = vabds_f32(v24, v25);
              if (a6)
              {
                if (v26 <= a7)
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\n");
                else
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\t****\n");
              }
              v19 = fmaxf(v19, v26);
              v18 = fminf(v18, v26);
              v17 = fmaxf(v17, v25);
              v16 = fminf(v16, v25);
              v15 = v15 + (float)((float)(v24 - v25) * (float)(v24 - v25));
              v20 = ++v21;
            }
            while (v21 < a3);
          }
          v13 = ++v14;
        }
        while (v14 < a4);
      }
      else
      {
        v18 = 3.4028e38;
        v19 = 0.0;
        v17 = 0.0;
        v16 = 3.4028e38;
        v15 = 0.0;
      }
      v31 = v31 + v15;
      printf("[%3d]\t", v12);
      printf("Dynamic Range [%f, %f]", v16, v17);
      printf("\tMax Diff = %.6f, Min Diff = %.6f, MSE = %.6f\n", v19, v18, (float)(v15 / v29));
      v11 = ++v12;
    }
    while (v12 < a5);
  }
  else
  {
    v31 = 0.0;
  }
  return printf("[Total] MSE = %6.6f\n", (float)(v31 / (float)(v28 * a5)));
}

float compareBuffersFP16(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, int a7, float a8)
{
  unint64_t v8;
  uint64_t v13;
  unsigned int v14;
  double v15;
  uint64_t v16;
  unsigned int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  float v35;
  float v37;
  float v38;
  unint64_t v39;
  float v40;
  unint64_t v42;
  float v43;
  float v45;
  unint64_t v47;

  v8 = a4;
  if (a5)
  {
    v13 = 0;
    v14 = 0;
    v15 = a8;
    v42 = a4 * a3;
    v43 = (float)(a4 * a3);
    v45 = 0.0;
    do
    {
      if (v8)
      {
        v16 = 0;
        v17 = 0;
        v47 = v13 * v8;
        v18 = 0.0;
        v19 = 3.4028e38;
        v20 = 0.0;
        v21 = 3.4028e38;
        v22 = 0.0;
        do
        {
          if (a3)
          {
            v23 = 0;
            v24 = 0;
            v25 = (v16 + v47) * a6;
            do
            {
              v26 = v23 + v25;
              if (a2)
              {
                _H0 = *(_WORD *)(a2 + 2 * v26);
                __asm { FCVT            S0, H0 }
              }
              else
              {
                _S0 = 0.0;
              }
              _H1 = *(_WORD *)(a1 + 2 * v26);
              __asm { FCVT            S10, H1 }
              v35 = _S10 - _S0;
              if (a7)
              {
                __asm { FCVT            D1, H1 }
                if (fabs(v35) <= v15)
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\n");
                else
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\t****\n");
              }
              v37 = fabsf(v35);
              v22 = fmaxf(v22, v37);
              v21 = fminf(v21, v37);
              v20 = fmaxf(v20, _S10);
              v19 = fminf(v19, _S10);
              v18 = v18 + (float)(v35 * v35);
              v23 = ++v24;
            }
            while (v24 < a3);
          }
          v16 = ++v17;
          v8 = a4;
        }
        while (v17 < a4);
      }
      else
      {
        v21 = 3.4028e38;
        v22 = 0.0;
        v20 = 0.0;
        v19 = 3.4028e38;
        v18 = 0.0;
      }
      v45 = v45 + v18;
      printf("[%3d]\t", v14);
      printf("Dynamic Range [%6.3f, %6.3f]", v19, v20);
      printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v22, v21, (float)(v18 / v43));
      v13 = ++v14;
    }
    while (v14 < a5);
    v38 = v45;
    v39 = v42;
  }
  else
  {
    v39 = a4 * a3;
    v38 = 0.0;
  }
  v40 = v38 / (float)(v39 * a5);
  printf("[Total] MSE = %6.6f\n", v40);
  return v40;
}

float compareYUV420PixelBuffers(__CVBuffer *a1, __CVBuffer *a2)
{
  _BYTE *BaseAddressOfPlane;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  double v11;
  double v12;
  float v13;
  size_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  float v22;
  size_t v23;
  size_t v24;
  size_t v25;
  double v26;
  double v27;
  double v28;
  size_t v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  unsigned int v38;
  unsigned int v39;
  unint64_t v40;
  double v41;
  float v42;
  double v43;
  double v44;
  BOOL v45;
  float v46;
  float v47;
  float v48;
  float v50;

  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  v5 = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
  v6 = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  v7 = CVPixelBufferGetBaseAddressOfPlane(a2, 1uLL);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  v13 = 0.0;
  if (HeightOfPlane)
  {
    LODWORD(v14) = 0;
    v15 = 0.0;
    v16 = 3.4028e38;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 3.4028e38;
    do
    {
      if (WidthOfPlane)
      {
        v20 = 0;
        do
        {
          LOBYTE(v11) = BaseAddressOfPlane[v20];
          v11 = (double)*(unint64_t *)&v11 / 255.0;
          *(float *)&v11 = v11;
          LOBYTE(v12) = v6[v20];
          v12 = (double)*(unint64_t *)&v12 / 255.0;
          *(float *)&v12 = v12;
          v21 = *(float *)&v11 - *(float *)&v12;
          *(float *)&v12 = vabds_f32(*(float *)&v11, *(float *)&v12);
          v17 = fmaxf(v17, *(float *)&v12);
          v16 = fminf(v16, *(float *)&v12);
          v18 = fmaxf(v18, *(float *)&v11);
          v19 = fminf(v19, *(float *)&v11);
          v15 = v15 + (float)(v21 * v21);
          ++v20;
        }
        while (WidthOfPlane > v20);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v6 += BytesPerRowOfPlane;
      v14 = (v14 + 1);
    }
    while (HeightOfPlane > v14);
  }
  else
  {
    v19 = 3.4028e38;
    v18 = 0.0;
    v16 = 3.4028e38;
    v17 = 0.0;
    v15 = 0.0;
  }
  v22 = v15 / (float)(HeightOfPlane * WidthOfPlane);
  printf("[Y]\tDynamic Range [%6.3f, %6.3f]", v19, v18);
  v50 = v22;
  printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v17, v16, v22);
  v23 = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
  v24 = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
  v25 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
  if (v24)
  {
    LODWORD(v29) = 0;
    v30 = 0.0;
    v31 = 3.4028e38;
    v32 = 3.4028e38;
    v33 = 0.0;
    v34 = 3.4028e38;
    v35 = 0.0;
    v36 = 3.4028e38;
    v37 = 0.0;
    LODWORD(v26) = 0;
    v13 = 0.0;
    do
    {
      if (v23)
      {
        v38 = 1;
        v39 = 1;
        do
        {
          LOBYTE(v26) = v5[v38 - 1];
          LOBYTE(v27) = v7[v38 - 1];
          v26 = (double)*(unint64_t *)&v26 / 255.0;
          *(double *)&v40 = (double)*(unint64_t *)&v27;
          v41 = *(double *)&v40 / 255.0;
          LOBYTE(v40) = v5[v38];
          *(float *)&v26 = v26;
          v27 = (double)v40 / 255.0;
          *(float *)&v27 = v27;
          LOBYTE(v28) = v7[v38];
          v42 = v41;
          v28 = (double)*(unint64_t *)&v28 / 255.0;
          *(float *)&v28 = v28;
          v43 = vabds_f32(*(float *)&v26, v42);
          v44 = vabds_f32(*(float *)&v27, *(float *)&v28);
          v33 = fmax(v33, v44);
          v32 = fmin(v32, v44);
          v35 = fmax(v35, *(float *)&v26);
          v37 = fmax(v37, v43);
          v30 = fmax(v30, *(float *)&v27);
          v34 = fmin(v34, *(float *)&v26);
          v36 = fmin(v36, v43);
          v31 = fmin(v31, *(float *)&v27);
          v45 = v23 > v39++;
          v38 += 2;
        }
        while (v45);
        *(float *)&v27 = *(float *)&v27 - *(float *)&v28;
        v13 = (float)(*(float *)&v26 - v42) * (float)(*(float *)&v26 - v42);
        *(float *)&v26 = *(float *)&v27 * *(float *)&v27;
      }
      v5 += v25;
      v7 += v25;
      v29 = (v29 + 1);
    }
    while (v24 > v29);
  }
  else
  {
    v36 = 3.4028e38;
    LODWORD(v26) = 0;
    v37 = 0.0;
    v35 = 0.0;
    v34 = 3.4028e38;
    v33 = 0.0;
    v32 = 3.4028e38;
    v30 = 0.0;
    v31 = 3.4028e38;
  }
  v46 = (float)(v24 * v23);
  v47 = v13 / v46;
  v48 = *(float *)&v26 / v46;
  printf("[U]\tDynamic Range [%6.3f, %6.3f]", v34, v35);
  printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v37, v36, v47);
  printf("[V]\tDynamic Range [%6.3f, %6.3f]", v31, v30);
  printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v33, v32, v48);
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return (float)(v50 + v47) + v48;
}

float compareCVPixelBuffers(__CVBuffer *a1, __CVBuffer *a2, unint64_t a3, int a4, float a5)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *BaseAddress;
  void *v14;
  float v15;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (CVPixelBufferGetPixelFormatType(a1) == 1380411457)
    Width *= 4;
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a1);
  v14 = CVPixelBufferGetBaseAddress(a2);
  v15 = compareBuffersFP16((uint64_t)BaseAddress, (uint64_t)v14, Width, Height / a3, a3, BytesPerRow >> 1, a4, a5);
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v15;
}

float compareBGRAPixelBuffers(__CVBuffer *a1, __CVBuffer *a2)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v8;
  double v9;
  double v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t i;
  uint64_t j;
  float v18;
  float v20[3];
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  v8 = (char *)CVPixelBufferGetBaseAddress(a2);
  v30 = 0;
  v29 = 0;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  v25 = 2139095039;
  v24 = 0;
  v23 = 0;
  v22 = 0;
  v21 = 2139095039;
  if (Height)
  {
    LODWORD(v11) = 0;
    v12 = 4 * (BytesPerRow >> 2);
    do
    {
      if (Width)
      {
        v13 = 0;
        v14 = v8;
        v15 = BaseAddress;
        do
        {
          for (i = 0; i != 3; ++i)
          {
            LOBYTE(v9) = v15[i];
            v9 = (double)*(unint64_t *)&v9 / 255.0;
            LOBYTE(v10) = v14[i];
            *(float *)&v9 = v9;
            v10 = (double)*(unint64_t *)&v10 / 255.0;
            *(float *)&v10 = v10;
            *((float *)&v29 + i) = *((float *)&v29 + i)
                                 + (float)((float)(*(float *)&v9 - *(float *)&v10)
                                         * (float)(*(float *)&v9 - *(float *)&v10));
            *(float *)&v10 = vabds_f32(*(float *)&v9, *(float *)&v10);
            *((float *)&v25 + i) = fminf(*(float *)&v10, *((float *)&v25 + i));
            *((float *)&v27 + i) = fmaxf(*(float *)&v10, *((float *)&v27 + i));
            *((float *)&v21 + i) = fminf(*(float *)&v9, *((float *)&v21 + i));
            LODWORD(v10) = *((_DWORD *)&v23 + i);
            *(float *)&v9 = fmaxf(*(float *)&v9, *(float *)&v10);
            *((_DWORD *)&v23 + i) = LODWORD(v9);
          }
          ++v13;
          v15 += 4;
          v14 += 4;
        }
        while (Width > v13);
      }
      v11 = (v11 + 1);
      BaseAddress += v12;
      v8 += v12;
    }
    while (Height > v11);
  }
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  for (j = 0; j != 3; ++j)
  {
    v18 = *((float *)&v29 + j) / (float)(Height * Width);
    v20[j] = v18;
    printf("[%d]\tDynamic Range [%6.3f, %6.3f]", j, *((float *)&v21 + j), *((float *)&v23 + j));
    printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", *((float *)&v27 + j), *((float *)&v25 + j), v18);
  }
  return (float)((float)(v20[0] + v20[1]) + v20[2]) / 3.0;
}

uint64_t checkMemoryLeaks()
{
  pid_t v0;
  char __str[500];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = getpid();
  snprintf(__str, 0x1F3uLL, "/usr/bin/leaks %d", v0);
  return system(__str);
}

void checkMemoryFootPrint()
{
  void *v0;
  pid_t v1;
  char __str[500];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  NSUserName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "isEqualToString:", CFSTR("root")))
  {
    v1 = getpid();
    snprintf(__str, 0x1F3uLL, "/usr/local/bin/jetsam_priority -p %d", v1);
    system(__str);
  }

}

uint64_t readYUVPlanar(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRowOfPlane;
  size_t v7;
  char *BaseAddressOfPlane;
  _BYTE *v9;
  unsigned int v10;
  uint64_t v11;
  void *v13;
  size_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  char *v21;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v7 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  v21 = (char *)malloc_type_malloc((Height * Width) >> 1, 0x5C440904uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  v9 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  if (Height)
  {
    v10 = 1;
    while (1)
    {
      v11 = 1;
      if (fread(BaseAddressOfPlane, 1uLL, Width, a1) != Width)
        break;
      BaseAddressOfPlane += BytesPerRowOfPlane;
      if (Height <= v10++)
        goto LABEL_5;
    }
    v13 = v21;
  }
  else
  {
LABEL_5:
    v11 = 1;
    v13 = v21;
    if (fread(v21, 1uLL, (Height * Width) >> 1, a1) == (Height * Width) >> 1)
    {
      if (Height >= 2)
      {
        LODWORD(v14) = 0;
        v15 = Width >> 1;
        v16 = v21;
        v17 = &v21[(Height * Width) >> 2];
        do
        {
          if (Width >= 2)
          {
            v18 = 0;
            v19 = 1;
            do
            {
              v9[v19 - 1] = v16[v18];
              v9[v19] = v17[v18++];
              v19 += 2;
            }
            while (v15 > v18);
          }
          v16 += v15;
          v17 += v15;
          v9 += v7;
          v14 = (v14 + 1);
        }
        while (Height >> 1 > v14);
      }
      v11 = 0;
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  free(v13);
  return v11;
}

uint64_t writeYUVPlanar(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  void *v6;
  size_t BytesPerRowOfPlane;
  size_t v8;
  char *BaseAddressOfPlane;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  size_t v16;
  unint64_t v17;
  _BYTE *v18;
  size_t v19;
  uint64_t v20;
  unsigned int v21;
  void *v23;
  size_t __nitems;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  __nitems = (Height * Width) >> 1;
  v6 = malloc_type_malloc(__nitems, 0x7492CA9CuLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v8 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  v10 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  if (Height)
  {
    v11 = v10;
    v23 = v6;
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = 1;
      if (fwrite(&BaseAddressOfPlane[v12 * BytesPerRowOfPlane], 1uLL, Width, a1) != Width)
      {
        v6 = v23;
        goto LABEL_14;
      }
      v12 = v13;
    }
    while (Height > v13++);
    v6 = v23;
    if (Height >= 2)
    {
      LODWORD(v16) = 0;
      v17 = Width >> 1;
      v18 = v23;
      v19 = (size_t)v23 + ((Height * Width) >> 2);
      do
      {
        if (Width >= 2)
        {
          v20 = 0;
          v21 = 1;
          do
          {
            v18[v20] = v11[v21 - 1];
            *(_BYTE *)(v19 + v20++) = v11[v21];
            v21 += 2;
          }
          while (v17 > v20);
        }
        v18 += v17;
        v19 += v17;
        v11 += v8;
        v16 = (v16 + 1);
      }
      while (Height >> 1 > v16);
    }
  }
  v14 = 1;
  if (fwrite(v6, 1uLL, __nitems, a1) == __nitems)
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    v14 = 0;
  }
LABEL_14:
  free(v6);
  return v14;
}

uint64_t write64RGBAHalf(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v8;
  size_t v9;
  unsigned int v10;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    v8 = BaseAddress;
    v9 = 8 * Width;
    v10 = 1;
    do
    {
      fwrite(v8, 1uLL, v9, a1);
      v8 += BytesPerRow;
    }
    while (Height > v10++);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return 0;
}

uint64_t writeBGRA(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v8;
  size_t v9;
  unsigned int v10;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    v8 = BaseAddress;
    v9 = 4 * Width;
    v10 = 1;
    do
    {
      fwrite(v8, 1uLL, v9, a1);
      v8 += BytesPerRow;
    }
    while (Height > v10++);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return 0;
}

uint64_t readBGRA(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v8;
  size_t v9;
  unsigned int v10;
  uint64_t v11;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    v8 = BaseAddress;
    v9 = 4 * Width;
    v10 = 1;
    while (1)
    {
      v11 = 1;
      if (fread(v8, 1uLL, v9, a1) != v9)
        break;
      v8 += BytesPerRow;
      if (Height <= v10++)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    return 0;
  }
  return v11;
}

uint64_t saveTensorBufferWithChannelOffset(__CVBuffer *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6, const char *a7)
{
  size_t v12;
  FILE *v13;
  FILE *v14;
  char __filename[256];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  __sprintf_chk(__filename, 0, 0x100uLL, "%s/%s%ldx%ldx%ld.yuv", a7, a6, a2, a3, a4);
  printf("\tfile name = %s\n", __filename);
  if (CVPixelBufferGetWidth(a1) != a2)
    saveTensorBufferWithChannelOffset_cold_3();
  v12 = a4 * a3;
  if (CVPixelBufferGetHeight(a1) < v12)
    saveTensorBufferWithChannelOffset_cold_1();
  v13 = fopen(__filename, "wb");
  if (!v13)
    saveTensorBufferWithChannelOffset_cold_2(__filename);
  v14 = v13;
  writeBufferWithVerticalOffset(v13, a1, a5 * a3, v12);
  return fclose(v14);
}

uint64_t saveTensorBuffer(__CVBuffer *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6)
{
  return saveTensorBufferWithChannelOffset(a1, a2, a3, a4, 0, a5, a6);
}

uint64_t readYUV10bit(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  _WORD *v12;
  size_t v13;
  int v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  size_t v19;

  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v19 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  v8 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  if (HeightOfPlane)
  {
    v9 = 1;
    while (1)
    {
      v10 = 1;
      if (fread(BaseAddressOfPlane, 1uLL, 2 * WidthOfPlane, a1) != 2 * WidthOfPlane)
        break;
      v11 = HeightOfPlane > v9++;
      BaseAddressOfPlane += 2 * (BytesPerRowOfPlane >> 1);
      if (!v11)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v12 = malloc_type_malloc((HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL, 0x2E69F676uLL);
    if (fread(v12, 1uLL, (HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL, a1) == ((HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL))
    {
      if (HeightOfPlane >= 2)
      {
        LODWORD(v13) = 0;
        v14 = 0;
        v15 = (HeightOfPlane * WidthOfPlane) >> 2;
        do
        {
          if (WidthOfPlane >= 2)
          {
            v16 = 0;
            v17 = 1;
            do
            {
              *(_WORD *)&v8[2 * v17 - 2] = v12[v14 + v16];
              *(_WORD *)&v8[2 * v17] = v12[v15 + v16++];
              v17 += 2;
            }
            while (WidthOfPlane >> 1 > v16);
            v14 += v16;
            v15 += v16;
          }
          v8 += 2 * (v19 >> 1);
          v13 = (v13 + 1);
        }
        while (HeightOfPlane >> 1 > v13);
      }
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      free(v12);
      return 0;
    }
    else
    {
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      return 1;
    }
  }
  return v10;
}

uint64_t writeYUV10bit(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  __CVBuffer *v2;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v7;
  size_t v8;
  _WORD *v9;
  char *BaseAddressOfPlane;
  char *v11;
  char *v12;
  size_t v13;
  unsigned int v14;
  BOOL v15;
  size_t v16;
  int v17;
  size_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  __CVBuffer *v23;

  v2 = pixelBuffer;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(v2, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v2, 0);
  v7 = CVPixelBufferGetBytesPerRowOfPlane(v2, 1uLL);
  v8 = (HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL;
  v9 = malloc_type_malloc(v8, 0x3FAEEA51uLL);
  CVPixelBufferLockBaseAddress(v2, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v2, 0);
  v11 = (char *)CVPixelBufferGetBaseAddressOfPlane(v2, 1uLL);
  if (HeightOfPlane)
  {
    v12 = v11;
    v23 = v2;
    v13 = v7 >> 1;
    v14 = 1;
    do
    {
      fwrite(BaseAddressOfPlane, 1uLL, 2 * WidthOfPlane, a1);
      v15 = HeightOfPlane > v14;
      BaseAddressOfPlane += 2 * (BytesPerRowOfPlane >> 1);
      ++v14;
    }
    while (v15);
    v8 = (HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL;
    v2 = v23;
    if (HeightOfPlane >= 2)
    {
      LODWORD(v16) = 0;
      v17 = 0;
      v18 = (HeightOfPlane * WidthOfPlane) >> 2;
      do
      {
        if (WidthOfPlane >= 2)
        {
          v19 = 0;
          v20 = 1;
          do
          {
            v9[v17 + v19] = *(_WORD *)&v12[2 * v20 - 2];
            v9[v18 + v19++] = *(_WORD *)&v12[2 * v20];
            v20 += 2;
          }
          while (WidthOfPlane >> 1 > v19);
          v17 += v19;
          v18 += v19;
        }
        v12 += 2 * v13;
        v16 = (v16 + 1);
      }
      while (HeightOfPlane >> 1 > v16);
    }
  }
  v21 = 1;
  if (fwrite(v9, 1uLL, v8, a1) == v8)
  {
    CVPixelBufferUnlockBaseAddress(v2, 0);
    free(v9);
    return 0;
  }
  return v21;
}

CVPixelBufferRef readPNG(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  void *v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  OSType v15;
  CVPixelBufferRef PixelBuffer;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGColorSpaceRef v22;
  void *v23;
  void *v24;
  uint64_t v25;
  CGColorSpaceRef v26;
  char v27;
  CGColorSpaceRef v28;
  uint64_t v29;
  uint64_t v30;
  const __CFDictionary *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CGColorSpaceRef ColorSpaceFromAttachments;
  const __CFDictionary *v40;
  void *v41;
  void *v42;
  CGColorSpaceRef v43;
  CGColorSpaceRef v44;
  CGColorSpaceRef cf;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      NSLog(CFSTR("readPNG: Error ! Invalid file name"));
      PixelBuffer = 0;
LABEL_17:

      return PixelBuffer;
    }
    v42 = v4;
    objc_msgSend(v5, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "colorSpace");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PixelWidth"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PixelHeight"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v41 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Depth"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    if (v14 == 8)
      v15 = 1111970369;
    else
      v15 = 1380411457;
    PixelBuffer = createPixelBuffer(v10, v12, v15, 0);
    v17 = *MEMORY[0x1E0CA8D68];
    v18 = *MEMORY[0x1E0CA8D88];
    v19 = *MEMORY[0x1E0CA8E98];
    v52[0] = *MEMORY[0x1E0CA8D68];
    v52[1] = v19;
    v20 = *MEMORY[0x1E0CA8EB0];
    v53[0] = v18;
    v53[1] = v20;
    v38 = v20;
    v21 = *MEMORY[0x1E0CA8EE8];
    v52[2] = *MEMORY[0x1E0CA8EE8];
    v37 = *MEMORY[0x1E0CA8F18];
    v53[2] = *MEMORY[0x1E0CA8F18];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
    v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v40);
    v22 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
    cf = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C0]);
    v44 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9A0]);
    v43 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9D0]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pathExtension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqual:", CFSTR("png")))
    {
      v36 = v18;
      v25 = v8;
      v26 = v22;
      v27 = CGColorSpaceEqualToColorSpace();

      if ((v27 & 1) == 0)
      {
        v28 = ColorSpaceFromAttachments;
        if ((CGColorSpaceEqualToColorSpace() & 1) != 0 || CGColorSpaceEqualToColorSpace())
        {
          v29 = *MEMORY[0x1E0CA8D80];
          v48[0] = v17;
          v48[1] = v19;
          v30 = *MEMORY[0x1E0CA8EA8];
          v49[0] = v29;
          v49[1] = v30;
          v48[2] = v21;
          v49[2] = *MEMORY[0x1E0CA8F00];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3, v36);
          v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((CGColorSpaceEqualToColorSpace() & 1) == 0 && !CGColorSpaceEqualToColorSpace())
            goto LABEL_16;
          v46[0] = v17;
          v46[1] = v19;
          v47[0] = v36;
          v47[1] = v38;
          v46[2] = v21;
          v47[2] = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3, v36);
          v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          v25 = (uint64_t)ColorSpaceFromAttachments;
        }
LABEL_15:
        CMSetAttachments(PixelBuffer, v31, 1u);

LABEL_16:
        objc_msgSend(MEMORY[0x1E0C9DD90], "context", v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "extent");
        objc_msgSend(v34, "render:toCVPixelBuffer:bounds:colorSpace:", v6, PixelBuffer, v25);
        CFRelease(v26);
        CFRelease(cf);
        CFRelease(v44);
        CFRelease(v43);
        CFRelease(v28);

        v4 = v42;
        goto LABEL_17;
      }
    }
    else
    {
      v25 = v8;
      v26 = v22;

    }
    v32 = *MEMORY[0x1E0CA8D98];
    v50[0] = v17;
    v50[1] = v19;
    v33 = *MEMORY[0x1E0CA8EE0];
    v51[0] = v32;
    v51[1] = v33;
    v50[2] = v21;
    v51[2] = *MEMORY[0x1E0CA8F10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3, v36);
    v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v28 = ColorSpaceFromAttachments;
    goto LABEL_15;
  }
  NSLog(CFSTR("readPNG: Error ! File name is NULL"));
  return 0;
}

void writePNG(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  OSType PixelFormatType;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  CFStringRef *v9;
  CGColorSpaceRef DeviceRGB;
  const __CFString **v11;
  const __CFString *v12;
  CGColorSpaceRef v13;
  CGColorSpaceRef v14;
  unsigned int *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  CFDictionaryRef v22;

  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v22 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], PixelFormatType);
  -[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  v7 = (const __CFString *)CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  v8 = (const __CFString *)CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
  v9 = (CFStringRef *)MEMORY[0x1E0C9D9D0];
  if (!v7)
    goto LABEL_5;
  if (CFStringCompare(v8, (CFStringRef)*MEMORY[0x1E0CA2120], 0) == kCFCompareEqualTo)
  {
    v11 = (const __CFString **)MEMORY[0x1E0C9D908];
LABEL_8:
    v12 = *v11;
LABEL_10:
    DeviceRGB = CGColorSpaceCreateWithName(v12);
    goto LABEL_11;
  }
  if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x1E0CA2318], 0) == kCFCompareEqualTo)
  {
    v11 = (const __CFString **)MEMORY[0x1E0C9D9C0];
    goto LABEL_8;
  }
  if (CFStringCompare(v7, (CFStringRef)*MEMORY[0x1E0CA8EB0], 0) == kCFCompareEqualTo)
  {
    v12 = *v9;
    goto LABEL_10;
  }
LABEL_5:
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
LABEL_11:
  v13 = DeviceRGB;
  v14 = CGColorSpaceCreateWithName(*v9);
  v15 = (unsigned int *)MEMORY[0x1E0C9E070];
  if (v6 != 8 && !CGColorSpaceEqualToColorSpace())
    v15 = (unsigned int *)MEMORY[0x1E0C9E068];
  v16 = *v15;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", pixelBuffer, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD90], "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  objc_msgSend(v18, "PNGRepresentationOfImage:format:colorSpace:options:", v17, v16, v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v13);
  CFRelease(v14);
  v21 = objc_retainAutorelease(v20);
  fwrite((const void *)objc_msgSend(v21, "bytes"), 1uLL, objc_msgSend(v21, "length"), a1);

}

void writeGrayscaldTiff(FILE *a1, uint64_t a2)
{
  CGColorSpaceRef DeviceGray;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v5 = *MEMORY[0x1E0C9E018];
  v12 = *MEMORY[0x1E0C9E110];
  v13[0] = DeviceGray;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DD90], "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  objc_msgSend(v8, "TIFFRepresentationOfImage:format:colorSpace:options:", v7, v5, DeviceGray, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(DeviceGray);
  v11 = objc_retainAutorelease(v10);
  fwrite((const void *)objc_msgSend(v11, "bytes"), 1uLL, objc_msgSend(v11, "length"), a1);

}

__CVBuffer *create420vBufferFromFile(void *a1, size_t a2, size_t a3)
{
  id v5;
  __CVBuffer *PixelBuffer;
  id v7;
  const char *v8;
  FILE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a1;
  PixelBuffer = createPixelBuffer(a2, a3, 0x34323066u, 0);
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  v9 = fopen(v8, "rb");
  readYUVPlanar(v9, PixelBuffer);
  fclose(v9);
  v10 = *MEMORY[0x1E0CA8D88];
  v11 = *MEMORY[0x1E0CA8E98];
  v15[0] = *MEMORY[0x1E0CA8D68];
  v15[1] = v11;
  v12 = *MEMORY[0x1E0CA8EB0];
  v16[0] = v10;
  v16[1] = v12;
  v15[2] = *MEMORY[0x1E0CA8EE8];
  v16[2] = *MEMORY[0x1E0CA8F18];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMSetAttachments(PixelBuffer, v13, 1u);

  return PixelBuffer;
}

__CVBuffer *createOpticalFlowTwoComponentFromFile(void *a1, size_t a2, size_t a3)
{
  id v5;
  __CVBuffer *PixelBuffer;
  id v7;
  const char *v8;
  FILE *v9;

  v5 = a1;
  PixelBuffer = createPixelBuffer(a2, a3, 0x32433068u, 0);
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  v9 = fopen(v8, "rb");
  readBufferInterleaved(v9, PixelBuffer, 2u);
  fclose(v9);
  return PixelBuffer;
}

__CVBuffer *createOpticalFlowFromFile(void *a1, size_t a2, uint64_t a3)
{
  size_t v4;
  id v5;
  __CVBuffer *PixelBuffer;
  id v7;
  const char *v8;
  FILE *v9;

  v4 = 2 * a3;
  v5 = a1;
  PixelBuffer = createPixelBuffer(a2, v4, 0x4C303068u, 0);
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  v9 = fopen(v8, "rb");
  if (readBuffer(v9, PixelBuffer))
    return 0;
  fclose(v9);
  return PixelBuffer;
}

__CVBuffer *readFlo(const char *a1)
{
  FILE *v1;
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _WORD *v9;
  _WORD *v10;
  size_t v11;
  _WORD *v12;
  _WORD *i;
  char *BaseAddress;
  size_t __n;
  __CVBuffer *pixelBuffer;
  _WORD *v24;
  _WORD *__src;
  uint64_t v26;
  size_t v27;
  float __ptr;

  v1 = fopen(a1, "rb");
  __ptr = 0.0;
  fread(&__ptr, 4uLL, 1uLL, v1);
  if (__ptr != 202020.0)
    printf("Invalid .flo file");
  v26 = 0;
  v27 = 0;
  fread(&v27, 4uLL, 1uLL, v1);
  fread(&v26, 4uLL, 1uLL, v1);
  v3 = v26;
  v2 = v27;
  v4 = 2 * v26;
  pixelBuffer = createPixelBuffer(v27, 2 * v26, 0x4C303068u, 0);
  v5 = CVPixelBufferGetBytesPerRow(pixelBuffer) >> 1;
  v6 = v4 * v5;
  __src = malloc_type_malloc(v6, 0x1000040BDFB0063uLL);
  __n = v6;
  v24 = malloc_type_malloc(v6, 0x1000040BDFB0063uLL);
  if (v3)
  {
    v7 = 0;
    v8 = 2 * v5;
    v10 = v24;
    v9 = __src;
    do
    {
      v11 = v2;
      v12 = v9;
      for (i = v10; v11; --v11)
      {
        fread(&__ptr, 4uLL, 1uLL, v1);
        _S0 = __ptr;
        __asm { FCVT            H0, S0 }
        *v12++ = LOWORD(_S0);
        fread(&__ptr, 4uLL, 1uLL, v1);
        _S0 = __ptr;
        __asm { FCVT            H0, S0 }
        *i++ = LOWORD(_S0);
      }
      ++v7;
      v10 = (_WORD *)((char *)v10 + v8);
      v9 = (_WORD *)((char *)v9 + v8);
    }
    while (v7 != v3);
  }
  fclose(v1);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  memcpy(BaseAddress, __src, __n);
  memcpy(&BaseAddress[__n], v24, __n);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  free(__src);
  free(v24);
  return pixelBuffer;
}

uint64_t writeFlo(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t BytesPerRow;
  char *BaseAddress;
  size_t v6;
  _DWORD *v7;
  size_t v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  _DWORD *v12;
  int __ptr;
  size_t v22;
  size_t Width;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  v22 = CVPixelBufferGetHeight(pixelBuffer) >> 1;
  BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  __ptr = 1212500304;
  fwrite(&__ptr, 1uLL, 4uLL, a1);
  fwrite(&Width, 4uLL, 1uLL, a1);
  fwrite(&v22, 4uLL, 1uLL, a1);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  v6 = v22;
  v7 = malloc_type_malloc(8 * Width, 0x100004052888210uLL);
  if (v22)
  {
    v8 = 0;
    v9 = &BaseAddress[v6 * BytesPerRow];
    do
    {
      v10 = Width;
      if (Width)
      {
        v11 = 0;
        v12 = v7 + 1;
        do
        {
          _H0 = *(_WORD *)&BaseAddress[2 * v11];
          __asm { FCVT            S0, H0 }
          *(v12 - 1) = _S0;
          LOWORD(_S0) = *(_WORD *)&v9[2 * v11];
          __asm { FCVT            S0, H0 }
          *v12 = _S0;
          v12 += 2;
          ++v11;
        }
        while (v10 != v11);
      }
      fwrite(v7, 1uLL, 8 * v10, a1);
      BaseAddress += BytesPerRow;
      v9 += BytesPerRow;
      ++v8;
    }
    while (v22 > v8);
  }
  free(v7);
  return CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
}

__CVBuffer *createTensorBufferFlowFromFile(void *a1, size_t a2, uint64_t a3, uint64_t a4)
{
  size_t v5;
  id v6;
  __CVBuffer *PixelBuffer;
  id v8;
  const char *v9;
  FILE *v10;

  v5 = a4 * a3;
  v6 = a1;
  PixelBuffer = createPixelBuffer(a2, v5, 0x4C303068u, 0);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = fopen(v9, "rb");
  if (readBuffer(v10, PixelBuffer))
    return 0;
  fclose(v10);
  return PixelBuffer;
}

unsigned __int16 *interleave4(unsigned __int16 *result, unint64_t *a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unsigned int v6;
  unsigned __int16 *v7;
  unint64_t *v8;
  unint64_t v9;

  if (a4)
  {
    LODWORD(v5) = 0;
    do
    {
      if (a3)
      {
        v6 = 1;
        v7 = result;
        v8 = a2;
        do
        {
          *v8++ = *v7 | ((unint64_t)v7[a4 * a3] << 16) | ((unint64_t)v7[2 * a4 * a3] << 32) | ((unint64_t)v7[3 * a4 * a3] << 48);
          v9 = v6;
          ++v7;
          ++v6;
        }
        while (v9 < a3);
      }
      a2 = (unint64_t *)((char *)a2 + a5);
      v5 = (v5 + 1);
      result += a3;
    }
    while (v5 < a4);
  }
  return result;
}

uint64_t deinterleave4(uint64_t result, _WORD *a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _WORD *v6;
  uint64_t v7;

  if (a4)
  {
    LODWORD(v4) = 0;
    do
    {
      if (a3)
      {
        v5 = 0;
        v6 = a2;
        do
        {
          v7 = *(_QWORD *)(result + 8 * v5);
          *v6 = v7;
          v6[a4 * a3] = WORD1(v7);
          v6[2 * a4 * a3] = WORD2(v7);
          v6[3 * a4 * a3] = HIWORD(v7);
          ++v5;
          ++v6;
        }
        while (a3 > v5);
      }
      v4 = (v4 + 1);
      a2 += a3;
    }
    while (v4 < a4);
  }
  return result;
}

uint64_t deinterleave3(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  int v7;

  if (a4)
  {
    LODWORD(v5) = 0;
    do
    {
      if (a3)
      {
        v6 = 0;
        do
        {
          v7 = *(_DWORD *)(result + 4 * v6);
          *(_BYTE *)(a2 + v6) = v7;
          *(_BYTE *)(a2 + a4 * a3 + v6) = BYTE1(v7);
          *(_BYTE *)(a2 + 2 * a4 * a3 + v6++) = BYTE2(v7);
        }
        while (a3 > v6);
      }
      result += a5;
      a2 += a3;
      v5 = (v5 + 1);
    }
    while (v5 < a4);
  }
  return result;
}

uint64_t interleave2(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    LODWORD(v5) = 0;
    v6 = result + 2 * a4 * a3;
    v7 = 2 * a3;
    do
    {
      if (a3)
      {
        v8 = 0;
        do
        {
          *(_DWORD *)(a2 + 4 * v8) = *(unsigned __int16 *)(result + 2 * v8) | (*(unsigned __int16 *)(v6 + 2 * v8) << 16);
          ++v8;
        }
        while (a3 > v8);
      }
      v5 = (v5 + 1);
      a2 += 4 * (a5 >> 2);
      v6 += v7;
      result += v7;
    }
    while (v5 < a4);
  }
  return result;
}

uint64_t deinterleave2(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  if (a4)
  {
    LODWORD(v6) = 0;
    v7 = a2 + 2 * a4 * (a6 >> 1);
    v8 = 2 * (a6 >> 1);
    do
    {
      if (a3)
      {
        v9 = 0;
        do
        {
          v10 = *(_DWORD *)(result + 4 * v9);
          *(_WORD *)(a2 + 2 * v9) = v10;
          *(_WORD *)(v7 + 2 * v9++) = HIWORD(v10);
        }
        while (a3 > v9);
      }
      v6 = (v6 + 1);
      v7 += v8;
      a2 += v8;
      result += 4 * (a5 >> 2);
    }
    while (v6 < a4);
  }
  return result;
}

id findIRAPs(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CMTimeValue v7;
  CMTimeFlags v8;
  uint64_t v9;
  opaqueCMSampleBuffer *v10;
  CMTimeScale v11;
  CMTimeEpoch v12;
  CMTimeFlags flags;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  CMTimeEpoch v25;
  void *v26;
  int v27;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  CMTimeEpoch v36;
  CMTimeScale v37;
  CMTimeFlags v38;
  CMTimeValue v39;
  id v40;
  CMTimeEpoch epoch;
  CMTimeScale timescale;
  CMTimeValue value;
  void *v44;
  CMTime time2;
  CMTime time1;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTime v51;
  CMTime v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = objc_claimAutoreleasedReturnValue();

  v35 = v1;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOutput:", v5);
  v33 = v4;
  objc_msgSend(v4, "startReading");
  v6 = MEMORY[0x1E0CA2E18];
  v7 = *MEMORY[0x1E0CA2E18];
  v8 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v52 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E28];
  v44 = v5;
  v9 = objc_msgSend(v5, "copyNextSampleBuffer");
  if (v9)
  {
    v10 = (opaqueCMSampleBuffer *)v9;
    v11 = *(_DWORD *)(v6 + 8);
    v12 = *(_QWORD *)(v6 + 16);
    flags = v8;
    v39 = v7;
    value = v7;
    v37 = v11;
    v38 = v8;
    timescale = v11;
    v36 = v12;
    epoch = v12;
    while (1)
    {
      if (!CMSampleBufferGetNumSamples(v10))
        goto LABEL_32;
      memset(&v51, 0, sizeof(v51));
      CMSampleBufferGetPresentationTimeStamp(&v51, v10);
      CMSampleBufferGetSampleAttachmentsArray(v10, 1u);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (!v16)
        goto LABEL_13;
      v17 = v16;
      v18 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HEVCSyncSampleNALUnitType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v26 = v21;
            v27 = objc_msgSend(v21, "intValue");

            if (v27 == 19 || v27 == 21)
            {
              if ((flags & 1) != 0)
              {
                time1.value = value;
                time1.timescale = timescale;
                time1.flags = flags;
                time1.epoch = epoch;
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &time1);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "addObject:", v29);

              }
              value = v51.value;
              flags = v51.flags;
              timescale = v51.timescale;
              v52 = v51;
              epoch = v51.epoch;
              goto LABEL_31;
            }
            if (v27 != 20)
              goto LABEL_14;
LABEL_29:
            v24 = (void *)MEMORY[0x1E0CB3B18];
            *(_OWORD *)&time1.value = *(_OWORD *)&v51.value;
            v25 = v51.epoch;
            goto LABEL_30;
          }
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("DependsOnOthers"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "BOOLValue");

          if ((v23 & 1) == 0)
          {

            goto LABEL_29;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v17)
          continue;
        break;
      }
LABEL_13:

LABEL_14:
      time1 = v51;
      time2 = v52;
      if (CMTimeCompare(&time1, &time2) == -1)
      {
        time1 = v51;
        time2.value = value;
        time2.timescale = timescale;
        time2.flags = flags;
        time2.epoch = epoch;
        if (CMTimeCompare(&time1, &time2) == -1)
        {
          value = v51.value;
          flags = v51.flags;
          timescale = v51.timescale;
          epoch = v51.epoch;
        }
      }
      else if ((flags & 1) != 0)
      {
        v24 = (void *)MEMORY[0x1E0CB3B18];
        time1.value = value;
        time1.timescale = timescale;
        time1.flags = flags;
        v25 = epoch;
LABEL_30:
        time1.epoch = v25;
        objc_msgSend(v24, "valueWithCMTime:", &time1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v30);

        epoch = v36;
        flags = v38;
        timescale = v37;
        value = v39;
      }
LABEL_31:

LABEL_32:
      CFRelease(v10);
      v10 = (opaqueCMSampleBuffer *)objc_msgSend(v44, "copyNextSampleBuffer");
      if (!v10)
      {
        if ((flags & 1) != 0)
          goto LABEL_34;
        goto LABEL_35;
      }
    }
  }
  value = v7;
  if ((v8 & 1) != 0)
  {
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", value);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v31);

  }
LABEL_35:

  return v40;
}

float calcNormalizationParams@<S0>(unint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>, float a4@<S1>, float a5@<S2>, float a6@<S3>)
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float result;

  v6 = (float)(2 * a1);
  v7 = (float)(a3 + a5) / v6;
  v8 = (float)((float)(a4 + a6) / v6) - (float)(v7 * v7);
  if (v8 <= 0.0)
    v8 = 0.00001;
  *(_DWORD *)(a2 + 24) = 0;
  *(float *)a2 = v7;
  *(float *)(a2 + 4) = 1.0 / fmaxf(sqrtf(v8), 0.1);
  v9 = (float)a1;
  v10 = a3 / (float)a1;
  v11 = (float)(a4 / (float)a1) - (float)(v10 * v10);
  if (v11 <= 0.0)
    v11 = 0.00001;
  v12 = fmaxf(sqrtf(v11), 0.1);
  v13 = a5 / v9;
  *(float *)(a2 + 8) = v10;
  *(float *)(a2 + 12) = v13;
  v14 = (float)(a6 / v9) - (float)(v13 * v13);
  if (v14 <= 0.0)
    v14 = 0.00001;
  result = fmaxf(sqrtf(v14), 0.1);
  *(float *)(a2 + 16) = v12;
  *(float *)(a2 + 20) = result;
  return result;
}

BOOL isTextureYUV420(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = objc_msgSend(v1, "pixelFormat") == 500
    || objc_msgSend(v1, "pixelFormat") == 505
    || objc_msgSend(v1, "pixelFormat") == 508;

  return v2;
}

void sub_1D426F430(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1D426FF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t FRCGetReverseRotation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_1D428E6D0[a1 - 1];
}

uint64_t *swapWidthAndHeight(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *result;
  *result = *a2;
  *a2 = v2;
  return result;
}

void FRCGetInputFrameSizeForUsage(__int16 a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  switch(a1 & 0xFFF)
  {
    case 0:
      v7 = 1440;
      goto LABEL_30;
    case 1:
      v11 = 1920;
LABEL_26:
      *a2 = v11;
      v6 = 1440;
      break;
    case 2:
      v12 = 960;
      goto LABEL_34;
    case 3:
      v8 = 720;
      goto LABEL_32;
    case 4:
      v7 = 1920;
LABEL_30:
      *a2 = v7;
      v6 = 1080;
      break;
    case 5:
      v8 = 960;
LABEL_32:
      *a2 = v8;
      v6 = 540;
      break;
    case 6:
      v12 = 1280;
LABEL_34:
      *a2 = v12;
      v6 = 720;
      break;
    case 7:
      *a2 = 1280;
      v6 = 960;
      break;
    case 8:
      *a2 = 640;
      v6 = 480;
      break;
    case 9:
      v10 = 640;
LABEL_68:
      *a2 = v10;
      v6 = 360;
      break;
    case 0xA:
      v9 = 480;
LABEL_62:
      *a2 = v9;
      v6 = 270;
      break;
    case 0xB:
      *a2 = 320;
      v6 = 180;
      break;
    case 0xC:
      *a2 = 320;
      v6 = 240;
      break;
    case 0xD:
      v13 = 3840;
      goto LABEL_44;
    case 0xE:
      *a2 = 4096;
      v6 = 2048;
      break;
    case 0xF:
      v13 = 4096;
LABEL_44:
      *a2 = v13;
      v6 = 2160;
      break;
    case 0x10:
      *a2 = 4096;
      v6 = 2304;
      break;
    case 0x11:
      *a2 = 4096;
      v6 = 3112;
      break;
    case 0x12:
      v14 = 7680;
      goto LABEL_55;
    case 0x13:
    case 0x14:
    case 0x1A:
LABEL_77:
      *a2 = 0;
      *a3 = 0;
      NSLog(CFSTR("No frame size available for usage: %ld"), a1 & 0xFFF);
      if ((a1 & 0x1000) == 0)
        return;
      goto LABEL_75;
    case 0x15:
      v15 = 5120;
      goto LABEL_52;
    case 0x16:
      *a2 = 5120;
      v6 = 4272;
      break;
    case 0x17:
      *a2 = 5744;
      v6 = 3024;
      break;
    case 0x18:
      v15 = 5760;
LABEL_52:
      *a2 = v15;
      v6 = 2880;
      break;
    case 0x19:
      *a2 = 6144;
      v6 = 3456;
      break;
    case 0x1B:
      v14 = 0x2000;
LABEL_55:
      *a2 = v14;
      v6 = 4320;
      break;
    case 0x1C:
      *a2 = 6560;
      v6 = 3104;
      break;
    case 0x1D:
      v6 = 2208;
LABEL_73:
      *a2 = v6;
      break;
    default:
      switch(a1 & 0xFFF)
      {
        case 'd':
          *a2 = 1440;
          v6 = 464;
          goto LABEL_74;
        case 'e':
          *a2 = 1920;
          v6 = 584;
          goto LABEL_74;
        case 'f':
          *a2 = 960;
          v6 = 424;
          goto LABEL_74;
        case 'g':
          v9 = 360;
          goto LABEL_62;
        case 'h':
          v10 = 480;
          goto LABEL_68;
        case 'i':
          *a2 = 2048;
          v6 = 1024;
          goto LABEL_74;
        case 'j':
          v7 = 2048;
          goto LABEL_30;
        case 'k':
          *a2 = 2048;
          v6 = 1152;
          goto LABEL_74;
        case 'l':
          *a2 = 2048;
          v6 = 1556;
          goto LABEL_74;
        case 'm':
          *a2 = 1024;
          v6 = 512;
          goto LABEL_74;
        case 'n':
          v11 = 2560;
          goto LABEL_26;
        case 'o':
          *a2 = 2560;
          v6 = 2136;
          goto LABEL_74;
        case 'p':
          *a2 = 2872;
          v6 = 1512;
          goto LABEL_74;
        case 'q':
          v11 = 2880;
          goto LABEL_26;
        case 'r':
          *a2 = 3072;
          v6 = 1728;
          goto LABEL_74;
        case 's':
          *a2 = 1536;
          v6 = 864;
          goto LABEL_74;
        case 't':
          *a2 = 3280;
          v6 = 1552;
          goto LABEL_74;
        case 'u':
          *a2 = 1640;
          v6 = 776;
          goto LABEL_74;
        default:
          switch(a1 & 0xFFF)
          {
            case 0xC8:
              v8 = 1024;
              goto LABEL_32;
            case 0xC9:
              *a2 = 1024;
              v6 = 576;
              goto LABEL_74;
            case 0xCA:
              *a2 = 1024;
              v6 = 778;
              goto LABEL_74;
            case 0xCB:
              *a2 = 512;
              v6 = 256;
              goto LABEL_74;
            case 0xCC:
              v9 = 512;
              goto LABEL_62;
            case 0xCD:
              *a2 = 512;
              v6 = 288;
              goto LABEL_74;
            case 0xCE:
              *a2 = 512;
              v6 = 389;
              goto LABEL_74;
            case 0xD1:
              *a2 = 640;
              v6 = 534;
              goto LABEL_74;
            case 0xD2:
              *a2 = 718;
              v6 = 378;
              goto LABEL_74;
            case 0xD3:
              v10 = 720;
              goto LABEL_68;
            case 0xD4:
              *a2 = 384;
              v6 = 216;
              goto LABEL_74;
            case 0xD5:
              *a2 = 410;
              v6 = 194;
              goto LABEL_74;
            case 0xD6:
              *a2 = 1280;
              v6 = 1068;
              goto LABEL_74;
            case 0xD7:
              v6 = 1104;
              goto LABEL_73;
            default:
              goto LABEL_77;
          }
      }
  }
LABEL_74:
  *a3 = v6;
  if ((a1 & 0x1000) != 0)
  {
LABEL_75:
    v16 = *a2;
    *a2 = *a3;
    *a3 = v16;
  }
}

uint64_t FRCGetNumberOfPixelsForUsage(__int16 a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  v3 = 0;
  FRCGetInputFrameSizeForUsage(a1, &v3, &v2);
  return v2 * v3;
}

void FRCGetAlignedInputFrameSizeForUsage(__int16 a1, uint64_t *a2, uint64_t *a3)
{
  FRCGetInputFrameSizeForUsage(a1, a2, a3);
  *a3 = (*a3 + 7) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t FRCGetUsageFromSize(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v7;

  if (a1 <= a2)
    v2 = a2;
  else
    v2 = a1;
  if (a1 >= a2)
    v3 = a2;
  else
    v3 = a1;
  v4 = 29;
  if (v2 != 2208 || v3 != 2208)
    v4 = -1;
  if (v2 == 1920 && v3 == 1440)
    goto LABEL_11;
  if (v2 == 1440 && v3 == 1080)
    goto LABEL_14;
  if (v2 == 1280 && v3 == 720)
    goto LABEL_17;
  if (v2 == 1280 && v3 == 960)
  {
    v4 = 7;
    goto LABEL_51;
  }
  if (v2 == 1920 && v3 == 1080)
    goto LABEL_23;
  if (v2 == 3840 && v3 == 2160)
    goto LABEL_26;
  if (v2 == 960 && v3 == 720)
  {
    v4 = 2;
    goto LABEL_51;
  }
  if (v2 == 720 && v3 == 540)
    goto LABEL_32;
  if (v2 == 960 && v3 == 540)
  {
LABEL_35:
    v4 = 5;
    goto LABEL_51;
  }
  if (v2 == 640 && v3 == 480)
  {
    v4 = 8;
    goto LABEL_51;
  }
  if (v2 == 640 && v3 == 360)
  {
    v4 = 9;
    goto LABEL_51;
  }
  if (v2 == 480 && v3 == 270)
  {
    v4 = 10;
    goto LABEL_51;
  }
  if (v2 == 320 && v3 == 180)
  {
    v4 = 11;
    goto LABEL_51;
  }
  if (v2 == 320 && v3 == 240)
    goto LABEL_50;
  if (v2 == 5120)
  {
    if (v3 == 2880)
    {
LABEL_116:
      v4 = 21;
      goto LABEL_51;
    }
    if (v3 == 4272)
    {
LABEL_64:
      v4 = 22;
      goto LABEL_51;
    }
    goto LABEL_71;
  }
  if (v2 == 4096)
  {
    v4 = 14;
    if (v3 != 2048)
      v4 = 15;
    if ((uint64_t)v3 > 2303)
    {
      if (v3 == 2304)
      {
        v4 = 16;
        goto LABEL_51;
      }
      if (v3 == 3112)
      {
        v4 = 17;
        goto LABEL_51;
      }
    }
    else if (v3 == 2048 || v3 == 2160)
    {
      goto LABEL_51;
    }
LABEL_71:
    if (v2 == 2208 && v3 == 2208)
    {
LABEL_76:
      v4 = 29;
      goto LABEL_51;
    }
    v7 = 0;
    goto LABEL_73;
  }
  if (v2 == 5744 && v3 == 3024)
  {
    v4 = 23;
    goto LABEL_51;
  }
  if (v2 == 5760 && v3 == 2880)
  {
    v4 = 24;
    goto LABEL_51;
  }
  if (v2 == 6144 && v3 == 3456)
    goto LABEL_82;
  if (v2 == 7680 && v3 == 4320)
    goto LABEL_86;
  if (v2 == 0x2000 && v3 == 4320)
    v4 = 27;
  if (v2 == 0x2000 && v3 == 4320 || v2 == 2208 && v3 == 2208)
    goto LABEL_51;
  if (v2 <= 0x140 && v3 < 0xF1)
  {
LABEL_50:
    v4 = 12;
    goto LABEL_51;
  }
  if (v2 <= 0x2D0 && v3 < 0x21D)
  {
LABEL_32:
    v4 = 3;
    goto LABEL_51;
  }
  if (v2 <= 0x3C0 && v3 < 0x21D)
    goto LABEL_35;
  if (v2 <= 0x500 && v3 < 0x2D1)
  {
LABEL_17:
    v4 = 6;
    goto LABEL_51;
  }
  if (v2 <= 0x5A0 && v3 < 0x439)
  {
LABEL_14:
    v4 = 0;
    goto LABEL_51;
  }
  v7 = v2 < 0x781;
  if (v2 <= 0x780 && v3 < 0x439)
  {
LABEL_23:
    v4 = 4;
    goto LABEL_51;
  }
LABEL_73:
  if (v7 && v3 < 0x5A1)
  {
LABEL_11:
    v4 = 1;
    goto LABEL_51;
  }
  if (v2 < 0x8A1)
    goto LABEL_76;
  if (v2 <= 0xF00 && v3 < 0x871)
  {
LABEL_26:
    v4 = 13;
    goto LABEL_51;
  }
  if (v2 <= 0x1000 && v3 <= 0xC28)
  {
    if (v3 < 0x801)
      v4 = 14;
    else
      v4 = 15;
    if (v3 >= 0x871)
    {
      if (v3 < 0x901)
        v4 = 16;
      else
        v4 = 17;
    }
    goto LABEL_51;
  }
  if (v2 <= 0x1400 && v3 < 0xB41)
    goto LABEL_116;
  if (v2 <= 0x1400 && v3 < 0x10B1)
    goto LABEL_64;
  if (v2 <= 0x1800 && v3 < 0xD81)
  {
LABEL_82:
    v4 = 25;
    goto LABEL_51;
  }
  if (v2 <= 0x19A0 && v3 < 0xC21)
  {
    v4 = 28;
    goto LABEL_51;
  }
  if (v2 <= 0x1E00 && v3 < 0x10E1)
  {
LABEL_86:
    v4 = 18;
    goto LABEL_51;
  }
  v5 = -1;
  if (v2 > 0x2000 || v3 > 0x10E0)
    return v5;
  v4 = 27;
LABEL_51:
  v5 = v4 | 0x1000;
  if (a1 >= a2)
    return v4;
  return v5;
}

uint64_t getQuarterSizeUsage(uint64_t a1)
{
  uint64_t result;

  result = 3;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 2;
      break;
    case 2:
    case 3:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 19:
    case 20:
    case 26:
LABEL_26:
      result = a1;
      break;
    case 4:
      result = 5;
      break;
    case 5:
      result = 10;
      break;
    case 6:
      result = 9;
      break;
    case 7:
      result = 8;
      break;
    case 13:
      result = 4;
      break;
    case 14:
      result = 105;
      break;
    case 15:
      result = 106;
      break;
    case 16:
      result = 107;
      break;
    case 17:
      result = 108;
      break;
    case 18:
      result = 13;
      break;
    case 21:
      result = 110;
      break;
    case 22:
      result = 111;
      break;
    case 23:
      result = 112;
      break;
    case 24:
      result = 113;
      break;
    case 25:
      result = 114;
      break;
    case 27:
      result = 15;
      break;
    case 28:
      result = 116;
      break;
    case 29:
      result = 215;
      break;
    default:
      switch(a1)
      {
        case 'i':
          result = 109;
          break;
        case 'j':
          result = 200;
          break;
        case 'k':
          result = 201;
          break;
        case 'l':
          result = 202;
          break;
        case 'n':
          result = 6;
          break;
        case 'o':
          result = 214;
          break;
        case 'r':
          result = 115;
          break;
        case 't':
          result = 117;
          break;
        default:
          goto LABEL_26;
      }
      break;
  }
  return result;
}

uint64_t get4xDownSizeUsage(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = 11;
  switch(a1)
  {
    case 0:
      result = 103;
      break;
    case 1:
      result = 104;
      break;
    case 2:
    case 3:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 19:
    case 20:
LABEL_18:
      NSLog(CFSTR("%s: Invalid Usage: %ld"), "get4xDownSizeUsage", a1, v1, v2);
      result = -1;
      break;
    case 4:
      result = 10;
      break;
    case 6:
      return result;
    case 7:
      result = 12;
      break;
    case 13:
      result = 5;
      break;
    case 14:
      result = 109;
      break;
    case 15:
      result = 200;
      break;
    case 16:
      result = 201;
      break;
    case 17:
      result = 202;
      break;
    case 18:
      result = 4;
      break;
    case 21:
      result = 6;
      break;
    default:
      switch(a1)
      {
        case 'i':
          result = 203;
          break;
        case 'j':
          result = 204;
          break;
        case 'k':
          result = 205;
          break;
        case 'l':
          result = 206;
          break;
        case 'n':
          result = 9;
          break;
        case 'o':
          result = 209;
          break;
        case 'p':
          result = 210;
          break;
        case 'q':
          result = 211;
          break;
        case 's':
          result = 212;
          break;
        case 'u':
          result = 213;
          break;
        default:
          goto LABEL_18;
      }
      break;
  }
  return result;
}

id uniformTimeScales(unint64_t a1)
{
  float v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v2 = 1.0 / ((double)a1 + 1.0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    do
    {
      *(float *)&v4 = v2 * (float)(int)++v5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

    }
    while (a1 != v5);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_1D4275DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

const __CFString *FRCGetRecommendationDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E9786AD0[a1 - 1];
}

const __CFString *FRCGetSessionResultDescription(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Unknown");
  else
    return off_1E9786AF0[a1];
}

const __CFString *FRCGetGatingCauseDescription(unint64_t a1)
{
  if (a1 > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E9786B18[a1];
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const char *getConfigurationName(uint64_t a1)
{
  const char *result;

  switch(a1)
  {
    case 'd':
      result = "landscape1440x464";
      break;
    case 'e':
      result = "landscape1920x584";
      break;
    case 'f':
      result = "landscape960x424";
      break;
    case 'g':
      result = "landscape360x270";
      break;
    case 'h':
      result = "landscape480x360";
      break;
    case 'i':
      result = "landscape2048x1024";
      break;
    case 'j':
      result = "landscape2048x1080";
      break;
    case 'k':
      result = "landscape2048x1152";
      break;
    case 'l':
      result = "landscape2048x1556";
      break;
    case 'm':
      result = "landscape1024x512";
      break;
    case 'n':
      result = "landscape2560x1440";
      break;
    case 'o':
      result = "landscape2560x2136";
      break;
    case 'p':
      result = "landscape2872x1512";
      break;
    case 'q':
      result = "landscape2880x1440";
      break;
    case 'r':
      result = "landscape3072x1728";
      break;
    case 's':
      result = "landscape1536x864";
      break;
    case 't':
      result = "landscape3280x1552";
      break;
    case 'u':
      result = "landscape1640x776";
      break;
    default:
      result = "landscape1440x1080";
      switch(a1)
      {
        case 0:
          return result;
        case 1:
          result = "landscape1920x1440";
          break;
        case 2:
          result = "landscape960x720";
          break;
        case 3:
          result = "landscape720x540";
          break;
        case 4:
          result = "landscape1920x1080";
          break;
        case 5:
          result = "landscape960x540";
          break;
        case 6:
          result = "landscape1280x720";
          break;
        case 7:
          result = "landscape1280x960";
          break;
        case 8:
          result = "landscape640x480";
          break;
        case 9:
          result = "landscape640x360";
          break;
        case 10:
          result = "landscape480x270";
          break;
        case 11:
          result = "landscape320x180";
          break;
        case 12:
          result = "landscape320x240";
          break;
        case 13:
        case 18:
          result = "landscape3840x2160";
          break;
        case 14:
        case 16:
        case 17:
        case 19:
        case 20:
        case 21:
        case 22:
LABEL_52:
          result = "";
          break;
        case 15:
          result = "landscape4096x2160";
          break;
        case 23:
          result = "landscape574x3024";
          break;
        default:
          switch(a1)
          {
            case 200:
              result = "landscape1024x540";
              break;
            case 201:
              result = "landscape1024x576";
              break;
            case 202:
              result = "landscape1024x778";
              break;
            case 203:
              result = "landscape512x256";
              break;
            case 204:
              result = "landscape512x270";
              break;
            case 205:
              result = "landscape512x288";
              break;
            case 206:
              result = "landscape512x389";
              break;
            case 209:
              result = "landscape640x534";
              break;
            case 210:
              result = "landscape718x378";
              break;
            case 211:
              result = "landscape720x360";
              break;
            case 212:
              result = "landscape384x216";
              break;
            case 213:
              result = "landscape410x194";
              break;
            case 214:
              result = "landscape1280x1068";
              break;
            case 215:
              result = "landscape1104x1104";
              break;
            default:
              goto LABEL_52;
          }
          break;
      }
      break;
  }
  return result;
}

uint64_t TileInfoMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void getSynthesisTensorSize(__int16 a1, int a2, unint64_t *a3)
{
  unint64_t i;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v7 = 0;
  v8 = 0;
  FRCGetAlignedInputFrameSizeForUsage(a1, (uint64_t *)&v8, (uint64_t *)&v7);
  v6 = v7;
  for (i = v8; a2; --a2)
  {
    i = (i + 1) >> 1;
    v6 = (v6 + 1) >> 1;
  }
  *a3 = i;
  a3[1] = v6;
  a3[2] = 3;
}

void sub_1D4285AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

CFMutableDictionaryRef createPixelBufferPoolWithExtendedPixels(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  const __CFAllocator *v6;
  CFMutableDictionaryRef result;
  __CFDictionary *v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFMutableDictionaryRef Mutable;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CVPixelBufferPoolRef poolOut;
  int v20;
  int v21;
  int v22;
  int valuePtr;
  uint64_t v24;
  uint64_t v25;

  v24 = a2;
  v25 = a1;
  v22 = a4;
  valuePtr = a3;
  v20 = a6;
  v21 = a5;
  poolOut = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (result)
  {
    v8 = result;
    v9 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
    if (!v9)
      goto LABEL_6;
    v10 = v9;
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CA9040], v9);
    CFRelease(v10);
    Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E0CA8FF0], Mutable);
    CFRelease(Mutable);
    v12 = CFNumberCreate(v6, kCFNumberLongType, &v25);
    if (!v12)
      goto LABEL_6;
    v13 = v12;
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CA90E0], v12);
    CFRelease(v13);
    v14 = CFNumberCreate(v6, kCFNumberLongType, &v24);
    if (v14)
    {
      v15 = v14;
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CA8FD8], v14);
      CFRelease(v15);
      v16 = CFNumberCreate(v6, kCFNumberIntType, &v22);
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CA8F68], v16);
      CFRelease(v16);
      v17 = CFNumberCreate(v6, kCFNumberIntType, &v21);
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CA8FB8], v17);
      CFRelease(v17);
      v18 = CFNumberCreate(v6, kCFNumberIntType, &v20);
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CA8FA0], v18);
      CFRelease(v18);
      CVPixelBufferPoolCreate(v6, 0, v8, &poolOut);
      CFRelease(v8);
      return poolOut;
    }
    else
    {
LABEL_6:
      CFRelease(v8);
      return 0;
    }
  }
  return result;
}

CFMutableDictionaryRef createPixelBufferPool(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return createPixelBufferPoolWithExtendedPixels(a1, a2, a3, a4, 0, ((a2 + 15) & 0xFFFFFFF0) - a2);
}

CVPixelBufferRef createPixelBuffer(size_t a1, size_t a2, OSType a3, int a4)
{
  const __CFAllocator *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v11;
  CFNumberRef v12;
  CVPixelBufferRef v14;
  int valuePtr;

  valuePtr = a4;
  v14 = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v11 = CFDictionaryCreateMutable(v7, 0, v8, v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA8FF0], v11);
  CFRelease(v11);
  v12 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8F68], v12);
  CFRelease(v12);
  CVPixelBufferCreate(v7, a1, a2, a3, Mutable, &v14);
  CFRelease(Mutable);
  return v14;
}

id createTextures(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v9;
  void *v10;
  void *v11;

  v9 = a1;
  createTextureDescriptor(a2, a3, a4, a5, 1278226536);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "newTextureWithDescriptor:", v10);

  return v11;
}

id createTextureDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = 115;
  v7 = 25;
  if (a5 == 1278226488)
    v7 = 12;
  if (a3 == 1)
    v6 = v7;
  if (a3 == 2)
    v8 = 65;
  else
    v8 = v6;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v8, a1, a2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsage:", 3);
  objc_msgSend(v9, "setStorageMode:", 0);
  if (a4 >= 2)
  {
    objc_msgSend(v9, "setTextureType:", 3);
    objc_msgSend(v9, "setArrayLength:", a4);
  }
  return v9;
}

id createRGBATextureFromCVPixelBuffer(__CVBuffer *a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  size_t Width;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = equivalentUncompressedPixelFormat(a1);
  v5 = 90;
  if (v4 == 1380411457)
    v5 = 115;
  if (v4 == 1111970369)
    v6 = 70;
  else
    v6 = v5;
  v7 = (void *)MEMORY[0x1E0CC6BB0];
  Width = CVPixelBufferGetWidth(a1);
  objc_msgSend(v7, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v6, Width, CVPixelBufferGetHeight(a1), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsage:", 3);
  v10 = (void *)objc_msgSend(v3, "newTextureWithDescriptor:iosurface:plane:", v9, CVPixelBufferGetIOSurface(a1), 0);

  return v10;
}

uint64_t equivalentUncompressedPixelFormat(__CVBuffer *a1)
{
  uint64_t PixelFormatType;
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v3 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], PixelFormatType);
  if (CVPixelBufferGetPlaneCount(a1))
  {
    -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA91B0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9158]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7)
    {
      -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9190]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PixelFormatType = objc_msgSend(v8, "intValue");

    }
  }

  return PixelFormatType;
}

uint64_t isYUV420(__CVBuffer *a1)
{
  unsigned int v1;

  v1 = equivalentUncompressedPixelFormat(a1);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(v1), (int32x4_t)xmmword_1D428EB00))) & 1 | ((v1 & 0xFFFFFFEF) == 875704422);
}

uint64_t isPackedRGBA(__CVBuffer *a1)
{
  OSType PixelFormatType;
  CFDictionaryRef v2;
  void *v3;
  uint64_t v4;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v2 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], PixelFormatType);
  -[__CFDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9180]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t isBufferYUV(__CVBuffer *a1)
{
  OSType PixelFormatType;
  CFDictionaryRef v2;
  void *v3;
  uint64_t v4;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v2 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], PixelFormatType);
  -[__CFDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9188]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

BOOL isBufferCopyNecessaryForCVtoTextureConversion(unint64_t a1, unint64_t a2, unint64_t a3)
{
  return a1 < 0x80 || a3 > 0x80 || a2 < 0x80;
}

id createTexturesFromCVPixelBufferWithCommandBuffer(__CVBuffer *a1, void *a2, void *a3, uint64_t a4, unint64_t a5)
{
  id v9;
  id v10;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  unint64_t v14;
  unint64_t v15;
  int v16;
  size_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  size_t v23;
  size_t v24;
  size_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  size_t BytesPerRow;
  size_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  BOOL v40;
  id v41;
  char *BaseAddress;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  size_t extraRowsOnBottom;
  size_t extraRowsOnTop;
  size_t extraColumnsOnLeft;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  size_t extraColumnsOnRight[4];

  v9 = a2;
  v10 = a3;
  if (a1)
  {
    Width = CVPixelBufferGetWidth(a1);
    Height = CVPixelBufferGetHeight(a1);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
    v14 = a5 >> (PixelFormatType == 843264104);
    if (PixelFormatType == 843264104)
      a4 = 2;
    v15 = Height / v14;
    if (v15 < 0x80 || Width < 0x80 || v14 >= 0x81)
    {
      v53 = v9;
      v21 = v9;
      v52 = v10;
      v22 = v10;
      v23 = CVPixelBufferGetWidth(a1);
      v24 = CVPixelBufferGetHeight(a1);
      v25 = v24 / v14;
      v26 = v23;
      v27 = v22;
      createTextures(v21, v26, v24 / v14, a4, v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
      v30 = BytesPerRow * v25;
      v50 = v21;
      v51 = v28;
      v49 = v27;
      if (v27)
      {
        v31 = v28;
        v32 = v21;
        objc_msgSend(v27, "blitCommandEncoder");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v32;
        v34 = (void *)objc_msgSend(v32, "newBufferWithIOSurface:", CVPixelBufferGetIOSurface(a1));
        v35 = objc_msgSend(v31, "width");
        v36 = objc_msgSend(v31, "height");
        if (objc_msgSend(v31, "arrayLength"))
        {
          v37 = 0;
          v38 = 0;
          v39 = 1;
          do
          {
            extraColumnsOnLeft = 0;
            v57 = 0;
            v58 = 0;
            extraColumnsOnRight[0] = v35;
            extraColumnsOnRight[1] = v36;
            extraColumnsOnRight[2] = 1;
            objc_msgSend(v33, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v34, v38, BytesPerRow, v30, extraColumnsOnRight, v31, v37, 0, &extraColumnsOnLeft);
            v38 += v30;
            v37 = v39;
            v40 = objc_msgSend(v31, "arrayLength") > (unint64_t)v39++;
          }
          while (v40);
        }
        objc_msgSend(v33, "endEncoding");

      }
      else
      {
        v41 = v28;
        CVPixelBufferLockBaseAddress(a1, 1uLL);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        v43 = objc_msgSend(v41, "width");
        v44 = objc_msgSend(v41, "height");
        if (objc_msgSend(v41, "arrayLength"))
        {
          v45 = 0;
          v46 = 1;
          do
          {
            extraColumnsOnLeft = 0;
            v57 = 0;
            v58 = 0;
            v59 = v43;
            v60 = v44;
            v61 = 1;
            objc_msgSend(v41, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &extraColumnsOnLeft, 0, v45, &BaseAddress[v45 * v30], BytesPerRow, v30);
            v45 = v46;
            v40 = objc_msgSend(v41, "arrayLength") > (unint64_t)v46++;
          }
          while (v40);
        }
        CVPixelBufferUnlockBaseAddress(a1, 1uLL);

      }
      v10 = v52;
      v9 = v53;
      v18 = v50;
      v20 = v51;
      if (!v51)
        createTexturesFromCVPixelBufferWithCommandBuffer_cold_1();

    }
    else
    {
      v16 = PixelFormatType;
      extraRowsOnTop = 0;
      extraColumnsOnLeft = 0;
      extraColumnsOnRight[0] = 0;
      extraRowsOnBottom = 0;
      CVPixelBufferGetExtendedPixels(a1, &extraColumnsOnLeft, extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
      v17 = CVPixelBufferGetBytesPerRow(a1);
      createTextureDescriptor(Width, v15, a4, v14, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v9, "newBufferWithIOSurface:", CVPixelBufferGetIOSurface(a1));
      v20 = (void *)objc_msgSend(v19, "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", v18, 0, v17, 0);

      if (!v20)
        createTexturesFromCVPixelBufferWithCommandBuffer_cold_2();
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id createTexturesFromCVPixelBuffer(__CVBuffer *a1, void *a2, uint64_t a3, unint64_t a4)
{
  return createTexturesFromCVPixelBufferWithCommandBuffer(a1, a2, 0, a3, a4);
}

void copyTextureToBuffer(void *a1, __CVBuffer *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  size_t BytesPerRow;
  char *BaseAddress;
  uint64_t v8;
  unsigned int v9;
  _QWORD v11[6];

  v3 = a1;
  v4 = objc_msgSend(v3, "width");
  v5 = objc_msgSend(v3, "height");
  BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a2);
  if (objc_msgSend(v3, "arrayLength"))
  {
    v8 = 0;
    v9 = 1;
    do
    {
      memset(v11, 0, 24);
      v11[3] = v4;
      v11[4] = v5;
      v11[5] = 1;
      objc_msgSend(v3, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", BaseAddress, BytesPerRow, BytesPerRow * v5, v11, 0, v8);
      BaseAddress += BytesPerRow * v5;
      v8 = v9;
    }
    while (objc_msgSend(v3, "arrayLength") > (unint64_t)v9++);
  }
  CVPixelBufferUnlockBaseAddress(a2, 0);

}

void copyTextureToBufferWithBlit(void *a1, __CVBuffer *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  size_t BytesPerRow;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v7, "width");
  v11 = objc_msgSend(v7, "height");
  BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  v13 = (void *)objc_msgSend(v8, "newBufferWithIOSurface:", CVPixelBufferGetIOSurface(a2));
  v19 = v9;
  objc_msgSend(v9, "blitCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "arrayLength"))
  {
    v15 = 0;
    v16 = 0;
    v17 = 1;
    do
    {
      memset(v21, 0, sizeof(v21));
      v20[0] = v10;
      v20[1] = v11;
      v20[2] = 1;
      objc_msgSend(v14, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v7, v15, 0, v21, v20, v13, v16, BytesPerRow, BytesPerRow * v11);
      v16 += BytesPerRow * v11;
      v15 = v17;
    }
    while (objc_msgSend(v7, "arrayLength") > (unint64_t)v17++);
  }
  objc_msgSend(v14, "endEncoding");

}

id createYUV420TextureFromCVPixelBuffer(__CVBuffer *a1, void *a2)
{
  id v3;
  OSType v4;
  CFDictionaryRef v5;
  void *v6;
  int v7;
  size_t Width;
  size_t Height;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = equivalentUncompressedPixelFormat(a1);
  v5 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v10 = v4 == 1885745712 || v4 == 1882468912;
  v11 = 505;
  if (v10)
    v11 = 508;
  if (v7 == 8)
    v12 = 500;
  else
    v12 = v11;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v12, Width, Height, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUsage:", 1);
  v14 = (void *)objc_msgSend(v3, "newTextureWithDescriptor:iosurface:plane:", v13, CVPixelBufferGetIOSurface(a1), 0);

  return v14;
}

id createRenderTargetTextureFromCVPixelBuffer(__CVBuffer *a1, void *a2)
{
  id v3;
  size_t Width;
  size_t Height;
  void *v6;
  int v7;
  uint64_t v8;
  int v9;
  void *v10;
  size_t v11;
  size_t v12;
  uint64_t PixelFormatType;
  size_t extraRowsOnBottom;
  size_t extraRowsOnTop;
  size_t extraColumnsOnRight;
  size_t extraColumnsOnLeft;

  v3 = a2;
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  extraColumnsOnRight = 0;
  extraColumnsOnLeft = 0;
  extraRowsOnBottom = 0;
  extraRowsOnTop = 0;
  CVPixelBufferGetExtendedPixels(a1, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTextureType:", 2);
  objc_msgSend(v6, "setWidth:", extraColumnsOnRight + Width);
  objc_msgSend(v6, "setHeight:", extraRowsOnBottom + Height);
  v7 = equivalentUncompressedPixelFormat(a1);
  if ((v7 & 0xFFFFFFEF) == 0x34323066)
  {
    v8 = 500;
    goto LABEL_13;
  }
  if (v7 <= 1885745711)
  {
    if (v7 == 1111970369)
    {
      v8 = 70;
      goto LABEL_13;
    }
    v9 = 1882468912;
    goto LABEL_9;
  }
  v8 = 505;
  if (v7 != 2019963440 && v7 != 2016686640)
  {
    v9 = 1885745712;
LABEL_9:
    if (v7 == v9)
      v8 = 508;
    else
      v8 = 115;
  }
LABEL_13:
  objc_msgSend(v6, "setPixelFormat:", v8);
  objc_msgSend(v6, "setUsage:", 5);
  if (!objc_msgSend(v6, "textureType"))
    NSLog(CFSTR("Failed to cretae texture descriptor\n"));
  v10 = (void *)objc_msgSend(v3, "newTextureWithDescriptor:iosurface:plane:", v6, CVPixelBufferGetIOSurface(a1), 0);

  if (!v10)
  {
    v11 = CVPixelBufferGetWidth(a1);
    v12 = CVPixelBufferGetHeight(a1);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
    NSLog(CFSTR("Error! Faild to create outputTextute. Buffer Size: %ld x %ld, Format: %d"), v11, v12, PixelFormatType);
  }

  return v10;
}

void deserializeLivePhotoMetadata(const __CFData *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v6 = FigLivePhotoMetadataComputeDeserializationSize();
  if ((_DWORD)v6)
  {
    NSLog(CFSTR("FigLivePhotoMetadataComputeDeserializationSize returned error %d"), v6);
    v7 = 0;
  }
  else
  {
    v7 = malloc_type_malloc(0, 0x311F9226uLL);
    if (v7)
    {
      v8 = FigLivePhotoMetadataDeserializeIntoBuffer();
      if (!(_DWORD)v8)
      {
        *a2 = v7;
        goto LABEL_8;
      }
      NSLog(CFSTR("FigLivePhotoMetadataDeserializeIntoBuffer returned error %d"), v8);
    }
    else
    {
      NSLog(CFSTR("Could not allocate live photo metadata"));
    }
  }
  free(v7);
  *a2 = 0;
LABEL_8:
  *a3 = 0;
}

uint64_t getFigLivePhotoMetadataV3(_DWORD *a1)
{
  int32x4_t *v2;

  if (*a1 < 3u)
    return 0;
  v2 = (int32x4_t *)&a1[8 * a1[11]];
  return (uint64_t)&v2[2 * vaddvq_s32(v2[3]) + 4];
}

void saveTensorBufferWithChannelOffset_cold_1()
{
  __assert_rtn("saveTensorBufferWithChannelOffset", "TestUtils.m", 905, "CVPixelBufferGetHeight(buffer) >= (height * channels)");
}

void saveTensorBufferWithChannelOffset_cold_2(const char *a1)
{
  printf("Cannot open file %s\n", a1);
  __assert_rtn("saveTensorBufferWithChannelOffset", "TestUtils.m", 913, "fp");
}

void saveTensorBufferWithChannelOffset_cold_3()
{
  __assert_rtn("saveTensorBufferWithChannelOffset", "TestUtils.m", 904, "CVPixelBufferGetWidth(buffer) == width");
}

void createTexturesFromCVPixelBufferWithCommandBuffer_cold_1()
{
  __assert_rtn("createTexturesFromCVPixelBufferWithCopy", "Utils.m", 257, "texture != nil");
}

void createTexturesFromCVPixelBufferWithCommandBuffer_cold_2()
{
  __assert_rtn("createTexturesFromCVPixelBufferWithCommandBuffer", "Utils.m", 398, "newTexture != nil");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9ED80](allocator, target, *(_QWORD *)&attachmentMode);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

void CMRemoveAllAttachments(CMAttachmentBearerRef target)
{
  MEMORY[0x1E0C9EF10](target);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x1E0C9F0D0](target, theAttachments, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1E0C9F290](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F370](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F388](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1E0C9F390](retstr, time, *(_QWORD *)&multiplier, *(_QWORD *)&divisor);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1E0CA89D0](attachments);
}

CGRect CVImageBufferGetCleanRect(CVImageBufferRef imageBuffer)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CA89D8](imageBuffer);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1E0CA8AE8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B00](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x1E0CA8B10](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1E0CA8B78](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8C08](allocator, *(_QWORD *)&pixelFormat);
}

uint64_t FigLivePhotoMetadataComputeDeserializationSize()
{
  return MEMORY[0x1E0D03AF0]();
}

uint64_t FigLivePhotoMetadataDeserializeIntoBuffer()
{
  return MEMORY[0x1E0D03B00]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1E0D3A1D0]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1E0D3A200]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBC48](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD0]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD8]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1E0D20080]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x1E0D20150]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int system(const char *a1)
{
  return MEMORY[0x1E0C857D8](a1);
}

