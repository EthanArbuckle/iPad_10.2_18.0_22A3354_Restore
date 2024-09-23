@implementation HDRImageConverter

+ (id)imageConverterWithOptions:(id)a3
{
  id v3;
  void *v4;
  char v5;
  HDRImageConverter_SIMD *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCGDisableMetal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0 || IIORestrictedDecodingEnabledFlag())
  {
    LogWarning("+[HDRImageConverter imageConverterWithOptions:]", 35, "☀️ Metal disabled, will use SIMD for image conversion");
LABEL_4:
    v6 = objc_alloc_init(HDRImageConverter_SIMD);
    goto LABEL_5;
  }
  v6 = objc_alloc_init(HDRImageConverter_Metal);
  if (!v6)
  {
    LogError("+[HDRImageConverter imageConverterWithOptions:]", 40, "☀️ Failed to initialize Metal converter, falling back to SIMD for image conversion (slow)");
    goto LABEL_4;
  }
LABEL_5:
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    -[HDRImageConverter_SIMD description](v6, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ImageIOLog("☀️ Using converter: %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

  }
  return v6;
}

- (BOOL)convertImage:(id)a3 toImage:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  const char *v20;
  id v21;
  void *v22;
  BOOL v23;
  double v24;
  float v25;
  double v26;
  float v27;
  uint64_t v28;
  BOOL v29;
  const char *v30;
  id v31;
  const char *v32;
  id v33;
  BOOL v34;
  id v36;
  HDRImageConverter *v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "headroom");
  v9 = v8;
  objc_msgSend(v7, "headroom");
  v11 = fmin(v9, v10);
  v12 = v11;
  *(float *)&v11 = v12;
  objc_msgSend(v7, "outputTransformFromEDR:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v37 = self;
    if ((objc_msgSend(v13, "flags") & 1) != 0)
    {
      if ((objc_msgSend(v14, "flags") & 2) != 0)
        v25 = 1.0;
      else
        v25 = v12;
      *(float *)&v24 = v25;
      objc_msgSend(v6, "inputTransformToEDR:", v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "flags") & 2) != 0)
        v27 = v12;
      else
        v27 = 1.0;
      *(float *)&v26 = v27;
      objc_msgSend(v6, "inputTransformToEDR:", v26);
      v28 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v28;
      if (v17)
        v29 = v28 == 0;
      else
        v29 = 1;
      v18 = !v29;
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        objc_msgSend(v17, "description");
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v30 = (const char *)objc_msgSend(v36, "UTF8String");
        objc_msgSend(v22, "description");
        v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v32 = (const char *)objc_msgSend(v31, "UTF8String");
        objc_msgSend(v14, "description");
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        ImageIOLog("☀️ HDRImageConverter::convertImageToImage SRC x ALT => DST\nSRC[EDR=%g] => %s\nALT[EDR=%g] => %s\nDST[EDR=%g] => %s", v25, v30, v27, v32, v12, (const char *)objc_msgSend(v33, "UTF8String"));

        if (v18)
          goto LABEL_24;
