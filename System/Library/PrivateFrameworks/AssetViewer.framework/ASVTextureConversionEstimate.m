@implementation ASVTextureConversionEstimate

- (ASVTextureConversionEstimate)initWithTextureDescription:(id)a3 converter:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  ASVTextureConversionEstimate *v19;
  char v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v6 = a3;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalSize");
  v9 = v8;
  v10 = objc_msgSend(v6, "originalPixelFormat");
  v12 = v11;
  v13 = objc_msgSend(v6, "destinationPixelFormat");
  v15 = v14;
  v16 = objc_msgSend(v6, "downsamplingFactor");
  v17 = objc_msgSend(v6, "fileType");
  v18 = objc_msgSend(v6, "generateMipmaps");

  v23.receiver = self;
  v23.super_class = (Class)ASVTextureConversionEstimate;
  v21 = v18;
  v19 = -[ASVTextureDescription initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:](&v23, sel_initWithName_originalSize_originalPixelFormat_destinationPixelFormat_downsamplingFactor_fileType_generateMipmaps_, v7, v10, v12, v13, v15, v16, v9, v17, v21);

  if (v19)
    -[ASVTextureConversionEstimate updateFromConverter:](v19, "updateFromConverter:", v22);

  return v19;
}

- (void)updateFromConverter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[ASVTextureConversionEstimate setConverterType:](self, "setConverterType:", objc_msgSend(v4, "converterType"));
  v5 = objc_msgSend(v4, "estimatedMemoryDeltaForTextureWithDescription:", self);
  v7 = v6;

  -[ASVTextureConversionEstimate setEstimatedMemoryDelta:](self, "setEstimatedMemoryDelta:", v5, v7);
}

- (unint64_t)peakMemoryUsage
{
  unint64_t v2;

  -[ASVTextureConversionEstimate estimatedMemoryDelta](self, "estimatedMemoryDelta");
  return v2;
}

