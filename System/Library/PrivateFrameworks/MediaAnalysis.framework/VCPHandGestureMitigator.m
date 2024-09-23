@implementation VCPHandGestureMitigator

+ (float)getMinHandFaceRatio
{
  return 1.2;
}

+ (float)getFaceExtensionRatio
{
  return 0.4;
}

+ (float)getPalmMoveDistanceThreshold
{
  return 0.2;
}

+ (float)getPalmScaleChangeThreshold
{
  return 0.8;
}

+ (float)getHandMotionLookBackDuration
{
  return 0.601;
}

+ (float)getGestureTypeConsistencyLookBackDuration
{
  return 0.5;
}

+ (float)getMinTiltingAngle
{
  return 0.16;
}

+ (float)getMinTiltingThumbAngle
{
  return 0.25;
}

- (VCPHandGestureMitigator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VCPHandGestureMitigator;
  return -[VCPHandGestureMitigator init](&v3, sel_init);
}

- (BOOL)checkHandGestureJitter:(id)a3 forHand:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  int rotationInDegrees;
  VCPHandObservation *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  VCPKeypoint *v20;
  double v21;
  VCPKeypoint *v22;
  double v23;
  VCPKeypoint *v24;
  double v25;
  VCPKeypoint *v26;
  double v27;
  float v28;
  int v29;
  float32x2_t v30;
  float v31;
  float32x2_t v32;
  float v33;
  char v34;
  BOOL v36;
  id v37;
  id v38;
  unint64_t v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  v39 = 1;
  do
  {
    v5 = objc_msgSend(v38, "count");
    v6 = objc_msgSend(&unk_1E6B766B0, "count");
    v7 = v6 >= v5 ? v5 : v6;
    v36 = v7 > v39;
    if (v7 <= v39)
      break;
    objc_msgSend(v38, "objectAtIndexedSubscript:", v39 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v37);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "objectAtIndexedSubscript:", v39);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !v41)
    {

      v36 = 0;
      break;
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = objc_msgSend(&unk_1E6B766C8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v43 != v12)
            objc_enumerationMutation(&unk_1E6B766C8);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "intValue");
          rotationInDegrees = self->_rotationInDegrees;
          v16 = v41;
          objc_msgSend(v10, "keypoints");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPHandObservation keypoints](v16, "keypoints");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (!v17)
            goto LABEL_16;
          if (!v18)
            goto LABEL_16;
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v20 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
          v21 = keyPointPosition(v20, rotationInDegrees);

          objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
          v22 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
          v23 = keyPointPosition(v22, rotationInDegrees);

          objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
          v24 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
          v25 = keyPointPosition(v24, rotationInDegrees);

          objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
          v26 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
          v27 = keyPointPosition(v26, rotationInDegrees);

          v28 = palmScale(v16, rotationInDegrees);
          if (v28 >= 0.0)
          {
            v29 = MediaAnalysisLogLevel();
            v30 = vsub_f32(*(float32x2_t *)&v23, *(float32x2_t *)&v21);
            v31 = sqrtf(vaddv_f32(vmul_f32(v30, v30)));
            v32 = vsub_f32(*(float32x2_t *)&v25, *(float32x2_t *)&v27);
            v33 = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
            if (v29 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218496;
              v48 = v31;
              v49 = 2048;
              v50 = v33;
              v51 = 2048;
              v52 = v28;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest : jittering logic distance1 %f distance2 %f, palmScale %f", buf, 0x20u);
            }

            if (vabds_f32(v31, v33) > (float)(v28 * 0.8))
            {
              v34 = 0;
              goto LABEL_25;
            }
          }
          else
          {
LABEL_16:

          }
        }
        v11 = objc_msgSend(&unk_1E6B766C8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v11)
          continue;
        break;
      }
    }
    v34 = 1;
LABEL_25:

    ++v39;
  }
  while ((v34 & 1) != 0);

  return v36;
}

