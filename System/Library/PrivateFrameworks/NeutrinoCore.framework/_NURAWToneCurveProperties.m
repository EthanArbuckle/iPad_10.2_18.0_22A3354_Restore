@implementation _NURAWToneCurveProperties

- (_NURAWToneCurveProperties)initWithToneCurveFilter:(id)a3 gainMapTableFilter:(id)a4
{
  CIFilter *v6;
  CIFilter *v7;
  _NURAWToneCurveProperties *v8;
  CIFilter *rawTRCFilter;
  CIFilter *v10;
  CIFilter *rawGainTableMapFilter;
  objc_super v13;

  v6 = (CIFilter *)a3;
  v7 = (CIFilter *)a4;
  v13.receiver = self;
  v13.super_class = (Class)_NURAWToneCurveProperties;
  v8 = -[_NURAWToneCurveProperties init](&v13, sel_init);
  rawTRCFilter = v8->_rawTRCFilter;
  v8->_rawTRCFilter = v6;
  v10 = v6;

  rawGainTableMapFilter = v8->_rawGainTableMapFilter;
  v8->_rawGainTableMapFilter = v7;

  return v8;
}

- (float)baselineExposure
{
  void *v3;
  double v4;
  float v5;

  -[_NURAWToneCurveProperties localAverageCurveData](self, "localAverageCurveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1043878380;
  if (v3)
  {
    LODWORD(v4) = 1043878380;
    -[_NURAWToneCurveProperties _inverseCurveValueAt:data:](self, "_inverseCurveValueAt:data:", v3, v4);
  }
  v5 = 0.18 / *(float *)&v4;

  return log2f(v5);
}

- (NSData)boostCurveData
{
  _NURAWToneCurveProperties *v2;
  void *v3;
  uint64_t v4;
  NSData *boostCurveData;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_boostCurveData && v2->_rawTRCFilter)
  {
    v7[0] = v2->_rawTRCFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NURAWToneCurveProperties _generateCurveDataFromFilters:sampleCount:](v2, "_generateCurveDataFromFilters:sampleCount:", v3, 11);
    v4 = objc_claimAutoreleasedReturnValue();
    boostCurveData = v2->_boostCurveData;
    v2->_boostCurveData = (NSData *)v4;

  }
  objc_sync_exit(v2);

  return v2->_boostCurveData;
}

- (id)localAverageCurveData
{
  _NURAWToneCurveProperties *v2;
  CIFilter *rawGainTableMapFilter;
  void *v4;
  void *v5;
  uint64_t v6;
  NSData *localAverageCurveData;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_localAverageCurveData)
  {
    rawGainTableMapFilter = v2->_rawGainTableMapFilter;
    if (rawGainTableMapFilter)
    {
      averageLTMFilter(rawGainTableMapFilter);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NURAWToneCurveProperties _generateCurveDataFromFilters:sampleCount:](v2, "_generateCurveDataFromFilters:sampleCount:", v5, 128);
      v6 = objc_claimAutoreleasedReturnValue();
      localAverageCurveData = v2->_localAverageCurveData;
      v2->_localAverageCurveData = (NSData *)v6;

    }
  }
  objc_sync_exit(v2);

  return v2->_localAverageCurveData;
}

- (id)aggregateCurveData
{
  _NURAWToneCurveProperties *v2;
  void *v3;
  void *v4;
  CIFilter *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  char v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSData *aggregateCurveData;
  int v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_aggregateCurveData && v2->_rawGainTableMapFilter)
  {
    +[NUGlobalSettings meteorGainMapExposureCompensationMode](NUGlobalSettings, "meteorGainMapExposureCompensationMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    averageLTMFilter(v2->_rawGainTableMapFilter);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2->_rawTRCFilter;
    if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("default")) & 1) == 0)
    {
      v8 = objc_msgSend(v3, "isEqualToString:", CFSTR("local"));
      if (v4)
        v9 = v8;
      else
        v9 = 0;
      if ((v9 & 1) != 0)
        goto LABEL_6;
    }
    else if (v4)
    {
LABEL_6:
      v20[0] = v4;
      v6 = v20;
      v7 = 1;
      goto LABEL_17;
    }
    v10 = objc_msgSend(v3, "isEqualToString:", CFSTR("total"));
    if (v4)
      v11 = v10;
    else
      v11 = 0;
    if (v11 != 1 || !v5)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_573);
      v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = v3;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Unsupported gain map exposure compensation mode: %@", (uint8_t *)&v17, 0xCu);
      }
      v12 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_23;
    }
    v19[0] = v4;
    v19[1] = v5;
    v6 = v19;
    v7 = 2;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
    -[_NURAWToneCurveProperties _generateCurveDataFromFilters:sampleCount:](v2, "_generateCurveDataFromFilters:sampleCount:", v12, 128);
    v14 = objc_claimAutoreleasedReturnValue();
    aggregateCurveData = v2->_aggregateCurveData;
    v2->_aggregateCurveData = (NSData *)v14;

  }
  objc_sync_exit(v2);

  return v2->_aggregateCurveData;
}

