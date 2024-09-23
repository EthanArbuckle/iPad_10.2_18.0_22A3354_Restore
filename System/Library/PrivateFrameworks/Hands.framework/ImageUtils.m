@implementation ImageUtils

+ (__CVBuffer)diffImage:(__CVBuffer *)a3 withAnother:(__CVBuffer *)a4
{
  size_t Width;
  size_t Height;
  uint64_t v8;
  const __CFDictionary *v9;
  size_t v10;
  size_t v11;
  float *BaseAddress;
  float *v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float *v18;
  size_t v19;
  float *v20;
  float *v21;
  float *i;
  float v23;
  float v24;
  float v25;
  void *v26;
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  float *v30;
  size_t v31;
  float *v32;
  unsigned __int8 *v33;
  unsigned __int8 *m;
  unsigned int v35;
  float v36;
  unsigned int v37;
  uint64_t j;
  size_t v39;
  float *k;
  __CVBuffer *v41;
  CVPixelBufferRef pixelBuffer;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = 0;
  v8 = *MEMORY[0x24BDC55D0];
  v44[0] = *MEMORY[0x24BDC5668];
  v44[1] = v8;
  v45[0] = MEMORY[0x24BDBD1B8];
  v45[1] = &unk_250E61E08;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = CVPixelBufferGetWidth(a3);
  v11 = CVPixelBufferGetWidth(a4);
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v11, 0x4C303066u, v9, &pixelBuffer);
  LODWORD(v10) = CVPixelBufferGetPixelFormatType(a3);
  if ((_DWORD)v10 == CVPixelBufferGetPixelFormatType(a4))
  {
    CVPixelBufferLockBaseAddress(a3, 0);
    CVPixelBufferLockBaseAddress(a4, 0);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(pixelBuffer);
    if (CVPixelBufferGetPixelFormatType(a3) == 1278226534)
    {
      v13 = (float *)CVPixelBufferGetBaseAddress(a3);
      v14 = (float *)CVPixelBufferGetBaseAddress(a4);
      if (Height)
      {
        v15 = 0;
        v16 = 4 * Width;
        v17 = 0.0;
        v18 = BaseAddress;
        do
        {
          v19 = Width;
          v20 = v18;
          v21 = v14;
          for (i = v13; v19; --v19)
          {
            v23 = *i++;
            v24 = v23;
            v25 = *v21++;
            *v20++ = v24 - v25;
            v17 = fmaxf(v17, vabds_f32(v24, v25));
          }
          ++v15;
          v13 = (float *)((char *)v13 + v16);
          v14 = (float *)((char *)v14 + v16);
          v18 = (float *)((char *)v18 + v16);
        }
        while (v15 != Height);
LABEL_17:
        for (j = 0; j != Height; ++j)
        {
          v39 = Width;
          for (k = BaseAddress; v39; --v39)
          {
            *k = (float)((float)(*k / v17) * 0.5) + 0.5;
            ++k;
          }
          BaseAddress += Width;
        }
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (CVPixelBufferGetPixelFormatType(a3) == 1278226488)
    {
      v27 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
      v28 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
      if (Height)
      {
        v29 = 0;
        v17 = 0.0;
        v30 = BaseAddress;
        do
        {
          v31 = Width;
          v32 = v30;
          v33 = v28;
          for (m = v27; v31; --v31)
          {
            v35 = *m++;
            v36 = (float)v35;
            v37 = *v33++;
            *v32++ = v36 - (float)v37;
            v17 = fmaxf(v17, vabds_f32(v36, (float)v37));
          }
          ++v29;
          v27 += Width;
          v28 += Width;
          v30 += Width;
        }
        while (v29 != Height);
        goto LABEL_17;
      }
LABEL_21:
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 0);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cant diff these images"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitPipeline"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/ImageUtils.mm"), 82, v26);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cant diiff these images"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitPipeline"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/ImageUtils.mm"), 43, v26);
  }

LABEL_22:
  v41 = pixelBuffer;

  return v41;
}

+ (float)diffImageBetween:(__CVBuffer *)a3 another:(__CVBuffer *)a4
{
  void *BaseAddress;
  void *v7;
  size_t Width;
  float v9;
  float v10;

  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  v7 = CVPixelBufferGetBaseAddress(a4);
  Width = CVPixelBufferGetWidth(a3);
  +[ImageUtils diffImageBetween:another:withWidth:withHeight:](ImageUtils, "diffImageBetween:another:withWidth:withHeight:", BaseAddress, v7, Width, CVPixelBufferGetHeight(a3));
  v10 = v9;
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v10;
}

+ (float)diffImageBetween:(void *)a3 another:(void *)a4 withWidth:(unint64_t)a5 withHeight:(unint64_t)a6
{
  uint64_t v6;
  float v7;
  unint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *i;
  unsigned int v11;
  float v12;
  unsigned int v13;

  if (a6)
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      v8 = a5;
      v9 = (unsigned __int8 *)a3;
      for (i = (unsigned __int8 *)a4; v8; --v8)
      {
        v11 = *i++;
        v12 = (float)v11;
        v13 = *v9++;
        v7 = fabs((float)(v12 - (float)v13) / 255.0) + v7;
      }
      ++v6;
      a4 = (char *)a4 + a5;
      a3 = (char *)a3 + a5;
    }
    while (v6 != a6);
  }
  else
  {
    v7 = 0.0;
  }
  return v7 / (float)(a6 * a5);
}

+ (id)flipCroppedImage:(id)a3 withCropShape:
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  vImage_Buffer dest;
  vImage_Buffer src;

  v8 = v3;
  v4 = a3;
  v5 = objc_retainAutorelease((id)objc_msgSend(v4, "mutableCopy"));
  src.data = (void *)objc_msgSend(v5, "bytes");
  src.height = (unint64_t)*((float *)&v8 + 1);
  src.width = (unint64_t)*(float *)&v8;
  src.rowBytes = vcvts_n_u32_f32(*(float *)&v8, 2uLL);
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", objc_msgSend(v5, "length")));
  dest.data = (void *)objc_msgSend(v6, "mutableBytes");
  dest.height = (unint64_t)*((float *)&v8 + 1);
  dest.width = (unint64_t)*(float *)&v8;
  dest.rowBytes = src.rowBytes;
  vImageHorizontalReflect_PlanarF(&src, &dest, 0);

  return v6;
}

@end