- (BOOL)checkHandHoldObject:(id)a3 forHand:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  v7 = 0;
  while (objc_msgSend(v5, "count") > v7)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    objc_msgSend(v9, "holdObject");
    v11 = v10;

    ++v7;
    if (v11 >= 0.975)
    {
      v12 = 1;
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)handsOverlap:(id)a3 pairedHand:(id)a4
{
  int32x2_t v4;
  int32x2_t v5;
  VCPHandObservation *v8;
  VCPHandObservation *v9;
  VCPHandObservation *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  float v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  VCPKeypoint *v26;
  VCPKeypoint *v27;
  float v28;
  float32x2_t v29;
  float32x2_t v30;
  int32x2_t v31;
  float v32;
  float32x2_t v33;
  float32x2_t v34;
  int32x2_t v35;
  float v36;
  float v37;
  float v38;
  float32x2_t v39;
  float v40;
  int v42;
  int32x2_t v44;
  int32x2_t v45;
  int32x2_t v46;
  float32x2_t v47;
  int32x2_t v48;
  float v49;
  int32x2_t v50;
  float32x2_t v51;
  int32x2_t v52;
  float v53;
  uint8_t buf[4];
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = (VCPHandObservation *)a3;
  v9 = (VCPHandObservation *)a4;
  v10 = v9;
  v11 = 0;
  if (!v8 || !v9)
    goto LABEL_40;
  +[VCPHandObservation twoHandGestureTypes](VCPHandObservation, "twoHandGestureTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPHandObservation gestureType](v8, "gestureType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "containsObject:", v13))
  {

  }
  else
  {
    +[VCPHandObservation twoHandGestureTypes](VCPHandObservation, "twoHandGestureTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPHandObservation gestureType](v10, "gestureType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    v17 = 0.0;
    if (!v16)
      goto LABEL_7;
  }
  v17 = 0.2;
LABEL_7:
  -[VCPHandObservation keypoints](v8, "keypoints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPHandObservation keypoints](v10, "keypoints");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v11 = 0;
  if (v18 && v19)
  {
    v21 = 0;
    v52 = 0;
    __asm { FMOV            V0.2S, #1.0 }
    v50 = _D0;
    v46 = _D0;
    v48 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v21, *(_QWORD *)&v44);
      v26 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v45 = COERCE_INT32X2_T(keyPointPosition(v26, self->_rotationInDegrees));

      objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
      v27 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v44 = COERCE_INT32X2_T(keyPointPosition(v27, self->_rotationInDegrees));

      if ((vcgt_f32((float32x2_t)v45, (float32x2_t)v50).u8[0] & 1) != 0)
        v28 = *(float *)v50.i32;
      else
        v28 = *(float *)v45.i32;
      if ((vcgt_f32((float32x2_t)v45, (float32x2_t)v52).u8[0] & 1) != 0)
        v4.i32[0] = v45.i32[0];
      else
        v4.i32[0] = v52.i32[0];
      if ((vcgt_f32((float32x2_t)v44, (float32x2_t)v46).u8[0] & 1) != 0)
        v5.i32[0] = v46.i32[0];
      else
        v5.i32[0] = v44.i32[0];
      v29 = (float32x2_t)vzip2_s32(v46, v50);
      v30 = (float32x2_t)vzip2_s32(v44, v45);
      v31 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v30, v29), (int8x8_t)v29, (int8x8_t)v30);
      v50 = (int32x2_t)__PAIR64__(v31.u32[1], LODWORD(v28));
      if ((vcgt_f32((float32x2_t)v44, (float32x2_t)v48).u8[0] & 1) != 0)
        v32 = *(float *)v44.i32;
      else
        v32 = *(float *)v48.i32;
      v33 = (float32x2_t)vzip2_s32(v52, v48);
      v34 = (float32x2_t)vzip2_s32(v45, v44);
      v35 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v33), (int8x8_t)v34, (int8x8_t)v33);
      v52 = vzip1_s32(v4, v35);
      v46 = vzip1_s32(v5, v31);
      v48 = (int32x2_t)__PAIR64__(v35.u32[1], LODWORD(v32));
      ++v21;
    }
    while (v21 != 21);
    v47 = (float32x2_t)v35;
    v49 = v32;
    v51 = (float32x2_t)v31;
    v53 = v28;
    v36 = palmScale(v8, self->_rotationInDegrees);
    v37 = (float)(v36 + palmScale(v10, self->_rotationInDegrees)) * 0.5;
    if ((float)(*(float *)v4.i32 - *(float *)v5.i32) >= (float)(v49 - v53))
      v38 = v49 - v53;
    else
      v38 = *(float *)v4.i32 - *(float *)v5.i32;
    v39 = vsub_f32(v47, v51);
    if (v39.f32[0] >= v39.f32[1])
      v40 = v39.f32[1];
    else
      v40 = v39.f32[0];
    if (v38 < (float)(v17 * v37) || v40 < (float)(v17 * v37))
    {
      v11 = 0;
    }
    else
    {
      v42 = MediaAnalysisLogLevel();
      if (v42 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        v55 = v38;
        v56 = 2048;
        v57 = v40;
        v58 = 2048;
        v59 = v37;
        v60 = 2048;
        v61 = v17;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Hands overlaps, XminOverlapAmount %f, YminOverlapAmount %f, avgPalmScale %f, thresh %f", buf, 0x2Au);
      }
      v11 = 1;
    }
  }

LABEL_40:
  return v11;
}

- (BOOL)handsTooClose:(id)a3 pairedHand:(id)a4
{
  VCPHandObservation *v6;
  VCPHandObservation *v7;
  VCPHandObservation *v8;
  BOOL v9;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float32x2_t v18;
  float v19;
  float v20;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (VCPHandObservation *)a3;
  v7 = (VCPHandObservation *)a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (-[VCPHandObservation gestureType](v6, "gestureType") == 13
      || -[VCPHandObservation gestureType](v6, "gestureType") == 17
      || -[VCPHandObservation gestureType](v8, "gestureType") == 13
      || -[VCPHandObservation gestureType](v8, "gestureType") == 17)
    {
      goto LABEL_7;
    }
    if (-[VCPHandGestureMitigator handsOverlap:pairedHand:](self, "handsOverlap:pairedHand:", v6, v8))
    {
      if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        goto LABEL_18;
      LOWORD(v21) = 0;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Hands are too close due to overlapping";
      v13 = 2;
    }
    else
    {
      v14 = palmCenter(v6, self->_rotationInDegrees);
      v15 = palmCenter(v8, self->_rotationInDegrees);
      v16 = palmScale(v6, self->_rotationInDegrees);
      v17 = palmScale(v8, self->_rotationInDegrees);
      v18 = vsub_f32(*(float32x2_t *)&v14, *(float32x2_t *)&v15);
      v19 = sqrtf(vaddv_f32(vmul_f32(v18, v18)));
      v20 = (float)(v16 + v17) * 0.5;
      if (v19 >= (float)(v20 * 0.5))
      {
LABEL_7:
        v9 = 0;
        goto LABEL_8;
      }
      if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
LABEL_18:
        v9 = 1;
        goto LABEL_8;
      }
      v21 = 134218240;
      v22 = v19;
      v23 = 2048;
      v24 = v20;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Hands are too close in palmDistance %f, avgPlmScale %f";
      v13 = 22;
    }
    _os_log_impl(&dword_1B6C4A000, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v21, v13);
    goto LABEL_18;
  }
