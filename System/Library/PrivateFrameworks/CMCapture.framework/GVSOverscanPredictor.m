@implementation GVSOverscanPredictor

- (GVSOverscanPredictor)initWithConfig:(VISOverscanPredictorConfiguration)a3 cameraInfoByPortType:(id)a4 visInputPixelBufferAttributes:(id)a5
{
  void *v5;
  void *v6;
  id v9;
  id v10;
  GVSOverscanPredictor *v11;
  float32x2_t *v12;
  double v13;
  VISRotationCorrectionEstimator *v14;
  double v15;
  uint64_t v16;
  void *v17;
  float32x2_t v18;
  GVSOverscanPredictor *v19;
  objc_super v21;

  v6 = v5;
  v9 = a5;
  v10 = v6;
  v21.receiver = self;
  v21.super_class = (Class)GVSOverscanPredictor;
  v11 = -[GVSOverscanPredictor init](&v21, sel_init);
  v12 = (float32x2_t *)v11;
  if (v11)
  {
    *(_QWORD *)v11->_margin = *((_QWORD *)a4 + 1);
    v13 = *((float *)a4 + 4);
    v11->_detectionTimeoutSeconds = v13;
    v11->_resetTimeoutSeconds = v13;
    v14 = [VISRotationCorrectionEstimator alloc];
    LODWORD(v15) = *(_DWORD *)a4;
    v16 = -[VISRotationCorrectionEstimator initWithTimeScale:](v14, "initWithTimeScale:", v15);
    v17 = (void *)v12[11];
    v12[11] = (float32x2_t)v16;

    if (!*(_QWORD *)&v12[11]
      || !FigCFDictionaryGetInt32IfPresent()
      || !FigCFDictionaryGetInt32IfPresent())
    {
      goto LABEL_14;
    }
    v12[2] = 0;
    v12[3] = vmul_f32(vcvt_f32_s32(vadd_s32(0, (int32x2_t)-1)), (float32x2_t)0x3F0000003F000000);
    v18 = v12[1];
    if (v18.f32[0] < 0.0)
    {
      v18.f32[0] = (float)0 * 8388600.0;
      v12[1] = v18;
    }
    if (v18.f32[1] < 0.0)
    {
      v18.f32[1] = (float)0 * 8388600.0;
      v12[1] = v18;
    }
    -[float32x2_t resetAndClear](v12, "resetAndClear");
    if (-[float32x2_t parseCameraInfoByPortType:](v12, "parseCameraInfoByPortType:", v9)
      || !*(_QWORD *)&v12[12])
    {
LABEL_14:
      fig_log_get_emitter();
      FigDebugAssert3();
      v19 = 0;
      goto LABEL_13;
    }
    objc_storeStrong((id *)&v12[10], (id)*MEMORY[0x1E0D05A18]);
    -[float32x2_t setCameraAlignmentForPortType:](v12, "setCameraAlignmentForPortType:", *(_QWORD *)&v12[10]);
  }
  v19 = v12;
LABEL_13:

  return v19;
}

- (int)parseCameraInfoByPortType:(id)a3
{
  id v3;
  void *v4;
  void *pixelSizeByPortType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  NSDictionary *v16;
  int v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "allKeys");
  pixelSizeByPortType = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(pixelSizeByPortType, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x1E0D05968];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(pixelSizeByPortType);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13 || (objc_msgSend(v13, "floatValue"), v15 <= 0.0))
        {
          fig_log_get_emitter();
          FigDebugAssert3();

          v17 = -12780;
          goto LABEL_12;
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

      }
      v7 = objc_msgSend(pixelSizeByPortType, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = v4;
  v17 = 0;
  pixelSizeByPortType = self->_pixelSizeByPortType;
  self->_pixelSizeByPortType = v16;
LABEL_12:

  return v17;
}

- (void)setCameraAlignmentForPortType:(id)a3
{
  int8x16_t v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0)
  {
    v4 = (int8x16_t)xmmword_1A32B17F0;
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D05A50]))
      v5 = -1;
    else
      v5 = 0;
    v4 = vbslq_s8((int8x16_t)vdupq_n_s32(v5), (int8x16_t)xmmword_1A32B17F0, (int8x16_t)xmmword_1A32B1800);
  }
  *(int8x16_t *)self->_anon_20 = v4;

}

- (void)resetAndClear
{
  self->_latestSampleTimestamp = 0.0;
  *(_OWORD *)self->_estimatedCorrection = 0u;
  *(_OWORD *)self->_estimatedOverscan = 0u;
  -[GVSOverscanPredictor resetPrediction](self, "resetPrediction");
  -[VISRotationCorrectionEstimator reset](self->_visEstimator, "reset");
}

- (void)resetPrediction
{
  self->_overscanFitsTimestamp = -1.0;
}

