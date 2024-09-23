@implementation VCPHandGestureImageRequest

- (VCPHandGestureImageRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPHandGestureImageRequest)initWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  VCPHandGestureImageRequest *v9;
  NSObject *v10;
  void *v11;
  VCPHandPoseImageRequest *v12;
  VCPHandPoseImageRequest *handPoseRequest;
  VCPCoreMLRequest *v14;
  VCPCoreMLRequest *gestureCoreMLRequest;
  OS_dispatch_queue *queue;
  dispatch_queue_t v17;
  OS_dispatch_queue *v18;
  NSObject *v19;
  VCPHandGestureImageRequest *v20;
  VCPHandGestureImageRequest *v21;
  objc_super v23;
  uint8_t buf[16];

  v4 = a3;
  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPHandGestureImageRequest_initWithOptions", ", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)VCPHandGestureImageRequest;
  v9 = -[VCPRequest initWithOptions:](&v23, sel_initWithOptions_, v4);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("handPoseLite"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("handPoseLite"));
    -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1E6B72B60, CFSTR("revision"));
    v12 = -[VCPHandPoseImageRequest initWithOptions:]([VCPHandPoseImageRequest alloc], "initWithOptions:", v10);
    handPoseRequest = v9->handPoseRequest;
    v9->handPoseRequest = v12;

    v14 = -[VCPCoreMLRequest initWithModelName:]([VCPCoreMLRequest alloc], "initWithModelName:", CFSTR("hand_gesture_static"));
    gestureCoreMLRequest = v9->gestureCoreMLRequest;
    v9->gestureCoreMLRequest = v14;

    if (!v9->handPoseRequest
      || !v9->gestureCoreMLRequest
      || (queue = v9->_queue, v9->_queue = 0, queue, v9->super._useAsync)
      && (v17 = dispatch_queue_create("VCPHandGestureImageRequestSerialQueue", 0),
          v18 = v9->_queue,
          v9->_queue = (OS_dispatch_queue *)v17,
          v18,
          !v9->_queue))
    {
      v20 = 0;
      goto LABEL_17;
    }

  }
  VCPSignPostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_END, v6, "VCPHandGestureImageRequest_initWithOptions", ", buf, 2u);
  }
  v20 = v9;
LABEL_17:

  v21 = v20;
  return v21;
}

- (id)taxonomyMappingStatic
{
  _QWORD v3[12];
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E6B72B78;
  v3[1] = &unk_1E6B72BA8;
  v4[0] = &unk_1E6B72B90;
  v4[1] = &unk_1E6B72BC0;
  v3[2] = &unk_1E6B72BD8;
  v3[3] = &unk_1E6B72C08;
  v4[2] = &unk_1E6B72BF0;
  v4[3] = &unk_1E6B72BA8;
  v3[4] = &unk_1E6B72B90;
  v3[5] = &unk_1E6B72BC0;
  v4[4] = &unk_1E6B72C20;
  v4[5] = &unk_1E6B72C38;
  v3[6] = &unk_1E6B72C50;
  v3[7] = &unk_1E6B72C68;
  v4[6] = &unk_1E6B72B78;
  v4[7] = &unk_1E6B72C68;
  v3[8] = &unk_1E6B72BF0;
  v3[9] = &unk_1E6B72C80;
  v4[8] = &unk_1E6B72C50;
  v4[9] = &unk_1E6B72C08;
  v3[10] = &unk_1E6B72C38;
  v3[11] = &unk_1E6B72C20;
  v4[10] = &unk_1E6B72C80;
  v4[11] = &unk_1E6B72BD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)heuristicThumb:(id)a3 rotationInDegrees:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  int v19;
  int v21;
  double v22;
  uint64_t v23;
  CGPoint v24;
  CGPoint v25;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "keypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "keypoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "location");
  transformLocation(v24, 0, a4);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "location");
  transformLocation(v25, 0, a4);
  v16 = atan2(v11 - v14, v13 - v15);
  v17 = v16 * 180.0 / 3.14159265;
  v18 = fabsf(v17);
  if (v18 >= 40.0)
  {
    if (v18 <= 140.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v21 = 134217984;
        v22 = v18;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "thumbs angle %f", (uint8_t *)&v21, 0xCu);
      }
      v19 = 0;
    }
    else
    {
      v19 = 12;
    }
  }
  else
  {
    v19 = 9;
  }

  return v19;
}