LABEL_21:
        v23 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      *(float *)&v15 = v12;
      objc_msgSend(v6, "inputTransformToEDR:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = v16 != 0;
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        objc_msgSend(v16, "description");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = (const char *)objc_msgSend(v19, "UTF8String");
        objc_msgSend(v14, "description");
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        ImageIOLog("☀️ HDRImageConverter::convertImageToImage SRC => DST\nSRC[EDR=%g] => %s\nDST[EDR=%g] => %s", v12, v20, v12, (const char *)objc_msgSend(v21, "UTF8String"));

        v22 = 0;
        if (!v17)
        {
          v23 = 0;
          v17 = 0;
LABEL_33:

          goto LABEL_34;
        }
LABEL_24:
        if ((objc_msgSend(v14, "flags") & 1) != 0)
        {
          if ((objc_msgSend(v17, "flags") & 1) != 0 || (objc_msgSend(v22, "flags") & 1) != 0)
            v34 = -[HDRImageConverter convertImage:transform:alternate:gainMap:transform:alternate:toImage:transform:gainMap:transform:](v37, "convertImage:transform:alternate:gainMap:transform:alternate:toImage:transform:gainMap:transform:", objc_msgSend(v6, "imageBuffer"), objc_msgSend(v17, "image"), objc_msgSend(v22, "image"), objc_msgSend(v6, "gainMapBuffer"), objc_msgSend(v17, "gainMap"), objc_msgSend(v22, "gainMap"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"), objc_msgSend(v7, "gainMapBuffer"), objc_msgSend(v14, "gainMap"));
          else
            v34 = -[HDRImageConverter convertImage:transform:alternate:toImage:transform:gainMap:transform:](v37, "convertImage:transform:alternate:toImage:transform:gainMap:transform:", objc_msgSend(v6, "imageBuffer"), objc_msgSend(v17, "image"), objc_msgSend(v22, "image"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"), objc_msgSend(v7, "gainMapBuffer"), objc_msgSend(v14, "gainMap"));
        }
        else if ((objc_msgSend(v17, "flags") & 1) != 0)
        {
          v34 = -[HDRImageConverter convertImage:transform:gainMap:transform:toImage:transform:](v37, "convertImage:transform:gainMap:transform:toImage:transform:", objc_msgSend(v6, "imageBuffer"), objc_msgSend(v17, "image"), objc_msgSend(v6, "gainMapBuffer"), objc_msgSend(v17, "gainMap"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"));
        }
        else
        {
          v34 = -[HDRImageConverter convertImage:transform:toImage:transform:](v37, "convertImage:transform:toImage:transform:", objc_msgSend(v6, "imageBuffer"), objc_msgSend(v17, "image"), objc_msgSend(v7, "imageBuffer"), objc_msgSend(v14, "image"));
        }
        v23 = v34;
        goto LABEL_33;
      }
      v22 = 0;
    }
    if (v18)
      goto LABEL_24;
    goto LABEL_21;
  }
  v23 = 0;
LABEL_34:

  return v23;
}

- (id)generateToneMappingCurveForImage:(id)a3 targetHeadroom:(double)a4
{
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  float v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  id v41;
  void *v42;
  _BYTE v43[4104];

  v4 = MEMORY[0x1E0C80A78](self, a2);
  v6 = v5;
  v7 = (void *)v4;
  v41 = v8;
  objc_msgSend(v41, "headroom");
  v10 = fmin(v9 + -0.000000999999997, v6);
  v11 = v10;
  *(float *)&v10 = v11;
  objc_msgSend(v41, "inputTransformToEDR:", v10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    objc_msgSend(v42, "description");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    ImageIOLog("☀️ HDRImageConverter::generateToneMappingCurve SRC => GTC\nSRC[EDR=%g] => %s", v11, (const char *)objc_msgSend(v12, "UTF8String"));

  }
  if (!v42)
    goto LABEL_18;
  if ((objc_msgSend(v42, "flags") & 1) == 0)
  {
    objc_msgSend(v41, "description");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 118, "Missing gain map: %s", (const char *)objc_msgSend(v13, "UTF8String"));

LABEL_18:
    v38 = 0;
    goto LABEL_19;
  }
  bzero(v43, 0x1000uLL);
  v14 = objc_msgSend(v41, "imageBuffer");
  v15 = objc_msgSend(v42, "image");
  v16 = objc_msgSend(v41, "gainMapBuffer");
  v17 = objc_msgSend(v42, "gainMap");
  __asm { FMOV            V0.2S, #1.0 }
  *(float *)&_D0 = 1.0 / v11;
  if ((objc_msgSend(v7, "computeLumaGainHistogram:scale:image:transform:gainMap:transform:", v43, v14, v15, v16, v17, _D0) & 1) == 0)
  {
    LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 130, "Failed to compute luma-gain histogram");
    goto LABEL_18;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
  v24 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v25 = 1;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v26);

    v25 = (v25 + 1);
  }
  while ((_DWORD)v25 != 33);
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendFormat:", CFSTR("lxg,%@\n"), v27);

  v28 = 0;
  v29 = v43;
  do
  {
    objc_msgSend(v23, "removeAllObjects");
    for (i = 0; i != 128; i += 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), *(unsigned int *)&v29[i]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v31);

    }
    objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("%d,%@\n"), ++v28, v32);

    v29 += 128;
  }
  while (v28 != 32);
  v33 = objc_retainAutorelease(v24);
  _cg_jpeg_mem_term("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 149, "Luma-Gain Histogram Data: (32x32)\n%s", (const char *)objc_msgSend(v33, "UTF8String"));
  objc_msgSend((id)objc_opt_class(), "computeToneMappingCurveFromLumaGainHistogram:", v43);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)objc_msgSend((id)objc_opt_class(), "createUUIDFromLumaGainHistogram:", v43);
    if (v35)
    {
      *(float *)&v36 = v6;
      objc_msgSend(v41, "flexGTCInfoWithCurveData:headroom:identifier:", v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
        v39 = v37;
      else
        LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 168, "Failed to compute tone mapping curve from luma gain histogram");

    }
    else
    {
      LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 161, "Failed to compute tone mapping curve from luma gain histogram");
      v38 = 0;
    }

  }
  else
  {
    LogError("-[HDRImageConverter generateToneMappingCurveForImage:targetHeadroom:]", 155, "Failed to compute tone mapping curve from luma gain histogram");
    v38 = 0;
  }