- (int)computeFocalLength:(float *)a3 fromMetadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  int32x2_t v12;
  int v13;
  float v14;
  float v15;
  float v16;
  int32x2_t v18;
  float v19;

  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_pixelSizeByPortType, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (v7 && (objc_msgSend(v7, "floatValue"), v10 > 0.0) && v8 && v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)objc_msgSend(v11, "intValue") < 1)
        v12 = (int32x2_t)0x100000001;
      else
        v12 = vdup_n_s32(objc_msgSend(v11, "intValue"));
      v18 = v12;

      v19 = 1.0;
      v13 = FigMotionComputeLensPositionScalingFactor((const __CFDictionary *)v6, *(_QWORD *)self->_imageSize, HIDWORD(*(_QWORD *)self->_imageSize), v18.i32[0], v18.u32[1], &v19);
      if (v13)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        objc_msgSend(v7, "floatValue");
        v15 = v14;
        objc_msgSend(v9, "floatValue");
        *a3 = (float)(v15 / v16) * v19;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v13 = -12780;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = -12782;
  }

  return v13;
}

- (__n64)estimateOverscanUseFromRotation:(float32x4_t)a3 focalLength:(float32x4_t)a4 cornerCoords:
{
  float32x2_t v4;
  float v5;
  float32x4_t v6;
  float v7;
  float v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v16;
  float32x4_t v17;
  int8x16_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  __n64 result;

  v4 = vrecpe_f32((float32x2_t)a2.u32[0]);
  LODWORD(v5) = vmul_f32(v4, vrecps_f32((float32x2_t)a2.u32[0], v4)).u32[0];
  v4.i32[0] = a1.n128_i32[2];
  v6 = vmulq_n_f32(a3, v5);
  v7 = vminvq_f32(a3);
  v8 = vmaxvq_f32(a3);
  v9 = vmlaq_lane_f32(vmlsq_lane_f32(a3, a4, v4, 0), (float32x4_t)vdupq_lane_s32(a2, 0), (float32x2_t)a1.n128_u64[0], 1);
  v10 = vmulq_n_f32(a4, v5);
  __asm { FMOV            V4.4S, #1.0 }
  v16 = vmlaq_n_f32(_Q4, v10, a1.n128_f32[0]);
  a1.n128_u32[0] = a1.n128_u32[1];
  v17 = vmlsq_lane_f32(v16, v6, (float32x2_t)a1.n128_u64[0], 0);
  v10.i64[0] = 0x3400000034000000;
  v10.i64[1] = 0x3400000034000000;
  v18 = (int8x16_t)vmaxnmq_f32(vabsq_f32(v17), v10);
  v10.i64[0] = 0x8000000080000000;
  v10.i64[1] = 0x8000000080000000;
  v19 = (float32x4_t)vbslq_s8((int8x16_t)v10, (int8x16_t)v17, v18);
  v20 = vrecpeq_f32(v19);
  v21 = vmulq_f32(v9, vmulq_f32(v20, vrecpsq_f32(v19, v20)));
  result.n64_f32[0] = v7 - vminvq_f32(v21);
  result.n64_f32[1] = vmaxvq_f32(v21) - v8;
  return result;
}

- (int)estimateOverscanUseFromMetadata:(id)a3 finalCropRect:(CGRect)a4
{
  id v5;
  void *v6;
  char v7;
  int MotionDataFromISP;
  int v9;
  int v10;
  uint64_t v11;
  double latestSampleTimestamp;
  double *p_timestamp;
  float32x4_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float32x4_t v19;
  int32x4_t v20;
  int8x16_t v21;
  float32x4_t v22;
  float32x4_t v23;
  __int128 v24;
  float32x4_t v25;
  int v26;
  float32x4_t v28;
  int v29;
  int v30;

  v5 = a3;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0D06B68]);

  if ((v7 & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = -12780;
    goto LABEL_13;
  }
  v30 = 0;
  MotionDataFromISP = FigMotionGetMotionDataFromISP((CFDictionaryRef)v5, (float64x2_t *)self->_rawQuaternionArray, 0, 36, &v30, 0, 0, 0, 0);
  if (MotionDataFromISP)
  {
    v26 = MotionDataFromISP;
    fig_log_get_emitter();
LABEL_18:
    FigDebugAssert3();
    goto LABEL_13;
  }
  if (v30 <= 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v26 = 0;
    goto LABEL_13;
  }
  v29 = 0;
  v9 = -[GVSOverscanPredictor computeFocalLength:fromMetadata:](self, "computeFocalLength:fromMetadata:", &v29, v5);
  if (v9)
  {
    v26 = v9;
    fig_log_get_emitter();
    goto LABEL_18;
  }
  v10 = v30;
  if (v30 < 1)
  {
    v14 = 0uLL;
  }
  else
  {
    v11 = 0;
    latestSampleTimestamp = self->_latestSampleTimestamp;
    p_timestamp = &self->_rawQuaternionArray[0].timestamp;
    v14 = 0uLL;
    do
    {
      if (*p_timestamp > latestSampleTimestamp)
      {
        v28 = v14;
        v15 = p_timestamp[2];
        v16 = p_timestamp[3];
        v17 = p_timestamp[4];
        v18 = p_timestamp[1];
        v19 = *(float32x4_t *)self->_anon_20;
        v20 = (int32x4_t)vnegq_f32(v19);
        v21 = (int8x16_t)vtrn2q_s32((int32x4_t)v19, vtrn1q_s32((int32x4_t)v19, v20));
        v22 = vmlaq_n_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)v20, 8uLL), v16), (float32x4_t)vextq_s8(v21, v21, 8uLL), v15);
        v23 = (float32x4_t)vrev64q_s32((int32x4_t)v19);
        v23.i32[0] = v20.i32[1];
        v23.i32[3] = v20.i32[2];
        -[VISRotationCorrectionEstimator updateWithRotation:atTime:](self->_visEstimator, "updateWithRotation:atTime:", *(double *)vaddq_f32(v22, vmlaq_n_f32(vmulq_n_f32(v19, v18), v23, v17)).i64, *p_timestamp);
        -[VISRotationCorrectionEstimator estimatedCorrection](self->_visEstimator, "estimatedCorrection");
        *(_OWORD *)self->_estimatedCorrection = v24;
        -[GVSOverscanPredictor estimateOverscanUseFromRotation:focalLength:cornerCoords:](self, "estimateOverscanUseFromRotation:focalLength:cornerCoords:");
        v14 = vmaxnmq_f32(v28, v25);
        latestSampleTimestamp = *p_timestamp;
        self->_latestSampleTimestamp = *p_timestamp;
        v10 = v30;
      }
      ++v11;
      p_timestamp += 6;
    }
    while (v11 < v10);
  }
  v26 = 0;
  *(float32x4_t *)self->_estimatedOverscan = v14;