- (id)_generateCurveDataFromFilters:(id)a3 sampleCount:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  float v10;
  int64x2_t v11;
  uint64x2_t v12;
  int64x2_t v13;
  int32x2_t v14;
  id v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  unsigned int v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 4 * a4;
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * a4));
  v8 = objc_msgSend(v7, "mutableBytes");
  if (a4)
  {
    v9 = 0;
    v10 = (float)(a4 - 1);
    v11 = (int64x2_t)xmmword_1A671A270;
    v12 = (uint64x2_t)vdupq_n_s64(a4 - 1);
    v13 = vdupq_n_s64(2uLL);
    do
    {
      v14 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v11));
      if ((v14.i8[0] & 1) != 0)
        *(float *)(v8 + 4 * v9) = (float)v9 / v10;
      if ((v14.i8[4] & 1) != 0)
        *(float *)(v8 + 4 * v9 + 4) = (float)(v9 + 1) / v10;
      v9 += 2;
      v11 = vaddq_s64(v11, v13);
    }
    while (((a4 + 1) & 0xFFFFFFFFFFFFFFFELL) != v9);
  }
  v15 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  v16 = (double)a4;
  v35 = v7;
  v34 = *MEMORY[0x1E0C9E028];
  v17 = (id)objc_msgSend(v15, "initWithBitmapData:bytesPerRow:size:format:colorSpace:", v7, 4 * a4, (double)a4, 1.0);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  v20 = v17;
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v37;
    v23 = *MEMORY[0x1E0C9E1F8];
    v20 = v17;
    do
    {
      v24 = 0;
      v25 = v20;
      do
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v18);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v24);
        objc_msgSend(v26, "setValue:forKey:", v25, v23);
        objc_msgSend(v26, "outputImage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "setValue:forKey:", 0, v23);
        ++v24;
        v25 = v20;
      }
      while (v21 != v24);
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v21);
  }

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v6);
  v28 = (void *)MEMORY[0x1E0C9DD90];
  v29 = *MEMORY[0x1E0C9DF88];
  v40[0] = *MEMORY[0x1E0C9DF58];
  v40[1] = v29;
  v41[0] = MEMORY[0x1E0C9AAA0];
  v41[1] = CFSTR("_NURAWToneCurveProperties");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contextWithOptions:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_retainAutorelease(v27);
  objc_msgSend(v31, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v20, objc_msgSend(v32, "mutableBytes"), v6, v34, 0, 0.0, 0.0, v16, 1.0);

  return v32;
}

