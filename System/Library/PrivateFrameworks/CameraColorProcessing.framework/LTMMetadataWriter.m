@implementation LTMMetadataWriter

+ (id)createLTMMetadataFromLTMOutput:(sLtmComputeOutput *)a3 statistics:(sCLRProcHITHStat *)a4 driverInputMetadata:(sRefDriverInputs *)a5 geometryData:(id)a6
{
  id v10;
  void *v11;
  id v12;
  NSObject *v14;

  v10 = a6;
  v11 = (void *)objc_opt_new();
  if (v11)
  {
    objc_msgSend(a1, "_addLTMCurvesToMetadata:curvesType:fromOutput:statistics:geometryData:isSIFR:", v11, 0, a3, a4, v10, a5->isSIFRFrame);
    objc_msgSend(a1, "_addSoftDGainToMetadata:driverInputMetadata:", v11, a5);
    objc_msgSend(a1, "_addLTMCurveTypeToMetadata:driverInputMetadata:", v11, a5);
    objc_msgSend(a1, "_addLTMEnabledToMetadata:", v11);
    objc_msgSend(a1, "_addLocalHistToMetadata:statistics:geometryData:", v11, a4, v10);
    objc_msgSend(a1, "_addLocalClippingDataToMetadata:statistics:geometryData:", v11, a4, v10);
    objc_msgSend(a1, "_addAverageLTMToMetadata:curvesType:fromOutput:", v11, 0, a3);
    objc_msgSend(a1, "_addSpatialCCMDataToMetadata:fromOutput:driverInputMetadata:", v11, a3, a5);
    objc_msgSend(a1, "_addGlobalLTMLookUpTableAlignedToFinalCropRect:", v11);
    objc_msgSend(a1, "_addHighlightCompression:driverInputMetadata:", v11, a5);
    objc_msgSend(a1, "_addHazeCorrection:driverInputMetadata:", v11, a5);
    v12 = v11;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v14 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  return v11;
}

+ (void)addLTMMetadataTo:(id)a3 curvesType:(int)a4 fromLTMOutput:(sLtmComputeOutput *)a5 statistics:(sCLRProcHITHStat *)a6 driverInputMetadata:(sRefDriverInputs *)a7 geometryData:(id)a8
{
  uint64_t v11;
  _BOOL8 isSIFRFrame;
  id v14;

  v11 = *(_QWORD *)&a4;
  isSIFRFrame = a7->isSIFRFrame;
  v14 = a3;
  objc_msgSend(a1, "_addLTMCurvesToMetadata:curvesType:fromOutput:statistics:geometryData:isSIFR:", v14, v11, a5, a6, a8, isSIFRFrame);
  objc_msgSend(a1, "_addAverageLTMToMetadata:curvesType:fromOutput:", v14, v11, a5);

}

+ (void)_addLTMCurvesToMetadata:(id)a3 curvesType:(int)a4 fromOutput:(sLtmComputeOutput *)a5 statistics:(sCLRProcHITHStat *)a6 geometryData:(id)a7 isSIFR:(BOOL)a8
{
  id v12;
  id v13;
  char *v14;
  _WORD *v15;
  _WORD *v16;
  _WORD *v17;
  void *v18;
  float *globalLUT;
  uint64_t i;
  unsigned int v21;
  float v22;
  float v23;
  unsigned int v24;
  float v25;
  float v26;
  uint64_t v27;
  float32x4_t v28;
  float32x4_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  NSObject *v34;
  NSObject *v35;

  v12 = a3;
  v13 = a7;
  v14 = (char *)malloc_type_malloc(0x1878uLL, 0x59BA2FA5uLL);
  if (v14 && (v15 = malloc_type_malloc(0x204uLL, 0xBCD4122FuLL)) != 0)
  {
    v16 = v15;
    v17 = malloc_type_malloc(0x204uLL, 0xA3C33102uLL);
    if (v17)
    {
      v18 = v17;
      *v16 = 257;
      *v17 = 257;
      globalLUT = a5->globalLUT;
      for (i = 1; i != 258; ++i)
      {
        v16[i] = vcvtms_s32_f32(*globalLUT * 65535.0);
        v17[i] = vcvtms_s32_f32(globalLUT[257] * 65535.0);
        ++globalLUT;
      }
      HIWORD(v21) = 8;
      *(_QWORD *)v14 = 0x410000600080004;
      *((_WORD *)v14 + 4) = 130;
      *(_QWORD *)(v14 + 10) = 0;
      LOWORD(v21) = a6->localHistStrideX;
      v22 = (float)v21;
      objc_msgSend(v13, "inputTextureDownsampleRatio");
      *(float *)&v24 = v23 * v22;
      *((_WORD *)v14 + 9) = (int)*(float *)&v24;
      LOWORD(v24) = a6->localHistStrideY;
      v25 = (float)v24;
      objc_msgSend(v13, "inputTextureDownsampleRatio");
      *((_WORD *)v14 + 10) = (int)(float)(v26 * v25);
      *((_WORD *)v14 + 11) = 65;
      v27 = -6240;
      v28 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
      do
      {
        v29 = *(float32x4_t *)a5->LTC;
        a5 = (sLtmComputeOutput *)((char *)a5 + 16);
        *(int16x4_t *)&v14[v27 + 6264] = vmovn_s32((int32x4_t)vcvtq_u32_f32(vrndmq_f32(vmulq_f32(v29, v28))));
        v27 += 8;
      }
      while (v27);
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v14, 6264);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v16, 516);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", v18, 516);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 2)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE11AF0]);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE11AB8]);
        v33 = (_QWORD *)MEMORY[0x24BE11AC8];
      }
      else if (a4 == 1)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE11AF8]);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE11AC0]);
        v33 = (_QWORD *)MEMORY[0x24BE11AD0];
      }
      else
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE11CC8]);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE11C90]);
        v33 = (_QWORD *)MEMORY[0x24BE11CA0];
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, *v33);
    }
    else
    {
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v35 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v32 = 0;
      v31 = 0;
      v30 = 0;
      v18 = 0;
    }
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v34 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v32 = 0;
    v31 = 0;
    v30 = 0;
    v18 = 0;
    v16 = 0;
  }
  free(v16);
  free(v18);
  free(v14);

}

