@implementation BWColorLookupCache

id __49__BWColorLookupCache_colorLookupTablesForFilter___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BWColorLookupCache)init
{
  BWColorLookupCache *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWColorLookupCache;
  v2 = -[BWColorLookupCache init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.bwgraph.color-lookup-cache", 0);
    v4 = MEMORY[0x1E0C809B0];
    v2->_coreImageCacheIsolationQueue = (OS_dispatch_queue *)v3;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __26__BWColorLookupCache_init__block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = v2;
    dispatch_sync(v3, block);
  }
  return v2;
}

uint64_t __54__BWColorLookupCache_fetchColorLookupTablesForFilter___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

id __26__BWColorLookupCache_init__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

- (id)fetchColorLookupTablesForFilter:(id)a3
{
  uint64_t v5;
  char isKindOfClass;
  char v7;
  char v8;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BWColorLookupCacheEntry *v15;
  NSObject *coreImageCacheIsolationQueue;
  _QWORD v17[7];
  uint64_t v18;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "name");
  NSClassFromString(CFSTR("CIPhotoEffect"));
  isKindOfClass = objc_opt_isKindOfClass();
  NSClassFromString(CFSTR("CIPhotoEffect3D"));
  v7 = objc_opt_isKindOfClass();
  NSClassFromString(CFSTR("CIPortraitEffect"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    NSClassFromString(CFSTR("CIPortraitEffectV2"));
    v8 = objc_opt_isKindOfClass();
  }
  NSClassFromString(CFSTR("CIColorCubeWithColorSpace"));
  v10 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v11 = objc_msgSend(a3, "cubePath");
    v12 = 0;
  }
  else
  {
    if ((v7 & 1) != 0)
    {
      v11 = objc_msgSend(a3, "cubePath");
      v13 = objc_msgSend(a3, "backgroundCubePath");
    }
    else
    {
      if ((v8 & 1) == 0)
      {
        if ((v10 & 1) != 0)
          return -[BWColorLookupCache _colorLookupTablesForColorCubeFilter:]((BWColorLookupCacheEntry *)self, a3);
        v14 = 0;
        v12 = 0;
        v18 = 0;
        goto LABEL_18;
      }
      v11 = objc_msgSend(a3, "previewCubePath");
      v13 = objc_msgSend(a3, "backgroundPreviewCubePath");
    }
    v12 = v13;
  }
  v18 = 0;
  if (v11)
  {
    v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v11, 2, &v18);
    if (!v12)
      goto LABEL_18;
    goto LABEL_17;
  }
  v14 = 0;
  if (v12)
LABEL_17:
    v12 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v12, 2, &v18);
