@implementation HDRFlexRangeParameters

- (HDRFlexRangeParameters)init
{
  HDRFlexRangeParameters *result;
  int32x4_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDRFlexRangeParameters;
  result = -[HDRFlexRangeParameters init](&v9, sel_init);
  result->_version = 1;
  *(_QWORD *)&result->_baseHeadroom = 0x4000000000000000;
  *(_WORD *)&result->_isMono = 257;
  __asm { FMOV            V1.4S, #1.0 }
  *(_OWORD *)result->_channelMinRGB = 0u;
  *(_OWORD *)result->_channelMaxRGB = _Q1;
  v8 = vdupq_n_s32(0x38D1B717u);
  *(_OWORD *)result->_channelGammaRGB = _Q1;
  *(int32x4_t *)result->_channelBaseOffsetRGB = v8;
  *(int32x4_t *)result->_channelAlternateOffsetRGB = v8;
  return result;
}

+ (id)flexRangeParametersFromDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void (**v5)(void *, void *, _QWORD);
  void (**v6)(void *, void *, _QWORD);
  HDRFlexRangeParameters *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  HDRFlexRangeParameters *v13;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_2;
  aBlock[3] = &unk_1E1BBE178;
  v18 = &__block_literal_global;
  v5 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_3;
  v15[3] = &unk_1E1BBE1A0;
  v16 = &__block_literal_global;
  v6 = (void (**)(void *, void *, _QWORD))_Block_copy(v15);
  v7 = objc_alloc_init(HDRFlexRangeParameters);
  *(float *)&v8 = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke((uint64_t)v7, v3);
  *(float *)&v9 = __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke(-[HDRFlexRangeParameters setBaseHeadroom:](v7, "setBaseHeadroom:", v8), v3);
  -[HDRFlexRangeParameters setAlternateHeadroom:](v7, "setAlternateHeadroom:", v9);
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCMPhotoMetadata_TonemapChannelMetadataKeys);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    -[HDRFlexRangeParameters setIsMono:](v7, "setIsMono:", 1);
    v5[2](v5, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin);
    -[HDRFlexRangeParameters setChannelMin:](v7, "setChannelMin:");
    v5[2](v5, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax);
    -[HDRFlexRangeParameters setChannelMax:](v7, "setChannelMax:");
    v5[2](v5, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma);
    -[HDRFlexRangeParameters setChannelGamma:](v7, "setChannelGamma:");
    v5[2](v5, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset);
    -[HDRFlexRangeParameters setChannelBaseOffset:](v7, "setChannelBaseOffset:");
    v5[2](v5, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset);
    -[HDRFlexRangeParameters setChannelAlternateOffset:](v7, "setChannelAlternateOffset:");
  }
  else
  {
    if (objc_msgSend(v10, "count") != 3)
    {
      LogError("+[HDRFlexRangeParameters flexRangeParametersFromDictionary:]", 95, "Invalid FlexRange channel count: %ld", objc_msgSend(v10, "count"));
      v13 = 0;
      goto LABEL_9;
    }
    -[HDRFlexRangeParameters setIsMono:](v7, "setIsMono:", 0);
    v6[2](v6, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin);
    -[HDRFlexRangeParameters setChannelMinRGB:](v7, "setChannelMinRGB:");
    v6[2](v6, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax);
    -[HDRFlexRangeParameters setChannelMaxRGB:](v7, "setChannelMaxRGB:");
    v6[2](v6, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma);
    -[HDRFlexRangeParameters setChannelGammaRGB:](v7, "setChannelGammaRGB:");
    v6[2](v6, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset);
    -[HDRFlexRangeParameters setChannelBaseOffsetRGB:](v7, "setChannelBaseOffsetRGB:");
    v6[2](v6, v10, *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset);
    -[HDRFlexRangeParameters setChannelAlternateOffsetRGB:](v7, "setChannelAlternateOffsetRGB:");
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)gIIO_kCMPhotoMetadata_TonemapBaseColorIsWorkingColor);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = (void *)MEMORY[0x1E0C9AAB0];
  -[HDRFlexRangeParameters setUseBaseColor:](v7, "setUseBaseColor:", objc_msgSend(v11, "BOOLValue"));

  -[HDRFlexRangeParameters setVersion:](v7, "setVersion:", 1);
  v13 = v7;