LABEL_19:
  return v38;
}

- (BOOL)canProcessPixelBufferWithAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVImageBufferCGColorSpaceKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 179, "Missing color space attribute: %s", (const char *)objc_msgSend(v6, "UTF8String"));
    goto LABEL_38;
  }
  if (CGColorSpaceUsesITUR_2100TF((CGColorSpaceRef)v5))
  {
    if (!CGColorSpaceIsPQBased((CGColorSpaceRef)v5) && !CGColorSpaceIsHLGBased((CGColorSpaceRef)v5))
    {
      objc_msgSend(v5, "description");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 186, "Unsupported HDR color space: %s", (const char *)objc_msgSend(v6, "UTF8String"));
LABEL_38:
      v9 = 0;
      goto LABEL_39;
    }
  }
  else if (!+[HDRImage supportsSourceColorSpace:](HDRImage, "supportsSourceColorSpace:", v5))
  {
    objc_msgSend(v5, "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 192, "Unsupported SDR color space: %s", (const char *)objc_msgSend(v6, "UTF8String"));
    goto LABEL_38;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCVPixelBufferPixelFormatTypeKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (!v7)
  {
    objc_msgSend(v4, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 200, "Missing pixel format attribute: %s", (const char *)objc_msgSend(v10, "UTF8String"));

    goto LABEL_38;
  }
  v8 = objc_msgSend(v7, "unsignedIntValue");
  if (!-[HDRImageConverter isPixelFormatSupported:](self, "isPixelFormatSupported:", v8))
  {
    v11 = (int)v8 >> 24;
    v12 = MEMORY[0x1E0C80978];
    if ((v8 & 0x80000000) != 0)
      v13 = __maskrune((int)v8 >> 24, 0x40000uLL);
    else
      v13 = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v11 + 60) & 0x40000;
    if (v13)
      v14 = v11;
    else
      v14 = 46;
    v15 = (int)((_DWORD)v8 << 8) >> 24;
    if ((((_DWORD)v8 << 8) & 0x80000000) != 0)
      v16 = __maskrune((int)((_DWORD)v8 << 8) >> 24, 0x40000uLL);
    else
      v16 = *(_DWORD *)(v12 + 4 * v15 + 60) & 0x40000;
    if (v16)
      v17 = v15;
    else
      v17 = 46;
    v18 = (__int16)v8 >> 8;
    if ((((_DWORD)v8 << 16) & 0x80000000) != 0)
      v19 = __maskrune((__int16)v8 >> 8, 0x40000uLL);
    else
      v19 = *(_DWORD *)(v12 + 4 * v18 + 60) & 0x40000;
    if ((_DWORD)v8 << 24 <= 0x7F000000u)
      v20 = *(_DWORD *)(v12 + 4 * (char)v8 + 60) & 0x40000;
    else
      v20 = __maskrune((char)v8, 0x40000uLL);
    if (v19)
      v21 = v18;
    else
      v21 = 46;
    if (v20)
      v22 = (char)v8;
    else
      v22 = 46;
    LogError("-[HDRImageConverter canProcessPixelBufferWithAttributes:]", 206, "Unsupported pixel format: '%c%c%c%c'", v14, v17, v21, v22);
    goto LABEL_38;
  }
  v9 = 1;
LABEL_39:

  return v9;
}