+ (BOOL)heuristicIsThumbOpenWide:(id)a3 rotationInDegrees:(int)a4 isRelaxed:(BOOL)a5
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
  double v19;
  float32x2_t v20;
  float32x2_t v21;
  float v22;
  int v23;
  const char *v24;
  double v25;
  BOOL v26;
  int v28;
  const char *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "bounds"), v9 > 0.0))
  {
    objc_msgSend(v8, "keypoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      goto LABEL_15;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
    v12 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v13 = keyPointPosition(v12, a4);

    objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
    v14 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v15 = keyPointPosition(v14, a4);

    objc_msgSend(v11, "objectAtIndexedSubscript:", 5);
    v16 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v17 = keyPointPosition(v16, a4);

    objc_msgSend(v11, "objectAtIndexedSubscript:", 13);
    v18 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v19 = keyPointPosition(v18, a4);

    v20 = vsub_f32(*(float32x2_t *)&v13, *(float32x2_t *)&v15);
    LODWORD(v13) = atan2f(v20.f32[1], v20.f32[0]);
    v21 = vsub_f32(*(float32x2_t *)&v17, *(float32x2_t *)&v19);
    v22 = fabsf(*(float *)&v13 - atan2f(v21.f32[1], v21.f32[0]));
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v23 = objc_msgSend(v8, "chirality");
      v24 = "right";
      if (v23 == -1)
        v24 = "left";
      v28 = 136315394;
      v29 = v24;
      v30 = 2048;
      v31 = v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureImageRequest : %s, thumbPalmLineAngle %f", (uint8_t *)&v28, 0x16u);
    }
    v25 = v5 ? 1.03672562 : 0.785398163;
    if (v22 < v25)
      v26 = 1;
    else
LABEL_15:
      v26 = 0;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)heuristicIsIndexMiddleTooClose:(id)a3 rotationInDegrees:(int)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  VCPKeypoint *v10;
  double v11;
  VCPKeypoint *v12;
  double v13;
  VCPKeypoint *v14;
  double v15;
  VCPKeypoint *v16;
  double v17;
  float32x2_t v18;
  int32x2_t v19;
  float32x2_t v20;
  int32x2_t v21;
  float32x2_t v22;
  int v23;
  const char *v24;
  BOOL v25;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "bounds"), v7 > 0.0))
  {
    objc_msgSend(v6, "keypoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_12;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 8);
    v10 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v11 = keyPointPosition(v10, a4);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 12);
    v12 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v13 = keyPointPosition(v12, a4);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
    v14 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v15 = keyPointPosition(v14, a4);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 9);
    v16 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v17 = keyPointPosition(v16, a4);

    v18 = vsub_f32(*(float32x2_t *)&v11, *(float32x2_t *)&v13);
    v19 = (int32x2_t)vmul_f32(v18, v18);
    v20 = vsub_f32(*(float32x2_t *)&v15, *(float32x2_t *)&v17);
    v21 = (int32x2_t)vmul_f32(v20, v20);
    v22 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v19, v21), (float32x2_t)vzip2_s32(v19, v21)));
    if ((vcgt_f32((float32x2_t)vdup_lane_s32((int32x2_t)v22, 1), v22).u8[0] & 1) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v23 = objc_msgSend(v6, "chirality");
        v24 = "right";
        if (v23 == -1)
          v24 = "left";
        v27 = 136315138;
        v28 = v24;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureImageRequest : %s hand victory FP check: index and middle tips are too close", (uint8_t *)&v27, 0xCu);
      }
      v25 = 1;
    }
    else
    {
LABEL_12:
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (float)tiltingAngleForHand:(id)a3 srcKeypointType:(int)a4 dstKeypointType:(int)a5 rotationInDegrees:(int)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  VCPKeypoint *v13;
  double v14;
  VCPKeypoint *v15;
  double v16;
  float32x2_t v17;
  float v18;
  uint8_t v20[16];

  v9 = a3;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "keypoints"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, a5 <= 20)
    && a4 <= 20
    && ((a5 | a4) & 0x80000000) == 0
    && v11)
  {
    objc_msgSend(v10, "keypoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v13 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v14 = keyPointPosition(v13, a6);

    objc_msgSend(v12, "objectAtIndexedSubscript:", a5);
    v15 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v16 = keyPointPosition(v15, a6);

    v17 = vsub_f32(*(float32x2_t *)&v16, *(float32x2_t *)&v14);
    v18 = fabsf(atan2f(fabsf(v17.f32[1]), fabsf(v17.f32[0])));

  }
  else
  {
    v18 = 0.0;
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPHandGestureImageRequest : tiltingAngleForHand invalid input", v20, 2u);
    }
  }

  return v18;
}

+ (BOOL)isFistClosedTight:(id)a3 rotationInDegrees:(int)a4 scalingFactor:(float)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  VCPKeypoint *v11;
  double v12;
  VCPKeypoint *v13;
  double v14;
  VCPKeypoint *v15;
  double v16;
  float32x2_t v17;
  float v18;
  float32x2_t v19;
  float v20;
  float v21;
  BOOL v22;
  int v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "keypoints"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    objc_msgSend(v8, "keypoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 8);
    v11 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v12 = keyPointPosition(v11, a4);

    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v13 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v14 = keyPointPosition(v13, a4);

    objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
    v15 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v16 = keyPointPosition(v15, a4);

    v17 = vsub_f32(*(float32x2_t *)&v12, *(float32x2_t *)&v14);
    v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
    v19 = vsub_f32(*(float32x2_t *)&v12, *(float32x2_t *)&v16);
    v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19)));
    v21 = v20 * a5;
    v22 = v18 < v21;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v24 = 134218496;
      v25 = v18;
      v26 = 2048;
      v27 = v20;
      v28 = 1024;
      v29 = v18 < v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "isFistClosedTight: distanceIndexClosed %f, distanceTwoTips %f, isTight %d", (uint8_t *)&v24, 0x1Cu);
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPHandGestureImageRequest : isFistClosedTight invalid input", (uint8_t *)&v24, 2u);
    }
    v22 = 0;
  }

  return v22;
}