+ (void)_addSoftDGainToMetadata:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16E0];
  LODWORD(v4) = vcvts_n_u32_f32(a4->softIspDGain, 8uLL);
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInt:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE11DA8]);

}

+ (void)_addLTMCurveTypeToMetadata:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  void *v4;
  uint64_t ltmProcMode;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  ltmProcMode = a4->ltmProcMode;
  v6 = a3;
  objc_msgSend(v4, "numberWithInt:", ltmProcMode);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE11CB8]);

}

+ (void)_addAverageLTMToMetadata:(id)a3 curvesType:(int)a4 fromOutput:(sLtmComputeOutput *)a5
{
  void *v7;
  uint64_t i;
  uint64_t v9;
  unsigned int v10;
  sLtmComputeOutput *v11;
  uint64_t j;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 65);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 65; ++i)
  {
    v9 = 0;
    v10 = 0;
    v11 = a5;
    do
    {
      for (j = 0; j != 520; j += 65)
        v10 = (float)(floorf(v11->LTC[j] * 65535.0) + (float)v10);
      ++v9;
      v11 = (sLtmComputeOutput *)((char *)v11 + 2080);
    }
    while (v9 != 6);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)(v10 / 0x30));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v13, i);

    a5 = (sLtmComputeOutput *)((char *)a5 + 4);
  }
  v14 = (_QWORD *)MEMORY[0x24BE11A90];
  v15 = (_QWORD *)MEMORY[0x24BE11A88];
  if (a4 != 2)
    v15 = (_QWORD *)MEMORY[0x24BE11BF0];
  if (a4 != 1)
    v14 = v15;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, *v14);

}

+ (void)_addHighlightCompression:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  id v5;
  void *v6;
  uint64_t i;
  void *v8;
  id v9;

  v5 = a3;
  if (a4->useHighlightCompression)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 257);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 257; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", highlightCompressionDataScaled[i]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, i);

    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE11AA8]);

    v5 = v9;
  }

}

+ (void)_addHazeCorrection:(id)a3 driverInputMetadata:(sRefDriverInputs *)a4
{
  id v5;
  void *v6;
  double v7;
  uint64_t i;
  void *v9;
  id v10;

  v5 = a3;
  if (a4->useHazeCorrection)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 3; ++i)
    {
      LODWORD(v7) = *((_DWORD *)&a4[1].HROn + (i & 3));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v9, i);

    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE11AD8]);

    v5 = v10;
  }

}