LABEL_8:

  return v9;
}

- (BOOL)checkHandGestureTemporalInconsistency:(id)a3 forHand:(id)a4
{
  id v5;
  id v6;
  float v7;
  unsigned int v8;
  int v9;
  uint64_t i;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "getGestureTypeConsistencyLookBackDuration");
  v8 = vcvtms_s32_f32(v7 * 5.0);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v19[0] = 67109120;
    v19[1] = v8;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "checkHandGestureTemporalInconsistency: frameChannelLookBackCount %d", (uint8_t *)v19, 8u);
  }
  v9 = ~v8;
  for (i = (int)objc_msgSend(v5, "count") - 2; ; --i)
  {
    v11 = objc_msgSend(v5, "count");
    v12 = (v11 + v9) & ~((v11 + v9) >> 31);
    if (i + 1 <= v12)
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectAtIndexedSubscript:", i + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16 || !v14 || (v17 = objc_msgSend(v16, "gestureType"), v17 != objc_msgSend(v14, "gestureType")))
    {

      break;
    }

  }
  return i + 1 > v12;
}

- (BOOL)checkHandGestureGlobalMotion:(id)a3 forHand:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  unsigned int v14;
  int v15;
  uint64_t i;
  int v17;
  void *v18;
  VCPHandObservation *v19;
  void *v20;
  VCPHandObservation *v21;
  double v22;
  double v23;
  float v24;
  float v25;
  float32x2_t v26;
  float v27;
  float v28;
  float v29;
  uint64_t j;
  int v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float32x2_t v38;
  float v39;
  float v40;
  float v41;
  NSObject *v42;
  const char *v43;
  BOOL v44;
  int v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "getHandMotionLookBackDuration");
  v9 = v8;
  objc_msgSend((id)objc_opt_class(), "getPalmScaleChangeThreshold");
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "getPalmMoveDistanceThreshold");
  v13 = v12;
  v14 = vcvtms_s32_f32(v9 * 5.0);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v46 = 67109120;
    LODWORD(v47) = v14;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "checkHandGestureGlobalMotion: frameChannelLookBackCount %d", (uint8_t *)&v46, 8u);
  }
  v15 = ~v14;
  for (i = (int)objc_msgSend(v6, "count") - 2; ; --i)
  {
    v17 = objc_msgSend(v6, "count");
    if (i + 1 <= ((v17 + v15) & ~((v17 + v15) >> 31)))
      break;
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v7);
    v19 = (VCPHandObservation *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", i + 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v7);
    v21 = (VCPHandObservation *)objc_claimAutoreleasedReturnValue();

    if (!v21 || !v19)
      goto LABEL_32;
    v22 = palmCenter(v21, self->_rotationInDegrees);
    v23 = palmCenter(v19, self->_rotationInDegrees);
    v24 = palmScale(v19, self->_rotationInDegrees);
    v25 = palmScale(v21, self->_rotationInDegrees);
    v26 = vsub_f32(*(float32x2_t *)&v22, *(float32x2_t *)&v23);
    v27 = sqrtf(vaddv_f32(vmul_f32(v26, v26)));
    v28 = vabds_f32(v25, v24);
    if (v24 >= v25)
      v29 = v25;
    else
      v29 = v24;
    if (v28 > (float)(v11 * v29) || v27 > (float)(v13 * v24))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v46 = 134219264;
        v47 = v11;
        v48 = 2048;
        v49 = v13;
        v50 = 2048;
        v51 = v28;
        v52 = 2048;
        v53 = v27;
        v54 = 2048;
        v55 = v24;
        v56 = 2048;
        v57 = v25;
        v42 = MEMORY[0x1E0C81028];
        v43 = "Global motion (consecutive): thresh_scale %f, thresh_dist %f, palmScaleChange %f, palmCenterChange %f, pal"
              "mScaleRef %f, palmScaleCur %f";
LABEL_31:
        _os_log_impl(&dword_1B6C4A000, v42, OS_LOG_TYPE_DEBUG, v43, (uint8_t *)&v46, 0x3Eu);
        goto LABEL_32;
      }
      goto LABEL_32;
    }

  }
  for (j = (int)(objc_msgSend(v6, "count") - 2); ; --j)
  {
    v31 = objc_msgSend(v6, "count");
    if (j < ((v31 + v15) & ~((v31 + v15) >> 31)))
    {
      v44 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", (int)(objc_msgSend(v6, "count") - 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v7);
    v19 = (VCPHandObservation *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", j);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v7);
    v21 = (VCPHandObservation *)objc_claimAutoreleasedReturnValue();

    if (!v21 || !v19)
      goto LABEL_32;
    v34 = palmCenter(v21, self->_rotationInDegrees);
    v35 = palmCenter(v19, self->_rotationInDegrees);
    v36 = palmScale(v19, self->_rotationInDegrees);
    v37 = palmScale(v21, self->_rotationInDegrees);
    v38 = vsub_f32(*(float32x2_t *)&v34, *(float32x2_t *)&v35);
    v39 = sqrtf(vaddv_f32(vmul_f32(v38, v38)));
    v40 = vabds_f32(v37, v36);
    v41 = v36 >= v37 ? v37 : v36;
    if (v40 > (float)(v11 * v41) || v39 > (float)(v13 * v36))
      break;

  }
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v46 = 134219264;
    v47 = v11;
    v48 = 2048;
    v49 = v13;
    v50 = 2048;
    v51 = v40;
    v52 = 2048;
    v53 = v39;
    v54 = 2048;
    v55 = v36;
    v56 = 2048;
    v57 = v37;
    v42 = MEMORY[0x1E0C81028];
    v43 = "Global motion (buffer head): thresh_scale %f, thresh_dist %f, palmScaleChange %f, palmCenterChange %f, palmSca"
          "leRef %f, palmScaleCur %f";
    goto LABEL_31;
  }
LABEL_32:

  v44 = 1;
LABEL_33:

  return v44;
}