+ (BOOL)isFistClosedTightOccluded:(id)a3 rotationInDegrees:(int)a4 scalingFactor:(float)a5 palmScale:(float)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  VCPKeypoint *v13;
  double v14;
  VCPKeypoint *v15;
  double v16;
  float32x2_t v17;
  float v18;
  float v19;
  BOOL v20;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "keypoints"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    objc_msgSend(v10, "keypoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 8);
    v13 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v14 = keyPointPosition(v13, a4);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
    v15 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v16 = keyPointPosition(v15, a4);

    v17 = vsub_f32(*(float32x2_t *)&v14, *(float32x2_t *)&v16);
    v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
    v19 = a5 * a6;
    v20 = v18 < v19;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v22 = 134218496;
      v23 = v18;
      v24 = 2048;
      v25 = a6;
      v26 = 1024;
      v27 = v18 < v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "isFistClosedTight: distanceIndexCloseToThumb %f, palmScale %f, isTight %d", (uint8_t *)&v22, 0x1Cu);
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPHandGestureImageRequest : isFistClosedTight invalid input", (uint8_t *)&v22, 2u);
    }
    v20 = 0;
  }

  return v20;
}

+ (unint64_t)heuristicFingerOpenness:(id)a3 rotationInDegrees:(int)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  VCPKeypoint *v10;
  double v11;
  VCPKeypoint *v12;
  VCPKeypoint *v13;
  double v14;
  VCPKeypoint *v15;
  VCPKeypoint *v16;
  VCPKeypoint *v17;
  double v18;
  VCPKeypoint *v19;
  VCPKeypoint *v20;
  VCPKeypoint *v21;
  double v22;
  VCPKeypoint *v23;
  VCPKeypoint *v24;
  VCPKeypoint *v25;
  double v26;
  VCPKeypoint *v27;
  VCPKeypoint *v28;
  VCPKeypoint *v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  _BOOL8 v40;
  unint64_t v41;
  int v42;
  const char *v43;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  float32x2_t v54;
  double v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  double v61;
  float v62[4];
  float v63[4];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "bounds"), v7 > 0.0))
  {
    objc_msgSend(v6, "keypoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
      v10 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v11 = keyPointPosition(v10, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v12 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v45 = keyPointPosition(v12, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 8);
      v13 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v14 = keyPointPosition(v13, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 6);
      v15 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v53 = keyPointPosition(v15, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
      v16 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v52 = keyPointPosition(v16, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 12);
      v17 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v18 = keyPointPosition(v17, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 10);
      v19 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v51 = keyPointPosition(v19, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 9);
      v20 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v50 = keyPointPosition(v20, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 16);
      v21 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v22 = keyPointPosition(v21, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 14);
      v23 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v49 = keyPointPosition(v23, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 13);
      v24 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v48 = keyPointPosition(v24, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 20);
      v25 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v26 = keyPointPosition(v25, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 18);
      v27 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v47 = keyPointPosition(v27, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 17);
      v28 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v46 = keyPointPosition(v28, a4);

      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v29 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
      v55 = keyPointPosition(v29, a4);

      v30 = vsub_f32(*(float32x2_t *)&v53, *(float32x2_t *)&v14);
      LODWORD(v14) = atan2f(v30.f32[1], v30.f32[0]);
      v63[0] = *(float *)&v14
             - atan2f(*((float *)&v53 + 1) - *((float *)&v52 + 1), vsub_f32(*(float32x2_t *)&v53, *(float32x2_t *)&v52).f32[0]);
      v31 = vsub_f32(*(float32x2_t *)&v51, *(float32x2_t *)&v18);
      LODWORD(v14) = atan2f(v31.f32[1], v31.f32[0]);
      v63[1] = *(float *)&v14
             - atan2f(*((float *)&v51 + 1) - *((float *)&v50 + 1), vsub_f32(*(float32x2_t *)&v51, *(float32x2_t *)&v50).f32[0]);
      v32 = vsub_f32(*(float32x2_t *)&v49, *(float32x2_t *)&v22);
      LODWORD(v14) = atan2f(v32.f32[1], v32.f32[0]);
      v63[2] = *(float *)&v14
             - atan2f(*((float *)&v49 + 1) - *((float *)&v48 + 1), vsub_f32(*(float32x2_t *)&v49, *(float32x2_t *)&v48).f32[0]);
      v33 = vsub_f32(*(float32x2_t *)&v47, *(float32x2_t *)&v26);
      LODWORD(v14) = atan2f(v33.f32[1], v33.f32[0]);
      v63[3] = *(float *)&v14
             - atan2f(*((float *)&v47 + 1) - *((float *)&v46 + 1), vsub_f32(*(float32x2_t *)&v47, *(float32x2_t *)&v46).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v52 + 1) - *((float *)&v53 + 1), vsub_f32(*(float32x2_t *)&v52, *(float32x2_t *)&v53).f32[0]);
      v62[0] = *(float *)&v14
             - atan2f(*((float *)&v52 + 1) - *((float *)&v55 + 1), vsub_f32(*(float32x2_t *)&v52, *(float32x2_t *)&v55).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v50 + 1) - *((float *)&v51 + 1), vsub_f32(*(float32x2_t *)&v50, *(float32x2_t *)&v51).f32[0]);
      v62[1] = *(float *)&v14
             - atan2f(*((float *)&v50 + 1) - *((float *)&v55 + 1), vsub_f32(*(float32x2_t *)&v50, *(float32x2_t *)&v55).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v48 + 1) - *((float *)&v49 + 1), vsub_f32(*(float32x2_t *)&v48, *(float32x2_t *)&v49).f32[0]);
      v62[2] = *(float *)&v14
             - atan2f(*((float *)&v48 + 1) - *((float *)&v55 + 1), vsub_f32(*(float32x2_t *)&v48, *(float32x2_t *)&v55).f32[0]);
      LODWORD(v14) = atan2f(*((float *)&v46 + 1) - *((float *)&v47 + 1), vsub_f32(*(float32x2_t *)&v46, *(float32x2_t *)&v47).f32[0]);
      v62[3] = *(float *)&v14
             - atan2f(*((float *)&v46 + 1) - *((float *)&v55 + 1), vsub_f32(*(float32x2_t *)&v46, *(float32x2_t *)&v55).f32[0]);
      v54 = vsub_f32(*(float32x2_t *)&v45, *(float32x2_t *)&v11);
      v34 = atan2f(*((float *)&v45 + 1) - *((float *)&v55 + 1), vsub_f32(*(float32x2_t *)&v45, *(float32x2_t *)&v55).f32[0]);
      v35 = 0;
      v36 = 0;
      do
      {
        v37 = fabsf(v63[v35]);
        if (v37 > 1.88495557 && v37 < 4.39822973)
        {
          v38 = fabsf(v62[v35]);
          if (v38 > 1.57079633 && v38 < 4.71238898)
            v36 |= (2 << v35);
        }
        ++v35;
      }
      while (v35 != 4);
      v39 = vabds_f32(atan2f(v54.f32[1], v54.f32[0]), v34);
      v40 = v39 < 3.45575192 && v39 > 2.82743338;
      v41 = v36 | v40;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v42 = objc_msgSend(v6, "chirality");
        v43 = "right";
        *(_DWORD *)buf = 136315650;
        if (v42 == -1)
          v43 = "left";
        v57 = v43;
        v58 = 1024;
        v59 = v41;
        v60 = 2048;
        v61 = v39;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureImageRequest : %s hand raw openness %d, thumbPIPAngle %f", buf, 0x1Cu);
      }
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