LABEL_9:

  return v13;
}

float __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  id v10;

  objc_msgSend(a2, "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "count") == 2)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9 = v5 / v8;
  }
  else
  {
    objc_msgSend(v2, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRFlexRangeParameters flexRangeParametersFromDictionary:]_block_invoke", 57, "Invalid FlexRange value: %s", (const char *)objc_msgSend(v10, "UTF8String"));

    v9 = 0.0;
  }

  return v9;
}

float __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  float v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(float (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);

  return v8;
}

__n128 __60__HDRFlexRangeParameters_flexRangeParametersFromDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __n128 result;
  unsigned __int32 v14;
  unsigned __int32 v15;
  unsigned __int32 v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6));

  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6));

  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = COERCE_UNSIGNED_INT64((*(double (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6));

  result.n128_u32[0] = v16;
  result.n128_u32[1] = v15;
  result.n128_u32[2] = v14;
  return result;
}

- (id)createFlexRangeDictionary
{
  uint64_t v3;
  void (**v4)(void *, id, _QWORD);
  void (**v5)(void *, id, _QWORD);
  id v6;
  void *v7;
  uint64_t v8;
  float v9;
  void *v10;
  uint64_t v11;
  float v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_2;
  aBlock[3] = &unk_1E1BBE1E8;
  v33 = &__block_literal_global_30;
  v4 = (void (**)(void *, id, _QWORD))_Block_copy(aBlock);
  v30[0] = v3;
  v30[1] = 3221225472;
  v30[2] = __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_3;
  v30[3] = &unk_1E1BBE210;
  v31 = &__block_literal_global_30;
  v5 = (void (**)(void *, id, _QWORD))_Block_copy(v30);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = *(void **)gIIO_kCMPhotoMetadata_TonemapBaseHDRHeadroom;
  v8 = -[HDRFlexRangeParameters baseHeadroom](self, "baseHeadroom");
  __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke(v9, v8, v6, v7);
  v10 = *(void **)gIIO_kCMPhotoMetadata_TonemapAlternateHDRHeadroom;
  v11 = -[HDRFlexRangeParameters alternateHeadroom](self, "alternateHeadroom");
  __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke(v12, v11, v6, v10);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[HDRFlexRangeParameters isMono](self, "isMono"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "addObject:", v14);

    v15 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin;
    -[HDRFlexRangeParameters channelMin](self, "channelMin");
    v4[2](v4, v13, v15);
    v16 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax;
    -[HDRFlexRangeParameters channelMax](self, "channelMax");
    v4[2](v4, v13, v16);
    v17 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma;
    -[HDRFlexRangeParameters channelGamma](self, "channelGamma");
    v4[2](v4, v13, v17);
    v18 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset;
    -[HDRFlexRangeParameters channelBaseOffset](self, "channelBaseOffset");
    v4[2](v4, v13, v18);
    v19 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset;
    -[HDRFlexRangeParameters channelAlternateOffset](self, "channelAlternateOffset");
    v4[2](v4, v13, v19);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "addObject:", v20);

    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "addObject:", v21);

    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v13, "addObject:", v22);

    v23 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMin;
    -[HDRFlexRangeParameters channelMinRGB](self, "channelMinRGB");
    v5[2](v5, v13, v23);
    v24 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_GainMapMax;
    -[HDRFlexRangeParameters channelMaxRGB](self, "channelMaxRGB");
    v5[2](v5, v13, v24);
    v25 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_Gamma;
    -[HDRFlexRangeParameters channelGammaRGB](self, "channelGammaRGB");
    v5[2](v5, v13, v25);
    v26 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_BaseOffset;
    -[HDRFlexRangeParameters channelBaseOffsetRGB](self, "channelBaseOffsetRGB");
    v5[2](v5, v13, v26);
    v27 = *(_QWORD *)gIIO_kCMPhotoMetadataTonemapChannel_AlternateOffset;
    -[HDRFlexRangeParameters channelAlternateOffsetRGB](self, "channelAlternateOffsetRGB");
    v5[2](v5, v13, v27);
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *(_QWORD *)gIIO_kCMPhotoMetadata_TonemapChannelMetadataKeys);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HDRFlexRangeParameters useBaseColor](self, "useBaseColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, *(_QWORD *)gIIO_kCMPhotoMetadata_TonemapBaseColorIsWorkingColor);

  return v6;
}