- (BOOL)isPixelFormatSupported:(unsigned int)a3
{
  return 0;
}

- (BOOL)isYCCMatrixSupported:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_601_4) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_709_2) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_2020);
  }

  return v4;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 toImage:(__CVBuffer *)a5 transform:(id *)a6
{
  LogError("-[HDRImageConverter convertImage:transform:toImage:transform:]", 232, "conversion not implemented", a4, a5, a6);
  return 0;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 gainMap:(__CVBuffer *)a5 transform:(id *)a6 toImage:(__CVBuffer *)a7 transform:(id *)a8
{
  LogError("-[HDRImageConverter convertImage:transform:gainMap:transform:toImage:transform:]", 237, "conversion not implemented", a4, a5, a6, a7, a8);
  return 0;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 toImage:(__CVBuffer *)a6 transform:(id *)a7 gainMap:(__CVBuffer *)a8 transform:(id *)a9
{
  LogError("-[HDRImageConverter convertImage:transform:alternate:toImage:transform:gainMap:transform:]", 242, "conversion not implemented", a4, a5, a6, a7, a8);
  return 0;
}

- (BOOL)convertImage:(__CVBuffer *)a3 transform:(id *)a4 alternate:(id *)a5 gainMap:(__CVBuffer *)a6 transform:(id *)a7 alternate:(id *)a8 toImage:(__CVBuffer *)a9 transform:(id *)a10 gainMap:(__CVBuffer *)a11 transform:(id *)a12
{
  LogError("-[HDRImageConverter convertImage:transform:alternate:gainMap:transform:alternate:toImage:transform:gainMap:transform:]", 247, "conversion not implemented", a4, a5, a6, a7, a8);
  return 0;
}

- (BOOL)computeLumaGainHistogram:(id *)a3 scale:(__CVBuffer *)a4 image:(id *)a5 transform:(__CVBuffer *)a6 gainMap:(id *)a7 transform:
{
  LogError("-[HDRImageConverter computeLumaGainHistogram:scale:image:transform:gainMap:transform:]", 255, "conversion not implemented", a4, a5, a6, a7);
  return 0;
}

+ (id)computeToneMappingCurveFromLumaGainHistogram:(id *)a3
{
  uint64_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  const $1FF2F8D2599020761ACEFF31D93EEB84 *v8;
  uint64_t v9;
  int32x4_t v10;
  int32x4_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  int32x4_t v15;
  float32x4_t v16;
  uint64_t v17;
  float32x4_t v18;
  float v19;
  int32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  _DWORD *v23;
  unsigned int *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint64_t v30;
  float *v31;
  uint64_t v32;
  float *v33;
  id v34;
  double v35;
  uint64_t v36;
  _DWORD *v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  int v48;
  _QWORD v49[3];
  _BYTE v50[8];
  _BYTE v51[888];
  _DWORD v52[2];
  _QWORD v53[561];

  v53[559] = *MEMORY[0x1E0C80C00];
  bzero(v52, 0x1180uLL);
  v4 = 0;
  v5.i64[0] = 0x3F0000003F000000;
  v5.i64[1] = 0x3F0000003F000000;
  v6.i64[0] = 0x3D0000003D000000;
  v6.i64[1] = 0x3D0000003D000000;
  v7.i64[0] = 0x400000004;
  v7.i64[1] = 0x400000004;
  v8 = a3;
  do
  {
    v9 = 0;
    v10 = 0uLL;
    do
    {
      v11 = *(int32x4_t *)&v8->var0[0][v9];
      v10 = vaddq_s32(v11, v10);
      v9 += 4;
    }
    while (v9 != 32);
    v12 = 0;
    v13 = vaddvq_s32(v10);
    v52[35 * v4] = v13;
    v14 = v13;
    v11.i32[0] = 0;
    v15 = (int32x4_t)xmmword_18820BF90;
    do
    {
      v16 = vmulq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v15), v5), v6), vcvtq_f32_u32(*(uint32x4_t *)&v8->var0[0][v12]));
      *(float *)v11.i32 = (float)((float)((float)(*(float *)v11.i32 + v16.f32[0]) + v16.f32[1]) + v16.f32[2])
                        + v16.f32[3];
      v15 = vaddq_s32(v15, v7);
      v12 += 4;
    }
    while (v12 != 32);
    v17 = 0;
    *(float *)v11.i32 = *(float *)v11.i32 / (float)v14;
    v52[35 * v4 + 1] = v11.i32[0];
    v18 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.i8, 0);
    v19 = 0.0;
    v20 = (int32x4_t)xmmword_18820BF90;
    do
    {
      v21 = vsubq_f32(vmulq_f32(vaddq_f32(vcvtq_f32_s32(v20), v5), v6), v18);
      v22 = vmulq_f32(vmulq_f32(v21, vcvtq_f32_u32(*(uint32x4_t *)&v8->var0[0][v17])), v21);
      v19 = (float)((float)((float)(v19 + v22.f32[0]) + v22.f32[1]) + v22.f32[2]) + v22.f32[3];
      v20 = vaddq_s32(v20, v7);
      v17 += 4;
    }
    while (v17 != 32);
    v23 = &v52[35 * v4];
    *((float *)v23 + 2) = sqrtf(v19 / (float)v14);
    v24 = a3->var0[v4];
    v25 = *((_OWORD *)v24 + 5);
    *(_OWORD *)(v23 + 19) = *((_OWORD *)v24 + 4);
    *(_OWORD *)(v23 + 23) = v25;
    v26 = *((_OWORD *)v24 + 7);
    *(_OWORD *)(v23 + 27) = *((_OWORD *)v24 + 6);
    *(_OWORD *)(v23 + 31) = v26;
    v27 = *((_OWORD *)v24 + 1);
    *(_OWORD *)(v23 + 3) = *(_OWORD *)v24;
    *(_OWORD *)(v23 + 7) = v27;
    v28 = *((_OWORD *)v24 + 3);
    *(_OWORD *)(v23 + 11) = *((_OWORD *)v24 + 2);
    *(_OWORD *)(v23 + 15) = v28;
    ++v4;
    v8 = (const $1FF2F8D2599020761ACEFF31D93EEB84 *)((char *)v8 + 128);
  }
  while (v4 != 32);
  if (HDRFlexGTC_fillGaps((uint64_t)v52, 0x424800003C03126FLL, 1))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v29, "appendString:", CFSTR("Bin,N,gM,gSD\n"));
    v30 = 0;
    v31 = (float *)v53;
    do
    {
      objc_msgSend(v29, "appendFormat:", CFSTR("%d,%u,%f,%f\n"), v30, *((unsigned int *)v31 - 2), *(v31 - 1), *v31);
      v31 += 35;
      ++v30;
    }
    while (v30 != 32);
    v46 = objc_retainAutorelease(v29);
    _cg_jpeg_mem_term("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 312, "Luma-Gain Bins Data: (32x32)\n%s", (const char *)objc_msgSend(v46, "UTF8String"));
    bzero(v50, 0x380uLL);
    v48 = 0;
    HDRFlexGTC_curveFit((uint64_t)v52, 0x424800003C03126FLL, 1, (uint64_t)v50, &v48);
    if (v48)
    {
      v47 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      objc_msgSend(v47, "appendString:", CFSTR("cubic,x,y,slope\n"));
      if (v48 >= 1)
      {
        v32 = 0;
        v33 = (float *)v51;
        do
        {
          objc_msgSend(v47, "appendFormat:", CFSTR("%d,%f,%f,%f\n"), v32++, *(v33 - 2), *(v33 - 1), *v33);
          v33 += 7;
        }
        while (v32 < v48);
      }
      v45 = objc_retainAutorelease(v47);
      _cg_jpeg_mem_term("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 329, "Luma-Gain Cubic Points: \n%s", (const char *)objc_msgSend(v45, "UTF8String"));
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v48 >= 1)
      {
        v36 = 0;
        v37 = v51;
        do
        {
          LODWORD(v35) = *(v37 - 2);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = v38;
          LODWORD(v39) = *(v37 - 1);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v49[1] = v40;
          LODWORD(v41) = *v37;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v49[2] = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v43);

          ++v36;
          v37 += 7;
        }
        while (v36 < v48);
      }

    }
    else
    {
      LogError("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 319, "Failed to fit curve");
      v34 = 0;
    }

    return v34;
  }
  else
  {
    LogError("+[HDRImageConverter computeToneMappingCurveFromLumaGainHistogram:]", 301, "Failed to fill gaps");
    return 0;
  }
}