+ (BOOL)heuristicHeart:(id)a3 andRightHand:(id)a4 rotationInDegrees:(int)a5 relax:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  VCPKeypoint *v14;
  VCPKeypoint *v15;
  VCPKeypoint *v16;
  VCPKeypoint *v17;
  VCPKeypoint *v18;
  VCPKeypoint *v19;
  VCPKeypoint *v20;
  VCPKeypoint *v21;
  VCPKeypoint *v22;
  VCPKeypoint *v23;
  double v24;
  VCPKeypoint *v25;
  double v26;
  void *v27;
  VCPKeypoint *v28;
  VCPKeypoint *v29;
  VCPKeypoint *v30;
  VCPKeypoint *v31;
  VCPKeypoint *v32;
  VCPKeypoint *v33;
  VCPKeypoint *v34;
  VCPKeypoint *v35;
  VCPKeypoint *v36;
  VCPKeypoint *v37;
  VCPKeypoint *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  double v44;
  float32x2_t v45;
  uint64_t v50;
  float32x2_t v51;
  uint64_t v52;
  float v53;
  float32x2_t v54;
  uint64_t v55;
  float32x2_t v56;
  uint64_t v57;
  float32x2_t v58;
  uint64_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  float32x2_t v63;
  float v64;
  float v65;
  float32x2_t v66;
  float v67;
  float32x2_t v69;
  float v70;
  BOOL v71;
  float32x2_t v72;
  float v73;
  float32x2_t v75;
  float32x2_t v76;
  float32x2_t v77;
  float32x2_t v78;
  float32x2_t v79;
  float32x2_t v80;
  float32x2_t v81;
  float32x2_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float32x2_t v86;
  double v88;
  float v89;
  float v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  unsigned __int128 v112;
  uint64_t v113;
  _QWORD v114[3];
  _QWORD v115[4];

  v6 = a6;
  v115[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    objc_msgSend(v9, "keypoints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
    v14 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v108 = keyPointPosition(v14, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v15 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v94 = keyPointPosition(v15, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 8);
    v16 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v104 = keyPointPosition(v16, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 6);
    v17 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v101 = keyPointPosition(v17, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 12);
    v18 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v103 = keyPointPosition(v18, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 10);
    v19 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v100 = keyPointPosition(v19, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 16);
    v20 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v102 = keyPointPosition(v20, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 14);
    v21 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v99 = keyPointPosition(v21, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 20);
    v22 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v91 = keyPointPosition(v22, a5);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 18);
    v23 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v24 = keyPointPosition(v23, a5);
    v90 = *((float *)&v24 + 1);

    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v25 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v26 = keyPointPosition(v25, a5);

    objc_msgSend(v11, "keypoints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 4);
    v28 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v106 = keyPointPosition(v28, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 2);
    v29 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v93 = keyPointPosition(v29, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 8);
    v30 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v107 = keyPointPosition(v30, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 6);
    v31 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v98 = keyPointPosition(v31, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 12);
    v32 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v105 = keyPointPosition(v32, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 10);
    v33 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v97 = keyPointPosition(v33, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 16);
    v34 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v96 = keyPointPosition(v34, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 14);
    v35 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v95 = keyPointPosition(v35, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 20);
    v36 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v92 = keyPointPosition(v36, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 18);
    v37 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v88 = keyPointPosition(v37, a5);

    objc_msgSend(v27, "objectAtIndexedSubscript:", 0, *(_QWORD *)&v88);
    v38 = (VCPKeypoint *)objc_claimAutoreleasedReturnValue();
    v39 = keyPointPosition(v38, a5);

    v12 = 0;
    if (*(float *)&v108 < 0.0
      || *(float *)&v94 < 0.0
      || *(float *)&v104 < 0.0
      || *(float *)&v101 < 0.0
      || *(float *)&v103 < 0.0
      || *(float *)&v100 < 0.0
      || *(float *)&v102 < 0.0
      || *(float *)&v99 < 0.0
      || *(float *)&v106 < 0.0
      || *(float *)&v93 < 0.0
      || *(float *)&v107 < 0.0
      || *(float *)&v98 < 0.0
      || *(float *)&v105 < 0.0
      || *(float *)&v97 < 0.0
      || *(float *)&v96 < 0.0
      || *(float *)&v95 < 0.0)
    {
      goto LABEL_74;
    }
    objc_msgSend(v9, "bounds", v95);
    v41 = v40;
    objc_msgSend(v9, "bounds");
    v43 = 0;
    if (v41 >= v42)
      v44 = v42;
    else
      v44 = v41;
    *(double *)v115 = v107;
    *(double *)&v115[1] = v105;
    *(double *)&v115[2] = v96;
    *(double *)v114 = v104;
    *(double *)&v114[1] = v103;
    *(double *)&v114[2] = v102;
    v112 = __PAIR128__(*(unint64_t *)&v105, *(unint64_t *)&v107);
    v45 = 0;
    v113 = 0;
    *(double *)v111 = v104;
    *(double *)&v111[1] = v103;
    v111[2] = 0;
    *(double *)v110 = v98;
    *(double *)&v110[1] = v97;
    *(double *)&v110[2] = v95;
    *(double *)v109 = v101;
    *(double *)&v109[1] = v100;
    __asm { FMOV            V1.2S, #3.0 }
    *(double *)&v109[2] = v99;
    do
      v45 = vadd_f32(v45, vdiv_f32((float32x2_t)v115[v43++], _D1));
    while (v43 != 3);
    v50 = 0;
    v51 = 0;
    do
      v51 = vadd_f32(v51, vdiv_f32((float32x2_t)v114[v50++], _D1));
    while (v50 != 3);
    v52 = 0;
    v53 = v44;
    v54 = 0;
    do
    {
      v54 = vadd_f32(v54, vdiv_f32(*(float32x2_t *)((char *)&v112 + v52), _D1));
      v52 += 8;
    }
    while (v52 != 24);
    v55 = 0;
    v56 = 0;
    do
      v56 = vadd_f32(v56, vdiv_f32((float32x2_t)v111[v55++], _D1));
    while (v55 != 3);
    v57 = 0;
    v58 = 0;
    do
      v58 = vadd_f32(v58, vdiv_f32((float32x2_t)v110[v57++], _D1));
    while (v57 != 3);
    v59 = 0;
    v60 = 0;
    do
      v60 = vadd_f32(v60, vdiv_f32((float32x2_t)v109[v59++], _D1));
    while (v59 != 3);
    v61 = vmul_f32(vadd_f32(v45, v51), (float32x2_t)0x3F0000003F000000);
    v62 = vmul_f32(vadd_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v106), (float32x2_t)0x3F0000003F000000);
    v63 = vsub_f32(v45, v51);
    v64 = sqrtf(vaddv_f32(vmul_f32(v63, v63)));
    v65 = v53 * 0.2;
    if (v6)
    {
      v66 = vsub_f32(v54, v56);
      v67 = sqrtf(vaddv_f32(vmul_f32(v66, v66)));
      _NF = v64 < v65 || v67 < v65;
      v69 = vsub_f32(*(float32x2_t *)&v107, *(float32x2_t *)&v104);
      v70 = sqrtf(vaddv_f32(vmul_f32(v69, v69)));
      v71 = _NF || v70 < v65;
      v72 = vsub_f32(*(float32x2_t *)&v105, *(float32x2_t *)&v103);
      v73 = sqrtf(vaddv_f32(vmul_f32(v72, v72)));
      if (v71 || v73 < v65)
      {
        v75 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v108);
        if (sqrtf(vaddv_f32(vmul_f32(v75, v75))) < v65)
        {
          v76 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v107);
          if (sqrtf(vaddv_f32(vmul_f32(v76, v76))) >= v65)
          {
            v77 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v105);
            if (sqrtf(vaddv_f32(vmul_f32(v77, v77))) >= v65)
            {
              v78 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v96);
              if (sqrtf(vaddv_f32(vmul_f32(v78, v78))) >= v65)
              {
                v79 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v92);
                if (sqrtf(vaddv_f32(vmul_f32(v79, v79))) >= v65)
                {
                  v80 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v104);
                  if (sqrtf(vaddv_f32(vmul_f32(v80, v80))) >= v65)
                  {
                    v81 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v103);
                    if (sqrtf(vaddv_f32(vmul_f32(v81, v81))) >= v65)
                    {
                      v82 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v102);
                      if (sqrtf(vaddv_f32(vmul_f32(v82, v82))) >= v65)
                      {
                        v83 = vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v91);
                        if (sqrtf(vaddv_f32(vmul_f32(v83, v83))) >= v65)
                        {
                          v12 = 0;
                          v84 = vsub_f32(*(float32x2_t *)&v39, *(float32x2_t *)&v26);
                          if (sqrtf(vaddv_f32(vmul_f32(v84, v84))) < v65 || (vcgt_f32(v61, v62).i32[1] & 1) == 0)
                            goto LABEL_74;
                          if (*((float *)&v93 + 1) * 1.1 >= *((float *)&v106 + 1)
                            && *((float *)&v98 + 1) * 1.1 >= *((float *)&v107 + 1)
                            && *((float *)&v97 + 1) * 1.1 >= *((float *)&v105 + 1)
                            && *((float *)&v95 + 1) * 1.1 >= *((float *)&v96 + 1)
                            && v89 * 1.1 >= *((float *)&v92 + 1)
                            && *((float *)&v94 + 1) * 1.1 >= *((float *)&v108 + 1)
                            && *((float *)&v101 + 1) * 1.1 >= *((float *)&v104 + 1)
                            && *((float *)&v100 + 1) * 1.1 >= *((float *)&v103 + 1)
                            && *((float *)&v99 + 1) * 1.1 >= *((float *)&v102 + 1))
                          {
                            v12 = v90 * 1.1 >= *((float *)&v91 + 1);
LABEL_74:

                            goto LABEL_75;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else if (v64 < v65)
    {
      v85 = vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v108);
      if (sqrtf(vaddv_f32(vmul_f32(v85, v85))) < v65)
      {
        v86 = vsub_f32(v62, v61);
        if (vaddv_f32(vmul_f32(v86, vsub_f32(v51, v60))) > -0.01
          && vaddv_f32(vmul_f32(v86, vsub_f32(v45, v58))) > -0.01
          && vaddv_f32(vmul_f32(vsub_f32(*(float32x2_t *)&v108, *(float32x2_t *)&v94), v86)) > -0.01)
        {
          v12 = vaddv_f32(vmul_f32(vsub_f32(*(float32x2_t *)&v106, *(float32x2_t *)&v93), v86)) > -0.01;
          goto LABEL_74;
        }
      }
    }
    v12 = 0;
    goto LABEL_74;
  }
LABEL_75:

  return v12;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  int maxNumOfPersons;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t k;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  VCPCoreMLFeatureProviderGesture *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t v53;
  float v54;
  void *v55;
  BOOL v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  uint64_t v62;
  VCPHandObservation *v63;
  VCPHandObservation *v64;
  uint64_t v65;
  uint64_t v66;
  VCPHandObservation *v67;
  float v68;
  VCPHandObservation *v69;
  VCPHandObservation *v70;
  VCPHandObservation *v71;
  float v72;
  VCPHandObservation *v73;
  double v74;
  double v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t ii;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v86;
  NSObject *v87;
  unint64_t v88;
  os_signpost_id_t spid;
  uint64_t v90;
  void *v91;
  void *m;
  int v93;
  NSDictionary *v94;
  uint64_t v95;
  id v96;
  unsigned int RotationInDegrees;
  int v99;
  VCPCoreMLFeatureProviderGesture *v100;
  id v102;
  id v103;
  id v104;
  void *v105;
  void *v106;
  id obj;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  void *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  uint8_t v136[128];
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  int v140;
  __int16 v141;
  int v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v94 = (NSDictionary *)a4;
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v88 = v7 - 1;
  spid = v7;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPHandGestureImageRequest_processImage", ", buf, 2u);
  }

  -[VCPHandPoseImageRequest processImage:withOptions:error:](self->handPoseRequest, "processImage:withOptions:error:", a3, v94, a5);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  RotationInDegrees = getRotationInDegrees(v94);
  maxNumOfPersons = self->super._maxNumOfPersons;
  if (maxNumOfPersons >= 3)
    maxNumOfPersons = 3;
  if (maxNumOfPersons <= 1)
    maxNumOfPersons = 1;
  v99 = maxNumOfPersons;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  obj = v91;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v129 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "groupID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (v18)
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v15, 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "groupID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v20);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "groupID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v15);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
    }
    while (v12);
  }

  objc_msgSend(v11, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");
  v23 = v99;
  if (v99 >= v22)
    v23 = v22;
  v93 = v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  objc_msgSend(v11, "allKeys");
  v102 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v125;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v125 != v25)
          objc_enumerationMutation(v102);
        v27 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j);
        objc_msgSend(v11, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count"))
        {
          v122 = 0u;
          v123 = 0u;
          v120 = 0u;
          v121 = 0u;
          v29 = v28;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v120, v143, 16);
          if (v30)
          {
            v31 = *(_QWORD *)v121;
            v32 = 0.0;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v121 != v31)
                  objc_enumerationMutation(v29);
                v32 = v32 + handArea(*(VCPHandObservation **)(*((_QWORD *)&v120 + 1) + 8 * k));
              }
              v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v120, v143, 16);
            }
            while (v30);
          }
          else
          {
            v32 = 0.0;
          }

          *(float *)&v34 = v32 / (float)(unint64_t)objc_msgSend(v29, "count");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "setObject:forKeyedSubscript:", v35, v27);

        }
      }
      v24 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
    }
    while (v24);
  }

  objc_msgSend(v105, "keysSortedByValueUsingComparator:", &__block_literal_global_31);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v138 = v36;
    v139 = 1024;
    v140 = v99;
    v141 = 1024;
    v142 = v93;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPHandGestureVideoRequest - sorted groupIDs based on hand size = %@, max number of persons = %d, number of valid persons = %d", buf, 0x18u);
  }
  v37 = 0;
  for (m = v36; ; v36 = m)
  {
    v38 = objc_msgSend(v36, "count");
    v39 = v93 >= v38 ? v38 : v93;
    if (v37 >= v39)
      break;
    objc_msgSend(v36, "objectAtIndexedSubscript:", v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v37;
    objc_msgSend(v11, "objectForKeyedSubscript:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v96 = v41;
    v42 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
    if (!v42)
      goto LABEL_67;
    v95 = *(_QWORD *)v117;
    while (2)
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v117 != v95)
          objc_enumerationMutation(v96);
        v44 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * n);
        v45 = -[VCPCoreMLFeatureProviderGesture initWith:rotationInDegrees:]([VCPCoreMLFeatureProviderGesture alloc], "initWith:rotationInDegrees:", v44, RotationInDegrees);
        v100 = v45;
        if (!v45)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create VCPCoreMLFeatureProviderGesture", buf, 2u);
          }
          goto LABEL_115;
        }
        -[VCPCoreMLRequest model](self->gestureCoreMLRequest, "model");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "predictionFromFeatures:error:", v45, a5);
        v103 = (id)objc_claimAutoreleasedReturnValue();

        if (!v103)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get output feature", buf, 2u);
          }

          goto LABEL_115;
        }
        objc_msgSend(v103, "featureValueForName:", CFSTR("output"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "multiArrayValue");
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49 = objc_msgSend(v48, "dataPointer");

        if (!v49)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v80 = MEMORY[0x1E0C81028];
            goto LABEL_113;
          }