void __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke(float a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  float v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  v8 = frexpf(a1, &v19);
  v9 = (int)ldexpf(v8, 24);
  if (v19 >= -7)
    v10 = 24 - v19;
  else
    v10 = 31;
  if (v19 >= -7)
    v11 = 0;
  else
    v11 = -7 - v19;
  LODWORD(v12) = v9 >> v11;
  if (((v9 >> v11) & 1) != 0 || v10 < 1)
  {
    v15 = (_DWORD)v12 << -(char)v10;
    if (v10 >= 0)
    {
      v12 = v12;
    }
    else
    {
      LOBYTE(v10) = 0;
      v12 = v15;
    }
  }
  else
  {
    do
    {
      v13 = v12;
      v12 = ((int)v12 >> 1);
      v14 = v10-- != 0;
    }
    while ((v13 & 2) == 0 && v10 != 0 && v14);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (1 << v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v7);

}

void __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_2(uint64_t a1, void *a2, void *a3, float a4)
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, float))(v7 + 16))(v7, v8, v9, a4);

}

void __51__HDRFlexRangeParameters_createFlexRangeDictionary__block_invoke_3(uint64_t a1, void *a2, void *a3, __n128 a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v14;

  v14 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, __n128))(v7 + 16))(v7, v8, v6, a4);

  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, float))(v9 + 16))(v9, v10, v6, a4.n128_f32[1]);

  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, float))(v11 + 16))(v11, v12, v6, a4.n128_f32[2]);

}