- (unint64_t)weight
{
  int8x8_t v3;
  int8x8_t v4;
  int8x8_t v5;
  int8x8_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[ASVTextureDescription destinationSize](self, "destinationSize");
  v4 = v3;
  -[ASVTextureDescription destinationSize](self, "destinationSize");
  v6 = vext_s8(v5, v4, 4uLL);
  v7 = v6.i32[0] * (uint64_t)v6.i32[1];
  v8 = -[ASVTextureDescription destinationPixelFormat](self, "destinationPixelFormat");
  return v7
       * +[ASVTextureDescription bytesPerPixelForPixelFormat:](ASVTextureDescription, "bytesPerPixelForPixelFormat:", v8, v9);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ASVTextureConversionEstimate;
  -[ASVTextureDescription debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASVTextureConversionEstimate converterType](self, "converterType");
  -[ASVTextureConversionEstimate estimatedMemoryDelta](self, "estimatedMemoryDelta");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [converterType: %d, estimated: peak %llu / footprint %llu, weight: %lu]"), v4, v5, v6, -[ASVTextureConversionEstimate estimatedMemoryDelta](self, "estimatedMemoryDelta"), -[ASVTextureConversionEstimate weight](self, "weight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)textureDescription:(id)a3 downsampledToTryAndFitDestinationWithinSize:
{
  int32x2_t v3;
  id v4;
  void *v5;
  int32x2_t v6;
  int32x2_t v7;
  uint64_t i;
  int v9;
  int32x2_t v10;
  int v11;
  int32x2_t v12;
  ASVTextureDescription *v13;
  ASVTextureDescription *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int32x2_t v27;

  v27 = v3;
  v4 = a3;
  v5 = v4;
  if (v27.i32[0]
    && v27.i32[1]
    && ((objc_msgSend(v4, "destinationSize"), (vcgt_s32(v6, v27).u8[0] & 1) != 0)
     || (objc_msgSend(v5, "destinationSize"), (vcgt_s32(v7, v27).i32[1] & 1) != 0)))
  {
    for (i = objc_msgSend(v5, "downsamplingFactor"); ; i *= 2)
    {
      objc_msgSend(v5, "originalSize");
      v10.i32[0] = v9 / (int)i;
      v10.i32[1] = v11 / (int)i;
      v12 = vcgt_s32(v10, v27);
      if ((v12.i8[0] & 1) == 0 && (v12.i8[4] & 1) == 0)
        break;
    }
    v14 = [ASVTextureDescription alloc];
    objc_msgSend(v5, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalSize");
    v17 = v16;
    v18 = objc_msgSend(v5, "originalPixelFormat");
    v20 = v19;
    v21 = objc_msgSend(v5, "destinationPixelFormat");
    v23 = v22;
    v24 = objc_msgSend(v5, "fileType");
    LOBYTE(v26) = objc_msgSend(v5, "generateMipmaps");
    v13 = -[ASVTextureDescription initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:](v14, "initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:", v15, v18, v20, v21, v23, i, v17, v24, v26);

  }
  else
  {
    v13 = v5;
  }

  return v13;
}

+ (id)conversionEstimatesFromTextureDescriptions:(id)a3 toFitAvailableMemory:(unint64_t)a4 withConverters:(id)a5 preferredMaxTextureSize:(int64_t *)a6 outcome:
{
  int32x2_t v6;
  id v9;
  id v10;
  uint64_t v11;
  int64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int32 v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  ASVTextureConversionEstimate *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t j;
  void *v29;
  ASVTextureDescription *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  ASVTextureDescription *v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  ASVTextureConversionEstimate *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  id v56;
  id v57;
  uint64_t v59;
  void *v60;
  id obj;
  uint64_t v64;
  void *v65;
  void *v66;
  int32x2_t v67;
  uint64_t v68;
  int64_t *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  unint64_t v81;
  __int16 v82;
  unint64_t v83;
  _BYTE v84[128];
  uint64_t v85;

  v67 = v6;
  v85 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v70 = a5;
  if (a6)
    *a6 = 1;
  v69 = a6;
  v60 = v9;
  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v70, "count"))
    {
      v66 = (void *)objc_opt_new();
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      v12 = a6;
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v76;
        v15 = vorr_s8((int8x8_t)vdup_lane_s32(v67, 1), (int8x8_t)v67).u32[0];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v76 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            if (v15)
            {
              +[ASVTextureConversionEstimate textureDescription:downsampledToTryAndFitDestinationWithinSize:](ASVTextureConversionEstimate, "textureDescription:downsampledToTryAndFitDestinationWithinSize:", v17, *(double *)&v67);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v12 && objc_msgSend(v18, "requiresDownsampling"))
                *v12 = 2;
            }
            else
            {
              v19 = v17;
            }
            +[ASVTextureConverter preferredConverterFromConverters:forTextureDescription:](ASVTextureConverter, "preferredConverterFromConverters:forTextureDescription:", v70, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = -[ASVTextureConversionEstimate initWithTextureDescription:converter:]([ASVTextureConversionEstimate alloc], "initWithTextureDescription:converter:", v19, v20);
              objc_msgSend(v66, "addObject:", v21);

              v12 = v69;
            }

          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        }
        while (v13);
      }

      v22 = (void *)objc_msgSend(v66, "copy");
      objc_msgSend(a1, "conversionEstimatesSortedByPeakMemoryUsage:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = +[ASVTextureConversionEstimate peakMemoryForConversionEstimates:](ASVTextureConversionEstimate, "peakMemoryForConversionEstimates:", v23);
      AssetViewerLogHandleForCategory(1);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v81 = v24;
        v82 = 2048;
        v83 = a4;
        _os_log_impl(&dword_1D93A7000, v25, OS_LOG_TYPE_DEFAULT, "peakMemory: %lu, availableMemory: %lu", buf, 0x16u);
      }

      AssetViewerLogHandleForCategory(1);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (a4 && v24 > a4)
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D93A7000, v26, OS_LOG_TYPE_DEFAULT, "Need to downsample, calculating...", buf, 2u);
        }

        v65 = (void *)objc_opt_new();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        obj = v23;
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        if (v68)
        {
          v64 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v72 != v64)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
              v30 = [ASVTextureDescription alloc];
              objc_msgSend(v29, "name");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "originalSize");
              v33 = v32;
              v34 = objc_msgSend(v29, "originalPixelFormat");
              v36 = v35;
              v37 = objc_msgSend(v29, "destinationPixelFormat");
              v39 = v38;
              v40 = objc_msgSend(v29, "downsamplingFactor");
              v41 = objc_msgSend(v29, "fileType");
              LOBYTE(v59) = objc_msgSend(v29, "generateMipmaps");
              v42 = -[ASVTextureDescription initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:](v30, "initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:", v31, v34, v36, v37, v39, v40, v33, v41, v59);

              -[ASVTextureDescription destinationSize](v42, "destinationSize");
              if (v43 >= 17)
              {
                do
                {
                  -[ASVTextureDescription destinationSize](v42, "destinationSize");
                  if (v44 < 17)
                    break;
                  -[ASVTextureDescription setDownsamplingFactor:](v42, "setDownsamplingFactor:", 2 * -[ASVTextureDescription downsamplingFactor](v42, "downsamplingFactor"));
                  -[ASVTextureDescription destinationSize](v42, "destinationSize");
                }
                while (v45 > 16);
              }
              +[ASVTextureConverter preferredConverterFromConverters:forTextureDescription:](ASVTextureConverter, "preferredConverterFromConverters:forTextureDescription:", v70, v42);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = -[ASVTextureConversionEstimate initWithTextureDescription:converter:]([ASVTextureConversionEstimate alloc], "initWithTextureDescription:converter:", v42, v46);
              objc_msgSend(v65, "addObject:", v47);

            }
            v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          }
          while (v68);
        }

        objc_msgSend(a1, "conversionEstimatesSortedByPeakMemoryUsage:", v65);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[ASVTextureConversionEstimate peakMemoryForConversionEstimates:](ASVTextureConversionEstimate, "peakMemoryForConversionEstimates:", v48) > a4)
        {
LABEL_48:
          v56 = 0;
        }
        else
        {
          v49 = obj;
          do
          {
            v50 = v49;
            +[ASVTextureConversionEstimate heaviestConversionEstimate:withMinimumDestinationSize:](ASVTextureConversionEstimate, "heaviestConversionEstimate:withMinimumDestinationSize:", v49, COERCE_DOUBLE(0x1000000010));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v51)
            {
              obj = v50;
              goto LABEL_48;
            }
            v52 = v51;
            objc_msgSend(v51, "setDownsamplingFactor:", 2 * objc_msgSend(v51, "downsamplingFactor"));
            +[ASVTextureConverter preferredConverterFromConverters:forTextureDescription:](ASVTextureConverter, "preferredConverterFromConverters:forTextureDescription:", v70, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "updateFromConverter:", v53);
            objc_msgSend(a1, "conversionEstimatesSortedByPeakMemoryUsage:", v50);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            v55 = +[ASVTextureConversionEstimate peakMemoryForConversionEstimates:](ASVTextureConversionEstimate, "peakMemoryForConversionEstimates:", v54);
            v49 = v54;
          }
          while (v55 > a4);
          if (v69)
            *v69 = 3;
          v56 = v54;
          obj = v56;
        }

        v57 = obj;
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D93A7000, v26, OS_LOG_TYPE_DEFAULT, "No need to downsample, returning", buf, 2u);
        }

        v57 = v23;
        v56 = v57;
      }

    }
    else
    {
      v56 = 0;
    }
  }
  else
  {
    v56 = (id)MEMORY[0x1E0C9AA60];
  }

  return v56;
}