LABEL_114:

LABEL_115:
          if (a5)
          {
            v81 = (void *)MEMORY[0x1E0CB35C8];
            v132 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: failed to processImage"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = v82;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v83);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
          v84 = 0;
          v36 = m;
          goto LABEL_118;
        }
        objc_msgSend(v47, "multiArrayValue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "count") == 12;

        if (!v51)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v80 = MEMORY[0x1E0C81028];
LABEL_113:
            _os_log_impl(&dword_1B6C4A000, v80, OS_LOG_TYPE_ERROR, "Failed to get multierarrayvalue", buf, 2u);
          }
          goto LABEL_114;
        }
        v52 = 0;
        v53 = 0;
        v54 = 0.0;
        while (1)
        {
          objc_msgSend(v47, "multiArrayValue");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count") > v52;

          if (!v56)
            break;
          v57 = *(float *)(v49 + 4 * v52);
          if (v57 <= v54)
            v53 = v53;
          else
            v53 = v52;
          if (v57 > v54)
            v54 = *(float *)(v49 + 4 * v52);
          ++v52;
        }
        -[VCPHandGestureImageRequest taxonomyMappingStatic](self, "taxonomyMappingStatic");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v53);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setGestureType:", objc_msgSend(v60, "intValue"));

        if (objc_msgSend(v44, "gestureType") == 9)
          objc_msgSend(v44, "setGestureType:", -[VCPHandGestureImageRequest heuristicThumb:rotationInDegrees:](self, "heuristicThumb:rotationInDegrees:", v44, RotationInDegrees));
        *(float *)&v61 = v54;
        objc_msgSend(v44, "setGestureConfidence:", v61);

      }
      v42 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
      if (v42)
        continue;
      break;
    }