+ (id)flexRangeParametersFromMetadata:(CGImageMetadata *)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t (**v7)(void *, const __CFString *, uint64_t);
  id v8;
  void (**v9)(void *, const __CFString *);
  id v10;
  void *v11;
  void (**v12)(void *, const __CFString *);
  void *v13;
  uint64_t v14;
  HDRFlexRangeParameters *v15;
  void *v16;
  HDRFlexRangeParameters *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  aBlock[4] = a3;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_2;
  v27[3] = &unk_1E1BBE258;
  v4 = _Block_copy(aBlock);
  v28 = v4;
  v5 = _Block_copy(v27);
  v25[0] = v3;
  v25[1] = 3221225472;
  v25[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_3;
  v25[3] = &unk_1E1BBE280;
  v6 = v4;
  v26 = v6;
  v7 = (uint64_t (**)(void *, const __CFString *, uint64_t))_Block_copy(v25);
  v23[0] = v3;
  v23[1] = 3221225472;
  v23[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_4;
  v23[3] = &unk_1E1BBE2A8;
  v8 = v6;
  v24 = v8;
  v9 = (void (**)(void *, const __CFString *))_Block_copy(v23);
  v21[0] = v3;
  v21[1] = 3221225472;
  v21[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_5;
  v21[3] = &unk_1E1BBE2D0;
  v10 = v5;
  v22 = v10;
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_6;
  v19[3] = &unk_1E1BBE2F8;
  v11 = _Block_copy(v21);
  v20 = v11;
  v12 = (void (**)(void *, const __CFString *))_Block_copy(v19);
  (*((void (**)(id, const __CFString *))v8 + 2))(v8, CFSTR("Version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14)
  {
    v15 = objc_alloc_init(HDRFlexRangeParameters);
    -[HDRFlexRangeParameters setVersion:](v15, "setVersion:", v14);
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("BaseHeadroom"));
    -[HDRFlexRangeParameters setBaseHeadroom:](v15, "setBaseHeadroom:");
    (*((void (**)(id, const __CFString *))v10 + 2))(v10, CFSTR("AlternateHeadroom"));
    -[HDRFlexRangeParameters setAlternateHeadroom:](v15, "setAlternateHeadroom:");
    v9[2](v9, CFSTR("ChannelMetadata"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count") == 1)
    {
      -[HDRFlexRangeParameters setIsMono:](v15, "setIsMono:", 1);
      (*((void (**)(void *, const __CFString *, _QWORD))v11 + 2))(v11, CFSTR("GainMapMin"), 0);
      -[HDRFlexRangeParameters setChannelMin:](v15, "setChannelMin:");
      (*((void (**)(void *, const __CFString *, _QWORD))v11 + 2))(v11, CFSTR("GainMapMax"), 0);
      -[HDRFlexRangeParameters setChannelMax:](v15, "setChannelMax:");
      (*((void (**)(void *, const __CFString *, _QWORD))v11 + 2))(v11, CFSTR("Gamma"), 0);
      -[HDRFlexRangeParameters setChannelGamma:](v15, "setChannelGamma:");
      (*((void (**)(void *, const __CFString *, _QWORD))v11 + 2))(v11, CFSTR("BaseOffset"), 0);
      -[HDRFlexRangeParameters setChannelBaseOffset:](v15, "setChannelBaseOffset:");
      (*((void (**)(void *, const __CFString *, _QWORD))v11 + 2))(v11, CFSTR("AlternateOffset"), 0);
      -[HDRFlexRangeParameters setChannelAlternateOffset:](v15, "setChannelAlternateOffset:");
    }
    else
    {
      if (objc_msgSend(v16, "count") != 3)
      {
        LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]", 237, "Invalid FlexRange channel count: %ld", objc_msgSend(v16, "count"));
        v17 = 0;
        goto LABEL_9;
      }
      -[HDRFlexRangeParameters setIsMono:](v15, "setIsMono:", 0);
      v12[2](v12, CFSTR("GainMapMin"));
      -[HDRFlexRangeParameters setChannelMinRGB:](v15, "setChannelMinRGB:");
      v12[2](v12, CFSTR("GainMapMax"));
      -[HDRFlexRangeParameters setChannelMaxRGB:](v15, "setChannelMaxRGB:");
      v12[2](v12, CFSTR("Gamma"));
      -[HDRFlexRangeParameters setChannelGammaRGB:](v15, "setChannelGammaRGB:");
      v12[2](v12, CFSTR("BaseOffset"));
      -[HDRFlexRangeParameters setChannelBaseOffsetRGB:](v15, "setChannelBaseOffsetRGB:");
      v12[2](v12, CFSTR("AlternateOffset"));
      -[HDRFlexRangeParameters setChannelAlternateOffsetRGB:](v15, "setChannelAlternateOffsetRGB:");
    }
    -[HDRFlexRangeParameters setUseBaseColor:](v15, "setUseBaseColor:", v7[2](v7, CFSTR("BaseColorIsWorkingColor"), 1));
    v17 = v15;
LABEL_9:

    goto LABEL_10;
  }
  v17 = 0;
LABEL_10:

  return v17;
}

id __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  CGImageMetadataTag *v4;
  CGImageMetadataTag *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRToneMap"), a2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 32), 0, v3);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)CGImageMetadataTagCopyValue(v4);
  }
  else
  {
    _cg_jpeg_mem_term("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke", 165, "Failed to get metadata tag: %s", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v3), "UTF8String"));
    v6 = 0;
  }

  return v6;
}