- (BOOL)mitigateWithFingerTiltingForHand:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  BOOL v14;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "getMinTiltingAngle");
  v6 = v5 * 3.14159265;
  if (objc_msgSend(v4, "gestureType") == 9)
  {
    +[VCPHandGestureImageRequest tiltingAngleForHand:srcKeypointType:dstKeypointType:rotationInDegrees:](VCPHandGestureImageRequest, "tiltingAngleForHand:srcKeypointType:dstKeypointType:rotationInDegrees:", v4, 4, 3, self->_rotationInDegrees);
  }
  else
  {
    if (objc_msgSend(v4, "gestureType") == 12)
    {
      objc_msgSend((id)objc_opt_class(), "getMinTiltingThumbAngle");
      v9 = v8;
      +[VCPHandGestureImageRequest tiltingAngleForHand:srcKeypointType:dstKeypointType:rotationInDegrees:](VCPHandGestureImageRequest, "tiltingAngleForHand:srcKeypointType:dstKeypointType:rotationInDegrees:", v4, 4, 3, self->_rotationInDegrees);
      v11 = v10;
      v12 = v9 * 3.14159265;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "mitigateWithFingerTiltingForHand: tiltingAngle %f, threshold %f", (uint8_t *)&v16, 0x16u);
      }
      v13 = v11 < v12;
      goto LABEL_12;
    }
    if (objc_msgSend(v4, "gestureType") != 2 && objc_msgSend(v4, "gestureType") != 7)
    {
      v14 = 0;
      goto LABEL_15;
    }
    +[VCPHandGestureImageRequest tiltingAngleForHand:srcKeypointType:dstKeypointType:rotationInDegrees:](VCPHandGestureImageRequest, "tiltingAngleForHand:srcKeypointType:dstKeypointType:rotationInDegrees:", v4, 8, 5, self->_rotationInDegrees);
  }
  v13 = v7 < v6;
LABEL_12:
  v14 = v13;
LABEL_15:

  return v14;
}

- (BOOL)mitigateWithFingerOpennessForHand:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  __CFString **v7;
  __CFString *v8;
  unsigned int v9;
  char v10;
  BOOL v11;
  NSObject *v12;
  const char *v13;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "heuristicFingerOpenness:rotationInDegrees:", v4, self->_rotationInDegrees);
  objc_msgSend(v4, "setFingerOpenness:", v5);
  v6 = objc_msgSend(v4, "chirality");
  v7 = VCPGestureLeftHandKey;
  if (v6 != -1)
    v7 = &VCPGestureRightHandKey;
  v8 = *v7;
  if ((objc_msgSend(v4, "gestureType") == 9 || objc_msgSend(v4, "gestureType") == 12)
    && ((v9 = objc_msgSend((id)objc_opt_class(), "heuristicIsThumbOpenWide:rotationInDegrees:isRelaxed:", v4, self->_rotationInDegrees, objc_msgSend(v4, "gestureType") == 12), objc_msgSend(v4, "setFingerOpenness:", v5 & 0xFFFFFFFFFFFFFFFELL | v9), (v5 & 0xFFFFFFFFFFFFFFFELL) == 0)? (v10 = v9): (v10 = 0), (v10 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out %@ hand thumbs up/down with finger openness heuristic constraints", v15, 0xCu);
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v4, "gestureType") == 2)
  {
    if (v5 != 6)
    {
      if ((int)MediaAnalysisLogLevel() < 6 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_24;
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v8;
      v12 = MEMORY[0x1E0C81028];
      v13 = "VCPHandGestureVideoRequest : gate out %@ hand victory with finger openness heuristic constraints";
      goto LABEL_23;
    }
    if (objc_msgSend((id)objc_opt_class(), "heuristicIsIndexMiddleTooClose:rotationInDegrees:", v4, self->_rotationInDegrees))
    {
      if ((int)MediaAnalysisLogLevel() < 6 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_24;
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v8;
      v12 = MEMORY[0x1E0C81028];
      v13 = "VCPHandGestureVideoRequest : gate out %@ hand victory due to index and middle tips too close";
LABEL_23:
      _os_log_impl(&dword_1B6C4A000, v12, OS_LOG_TYPE_INFO, v13, v15, 0xCu);
LABEL_24:
      v11 = 1;
    }
  }
  if (objc_msgSend(v4, "gestureType", *(_OWORD *)v15) == 7 && v5 != 18)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out %@ hand rock with finger openness heuristic constraints", v15, 0xCu);
    }
    v11 = 1;
  }

  return v11;
}