LABEL_67:

    if ((unint64_t)objc_msgSend(v96, "count") < 2)
      goto LABEL_92;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v104 = v96;
    v62 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
    if (!v62)
    {

      v64 = 0;
      v63 = 0;
      goto LABEL_91;
    }
    v63 = 0;
    v64 = 0;
    v65 = *(_QWORD *)v113;
    while (2)
    {
      v66 = 0;
      while (2)
      {
        if (*(_QWORD *)v113 != v65)
          objc_enumerationMutation(v104);
        v67 = *(VCPHandObservation **)(*((_QWORD *)&v112 + 1) + 8 * v66);
        if (-[VCPHandObservation chirality](v67, "chirality") != -1)
        {
          if (-[VCPHandObservation chirality](v67, "chirality") != 1)
            goto LABEL_84;
          if (v64)
          {
            v68 = handArea(v64);
            v69 = v64;
            v70 = v63;
            v71 = v67;
            if (v68 >= handArea(v67))
              goto LABEL_84;
          }
          else
          {
            v69 = 0;
            v70 = v63;
            v71 = v67;
          }
          goto LABEL_83;
        }
        if (!v63)
        {
          v69 = 0;
          v70 = v67;
          v71 = v64;
          goto LABEL_83;
        }
        v72 = handArea(v63);
        v69 = v63;
        v70 = v67;
        v71 = v64;
        if (v72 < handArea(v67))
        {
LABEL_83:
          v73 = v67;

          v63 = v70;
          v64 = v71;
        }
LABEL_84:
        if (v62 != ++v66)
          continue;
        break;
      }
      v62 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
      if (v62)
        continue;
      break;
    }

    if (v63
      && v64
      && objc_msgSend((id)objc_opt_class(), "heuristicHeart:andRightHand:rotationInDegrees:relax:", v63, v64, RotationInDegrees, 0))
    {
      -[VCPHandObservation setGestureType:](v63, "setGestureType:", 15);
      LODWORD(v74) = 0.5;
      -[VCPHandObservation setGestureConfidence:](v63, "setGestureConfidence:", v74);
      -[VCPHandObservation setGestureType:](v64, "setGestureType:", 15);
      LODWORD(v75) = 0.5;
      -[VCPHandObservation setGestureConfidence:](v64, "setGestureConfidence:", v75);
    }