float __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  float v6;
  const char *v7;
  id v8;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "floatValue");
    v6 = v5;
  }
  else
  {
    v7 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    objc_msgSend(v4, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke_2", 174, "Invalid '%s' tag value: %s", v7, (const char *)objc_msgSend(v8, "UTF8String"));

    v6 = 0.0;
  }

  return v6;
}

uint64_t __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  const char *v7;
  id v8;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      a3 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      v7 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      objc_msgSend(v6, "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke_3", 185, "Invalid '%s' tag value: %s", v7, (const char *)objc_msgSend(v8, "UTF8String"));

    }
  }

  return a3;
}

id __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    objc_msgSend(v4, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LogError("+[HDRFlexRangeParameters flexRangeParametersFromMetadata:]_block_invoke_4", 193, "Invalid '%s' tag value: %s", v6, (const char *)objc_msgSend(v7, "UTF8String"));

    v5 = 0;
  }

  return v5;
}

float __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  float v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%lu].%@"), CFSTR("ChannelMetadata"), a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(float (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v5;
}

__n128 __58__HDRFlexRangeParameters_flexRangeParametersFromMetadata___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  __n128 result;
  unsigned __int32 v5;
  unsigned __int32 v6;
  unsigned __int32 v7;

  v3 = a2;
  v7 = COERCE_UNSIGNED_INT64((*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
  v6 = COERCE_UNSIGNED_INT64((*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))());
  v5 = COERCE_UNSIGNED_INT64((*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))());

  result.n128_u32[0] = v7;
  result.n128_u32[1] = v6;
  result.n128_u32[2] = v5;
  return result;
}