LABEL_13:

  return v26;
}

- (BOOL)predictOverscanFitsFromMetadata:(id)a3 finalCropRect:(CGRect)a4 boundingRect:(CGRect)a5
{
  uint64_t v5;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  int32x4_t v20;
  double overscanFitsTimestamp;
  float32x4_t v22;
  float v23;
  float v24;
  float32x4_t v25;
  float v26;
  double latestSampleTimestamp;
  BOOL v28;
  int v30;
  uint64_t v31;
  uint64_t v32;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v15 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0D06B68]);

  if ((v18 & 1) == 0 || !v16)
    goto LABEL_16;
  if (!-[NSString isEqualToString:](self->_previousPort, "isEqualToString:", v16))
  {
    -[GVSOverscanPredictor setCameraAlignmentForPortType:](self, "setCameraAlignmentForPortType:", v16);
    objc_storeStrong((id *)&self->_previousPort, v16);
  }
  v19 = -[GVSOverscanPredictor estimateOverscanUseFromMetadata:finalCropRect:](self, "estimateOverscanUseFromMetadata:finalCropRect:", v15, v13, v12, v11, v10);
  if (v19)
  {
    v30 = v19;
    fig_log_get_emitter();
    v32 = v5;
    LODWORD(v31) = v30;
LABEL_17:
    FigDebugAssert3();
    -[GVSOverscanPredictor resetPrediction](self, "resetPrediction", v31, v32);
    v28 = 0;
    goto LABEL_12;
  }
  overscanFitsTimestamp = self->_overscanFitsTimestamp;
  if (overscanFitsTimestamp < 0.0)
  {
    overscanFitsTimestamp = self->_latestSampleTimestamp + self->_resetTimeoutSeconds;
    self->_overscanFitsTimestamp = overscanFitsTimestamp;
  }
  v22.f32[0] = v13 - x;
  *(float *)v20.i32 = v12 - y;
  v23 = width - v11;
  v24 = height - v10;
  v22.f32[1] = v23 - v22.f32[0];
  v22.i64[1] = __PAIR64__(v24 - *(float *)v20.i32, v20.u32[0]);
  v20.i64[0] = *(_QWORD *)self->_margin;
  v25 = vsubq_f32(v22, (float32x4_t)vzip1q_s32(v20, v20));
  if (vminvq_f32(v25) <= 0.0)
  {
LABEL_16:
    fig_log_get_emitter();
    v32 = v5;
    LODWORD(v31) = 0;
    goto LABEL_17;
  }
  v26 = vminvq_f32(vsubq_f32(v25, *(float32x4_t *)self->_estimatedOverscan));
  latestSampleTimestamp = self->_latestSampleTimestamp;
  if (v26 <= 0.0)
  {
    overscanFitsTimestamp = fmax(overscanFitsTimestamp, latestSampleTimestamp + self->_detectionTimeoutSeconds);
    self->_overscanFitsTimestamp = overscanFitsTimestamp;
  }
  v28 = latestSampleTimestamp > overscanFitsTimestamp;
LABEL_12:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelSizeByPortType, 0);
  objc_storeStrong((id *)&self->_visEstimator, 0);
  objc_storeStrong((id *)&self->_previousPort, 0);
}

@end