LABEL_91:

LABEL_92:
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v76 = v96;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v109;
      do
      {
        for (ii = 0; ii != v77; ++ii)
        {
          if (*(_QWORD *)v109 != v78)
            objc_enumerationMutation(v76);
          objc_msgSend(v106, "addObject:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * ii));
        }
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
      }
      while (v77);
    }

    v37 = v90 + 1;
  }
  VCPSignPostLog();
  v86 = objc_claimAutoreleasedReturnValue();
  v87 = v86;
  if (v88 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v87, OS_SIGNPOST_INTERVAL_END, spid, "VCPHandGestureImageRequest_processImage", ", buf, 2u);
  }

  v84 = v106;
LABEL_118:

  return v84;
}

uint64_t __61__VCPHandGestureImageRequest_processImage_withOptions_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  return -[VCPHandPoseImageRequest updateWithOptions:error:](self->handPoseRequest, "updateWithOptions:error:", a3, a4);
}

- (void)updateWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  void *v9;
  uint8_t v10[8];
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__VCPHandGestureImageRequest_updateWithOptions_completion___block_invoke;
    block[3] = &unk_1E6B17158;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPHandGestureImageRequest : queue not available for async updateWithOptions", v10, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v9);

  }
}

void __59__VCPHandGestureImageRequest_updateWithOptions_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 64);
  v8 = 0;
  v4 = objc_msgSend(v3, "updateWithOptions:error:", v2, &v8);
  v5 = v8;
  v6 = a1[6];
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

- (void)processImage:(__CVBuffer *)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  CFTypeRef v19;

  v8 = a4;
  v9 = a5;
  if (self->_queue)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 0;
    v19 = CFRetain(a3);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__VCPHandGestureImageRequest_processImage_withOptions_completion___block_invoke;
    v12[3] = &unk_1E6B17510;
    v12[4] = self;
    v15 = buf;
    v13 = v8;
    v14 = v9;
    dispatch_async(queue, v12);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPHandGestureImageRequest : queue not available for async processImage", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v11);

  }
}

void __66__VCPHandGestureImageRequest_processImage_withOptions_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const void *v7;
  id v8;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v3 = (void *)a1[4];
  v4 = a1[5];
  v8 = 0;
  objc_msgSend(v3, "processImage:withOptions:error:", v2, v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = *(const void **)(*(_QWORD *)(a1[7] + 8) + 24);
  if (v7)
    CFRelease(v7);
  (*(void (**)(void))(a1[6] + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->gestureCoreMLRequest, 0);
  objc_storeStrong((id *)&self->handPoseRequest, 0);
}

@end