- (BOOL)handPalmFacingCamera:(id)a3 rotationInDegrees:(int)a4 useTips:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  VCPKeypoint *v12;
  double v13;
  VCPKeypoint *v14;
  double v15;
  VCPKeypoint *v16;
  double v17;
  VCPKeypoint *v18;
  VCPKeypoint *v19;
  int v20;
  float32x2_t v21;
  float32x2_t v22;
  float v23;
  _BOOL4 v24;
  int v25;
  const char *v26;
  int v28;
  const char *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "bounds");
    if (v9 > 0.0)
    {
      objc_msgSend(v8, "keypoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {
        LOBYTE(v24) = 0;
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v12 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v13 = keyPointPosition(v12, a4);

      objc_msgSend(v11, "objectAtIndexedSubscript:", 5);
      v14 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v15 = keyPointPosition(v14, a4);

      objc_msgSend(v11, "objectAtIndexedSubscript:", 13);
      v16 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v17 = keyPointPosition(v16, a4);

      if (v5)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 8);
        v18 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
        v15 = keyPointPosition(v18, a4);

        objc_msgSend(v11, "objectAtIndexedSubscript:", 12);
        v19 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
        v17 = keyPointPosition(v19, a4);

      }
      v20 = objc_msgSend(v8, "chirality");
      v21 = vsub_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v13);
      v22 = vsub_f32(*(float32x2_t *)&v17, *(float32x2_t *)&v13);
      v23 = vmlas_n_f32((float)-v21.f32[1] * v22.f32[0], v22.f32[1], v21.f32[0]);
      if (v20 == 1)
      {
        if (v23 <= 0.0)
        {
LABEL_8:
          v24 = 0;
LABEL_13:
          if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            v25 = objc_msgSend(v8, "chirality");
            v26 = "right";
            v28 = 136315906;
            if (v25 == -1)
              v26 = "left";
            v29 = v26;
            v30 = 2048;
            v31 = v23;
            v32 = 1024;
            v33 = v24;
            v34 = 1024;
            v35 = v5;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest : chirality %s, cross_product %f, facingCamera %d, usedTips %d", (uint8_t *)&v28, 0x22u);
          }
          goto LABEL_18;
        }
      }
      else if (v23 >= 0.0)
      {
        goto LABEL_8;
      }
      v24 = 1;
      goto LABEL_13;
    }
  }
  LOBYTE(v24) = 0;
LABEL_19:

  return v24;
}

- (BOOL)handTouchFace:(id)a3 andFace:(CGRect)a4 rotationInDegrees:(int)a5
{
  uint64_t v5;
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  id v11;
  int v12;
  float v14;
  float v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  uint64_t j;
  void *v34;
  double v35;
  double v36;
  double v37;
  float v38;
  float v39;
  double v40;
  _BOOL4 v41;
  uint8_t v42[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;
  CGPoint v54;
  CGRect v55;
  CGRect v56;

  v5 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v53 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (v11
    && (v55.origin.x = x, v55.origin.y = y, v55.size.width = width, v55.size.height = height, !CGRectIsEmpty(v55)))
  {
    objc_msgSend((id)objc_opt_class(), "getFaceExtensionRatio");
    v15 = v14;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = objc_msgSend(&unk_1E6B766E0, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v16)
    {
      v17 = y + (float)(v15 * -0.5) * height;
      v18 = height * (float)(v15 + 1.0);
      v19 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(&unk_1E6B766E0);
          v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v11, "keypoints");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", (int)objc_msgSend(v21, "intValue"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v23, "location");
            v25 = v24;
            objc_msgSend(v23, "location");
            v54.y = v26;
            v56.origin.x = x;
            v56.origin.y = v17;
            v56.size.width = width;
            v56.size.height = v18;
            v54.x = v25;
            if (CGRectContainsPoint(v56, v54))
            {

              v27 = 1;
              goto LABEL_16;
            }
          }

        }
        v16 = objc_msgSend(&unk_1E6B766E0, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v16)
          continue;
        break;
      }
    }
    v27 = 0;
LABEL_16:
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v11, "keypoints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v44;
      v31 = 0.0;
      v32 = 1.0;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v44 != v30)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v34, "location");
          v36 = v35;
          objc_msgSend(v34, "location");
          v32 = fmin(v36, v32);
          v31 = fmax(v37, v31);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v29);
    }
    else
    {
      v31 = 0.0;
      v32 = 1.0;
    }

    objc_msgSend((id)objc_opt_class(), "getMinHandFaceRatio");
    v39 = v38;
    if (objc_msgSend(v11, "gestureType") != 12 && objc_msgSend(v11, "gestureType") != 9)
      v39 = v39 * 1.2;
    if (height * v39 >= (float)(v31 - v32))
      v12 = v27;
    else
      v12 = 0;
    if (objc_msgSend(v11, "gestureType") == 2)
    {
      if (-[VCPHandGestureMitigator handPalmFacingCamera:rotationInDegrees:useTips:](self, "handPalmFacingCamera:rotationInDegrees:useTips:", v11, v5, 1)&& -[VCPHandGestureMitigator handPalmFacingCamera:rotationInDegrees:useTips:](self, "handPalmFacingCamera:rotationInDegrees:useTips:", v11, v5, 0))
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v11, "setMitigationType:", objc_msgSend(v11, "mitigationType") | 0x20);
        LODWORD(v40) = 1036831949;
        objc_msgSend(v11, "setGestureConfidence:", v40);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out victory gesture due to palm-not-facing-camera", v42, 2u);
        }
      }
    }
    if (objc_msgSend(v11, "gestureType") == 7)
    {
      v41 = -[VCPHandGestureMitigator handPalmFacingCamera:rotationInDegrees:useTips:](self, "handPalmFacingCamera:rotationInDegrees:useTips:", v11, v5, 0);
      if (((v41 | v12 ^ 1) & 1) != 0)
      {
        LOBYTE(v12) = v12 & ~v41;
      }
      else
      {
        objc_msgSend(v11, "setMitigationType:", objc_msgSend(v11, "mitigationType") | 0x20);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out rock gesture due to palm-not-facing-camera while in hand-touch-face", v42, 2u);
        }
      }
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)adjustGestureForHand:(id)a3 withFace:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  float v11;
  double v12;
  float v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  uint64_t v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "gestureType") == 12
     || objc_msgSend(v10, "gestureType") == 9
     || objc_msgSend(v10, "gestureType") == 2
     || objc_msgSend(v10, "gestureType") == 7
     || objc_msgSend(v10, "gestureType") == 8)
    && -[VCPHandGestureMitigator handTouchFace:andFace:rotationInDegrees:](self, "handTouchFace:andFace:rotationInDegrees:", v10, self->_rotationInDegrees, x, y, width, height))
  {
    objc_msgSend(v10, "gestureConfidence");
    *(float *)&v12 = v11 * 0.7;
    objc_msgSend(v10, "setGestureConfidence:", v12);
    objc_msgSend(v10, "setMitigationType:", objc_msgSend(v10, "mitigationType") | 1);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v14[0] = 67109376;
      v14[1] = objc_msgSend(v10, "groupID");
      v15 = 1024;
      v16 = objc_msgSend(v10, "chirality");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : adjust gesture confidence based on hand-face position for hand with groupID = %d, chirality = %d", (uint8_t *)v14, 0xEu);
    }
    objc_msgSend(v10, "gestureConfidence");
    if (v13 < 0.5)
      objc_msgSend(v10, "setGestureType:", 0);
  }

}