+ (void)_addLTMEnabledToMetadata:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE11CC0]);

}

+ (void)_addLocalHistToMetadata:(id)a3 statistics:(sCLRProcHITHStat *)a4 geometryData:(id)a5
{
  id v7;
  size_t v8;
  _DWORD *v9;
  unint64_t v10;
  _DWORD *v11;
  double v12;
  double v13;
  double v14;
  float v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  unsigned int v23;
  float v24;
  unsigned int v25;
  float v26;
  unsigned int v27;
  float v28;
  void *v29;
  id v30;

  v30 = a3;
  v7 = a5;
  v8 = a4->localHistStatSize + 32;
  v9 = malloc_type_malloc(v8, 0xF959B967uLL);
  v11 = v9;
  if (v9)
  {
    *v9 = 1;
    v9[1] = v8;
    LODWORD(v10) = a4->gridOriginX;
    v12 = (double)v10;
    objc_msgSend(v7, "deepZoomOrigin");
    v14 = v13 + v12;
    objc_msgSend(v7, "inputTextureDownsampleRatio");
    *(double *)&v16 = v14 * v15;
    *((_WORD *)v11 + 4) = (int)*(double *)&v16;
    LODWORD(v16) = a4->gridOriginY;
    v17 = (double)v16;
    objc_msgSend(v7, "deepZoomOrigin");
    v19 = v18 + v17;
    objc_msgSend(v7, "inputTextureDownsampleRatio");
    v21 = v19 * v20;
    *((_WORD *)v11 + 5) = (int)v21;
    LOWORD(v21) = a4->localHistBlockSizeX;
    *(float *)&v19 = (float)LODWORD(v21);
    objc_msgSend(v7, "inputTextureDownsampleRatio");
    *(float *)&v23 = v22 * *(float *)&v19;
    *((_WORD *)v11 + 6) = (int)*(float *)&v23;
    LOWORD(v23) = a4->localHistBlockSizeY;
    *(float *)&v19 = (float)v23;
    objc_msgSend(v7, "inputTextureDownsampleRatio");
    *(float *)&v25 = v24 * *(float *)&v19;
    *((_WORD *)v11 + 7) = (int)*(float *)&v25;
    LOWORD(v25) = a4->localHistStrideX;
    *(float *)&v19 = (float)v25;
    objc_msgSend(v7, "inputTextureDownsampleRatio");
    *(float *)&v27 = v26 * *(float *)&v19;
    *((_WORD *)v11 + 8) = (int)*(float *)&v27;
    LOWORD(v27) = a4->localHistStrideY;
    *(float *)&v19 = (float)v27;
    objc_msgSend(v7, "inputTextureDownsampleRatio");
    *((_WORD *)v11 + 9) = (int)(float)(v28 * *(float *)&v19);
    v11[5] = *(_DWORD *)&a4->localHistNumHorBlocks;
    *((_WORD *)v11 + 12) = a4->localHistBinSize;
    *((_WORD *)v11 + 13) = a4->localHistCountBitShift;
    v11[7] = a4->localHistogramOriginalTilePixelCount;
    memcpy(v11 + 8, a4->localHistStat, a4->localHistStatSize);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v11, v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BE11CE8]);

  }
  else
  {
    FigSignalErrorAt();
  }
  free(v11);

}