- (CGImageMetadata)createFlexRangeMetadata
{
  CGMutableImageMetadataRef Mutable;
  uint64_t v4;
  CGImageMetadata *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(void *, const __CFString *, BOOL);
  id v10;
  void (**v11)(void *, const __CFString *, unint64_t);
  id v12;
  void *v13;
  void (**v14)(void *, const __CFString *);
  CGImageMetadata *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, __n128);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  CGImageMetadata *v31;

  Mutable = CGImageMetadataCreateMutable();
  if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("http://ns.apple.com/HDRToneMap/1.0/"), CFSTR("HDRToneMap"), 0))
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke;
    aBlock[3] = &unk_1E1BBE320;
    v5 = Mutable;
    v31 = v5;
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_2;
    v28[3] = &unk_1E1BBE348;
    v6 = _Block_copy(aBlock);
    v29 = v6;
    v7 = _Block_copy(v28);
    v26[0] = v4;
    v26[1] = 3221225472;
    v26[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_3;
    v26[3] = &unk_1E1BBE370;
    v8 = v6;
    v27 = v8;
    v9 = (void (**)(void *, const __CFString *, BOOL))_Block_copy(v26);
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_4;
    v24[3] = &unk_1E1BBE398;
    v10 = v8;
    v25 = v10;
    v11 = (void (**)(void *, const __CFString *, unint64_t))_Block_copy(v24);
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_5;
    v22[3] = &unk_1E1BBE3C0;
    v12 = v7;
    v23 = v12;
    v17 = v4;
    v18 = 3221225472;
    v19 = __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_6;
    v20 = &unk_1E1BBE3E8;
    v13 = _Block_copy(v22);
    v21 = v13;
    v14 = (void (**)(void *, const __CFString *))_Block_copy(&v17);
    -[HDRFlexRangeParameters baseHeadroom](self, "baseHeadroom", v17, v18, v19, v20);
    (*((void (**)(id, const __CFString *))v12 + 2))(v12, CFSTR("BaseHeadroom"));
    -[HDRFlexRangeParameters alternateHeadroom](self, "alternateHeadroom");
    (*((void (**)(id, const __CFString *))v12 + 2))(v12, CFSTR("AlternateHeadroom"));
    if (-[HDRFlexRangeParameters isMono](self, "isMono"))
    {
      -[HDRFlexRangeParameters channelMin](self, "channelMin");
      (*((void (**)(void *, const __CFString *, _QWORD))v13 + 2))(v13, CFSTR("GainMapMin"), 0);
      -[HDRFlexRangeParameters channelMax](self, "channelMax");
      (*((void (**)(void *, const __CFString *, _QWORD))v13 + 2))(v13, CFSTR("GainMapMax"), 0);
      -[HDRFlexRangeParameters channelGamma](self, "channelGamma");
      (*((void (**)(void *, const __CFString *, _QWORD))v13 + 2))(v13, CFSTR("Gamma"), 0);
      -[HDRFlexRangeParameters channelBaseOffset](self, "channelBaseOffset");
      (*((void (**)(void *, const __CFString *, _QWORD))v13 + 2))(v13, CFSTR("BaseOffset"), 0);
      -[HDRFlexRangeParameters channelAlternateOffset](self, "channelAlternateOffset");
      (*((void (**)(void *, const __CFString *, _QWORD))v13 + 2))(v13, CFSTR("AlternateOffset"), 0);
    }
    else
    {
      -[HDRFlexRangeParameters channelMinRGB](self, "channelMinRGB");
      v14[2](v14, CFSTR("GainMapMin"));
      -[HDRFlexRangeParameters channelMaxRGB](self, "channelMaxRGB");
      v14[2](v14, CFSTR("GainMapMax"));
      -[HDRFlexRangeParameters channelGammaRGB](self, "channelGammaRGB");
      v14[2](v14, CFSTR("Gamma"));
      -[HDRFlexRangeParameters channelBaseOffsetRGB](self, "channelBaseOffsetRGB");
      v14[2](v14, CFSTR("BaseOffset"));
      -[HDRFlexRangeParameters channelAlternateOffsetRGB](self, "channelAlternateOffsetRGB");
      v14[2](v14, CFSTR("AlternateOffset"));
    }
    v9[2](v9, CFSTR("BaseColorIsWorkingColor"), -[HDRFlexRangeParameters useBaseColor](self, "useBaseColor"));
    v11[2](v11, CFSTR("Version"), -[HDRFlexRangeParameters version](self, "version"));
    v15 = v5;

  }
  else
  {
    LogError("-[HDRFlexRangeParameters createFlexRangeMetadata]", 250, "Failed to register HDRFlexRange metadata tag!");
    v15 = 0;
  }

  return v15;
}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  __CFString *v5;
  id value;

  value = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("HDRToneMap"), a2);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!CGImageMetadataSetValueWithPath(*(CGMutableImageMetadataRef *)(a1 + 32), 0, v5, value))
    LogError("-[HDRFlexRangeParameters createFlexRangeMetadata]_block_invoke", 256, "Failed to set metadata tag: %s", (const char *)-[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String"));

}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v5;
  double v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v8, v7);

}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%lu].%@"), CFSTR("ChannelMetadata"), a3, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(a4);

}