- (float)boostCurveValueAt:(float)a3
{
  void *v5;
  double v6;
  float v7;
  float v8;

  -[_NURAWToneCurveProperties boostCurveData](self, "boostCurveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  -[_NURAWToneCurveProperties _curveValueAt:data:](self, "_curveValueAt:data:", v5, v6);
  v8 = v7;

  return v8;
}

- (float)_curveValueAt:(float)result data:(id)a4
{
  float v4;
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  float v9;
  signed int v10;
  signed int v11;
  float v12;

  v4 = result;
  if (a4)
  {
    v5 = a4;
    v6 = (unint64_t)objc_msgSend(v5, "length") >> 2;
    v7 = objc_retainAutorelease(v5);
    v8 = objc_msgSend(v7, "bytes");

    v9 = fminf(fmaxf(v4, 0.0), 1.0) * (float)(v6 - 1);
    v10 = vcvtms_s32_f32(v9);
    v11 = vcvtps_s32_f32(v9);
    v12 = v9 - floorf(v9);
    return (float)(*(float *)(v8 + 4 * v10) * (float)(1.0 - v12)) + (float)(v12 * *(float *)(v8 + 4 * v11));
  }
  return result;
}

- (float)inverseAggregatedCurveValueAt:(float)a3
{
  void *v5;
  double v6;
  float v7;
  float v8;

  -[_NURAWToneCurveProperties aggregateCurveData](self, "aggregateCurveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a3;
  -[_NURAWToneCurveProperties _inverseCurveValueAt:data:](self, "_inverseCurveValueAt:data:", v5, v6);
  v8 = v7;

  return v8;
}

- (float)_inverseCurveValueAt:(float)a3 data:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  float *v8;
  float v9;
  float v10;
  unint64_t v11;
  int v12;
  float v13;
  float v14;
  int v15;
  int v16;
  int v17;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    v8 = (float *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
    v9 = *v8;
    v10 = 0.0;
    if (*v8 < a3)
    {
      v11 = v7 >> 2;
      v12 = (v7 >> 2) - 1;
      v13 = v8[v12];
      v10 = 1.0;
      if (v13 > a3)
      {
        v14 = 0.0;
        if ((int)v11 >= 3)
        {
          v15 = 0;
          do
          {
            v16 = v15 + v12;
            if (v15 + v12 < 0 != __OFADD__(v15, v12))
              ++v16;
            v17 = v16 >> 1;
            if (v8[v17] <= a3)
              v15 = v17;
            else
              v12 = v17;
          }
          while (v12 - v15 > 1);
          v9 = v8[v15];
          v13 = v8[v12];
          v14 = (float)v15;
        }
        v10 = (float)((float)((float)((float)v12 / (float)(v11 - 1)) * (float)(a3 - v9))
                    + (float)((float)(v14 / (float)(v11 - 1)) * (float)(v13 - a3)))
            / (float)(v13 - v9);
      }
    }
  }
  else
  {
    v10 = a3;
  }

  return v10;
}

- (id)_generateGainMapExposure
{
  CIFilter *v3;
  CIFilter *v4;
  double v5;
  CIFilter *v6;
  float v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  int v15;
  void *v16;
  double v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v28;
  id v30;
  _OWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_rawGainTableMapFilter;
  v4 = self->_rawTRCFilter;
  v6 = v4;
  v7 = 1.0;
  if (v3)
    v8 = v4 == 0;
  else
    v8 = 1;
  v9 = 0x1E0CB3000uLL;
  if (v8)
  {
    v10 = v3;
  }
  else
  {
    if (_generateGainMapExposure_once != -1)
      dispatch_once(&_generateGainMapExposure_once, &__block_literal_global_541);
    averageLTMFilter(v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (id)_generateGainMapExposure_s_synthGainInputKernel;
    v11 = *MEMORY[0x1E0C9E1F8];
    v12 = *MEMORY[0x1E0C9E078];
    v13 = 1.0;
    v14 = 0.0;
    v15 = -12;
    do
    {
      v16 = (void *)MEMORY[0x1A85C1390]();
      *(float *)&v17 = (float)(v13 + v14) * 0.5;
      objc_msgSend(*(id *)(v9 + 2024), "numberWithFloat:", v17);
      v18 = v9;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "applyWithExtent:arguments:", v20, 0.0, 0.0, 1.0, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setValue:forKey:", v21, v11);
      objc_msgSend(v10, "outputImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setValue:forKey:", 0, v11);
      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", v22, v11);
      -[CIFilter outputImage](v6, "outputImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[CIFilter setValue:forKey:](v6, "setValue:forKey:", 0, v11);
      memset(v31, 0, sizeof(v31));
      v24 = _generateGainMapExposure_ctx;
      v25 = objc_msgSend((id)_generateGainMapExposure_ctx, "workingColorSpace");
      v26 = (void *)v24;
      v9 = v18;
      objc_msgSend(v26, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v23, v31, 32, v12, v25, 0.0, 0.0, 1.0, 1.0);
      if (*(float *)v31 < 0.18)
        v14 = (float)(v13 + v14) * 0.5;
      else
        v13 = (float)(v13 + v14) * 0.5;

      objc_autoreleasePoolPop(v16);
    }
    while (!__CFADD__(v15++, 1));
    v7 = 0.18 / (float)((float)(v13 + v14) * 0.5);

  }
  *(float *)&v5 = v7;
  objc_msgSend(*(id *)(v9 + 2024), "numberWithFloat:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawGainTableMapFilter, 0);
  objc_storeStrong((id *)&self->_rawTRCFilter, 0);
  objc_storeStrong((id *)&self->_gainMapExposure, 0);
  objc_storeStrong((id *)&self->_aggregateCurveData, 0);
  objc_storeStrong((id *)&self->_localAverageCurveData, 0);
  objc_storeStrong((id *)&self->_boostCurveData, 0);
}

@end