+ (void)_addLocalClippingDataToMetadata:(id)a3 statistics:(sCLRProcHITHStat *)a4 geometryData:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  float v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  unsigned int v23;
  float v24;
  unsigned int v25;
  float v26;
  unsigned int v27;
  uint64_t v28;
  float v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  __int16 *v34;
  char *v35;
  __int16 v36;
  NSObject *v37;

  v7 = a3;
  v8 = a5;
  v9 = malloc_type_malloc(0x1ACuLL, 0x8DB544A5uLL);
  v10 = v9;
  if (v9)
  {
    HIDWORD(v11) = 428;
    *v9 = 0x1AC00000001;
    LODWORD(v11) = a4->gridOriginX;
    v12 = (double)v11;
    objc_msgSend(v8, "deepZoomOrigin");
    v14 = v13 + v12;
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    *(double *)&v16 = v14 * v15;
    *((_WORD *)v10 + 4) = (int)*(double *)&v16;
    LODWORD(v16) = a4->gridOriginY;
    v17 = (double)v16;
    objc_msgSend(v8, "deepZoomOrigin");
    v19 = v18 + v17;
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    v21 = v19 * v20;
    *((_WORD *)v10 + 5) = (int)v21;
    LOWORD(v21) = a4->localHistBlockSizeX;
    *(float *)&v19 = (float)LODWORD(v21);
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    *(float *)&v23 = v22 * *(float *)&v19;
    *((_WORD *)v10 + 6) = (int)*(float *)&v23;
    LOWORD(v23) = a4->localHistBlockSizeY;
    *(float *)&v19 = (float)v23;
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    *(float *)&v25 = v24 * *(float *)&v19;
    *((_WORD *)v10 + 7) = (int)*(float *)&v25;
    LOWORD(v25) = a4->localHistStrideX;
    *(float *)&v19 = (float)v25;
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    *(float *)&v27 = v26 * *(float *)&v19;
    *((_WORD *)v10 + 8) = (int)*(float *)&v27;
    LOWORD(v27) = a4->localHistStrideY;
    *(float *)&v19 = (float)v27;
    objc_msgSend(v8, "inputTextureDownsampleRatio");
    v28 = 0;
    *((_WORD *)v10 + 9) = (int)(float)(v29 * *(float *)&v19);
    *((_DWORD *)v10 + 5) = *(_DWORD *)&a4->localHistNumHorBlocks;
    *((_WORD *)v10 + 12) = a4->localHistCountBitShift;
    *((_DWORD *)v10 + 7) = a4->localHistogramOriginalTilePixelCount;
    *((_WORD *)v10 + 16) = a4->localHistLowThreshold;
    *((_WORD *)v10 + 17) = 0;
    *((_WORD *)v10 + 18) = a4->localHistHighThreshold;
    *(_DWORD *)((char *)v10 + 38) = 65539;
    *((_WORD *)v10 + 21) = 2;
    v30 = (char *)a4->localHistStat + 134;
    v31 = 44;
    do
    {
      v32 = 0;
      v33 = (char *)v10 + v31;
      v34 = (__int16 *)v30;
      do
      {
        *(_WORD *)&v33[v32] = *(v34 - 67);
        v35 = &v33[v32];
        *((_WORD *)v35 + 1) = *(v34 - 66);
        *((_WORD *)v35 + 2) = *(v34 - 1);
        v36 = *v34;
        v34 += 68;
        *((_WORD *)v35 + 3) = v36;
        v32 += 8;
      }
      while (v32 != 64);
      ++v28;
      v30 += 1088;
      v31 += 64;
    }
    while (v28 != 6);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, 428);
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BE11CE0]);
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v37 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  free(v10);
}

+ (void)_addSpatialCCMDataToMetadata:(id)a3 fromOutput:(sLtmComputeOutput *)a4 driverInputMetadata:(sRefDriverInputs *)a5
{
  id v7;
  void *v8;
  char *v9;
  _WORD *v10;
  uint64_t i;
  uint64_t v12;
  char *v13;
  simd_float3 v14;
  simd_float3 v15;
  simd_float3 v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  _WORD *v25;
  _WORD *v26;
  char *v27;
  uint64_t v28;
  _WORD *v29;
  _WORD *v30;
  _WORD *v31;
  _WORD *v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  _WORD *v36;
  uint64_t v37;
  _WORD *v38;
  _WORD *v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  _WORD *v43;
  char *v44;
  uint64_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  simd_float3 v55;
  simd_float3 v56;
  simd_float3 v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  simd_float3 v61;
  simd_float3 v62;
  simd_float3 v63;
  uint64_t v64;
  simd_float3x3 v65;
  simd_float3x3 v66;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (!a5->useSpatialCCM)
  {
    objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x24BE11CD8]);
    goto LABEL_21;
  }
  v9 = (char *)malloc_type_malloc(0x2898uLL, 0x75574A44uLL);
  v10 = v9;
  if (!v9)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v53 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