void __49__HDRFlexRangeParameters_createFlexRangeMetadata__block_invoke_6(uint64_t a1, void *a2, __n128 a3)
{
  id v4;

  v4 = a2;
  (*(void (**)(__n128))(*(_QWORD *)(a1 + 32) + 16))(a3);
  (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(a3.n128_f32[1]);
  (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(a3.n128_f32[2]);

}

- (float)channelMin
{
  return *(float *)self->_channelMinRGB;
}

- (void)setChannelMin:(float)a3
{
  *(int32x4_t *)self->_channelMinRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelMax
{
  return *(float *)self->_channelMaxRGB;
}

- (void)setChannelMax:(float)a3
{
  *(int32x4_t *)self->_channelMaxRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelGamma
{
  return *(float *)self->_channelGammaRGB;
}

- (void)setChannelGamma:(float)a3
{
  *(int32x4_t *)self->_channelGammaRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelBaseOffset
{
  return *(float *)self->_channelBaseOffsetRGB;
}

- (void)setChannelBaseOffset:(float)a3
{
  *(int32x4_t *)self->_channelBaseOffsetRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (float)channelAlternateOffset
{
  return *(float *)self->_channelAlternateOffsetRGB;
}

- (void)setChannelAlternateOffset:(float)a3
{
  *(int32x4_t *)self->_channelAlternateOffsetRGB = vdupq_lane_s32(*(int32x2_t *)&a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *((_QWORD *)result + 3) = self->_version;
  *((_DWORD *)result + 3) = LODWORD(self->_baseHeadroom);
  *((_DWORD *)result + 4) = LODWORD(self->_alternateHeadroom);
  *((_BYTE *)result + 8) = self->_isMono;
  *((_OWORD *)result + 3) = *(_OWORD *)self->_channelMinRGB;
  *((_OWORD *)result + 4) = *(_OWORD *)self->_channelMaxRGB;
  *((_OWORD *)result + 5) = *(_OWORD *)self->_channelGammaRGB;
  *((_OWORD *)result + 6) = *(_OWORD *)self->_channelBaseOffsetRGB;
  *((_OWORD *)result + 7) = *(_OWORD *)self->_channelAlternateOffsetRGB;
  *((_BYTE *)result + 9) = self->_useBaseColor;
  *((_QWORD *)result + 4) = self->_alternateColorSpace;
  return result;
}

- (id)description
{
  __CFString *v2;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  const __CFString *v15;
  const __CFString *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  CGColorSpace *v32;
  CFStringRef v33;
  int v34;
  __CFString *v35;
  void *v36;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = -[HDRFlexRangeParameters version](self, "version");
  -[HDRFlexRangeParameters baseHeadroom](self, "baseHeadroom");
  v8 = v7;
  -[HDRFlexRangeParameters baseHeadroom](self, "baseHeadroom");
  v10 = exp2f(v9);
  -[HDRFlexRangeParameters alternateHeadroom](self, "alternateHeadroom");
  v12 = v11;
  -[HDRFlexRangeParameters alternateHeadroom](self, "alternateHeadroom");
  v14 = exp2f(v13);
  if (-[HDRFlexRangeParameters isMono](self, "isMono"))
    v15 = CFSTR("Yes");
  else
    v15 = CFSTR("No");
  if (-[HDRFlexRangeParameters useBaseColor](self, "useBaseColor"))
    v16 = CFSTR("base");
  else
    v16 = CFSTR("alternate");
  -[HDRFlexRangeParameters channelMinRGB](self, "channelMinRGB");
  v52 = v17;
  -[HDRFlexRangeParameters channelMinRGB](self, "channelMinRGB");
  v51 = v18;
  -[HDRFlexRangeParameters channelMinRGB](self, "channelMinRGB");
  v50 = v19;
  -[HDRFlexRangeParameters channelMaxRGB](self, "channelMaxRGB");
  v49 = v20;
  -[HDRFlexRangeParameters channelMaxRGB](self, "channelMaxRGB");
  v48 = v21;
  -[HDRFlexRangeParameters channelMaxRGB](self, "channelMaxRGB");
  v47 = v22;
  -[HDRFlexRangeParameters channelGammaRGB](self, "channelGammaRGB");
  v46 = v23;
  -[HDRFlexRangeParameters channelGammaRGB](self, "channelGammaRGB");
  v45 = v24;
  -[HDRFlexRangeParameters channelGammaRGB](self, "channelGammaRGB");
  v44 = v25;
  -[HDRFlexRangeParameters channelBaseOffsetRGB](self, "channelBaseOffsetRGB");
  v43 = v26;
  -[HDRFlexRangeParameters channelBaseOffsetRGB](self, "channelBaseOffsetRGB");
  v42 = v27;
  -[HDRFlexRangeParameters channelBaseOffsetRGB](self, "channelBaseOffsetRGB");
  v41 = v28;
  -[HDRFlexRangeParameters channelAlternateOffsetRGB](self, "channelAlternateOffsetRGB");
  v40 = v29;
  -[HDRFlexRangeParameters channelAlternateOffsetRGB](self, "channelAlternateOffsetRGB");
  v39 = v30;
  -[HDRFlexRangeParameters channelAlternateOffsetRGB](self, "channelAlternateOffsetRGB");
  v38 = v31;
  v32 = -[HDRFlexRangeParameters alternateColorSpace](self, "alternateColorSpace");
  if (v32)
  {
    v33 = CGColorSpaceCopyName(-[HDRFlexRangeParameters alternateColorSpace](self, "alternateColorSpace"));
    if (v33)
    {
      v2 = (__CFString *)v33;
      v34 = 0;
      v35 = (__CFString *)v33;
    }
    else
    {
      v35 = (__CFString *)CFCopyDescription(-[HDRFlexRangeParameters alternateColorSpace](self, "alternateColorSpace"));
      v2 = 0;
      v34 = 1;
    }
  }
  else
  {
    v34 = 0;
    v35 = CFSTR("n/a");
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p version:%ld base:%0.2f(%0.2f) alt:%0.2f(%0.2f) mono:%@ color:%@ min=(%0.3f,%0.3f,%0.3f) max=(%0.3f,%0.3f,%0.3f) g=(%0.3f,%0.3f,%0.3f) kB=(%0.3f,%0.3f,%0.3f) kA=(%0.3f,%0.3f,%0.3f) alt space: %@>"), v5, self, v6, v8, v10, v12, v14, v15, v16, v52, v51, v50, v49, v48, v47, v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)

  if (v32)
  return v36;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (float)baseHeadroom
{
  return self->_baseHeadroom;
}

- (void)setBaseHeadroom:(float)a3
{
  self->_baseHeadroom = a3;
}

- (float)alternateHeadroom
{
  return self->_alternateHeadroom;
}

- (void)setAlternateHeadroom:(float)a3
{
  self->_alternateHeadroom = a3;
}

- (BOOL)isMono
{
  return self->_isMono;
}

- (void)setIsMono:(BOOL)a3
{
  self->_isMono = a3;
}

- (__n128)channelMinRGB
{
  return a1[3];
}

- (void)setChannelMinRGB:(HDRFlexRangeParameters *)self
{
  __int128 v2;

  *(_OWORD *)self->_channelMinRGB = v2;
}

- (__n128)channelMaxRGB
{
  return a1[4];
}

- (void)setChannelMaxRGB:(HDRFlexRangeParameters *)self
{
  __int128 v2;

  *(_OWORD *)self->_channelMaxRGB = v2;
}

- (__n128)channelGammaRGB
{
  return a1[5];
}

- (void)setChannelGammaRGB:(HDRFlexRangeParameters *)self
{
  __int128 v2;

  *(_OWORD *)self->_channelGammaRGB = v2;
}

- (__n128)channelBaseOffsetRGB
{
  return a1[6];
}

- (void)setChannelBaseOffsetRGB:(HDRFlexRangeParameters *)self
{
  __int128 v2;

  *(_OWORD *)self->_channelBaseOffsetRGB = v2;
}

- (__n128)channelAlternateOffsetRGB
{
  return a1[7];
}

- (void)setChannelAlternateOffsetRGB:(HDRFlexRangeParameters *)self
{
  __int128 v2;

  *(_OWORD *)self->_channelAlternateOffsetRGB = v2;
}

- (BOOL)useBaseColor
{
  return self->_useBaseColor;
}

- (void)setUseBaseColor:(BOOL)a3
{
  self->_useBaseColor = a3;
}

- (CGColorSpace)alternateColorSpace
{
  return self->_alternateColorSpace;
}

- (void)setAlternateColorSpace:(CGColorSpace *)a3
{
  self->_alternateColorSpace = a3;
}

@end