- (void)adjustGestureForHand:(id)a3 withFaceYaw:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  float v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (objc_msgSend(v5, "gestureType"))
    {
      objc_msgSend(v6, "floatValue");
      if ((float)(v7 * 180.0) / 3.14159265 < -45.0
        || (objc_msgSend(v6, "floatValue"), (float)(v8 * 180.0) / 3.14159265 > 45.0))
      {
        objc_msgSend(v5, "setMitigationType:", objc_msgSend(v5, "mitigationType") | 0x1000);
        LODWORD(v9) = 1036831949;
        objc_msgSend(v5, "setGestureConfidence:", v9);
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v6, "floatValue");
          v11 = v10;
          objc_msgSend(v6, "floatValue");
          v13 = 134218240;
          v14 = v11;
          v15 = 2048;
          v16 = (float)(v12 * 180.0) / 3.14159265;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest : adjust gesture confidence based on face yaw = %f (%f degrees)", (uint8_t *)&v13, 0x16u);
        }
      }
    }
  }

}

- (BOOL)handInMitigationQuadrant:(id)a3 withFace:(CGRect)a4
{
  double width;
  CGFloat y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  VCPKeypoint *v16;
  NSObject *v17;
  const char *v18;
  BOOL v19;
  double v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;
  CGPoint v31;

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "keypoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v9, "keypoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31.x = x + width * 0.5;
      v31.y = y;
      transformLocation(v31, 0, self->_rotationInDegrees);
      v13 = v12;
      v15 = v14;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 4);
      v16 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v21 = keyPointPosition(v16, self->_rotationInDegrees);

      if (objc_msgSend(v9, "chirality") == -1)
      {
        if (v13 > *(float *)&v21 && v15 > *((float *)&v21 + 1))
        {
          if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            goto LABEL_20;
          *(_DWORD *)buf = 134218752;
          v23 = v13;
          v24 = 2048;
          v25 = v15;
          v26 = 2048;
          v27 = *(float *)&v21;
          v28 = 2048;
          v29 = *((float *)&v21 + 1);
          v17 = MEMORY[0x1E0C81028];
          v18 = "handInMitigationQuadrant: faceLowerCenter (%f, %f), handCenter(%f, %f), left hand mitigation ON in quadrant 3";
          goto LABEL_19;
        }
      }
      else if (objc_msgSend(v9, "chirality") == 1 && v13 < *(float *)&v21 && v15 > *((float *)&v21 + 1))
      {
        if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          goto LABEL_20;
        *(_DWORD *)buf = 134218752;
        v23 = v13;
        v24 = 2048;
        v25 = v15;
        v26 = 2048;
        v27 = *(float *)&v21;
        v28 = 2048;
        v29 = *((float *)&v21 + 1);
        v17 = MEMORY[0x1E0C81028];
        v18 = "handInMitigationQuadrant: faceLowerCenter (%f, %f), handCenter(%f, %f), right hand mitigation ON in quadrant 4";
LABEL_19:
        _os_log_impl(&dword_1B6C4A000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0x2Au);
LABEL_20:
        v19 = 1;
LABEL_22:

        goto LABEL_23;
      }
      v19 = 0;
      goto LABEL_22;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "handInMitigationQuadrant invalid hand input", buf, 2u);
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (int)mitigateHand:(id)a3 handKey:(id)a4 pairedHand:(id)a5 featureProvider:(id)a6 faceRects:(id)a7 faceYaws:(id)a8
{
  VCPHandObservation *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double minHandSize;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  _BOOL4 v39;
  double v40;
  void *v41;
  _BOOL4 v42;
  double v43;
  void *v44;
  _BOOL4 v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  NSString *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  double v74;
  __int16 v75;
  double v76;
  uint64_t v77;
  NSRect v78;
  NSRect v79;
  CGRect v80;

  v77 = *MEMORY[0x1E0C80C00];
  v14 = (VCPHandObservation *)a3;
  v67 = a4;
  v15 = a5;
  v16 = a6;
  v66 = a7;
  v17 = a8;
  v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "count", v66) == 1)
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v19, "floatValue");
        *(_DWORD *)buf = 138412546;
        v74 = *(double *)&v19;
        v75 = 2048;
        v76 = (float)(v20 * 180.0) / 3.14159265;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureMitigator - faceYaw = %@ (%f degree)", buf, 0x16u);
      }
      -[VCPHandGestureMitigator adjustGestureForHand:withFaceYaw:](self, "adjustGestureForHand:withFaceYaw:", v14, v19);

    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureMitigator - face yaw angles not available", buf, 2u);
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v21 = v66;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v69 != v23)
          objc_enumerationMutation(v21);
        v78 = NSRectFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
        x = v78.origin.x;
        y = v78.origin.y;
        width = v78.size.width;
        height = v78.size.height;
        if (!CGRectIsEmpty(v78))
          -[VCPHandGestureMitigator adjustGestureForHand:withFace:](self, "adjustGestureForHand:withFace:", v14, x, y, width, height);
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v22);
  }

  -[VCPHandObservation bounds](v14, "bounds");
  v30 = v29;
  -[VCPHandObservation bounds](v14, "bounds");
  if (v30 >= v31)
    v32 = v30;
  else
    v32 = v31;
  if (v32 < self->_minHandSize)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      minHandSize = self->_minHandSize;
      *(_DWORD *)buf = 134217984;
      v74 = minHandSize;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out small hand < %f", buf, 0xCu);
    }
    LODWORD(v33) = 1036831949;
    -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v33, v66);
    -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 8);
  }
  if (!v15)
  {
    +[VCPHandObservation twoHandGestureTypes](VCPHandObservation, "twoHandGestureTypes");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPHandObservation gestureType](v14, "gestureType"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "containsObject:", v36);

    if (v37)
      -[VCPHandObservation setGestureType:](v14, "setGestureType:", 0);
  }
  if (-[VCPHandObservation gestureType](v14, "gestureType", v66) != 13
    && -[VCPHandObservation gestureType](v14, "gestureType") != 17)
  {
    objc_msgSend(v16, "observationsForCurrentGroup");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[VCPHandGestureMitigator checkHandGestureJitter:forHand:](self, "checkHandGestureJitter:forHand:", v38, v67);

    if (v39)
    {
      -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 2);
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to jittering", buf, 2u);
      }
      LODWORD(v40) = 1036831949;
      -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v40);
    }
  }
  if (-[VCPHandObservation gestureType](v14, "gestureType") == 9)
  {
    if (v15 && objc_msgSend(v15, "gestureType") == 9)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : skip checking holding object for two-hand thumbs-up", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v16, "observationsForCurrentGroup");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[VCPHandGestureMitigator checkHandHoldObject:forHand:](self, "checkHandHoldObject:forHand:", v41, v67);

      if (v42)
      {
        -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 0x2000);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to holding object", buf, 2u);
        }
        LODWORD(v43) = 1036831949;
        -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v43);
      }
    }
  }
  if (-[VCPHandObservation gestureType](v14, "gestureType") != 13
    && -[VCPHandObservation gestureType](v14, "gestureType") != 14)
  {
    objc_msgSend(v16, "observationsForCurrentGroup");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[VCPHandGestureMitigator checkHandGestureGlobalMotion:forHand:](self, "checkHandGestureGlobalMotion:forHand:", v44, v67);

    if (v45)
    {
      -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 0x10);
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to global motion", buf, 2u);
      }
      LODWORD(v46) = 1036831949;
      -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v46);
    }
  }
  if (-[VCPHandGestureMitigator mitigateWithFingerOpennessForHand:](self, "mitigateWithFingerOpennessForHand:", v14))
  {
    -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 4);
    LODWORD(v47) = 1036831949;
    -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v47);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to opennnes", buf, 2u);
    }
  }
  +[VCPHandObservation twoHandGestureTypes](VCPHandObservation, "twoHandGestureTypes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPHandObservation gestureType](v14, "gestureType"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v48, "containsObject:", v49))
  {
    v50 = -[VCPHandObservation gestureType](v14, "gestureType") == 15;

    if (!v50)
      goto LABEL_68;
  }
  else
  {

  }
  objc_msgSend(v16, "observationsForCurrentGroup");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[VCPHandGestureMitigator checkHandGestureTemporalInconsistency:forHand:](self, "checkHandGestureTemporalInconsistency:forHand:", v51, v67);

  if (v52)
  {
    -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 0x200);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out hand gesture due to temporal gesture type consistency", buf, 2u);
    }
    LODWORD(v53) = 1036831949;
    -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v53);
  }