+ (unint64_t)peakMemoryForConversionEstimates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "estimatedMemoryDelta");
        if (v7 <= v11 + v6)
          v7 = v11 + v6;
        v6 += objc_msgSend(v10, "estimatedMemoryDelta");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)heaviestConversionEstimate:(id)a3 withMinimumDestinationSize:
{
  int32x2_t v3;
  int32x2_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int32x2_t v15;
  int32x2_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = v3;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "weight");
        if (v13 > v8)
        {
          v14 = v13;
          objc_msgSend(v12, "destinationSize");
          if ((vcgt_s32(v4, v15).u8[0] & 1) == 0)
          {
            objc_msgSend(v12, "destinationSize");
            if ((vcgt_s32(v4, v16).i32[1] & 1) == 0)
            {
              v17 = v12;

              v8 = v14;
              v9 = v17;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)conversionEstimatesSortedByPeakMemoryUsage:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_10);
}

uint64_t __75__ASVTextureConversionEstimate_conversionEstimatesSortedByPeakMemoryUsage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  float v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "estimatedMemoryDelta");
  v6 = (float)v5;
  objc_msgSend(v4, "estimatedMemoryDelta");
  v8 = v7;

  if (v6 <= (float)v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 < (float)v8)
    return 1;
  else
    return v9;
}

- (int64_t)converterType
{
  return self->_converterType;
}

- (void)setConverterType:(int64_t)a3
{
  self->_converterType = a3;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDelta
{
  $CF008E7FDE220E2923E69B3034183AF7 *p_estimatedMemoryDelta;
  unint64_t footprint;
  unint64_t peak;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  p_estimatedMemoryDelta = &self->_estimatedMemoryDelta;
  footprint = self->_estimatedMemoryDelta.footprint;
  peak = p_estimatedMemoryDelta->peak;
  result.var1 = peak;
  result.var0 = footprint;
  return result;
}

- (void)setEstimatedMemoryDelta:(id)a3
{
  self->_estimatedMemoryDelta = ($CF008E7FDE220E2923E69B3034183AF7)a3;
}

@end