LABEL_18:
  if (v14 | v12)
  {
    v15 = -[BWColorLookupCacheEntry initWithForegroundColorLookupTable:backgroundColorLookupTable:]([BWColorLookupCacheEntry alloc], "initWithForegroundColorLookupTable:backgroundColorLookupTable:", v14, v12);
    coreImageCacheIsolationQueue = self->_coreImageCacheIsolationQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__BWColorLookupCache_fetchColorLookupTablesForFilter___block_invoke;
    v17[3] = &unk_1E491EB90;
    v17[4] = self;
    v17[5] = v15;
    v17[6] = v5;
    dispatch_sync(coreImageCacheIsolationQueue, v17);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)colorLookupTablesForFilter:(id)a3
{
  id v3;
  int isKindOfClass;
  BWColorLookupCacheEntry *v6;
  NSObject *coreImageCacheIsolationQueue;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v3 = a3;
  if (a3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__29;
    v14 = __Block_byref_object_dispose__29;
    v15 = 0;
    NSClassFromString(CFSTR("CIColorCubesMixedWithMask"));
    isKindOfClass = objc_opt_isKindOfClass();
    NSClassFromString(CFSTR("CIColorCubeWithColorSpace"));
    if (((objc_opt_isKindOfClass() | isKindOfClass) & 1) != 0)
    {
      if ((isKindOfClass & 1) != 0)
        v6 = -[BWColorLookupCache _colorLookupTablesForColorCubesWithMaskFilter:]((BWColorLookupCacheEntry *)self, v3);
      else
        v6 = -[BWColorLookupCache _colorLookupTablesForColorCubeFilter:]((BWColorLookupCacheEntry *)self, v3);
    }
    else
    {
      coreImageCacheIsolationQueue = self->_coreImageCacheIsolationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__BWColorLookupCache_colorLookupTablesForFilter___block_invoke;
      block[3] = &unk_1E4921488;
      block[5] = v3;
      block[6] = &v10;
      block[4] = self;
      dispatch_sync(coreImageCacheIsolationQueue, block);
      v6 = (BWColorLookupCacheEntry *)(id)v11[5];
    }
    v3 = v6;
    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

- (id)identityColorLookupTable
{
  if (identityColorLookupTable_onceToken != -1)
    dispatch_once(&identityColorLookupTable_onceToken, &__block_literal_global_84);
  return (id)identityColorLookupTable_identityColorLookupTable;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  NSObject *coreImageCacheIsolationQueue;
  objc_super v4;
  _QWORD block[5];

  coreImageCacheIsolationQueue = self->_coreImageCacheIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BWColorLookupCache_dealloc__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(coreImageCacheIsolationQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)BWColorLookupCache;
  -[BWColorLookupCache dealloc](&v4, sel_dealloc);
}

void __29__BWColorLookupCache_dealloc__block_invoke(uint64_t a1)
{

}

- (BWColorLookupCacheEntry)_colorLookupTablesForColorCubesWithMaskFilter:(BWColorLookupCacheEntry *)result
{
  float v3;

  if (result)
  {
    objc_msgSend(a2, "cubeDimension");
    if (v3 != 32.0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return -[BWColorLookupCacheEntry initWithForegroundColorLookupTable:backgroundColorLookupTable:]([BWColorLookupCacheEntry alloc], "initWithForegroundColorLookupTable:backgroundColorLookupTable:", objc_msgSend(a2, "cube0Data"), objc_msgSend(a2, "cube1Data"));
  }
  return result;
}

- (BWColorLookupCacheEntry)_colorLookupTablesForColorCubeFilter:(BWColorLookupCacheEntry *)result
{
  float v3;

  if (result)
  {
    objc_msgSend(a2, "cubeDimension");
    if (v3 != 32.0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return -[BWColorLookupCacheEntry initWithForegroundColorLookupTable:backgroundColorLookupTable:]([BWColorLookupCacheEntry alloc], "initWithForegroundColorLookupTable:backgroundColorLookupTable:", objc_msgSend(a2, "cubeData"), 0);
  }
  return result;
}

uint64_t __46__BWColorLookupCache_identityColorLookupTable__block_invoke()
{
  char *v0;
  uint64_t v1;
  __int128 v2;
  float64x2_t v3;
  int32x4_t v9;
  char *v10;
  uint64_t v11;
  int8x16_t v12;
  char *v13;
  uint64_t v14;
  int8x16_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  int8x16_t v28;
  char *v29;
  uint64_t result;

  v0 = (char *)malloc_type_malloc(0x20000uLL, 0x6E5A3F69uLL);
  v1 = 0;
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  v3 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
  __asm { FMOV            V19.2D, #31.0 }
  v9.i64[0] = 0x1000000010;
  v9.i64[1] = 0x1000000010;
  v10 = v0;
  do
  {
    v11 = 0;
    v12 = vdupq_n_s8(llround((double)(int)v1 * 255.0 / 31.0));
    v13 = v10;
    do
    {
      v14 = 0;
      v15 = vdupq_n_s8(llround((double)(int)v11 * 255.0 / 31.0));
      v16 = (int32x4_t)xmmword_1A3161E00;
      v17 = (int32x4_t)xmmword_1A32B1440;
      v18 = (int32x4_t)xmmword_1A32B1450;
      v19 = (int32x4_t)xmmword_1A32B19F0;
      do
      {
        v20.i64[0] = v16.i32[2];
        v20.i64[1] = v16.i32[3];
        v21 = vcvtq_f64_s64(v20);
        v20.i64[0] = v16.i32[0];
        v20.i64[1] = v16.i32[1];
        v22 = vcvtq_f64_s64(v20);
        v20.i64[0] = v17.i32[2];
        v20.i64[1] = v17.i32[3];
        v23 = vcvtq_f64_s64(v20);
        v20.i64[0] = v17.i32[0];
        v20.i64[1] = v17.i32[1];
        v24 = vcvtq_f64_s64(v20);
        v20.i64[0] = v18.i32[2];
        v20.i64[1] = v18.i32[3];
        v25 = vcvtq_f64_s64(v20);
        v20.i64[0] = v18.i32[0];
        v20.i64[1] = v18.i32[1];
        v26 = vcvtq_f64_s64(v20);
        v20.i64[0] = v19.i32[2];
        v20.i64[1] = v19.i32[3];
        v27 = vcvtq_f64_s64(v20);
        v20.i64[0] = v19.i32[0];
        v20.i64[1] = v19.i32[1];
        *(int16x4_t *)&v21.f64[0] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v22, v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v21, v3), _Q19)))));
        *(int16x4_t *)&v21.f64[1] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v24, v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v23, v3), _Q19)))));
        *(int16x4_t *)&v22.f64[0] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v26, v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v25, v3), _Q19)))));
        *(int16x4_t *)&v22.f64[1] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(vcvtq_f64_s64(v20), v3), _Q19)))), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vdivq_f64(vmulq_f64(v27, v3), _Q19)))));
        v28 = vuzp1q_s8((int8x16_t)v21, (int8x16_t)v22);
        v29 = &v13[v14];
        vst4q_s8(v29, *(int8x16x4_t *)(&v2 - 3));
        v16 = vaddq_s32(v16, v9);
        v17 = vaddq_s32(v17, v9);
        v18 = vaddq_s32(v18, v9);
        v19 = vaddq_s32(v19, v9);
        v14 += 64;
      }
      while (v14 != 128);
      ++v11;
      v13 += 128;
    }
    while (v11 != 32);
    ++v1;
    v10 += 4096;
  }
  while (v1 != 32);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v0, 0x20000, 1);
  identityColorLookupTable_identityColorLookupTable = result;
  return result;
}