+ (__CFUUID)createUUIDFromLumaGainHistogram:(id *)a3
{
  CFUUIDBytes v4;

  CGGetMD5DigestOfBytes();
  *(_QWORD *)&v4.byte0 = 0;
  *(_QWORD *)&v4.byte8 = 0;
  return CFUUIDCreateFromUUIDBytes(0, v4);
}

+ (id)flexGTCTableDataFromCurveArray:(id)a3 min:(float)a4 max:(float)a5
{
  id v6;
  id v7;
  id v8;
  int v9;
  char *v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  char v22;
  int v23;
  id v24;
  uint64_t v26;
  float v27;
  uint64_t v28;
  int32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  uint64_t v33;
  id v34;
  int v36;
  float *v37;
  float v38;
  int32x2_t v39;
  float v40;

  v39 = *(int32x2_t *)&a4;
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2 && (unint64_t)objc_msgSend(v6, "count") < 0x21)
  {
    v9 = objc_msgSend(v6, "count");
    v10 = (char *)malloc_type_calloc(v9, 0x1CuLL, 0x100004027586B93uLL);
    v11 = (float *)v10;
    if (v9 < 1)
    {
LABEL_17:
      v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4096));
      v26 = objc_msgSend(v8, "mutableBytes");
      HDRFlexGTC_fillTable(v11, v9, v26, 1024, v27);
      v28 = 0;
      *(float *)v29.i32 = a5 - *(float *)v39.i32;
      v30 = (float32x2_t)vdup_lane_s32(v29, 0);
      v31 = (float32x2_t)vdup_lane_s32(v39, 0);
      do
      {
        v32 = vmla_f32(v31, *(float32x2_t *)(v26 + v28), v30);
        v38 = v32.f32[0];
        v40 = exp2f(v32.f32[1]);
        *(float *)&v33 = exp2f(v38);
        *((float *)&v33 + 1) = v40;
        *(_QWORD *)(v26 + v28) = v33;
        v28 += 8;
      }
      while (v28 != 4096);
    }
    else
    {
      v12 = 0;
      v36 = v9;
      v37 = (float *)v10;
      v13 = v9 - 1;
      v14 = v10 + 8;
      v15 = 1;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v16, "count") != 3)
        {
          objc_msgSend(v16, "description");
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          LogError("+[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:]", 379, "Invalid GTC data: %s", (const char *)objc_msgSend(v34, "UTF8String"));

          v8 = 0;
          v11 = v37;
          goto LABEL_21;
        }
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v17, "floatValue");
          *(v14 - 2) = v20;
          objc_msgSend(v18, "floatValue");
          *(v14 - 1) = v21;
          objc_msgSend(v19, "floatValue");
          v22 = 0;
          *v14 = v23;
        }
        else
        {
          objc_msgSend(v16, "description");
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          LogError("+[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:]", 374, "Invalid GTC data: %s", (const char *)objc_msgSend(v24, "UTF8String"));

          v15 = 0;
          v22 = 1;
        }

        if ((v22 & 1) != 0)
          break;
        v14 += 7;
      }
      while (v13 != v12++);
      v9 = v36;
      v11 = v37;
      if ((v15 & 1) != 0)
        goto LABEL_17;
      v8 = 0;
    }
LABEL_21:
    free(v11);
  }
  else
  {
    objc_msgSend(v6, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRImageConverter flexGTCTableDataFromCurveArray:min:max:]", 354, "Invalid GTC data: %s", (const char *)objc_msgSend(v7, "UTF8String"));

    v8 = 0;
  }

  return v8;
}

void __38__HDRImageConverter_Metal_metalDevice__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "selectMetalDevice");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[HDRImageConverter_Metal metalDevice]::s_device;
  +[HDRImageConverter_Metal metalDevice]::s_device = v1;

}

void __55__HDRImageConverter_Metal_commitAndWaitUntilCompleted___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "status") != 4)
  {
    objc_msgSend(v5, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugDescription");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("-[HDRImageConverter_Metal commitAndWaitUntilCompleted:]_block_invoke", 353, "☀️ CommandBuffer %p failed '%s'", v5, (const char *)objc_msgSend(v4, "UTF8String"));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

@end