LABEL_68:
  if (-[VCPHandGestureMitigator mitigateWithFingerTiltingForHand:](self, "mitigateWithFingerTiltingForHand:", v14))
  {
    -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 0x400);
    LODWORD(v54) = 1036831949;
    -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v54);
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to tilting angle", buf, 2u);
    }
  }
  if (-[VCPHandObservation gestureType](v14, "gestureType") == 12)
  {
    LODWORD(v55) = 1058642330;
    if (!+[VCPHandGestureImageRequest isFistClosedTight:rotationInDegrees:scalingFactor:](VCPHandGestureImageRequest, "isFistClosedTight:rotationInDegrees:scalingFactor:", v14, self->_rotationInDegrees, v55))
    {
      -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 0x800);
      LODWORD(v56) = 1036831949;
      -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v56);
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to fist not closed tight in thumbs down", buf, 2u);
      }
    }
  }
  if (-[VCPHandObservation gestureType](v14, "gestureType") == 9 && objc_msgSend(v21, "count") == 1)
  {
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v57 = (NSString *)objc_claimAutoreleasedReturnValue();
    v79 = NSRectFromString(v57);
    v58 = v79.origin.x;
    v59 = v79.origin.y;
    v60 = v79.size.width;
    v61 = v79.size.height;

    v80.origin.x = v58;
    v80.origin.y = v59;
    v80.size.width = v60;
    v80.size.height = v61;
    if (!CGRectIsEmpty(v80)
      && -[VCPHandGestureMitigator handInMitigationQuadrant:withFace:](self, "handInMitigationQuadrant:withFace:", v14, v58, v59, v60, v61))
    {
      LODWORD(v62) = palmScale(v14, self->_rotationInDegrees);
      LODWORD(v63) = 1061997773;
      if (!+[VCPHandGestureImageRequest isFistClosedTightOccluded:rotationInDegrees:scalingFactor:palmScale:](VCPHandGestureImageRequest, "isFistClosedTightOccluded:rotationInDegrees:scalingFactor:palmScale:", v14, self->_rotationInDegrees, v63, v62))
      {
        -[VCPHandObservation setMitigationType:](v14, "setMitigationType:", -[VCPHandObservation mitigationType](v14, "mitigationType") | 0x800);
        LODWORD(v64) = 1036831949;
        -[VCPHandObservation setGestureConfidence:](v14, "setGestureConfidence:", v64);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to fist not closed tight in thumbs up", buf, 2u);
        }
      }
    }
  }

  return 0;
}