- (id)blackColorLookupTable
{
  if (blackColorLookupTable_onceToken != -1)
    dispatch_once(&blackColorLookupTable_onceToken, &__block_literal_global_24);
  return (id)blackColorLookupTable_identityColorLookupTable;
}

uint64_t __43__BWColorLookupCache_blackColorLookupTable__block_invoke()
{
  char *v0;
  uint64_t v1;
  __int128 v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t i;
  char *v7;
  uint64_t result;

  v0 = (char *)malloc_type_malloc(0x20000uLL, 0x93E8BCEuLL);
  v1 = 0;
  *(_QWORD *)&v2 = 0xFF000000FF000000;
  *((_QWORD *)&v2 + 1) = 0xFF000000FF000000;
  v3 = v0;
  do
  {
    v4 = 0;
    v5 = v3;
    do
    {
      for (i = 0; i != 128; i += 64)
      {
        v7 = &v5[i];
        *((_OWORD *)v7 + 2) = v2;
        *((_OWORD *)v7 + 3) = v2;
        *(_OWORD *)v7 = v2;
        *((_OWORD *)v7 + 1) = v2;
      }
      ++v4;
      v5 += 128;
    }
    while (v4 != 32);
    ++v1;
    v3 += 4096;
  }
  while (v1 != 32);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v0, 0x20000, 1);
  blackColorLookupTable_identityColorLookupTable = result;
  return result;
}

- (id)whiteColorLookupTable
{
  if (whiteColorLookupTable_onceToken != -1)
    dispatch_once(&whiteColorLookupTable_onceToken, &__block_literal_global_25);
  return (id)whiteColorLookupTable_identityColorLookupTable;
}

uint64_t __43__BWColorLookupCache_whiteColorLookupTable__block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = malloc_type_malloc(0x20000uLL, 0x511EF02BuLL);
  memset(v0, 255, 0x20000uLL);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v0, 0x20000, 1);
  whiteColorLookupTable_identityColorLookupTable = result;
  return result;
}

- (id)interpolatedColorLookupTableFromTable:(id)a3 toTable:(id)a4 fractionComplete:(float)a5
{
  unint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  size_t v11;
  _BYTE *v12;
  double v13;
  _BYTE *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  float v19;
  _BYTE *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;

  if (!a3 || !a4)
    return 0;
  v8 = (unint64_t)cbrt((double)((unint64_t)objc_msgSend(a3, "length") >> 2));
  if (v8 != (unint64_t)cbrt((double)((unint64_t)objc_msgSend(a4, "length") >> 2)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v9 = (unsigned __int8 *)objc_msgSend(a3, "bytes");
  v10 = (unsigned __int8 *)objc_msgSend(a4, "bytes");
  v11 = 4 * v8 * v8 * v8;
  v12 = malloc_type_malloc(v11, 0xF60A403AuLL);
  *(float *)&v13 = 1.0 - a5;
  if (a5 <= 1.0)
  {
    if (v11)
    {
      v20 = v12;
      v21 = 4 * v8 * v8 * v8;
      do
      {
        v23 = *v9++;
        v22 = v23;
        v24 = *v10++;
        *v20++ = llroundf((float)((float)v24 * a5) + (float)((float)v22 * *(float *)&v13));
        --v21;
      }
      while (v21);
    }
  }
  else if (v11)
  {
    v14 = v12;
    v15 = 4 * v8 * v8 * v8;
    do
    {
      v17 = *v10++;
      v16 = v17;
      v18 = *v9++;
      v19 = roundf((float)((float)v16 * a5) + (float)((float)v18 * *(float *)&v13));
      if (v19 > 255.0)
        v19 = 255.0;
      if (v19 < 0.0)
        v19 = 0.0;
      *v14++ = (int)v19;
      --v15;
    }
    while (v15);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v11, 1, v13);
}

@end