LABEL_24:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_19;
  }
  v54 = v8;
  *(_QWORD *)v9 = 0x360000C001003E9;
  *((_WORD *)v9 + 4) = 54;
  *(_QWORD *)(v9 + 10) = 0;
  *((_WORD *)v9 + 9) = a5->tileStatsRegionInRaw.width >> 4;
  *((_WORD *)v9 + 10) = a5->tileStatsRegionInRaw.height / 0xC;
  *((_WORD *)v9 + 11) = 4096;
  v65.columns[0].i32[3] = 0;
  v65.columns[0].f32[0] = (float)(__int16)a5->ccm.coeff[0].v16 * 0.00024414;
  v65.columns[0].f32[1] = (float)(__int16)a5->ccm.coeff[3].v16 * 0.00024414;
  v65.columns[0].f32[2] = (float)(__int16)a5->ccm.coeff[6].v16 * 0.00024414;
  v65.columns[1].i32[3] = 0;
  v65.columns[1].f32[0] = (float)(__int16)a5->ccm.coeff[1].v16 * 0.00024414;
  v65.columns[1].f32[1] = (float)(__int16)a5->ccm.coeff[4].v16 * 0.00024414;
  v65.columns[1].f32[2] = (float)(__int16)a5->ccm.coeff[7].v16 * 0.00024414;
  v65.columns[2].i32[3] = 0;
  v65.columns[2].f32[0] = (float)(__int16)a5->ccm.coeff[2].v16 * 0.00024414;
  v65.columns[2].f32[1] = (float)(__int16)a5->ccm.coeff[5].v16 * 0.00024414;
  v65.columns[2].f32[2] = (float)(__int16)a5->ccm.coeff[8].v16 * 0.00024414;
  v56 = v65.columns[1];
  v57 = v65.columns[0];
  v55 = v65.columns[2];
  v66 = __invert_f3(v65);
  for (i = 0; i != 192; ++i)
  {
    v12 = 0;
    v13 = (char *)a4 + 108 * i;
    v14.i64[0] = *(_QWORD *)(v13 + 14796);
    v15.i64[0] = *((_QWORD *)v13 + 1851);
    v16.i64[0] = *(_QWORD *)(v13 + 14820);
    v14.i64[1] = *((unsigned int *)v13 + 3701);
    v15.i64[1] = *((unsigned int *)v13 + 3704);
    v16.i64[1] = *((unsigned int *)v13 + 3707);
    v61 = v14;
    v62 = v15;
    v63 = v16;
    v58 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v12 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v66.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v12 * 4))), (float32x4_t)v66.columns[1], *(float32x2_t *)&v61.f32[v12], 1), (float32x4_t)v66.columns[2], *(float32x4_t *)((char *)&v61 + v12 * 4), 2);
      v12 += 4;
    }
    while (v12 != 12);
    v17 = 0;
    v18 = v58;
    v19 = v59;
    v20 = v60;
    v61 = v57;
    v62 = v56;
    v63 = v55;
    v58 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v17 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v17 * 4))), v19, *(float32x2_t *)&v61.f32[v17], 1), v20, *(float32x4_t *)((char *)&v61 + v17 * 4), 2);
      v17 += 4;
    }
    while (v17 != 12);
    v21 = 0;
    v22 = v58;
    v23 = v59;
    v24 = v60;
    v25 = &v10[27 * i];
    v25[14] = vcvtms_s32_f32(4096.0 * v58.f32[0]);
    v25[17] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v22.f32, 1));
    v25[20] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v22, 2));
    v25[23] = vcvtms_s32_f32(4096.0 * v23.f32[0]);
    v25[26] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v23.f32, 1));
    v25[29] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v23, 2));
    v26 = v25 + 12;
    v25[32] = vcvtms_s32_f32(4096.0 * v24.f32[0]);
    v25[35] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v24.f32, 1));
    v25[38] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v24, 2));
    v27 = (char *)a4 + 108 * i;
    v22.i64[0] = *((_QWORD *)v27 + 1854);
    v23.i64[0] = *(_QWORD *)(v27 + 14844);
    v22.i32[2] = *((_DWORD *)v27 + 3710);
    v24.i64[0] = *((_QWORD *)v27 + 1857);
    v23.i32[2] = *((_DWORD *)v27 + 3713);
    v24.i32[2] = *((_DWORD *)v27 + 3716);
    v61 = (simd_float3)v22;
    v62 = (simd_float3)v23;
    v63 = (simd_float3)v24;
    v58 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v21 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v66.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v21 * 4))), (float32x4_t)v66.columns[1], *(float32x2_t *)&v61.f32[v21], 1), (float32x4_t)v66.columns[2], *(float32x4_t *)((char *)&v61 + v21 * 4), 2);
      v21 += 4;
    }
    while (v21 != 12);
    v28 = 0;
    v29 = &v10[27 * i];
    v30 = v29 + 15;
    v31 = v29 + 21;
    v32 = v29 + 27;
    v33 = v58;
    v34 = v59;
    v35 = v60;
    v36 = v29 + 33;
    v61 = v57;
    v62 = v56;
    v63 = v55;
    v58 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v28 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v33, COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v28 * 4))), v34, *(float32x2_t *)&v61.f32[v28], 1), v35, *(float32x4_t *)((char *)&v61 + v28 * 4), 2);
      v28 += 4;
    }
    while (v28 != 12);
    v37 = 0;
    v38 = &v10[27 * i];
    v39 = v38 + 24;
    v40 = v58;
    v41 = v59;
    v42 = v60;
    v26[1] = vcvtms_s32_f32(4096.0 * v58.f32[0]);
    v38[16] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v40.f32, 1));
    v38[19] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v40, 2));
    v38[22] = vcvtms_s32_f32(4096.0 * v41.f32[0]);
    v38[25] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v41.f32, 1));
    v38[28] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v41, 2));
    v43 = v38 + 36;
    v38[31] = vcvtms_s32_f32(4096.0 * v42.f32[0]);
    v38[34] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v42.f32, 1));
    v38[37] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v42, 2));
    v44 = (char *)a4 + 108 * i;
    v40.i64[0] = *(_QWORD *)(v44 + 14868);
    v41.i64[0] = *((_QWORD *)v44 + 1860);
    v42.i64[0] = *(_QWORD *)(v44 + 14892);
    v40.i32[2] = *((_DWORD *)v44 + 3719);
    v41.i32[2] = *((_DWORD *)v44 + 3722);
    v42.i32[2] = *((_DWORD *)v44 + 3725);
    v61 = (simd_float3)v40;
    v62 = (simd_float3)v41;
    v63 = (simd_float3)v42;
    v58 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v37 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v66.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v37 * 4))), (float32x4_t)v66.columns[1], *(float32x2_t *)&v61.f32[v37], 1), (float32x4_t)v66.columns[2], *(float32x4_t *)((char *)&v61 + v37 * 4), 2);
      v37 += 4;
    }
    while (v37 != 12);
    v45 = 0;
    v46 = v58;
    v47 = v59;
    v48 = v60;
    v61 = v57;
    v62 = v56;
    v63 = v55;
    v58 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    do
    {
      *(float32x4_t *)((char *)&v58 + v45 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v46, COERCE_FLOAT(*(_OWORD *)((char *)&v61 + v45 * 4))), v47, *(float32x2_t *)&v61.f32[v45], 1), v48, *(float32x4_t *)((char *)&v61 + v45 * 4), 2);
      v45 += 4;
    }
    while (v45 != 12);
    v49 = v58;
    v50 = v59;
    v51 = v60;
    *v26 = vcvtms_s32_f32(4096.0 * v58.f32[0]);
    *v30 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v49.f32, 1));
    v10[27 * i + 18] = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v49, 2));
    *v31 = vcvtms_s32_f32(4096.0 * v50.f32[0]);
    *v39 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v50.f32, 1));
    *v32 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v50, 2));
    v10[27 * i + 30] = vcvtms_s32_f32(4096.0 * v51.f32[0]);
    *v36 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, *(float32x2_t *)v51.f32, 1));
    *v43 = vcvtms_s32_f32(vmuls_lane_f32(4096.0, v51, 2));
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, 10392, 14888, 14900);
  v52 = objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v53 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    v8 = v54;
    goto LABEL_24;
  }
  v53 = v52;
  v8 = v54;
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v52, *MEMORY[0x24BE11CD8]);
LABEL_19:

  free(v10);
LABEL_21:

}

+ (void)_addGlobalLTMLookUpTableAlignedToFinalCropRect:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v3, "numberWithBool:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE11AB0]);

}

@end