- (int)mitigate:(id)a3 rightHand:(id)a4 featureProvider:(id)a5 faceRects:(id)a6 faceYaws:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v31;
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t buf[16];

  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!(v12 | v13))
    goto LABEL_30;
  if (!v12)
  {
    if (!v13)
      goto LABEL_30;
    goto LABEL_7;
  }
  v17 = -[VCPHandGestureMitigator mitigateHand:handKey:pairedHand:featureProvider:faceRects:faceYaws:](self, "mitigateHand:handKey:pairedHand:featureProvider:faceRects:faceYaws:", v12, CFSTR("leftHand"), v13, v14, v15, v16);
  v18 = v17;
  if (v13 && !v17)
  {
LABEL_7:
    v18 = -[VCPHandGestureMitigator mitigateHand:handKey:pairedHand:featureProvider:faceRects:faceYaws:](self, "mitigateHand:handKey:pairedHand:featureProvider:faceRects:faceYaws:", v13, CFSTR("rightHand"), v12, v14, v15, v16);
    if (v18 || !v12)
      goto LABEL_31;
    +[VCPHandObservation twoHandGestureTypes](VCPHandObservation, "twoHandGestureTypes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)v12, "gestureType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "containsObject:", v19))
    {

    }
    else
    {
      +[VCPHandObservation twoHandGestureTypes](VCPHandObservation, "twoHandGestureTypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)v13, "gestureType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "containsObject:", v21);

      if (!v22)
      {
        if (-[VCPHandGestureMitigator handsTooClose:pairedHand:](self, "handsTooClose:pairedHand:", v12, v13))
        {
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gated out hand due to two-hand too close", v32, 2u);
          }
          objc_msgSend((id)v12, "setMitigationType:", objc_msgSend((id)v12, "mitigationType") | 0x80);
          LODWORD(v28) = 1036831949;
          objc_msgSend((id)v12, "setGestureConfidence:", v28);
          objc_msgSend((id)v13, "setMitigationType:", objc_msgSend((id)v13, "mitigationType") | 0x80);
          LODWORD(v29) = 1036831949;
          objc_msgSend((id)v13, "setGestureConfidence:", v29);
        }
        goto LABEL_30;
      }
    }
    v23 = objc_msgSend((id)v12, "gestureType");
    if (v23 != objc_msgSend((id)v13, "gestureType"))
    {
      objc_msgSend((id)v12, "setGestureType:", 0);
      objc_msgSend((id)v13, "setGestureType:", 0);
      v18 = 0;
      goto LABEL_31;
    }
    if (objc_msgSend((id)v12, "gestureType") == 15)
    {
      if ((objc_msgSend((id)objc_opt_class(), "heuristicHeart:andRightHand:rotationInDegrees:relax:", v12, v13, objc_msgSend(v14, "rotationInDegrees"), 1) & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out heart with heuristic constraints", buf, 2u);
        }
        objc_msgSend((id)v13, "setMitigationType:", objc_msgSend((id)v13, "mitigationType") | 0x40);
        objc_msgSend((id)v12, "setMitigationType:", objc_msgSend((id)v12, "mitigationType") | 0x40);
        LODWORD(v24) = 1036831949;
        objc_msgSend((id)v13, "setGestureConfidence:", v24);
        LODWORD(v25) = 1036831949;
        objc_msgSend((id)v12, "setGestureConfidence:", v25);
      }
      if (-[VCPHandGestureMitigator handsOverlap:pairedHand:](self, "handsOverlap:pairedHand:", v12, v13))
      {
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPHandGestureVideoRequest : gate out heart due to overlapping hands", v33, 2u);
        }
        objc_msgSend((id)v13, "setMitigationType:", objc_msgSend((id)v13, "mitigationType") | 0x100);
        objc_msgSend((id)v12, "setMitigationType:", objc_msgSend((id)v12, "mitigationType") | 0x100);
        LODWORD(v26) = 1036831949;
        objc_msgSend((id)v13, "setGestureConfidence:", v26);
        LODWORD(v27) = 1036831949;
        objc_msgSend((id)v12, "setGestureConfidence:", v27);
      }
    }
LABEL_30:
    v18 = 0;
  }
LABEL_31:

  return v18;
}

- (int)rotationInDegrees
{
  return self->_rotationInDegrees;
}

- (void)setRotationInDegrees:(int)a3
{
  self->_rotationInDegrees = a3;
}

- (float)minHandSize
{
  return self->_minHandSize;
}

- (void)setMinHandSize:(float)a3
{
  self->_minHandSize = a3;
}

@end
