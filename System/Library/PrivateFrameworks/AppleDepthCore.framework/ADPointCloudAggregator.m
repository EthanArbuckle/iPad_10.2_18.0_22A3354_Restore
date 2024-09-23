@implementation ADPointCloudAggregator

- (ADPointCloudAggregator)initWithAggregationParameters:(id)a3
{
  return -[ADPointCloudAggregator initWithAggregationParameters:jasperToColorTransform:colorCamera:](self, "initWithAggregationParameters:jasperToColorTransform:colorCamera:", a3, 0, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
}

- (ADPointCloudAggregator)initWithAggregationParameters:(__n128)a3 jasperToColorTransform:(__n128)a4 colorCamera:(__n128)a5
{
  id v11;
  id v12;
  ADPointCloudAggregator *v13;
  ADPointCloudAggregator *v14;
  id *p_aggregationParameters;
  unsigned int v16;
  $AECC3E7C48FE2C79DB5526DBCC64C3FF *v17;
  uint64_t v18;
  $AECC3E7C48FE2C79DB5526DBCC64C3FF *v19;
  objc_super v25;
  int v26;
  __int128 v27;
  __int128 v28;

  v11 = a7;
  v12 = a8;
  v26 = 335679380;
  v27 = 0u;
  v28 = 0u;
  kdebug_trace();
  a1[1] = 0;
  v25.receiver = a1;
  v25.super_class = (Class)ADPointCloudAggregator;
  v13 = -[ADPointCloudAggregator init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    p_aggregationParameters = (id *)&v13->_aggregationParameters;
    objc_storeStrong((id *)&v13->_aggregationParameters, a7);
    -[ADPointCloudAggregator setColorCameraCalibration:](v14, "setColorCameraCalibration:", v12);
    -[ADPointCloudAggregator setJasperToCameraTransform:](v14, "setJasperToCameraTransform:", a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0]);
    v16 = objc_msgSend(*p_aggregationParameters, "aggregationSize");
    v17 = ($AECC3E7C48FE2C79DB5526DBCC64C3FF *)operator new[]();
    v17->var0 = (id)96;
    *(_QWORD *)&v17->var2 = v16;
    if (v16)
    {
      v18 = 96 * v16;
      v19 = v17 + 1;
      do
      {
        v19->var0 = 0;
        v19 += 6;
        v18 -= 96;
      }
      while (v18);
    }
    v14->_history = v17 + 1;
    -[ADPointCloudAggregator clear](v14, "clear", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
  }
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v26);

  return v14;
}

- (void)dealloc
{
  $AECC3E7C48FE2C79DB5526DBCC64C3FF *history;
  $AECC3E7C48FE2C79DB5526DBCC64C3FF *v4;
  double var2;
  uint64_t v6;
  $AECC3E7C48FE2C79DB5526DBCC64C3FF *v7;
  objc_super v8;

  history = self->_history;
  if (history)
  {
    v4 = history - 1;
    var2 = history[-1].var2;
    if (var2 != 0.0)
    {
      v6 = 6 * *(_QWORD *)&var2;
      v7 = history - 6;
      do
      {

        v6 -= 6;
      }
      while (v6 * 16);
    }
    MEMORY[0x23B7F1D4C](v4, 0x1080C80A5AEB770);
  }
  v8.receiver = self;
  v8.super_class = (Class)ADPointCloudAggregator;
  -[ADPointCloudAggregator dealloc](&v8, sel_dealloc);
}

- (uint64_t)pushPointCloud:(__n128)a3 timestamp:(__n128)a4 worldToLidarTransform:(__n128)a5
{
  id v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v10 = a8;
  objc_msgSend(a1, "jasperToCameraTransform");
  v15 = 0;
  v22[0] = a3;
  v22[1] = a4;
  v22[2] = a5;
  v22[3] = a6;
  do
  {
    *(__int128 *)((char *)&v23 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v22[v15])), v12, *(float32x2_t *)&v22[v15], 1), v13, (float32x4_t)v22[v15], 2), v14, (float32x4_t)v22[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  v16 = objc_msgSend(a1, "pushPointCloud:timestamp:worldToCameraTransform:", v10, a2, *(double *)&v23, *(double *)&v24, *(double *)&v25, *(double *)&v26);

  return v16;
}

- (uint64_t)pushPointCloud:(__n128)a3 timestamp:(__n128)a4 worldToCameraTransform:(__n128)a5
{
  id v11;
  id *v12;
  ADJasperPointCloud *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  __n128 *v18;
  id v19;
  int v25;
  __int128 v26;
  __int128 v27;

  v11 = a8;
  if (v11)
  {
    v12 = a1;
    objc_sync_enter(v12);
    v25 = 335679212;
    v26 = 0u;
    v27 = 0u;
    kdebug_trace();
    if (v12[4])
    {
      objc_msgSend(v11, "pointCloudByApplyingFilter:");
      v13 = (ADJasperPointCloud *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_storeStrong((id *)v12[1] + 12 * (_QWORD)v12[2], a8);
      v13 = -[ADJasperPointCloud initWithPointCloud:]([ADJasperPointCloud alloc], "initWithPointCloud:", v11);
    }
    v15 = (char *)v12[1];
    v16 = 96 * (_QWORD)v12[2];
    v17 = *(void **)&v15[v16];
    *(_QWORD *)&v15[v16] = v13;

    v18 = (__n128 *)((char *)v12[1] + 96 * (_QWORD)v12[2]);
    v18[5].n128_f64[0] = a2;
    v18[1] = a3;
    v18[2] = a4;
    v18[3] = a5;
    v18[4] = a6;
    v19 = v12[2];
    v12[2] = (id)(((unint64_t)v19 + 1) % objc_msgSend(v12[3], "aggregationSize"));
    InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v25);
    objc_sync_exit(v12);

    v14 = 0;
  }
  else
  {
    v14 = -22953;
  }

  return v14;
}

- (id)aggregateForTime:(__n128)a3 worldToCameraTransform:(__n128)a4
{
  id *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t i;
  id v13;
  unint64_t v14;
  double *v15;
  double v16;
  double v17;
  simd_float4 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  unint64_t *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  simd_float4x4 v61;
  simd_float4x4 v62;

  v40 = a6;
  v39 = a5;
  v38 = a4;
  v37 = a3;
  v60 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  objc_sync_enter(v7);
  if (v7[5])
  {
    v49 = 335679376;
    v50 = 0u;
    v51 = 0u;
    kdebug_trace();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7[3], "aggregationSize"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7[3], "aggregationSize");
    MEMORY[0x24BDAC7A8](v9);
    v11 = &v37.n128_u64[-8 * v10];
    for (i = 0;
          i < objc_msgSend(v7[3], "aggregationSize", v37.n128_u64[0], v37.n128_u64[1], v38.n128_u64[0], v38.n128_u64[1], v39.n128_u64[0], v39.n128_u64[1], v40.n128_u64[0], v40.n128_u64[1]);
          ++i)
    {
      v13 = v7[2];
      v14 = ((unint64_t)v13 + i) % objc_msgSend(v7[3], "aggregationSize");
      v15 = (double *)v7[1];
      if (*(_QWORD *)&v15[12 * v14])
      {
        v16 = v15[12 * v14 + 10];
        objc_msgSend(v7[3], "maxPointCloudAge");
        if (a2 - v16 < v17)
        {
          v18 = (simd_float4 *)((char *)v7[1] + 96 * v14);
          v44 = v18[1];
          v43 = v18[2];
          v42 = v18[3];
          v41 = v18[4];
          objc_msgSend(v7, "jasperToCameraTransform");
          v48 = v19;
          v47 = v20;
          v46 = v21;
          v45 = v22;
          v61.columns[0] = v44;
          v61.columns[1] = v43;
          v61.columns[2] = v42;
          v61.columns[3] = v41;
          v62 = __invert_f4(v61);
          v23 = 0;
          v52 = v48;
          v53 = v47;
          v54 = v46;
          v55 = v45;
          do
          {
            *(float32x4_t *)&buf[v23] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v62.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v52 + v23))), (float32x4_t)v62.columns[1], *(float32x2_t *)((char *)&v52 + v23), 1), (float32x4_t)v62.columns[2], *(float32x4_t *)((char *)&v52 + v23), 2), (float32x4_t)v62.columns[3], *(float32x4_t *)((char *)&v52 + v23), 3);
            v23 += 16;
          }
          while (v23 != 64);
          v24 = 0;
          v52 = *(_OWORD *)buf;
          v53 = v57;
          v54 = v58;
          v55 = v59;
          v25 = (float32x4_t)v40;
          v26 = (float32x4_t)v39;
          v27 = (float32x4_t)v38;
          v28 = (float32x4_t)v37;
          do
          {
            *(float32x4_t *)&buf[v24] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, COERCE_FLOAT(*(__int128 *)((char *)&v52 + v24))), v27, *(float32x2_t *)((char *)&v52 + v24), 1), v26, *(float32x4_t *)((char *)&v52 + v24), 2), v25, *(float32x4_t *)((char *)&v52 + v24), 3);
            v24 += 16;
          }
          while (v24 != 64);
          v45 = *(_OWORD *)buf;
          v46 = v57;
          v47 = v58;
          v48 = v59;
          v29 = &v11[8 * objc_msgSend(v8, "count")];
          v30 = DWORD2(v45);
          *v29 = v45;
          *((_DWORD *)v29 + 2) = v30;
          v31 = DWORD2(v46);
          v29[2] = v46;
          *((_DWORD *)v29 + 6) = v31;
          v32 = DWORD2(v47);
          v29[4] = v47;
          *((_DWORD *)v29 + 10) = v32;
          v33 = DWORD2(v48);
          v29[6] = v48;
          *((_DWORD *)v29 + 14) = v33;
          objc_msgSend(v8, "addObject:", *((_QWORD *)v7[1] + 12 * v14));
        }
      }
    }
    objc_msgSend(v7, "colorCameraCalibration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[ADJasperPointCloud pointCloudByMergingPointClouds:applyingTransforms:projectingToCamera:](ADJasperPointCloud, "pointCloudByMergingPointClouds:applyingTransforms:projectingToCamera:", v8, v11, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v49);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot aggregate point cloud. color camera calibration not set", buf, 2u);
    }
    v35 = 0;
  }
  objc_sync_exit(v7);

  return v35;
}

- (uint64_t)aggregateAndProjectForTime:(double)a3 worldToCameraTransform:(double)a4 cropTo:(double)a5 rotateBy:(double)a6 projectedPointsBuffer:(uint64_t)a7
{
  id v20;
  void *v21;
  uint64_t v22;

  v20 = a1;
  objc_sync_enter(v20);
  objc_msgSend(v20, "aggregateForTime:worldToCameraTransform:", a2, a3, a4, a5, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "projectJasperPointsCroppedBy:rotatedBy:andScaledInto:", a8, a9, a13, a14, a15, a16);

  objc_sync_exit(v20);
  return v22;
}

- (uint64_t)aggregateAndProjectForTime:(double)a3 worldToCameraTransform:(double)a4 filterParams:(double)a5 cropTo:(double)a6 rotateBy:(uint64_t)a7 projectedPointsBuffer:(void *)a8
{
  id v21;
  id v22;
  void *v23;
  uint64_t v24;

  v21 = a8;
  v22 = a1;
  objc_sync_enter(v22);
  objc_msgSend(v22, "aggregateForTime:worldToCameraTransform:", a2, a3, a4, a5, a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v21, a9, a10, a14, a15, a16, a17);

  objc_sync_exit(v22);
  return v24;
}

- (int64_t)clear
{
  ADPointCloudAggregator *v2;
  uint64_t v3;
  unint64_t i;
  $AECC3E7C48FE2C79DB5526DBCC64C3FF *history;
  id var0;

  v2 = self;
  objc_sync_enter(v2);
  v3 = 0;
  for (i = 0; i < -[ADAggregationParameters aggregationSize](v2->_aggregationParameters, "aggregationSize"); ++i)
  {
    history = v2->_history;
    var0 = history[v3].var0;
    history[v3].var0 = 0;

    v2->_history[v3 + 5].var0 = 0;
    v3 += 6;
  }
  v2->_historyIndex = 0;
  objc_sync_exit(v2);

  return 0;
}

- (ADAggregationParameters)aggregationParameters
{
  return self->_aggregationParameters;
}

- (ADJasperPointCloudFilterParameters)pointCloudFilterParameters
{
  return self->_pointCloudFilterParameters;
}

- (void)setPointCloudFilterParameters:(id)a3
{
  objc_storeStrong((id *)&self->_pointCloudFilterParameters, a3);
}

- (double)jasperToCameraTransform
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 48), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setJasperToCameraTransform:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 48), v5, 64, 1, 0);
}

- (ADCameraCalibration)colorCameraCalibration
{
  return (ADCameraCalibration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setColorCameraCalibration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCameraCalibration, 0);
  objc_storeStrong((id *)&self->_pointCloudFilterParameters, 0);
  objc_storeStrong((id *)&self->_aggregationParameters, 0);
}

+ (id)aggregatePointClouds:(__n128)a3 calibrations:(__n128)a4 worldToPlatformTransforms:(uint64_t)a5 projectingToCamera:(uint64_t)a6 worldToPlatformAtProjectionTime:(void *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unsigned int i;
  void *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  unint64_t v29;
  void *v30;
  NSObject *v32;
  const char *v33;
  uint32_t v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  _BYTE buf[24];
  __int128 v40;
  uint64_t v41;

  v37 = a3;
  v38 = a4;
  v35 = a1;
  v36 = a2;
  v41 = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  v14 = a8;
  v15 = a10;
  if (!v14 || !objc_msgSend(v14, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v32 = MEMORY[0x24BDACB70];
      v33 = "cannot aggregate point cloud. no calibration provided";
      v34 = 2;
      goto LABEL_18;
    }
LABEL_12:
    v30 = 0;
    goto LABEL_14;
  }
  v16 = objc_msgSend(v14, "count");
  if (v16 != objc_msgSend(v13, "count") && objc_msgSend(v14, "count") != 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend(v14, "count");
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v13, "count");
      v32 = MEMORY[0x24BDACB70];
      v33 = "cannot aggregate point cloud. expecting either 1 calibration instance, or one per point cloud. got %lu calib"
            "ration and %lu point clouds";
      v34 = 22;
LABEL_18:
      _os_log_error_impl(&dword_236382000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  *(_DWORD *)buf = 335679376;
  *(_OWORD *)&buf[8] = 0u;
  v40 = 0u;
  kdebug_trace();
  v17 = objc_msgSend(v13, "count");
  v18 = &v35.n128_u64[-8 * MEMORY[0x24BDAC7A8](v17)];
  for (i = 0;
        objc_msgSend(v13, "count", *(_OWORD *)&v35, *(_OWORD *)&v36, *(_OWORD *)&v37, *(_OWORD *)&v38, *(_QWORD *)buf, *(_OWORD *)&buf[8], v40, v41) > (unint64_t)i;
        ++i)
  {
    if (objc_msgSend(v14, "count") <= (unint64_t)i)
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    else
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cameraToPlatformTransform");
    v21 = &v18[8 * (unint64_t)i];
    *v21 = v22;
    *((_DWORD *)v21 + 2) = v23;
    *((_DWORD *)v21 + 6) = v24;
    *((_DWORD *)v21 + 10) = v25;
    v21[2] = v26;
    v21[4] = v27;
    *((_DWORD *)v21 + 14) = v28;
    v21[6] = v29;

  }
  +[ADPointCloudAggregator aggregatePointClouds:pointCloudToPlatformTransforms:worldToPlatformTransforms:projectingToCamera:worldToPlatformAtProjectionTime:](ADPointCloudAggregator, "aggregatePointClouds:pointCloudToPlatformTransforms:worldToPlatformTransforms:projectingToCamera:worldToPlatformAtProjectionTime:", v13, v18, a9, v15, v35.n128_f64[0], v36.n128_f64[0], v37.n128_f64[0], v38.n128_f64[0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)buf);
LABEL_14:

  return v30;
}

+ (id)aggregatePointClouds:(__n128)a3 pointCloudToPlatformTransforms:(__n128)a4 worldToPlatformTransforms:(uint64_t)a5 projectingToCamera:(uint64_t)a6 worldToPlatformAtProjectionTime:(void *)a7
{
  id v13;
  id v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unsigned int v18;
  simd_float4x4 *v19;
  unint64_t v20;
  __n128 *v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  unint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  unint64_t v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  unint64_t *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  uint8_t buf[16];
  __n128 v49;
  __n128 v50;
  __n128 v51;
  uint64_t v52;
  simd_float4x4 v53;
  simd_float4x4 v54;
  simd_float4x4 v55;

  v42 = a3;
  v43 = a4;
  v41 = a2;
  v40 = a1;
  v52 = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  v14 = a10;
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = MEMORY[0x24BDACB70];
      v37 = "cannot aggregate point cloud. color camera calibration not set";
      goto LABEL_23;
    }
LABEL_19:
    v38 = 0;
    goto LABEL_21;
  }
  if (!v13 || !objc_msgSend(v13, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = MEMORY[0x24BDACB70];
      v37 = "cannot aggregate point cloud. no point clouds provided";
LABEL_23:
      _os_log_error_impl(&dword_236382000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v15 = objc_msgSend(v13, "count");
  v16 = &v40.n128_u64[-8 * MEMORY[0x24BDAC7A8](v15)];
  objc_msgSend(v14, "cameraToPlatformTransform");
  v53.columns[0].i32[3] = 0;
  v53.columns[1].i32[3] = 0;
  v53.columns[2].i32[3] = 0;
  v53.columns[3].i32[3] = 1.0;
  v54 = __invert_f4(v53);
  v17 = 0;
  v44 = v40;
  v45 = v41;
  v46 = v42;
  v47 = v43;
  do
  {
    *(float32x4_t *)&buf[v17] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v54.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v44 + v17))), (float32x4_t)v54.columns[1], (float32x2_t)v44.n128_u64[v17 / 8], 1), (float32x4_t)v54.columns[2], *(float32x4_t *)((char *)&v44 + v17), 2), (float32x4_t)v54.columns[3], *(float32x4_t *)((char *)&v44 + v17), 3);
    v17 += 16;
  }
  while (v17 != 64);
  v18 = 0;
  v42 = v49;
  v43 = *(__n128 *)buf;
  v41 = v50;
  v40 = v51;
  v19 = (simd_float4x4 *)MEMORY[0x24BDAEE00];
  while (objc_msgSend(v13, "count", v40.n128_u64[0], v40.n128_u64[1], v41.n128_u64[0], v41.n128_u64[1], *(_OWORD *)&v42, *(_OWORD *)&v43, *(_OWORD *)&v44, *(_OWORD *)&v45, *(_OWORD *)&v46, *(_OWORD *)&v47) > (unint64_t)v18)
  {
    if (a9)
      v55 = __invert_f4(*(simd_float4x4 *)(a9 + ((unint64_t)v18 << 6)));
    else
      v55 = *v19;
    v20 = 0;
    v21 = (__n128 *)(a8 + ((unint64_t)v18 << 6));
    v22 = *v21;
    v23 = v21[1];
    v24 = v21[2];
    v25 = v21[3];
    v22.n128_u32[3] = 0;
    v23.n128_u32[3] = 0;
    v24.n128_u32[3] = 0;
    v25.n128_u32[3] = 1.0;
    v44 = v22;
    v45 = v23;
    v46 = v24;
    v47 = v25;
    do
    {
      *(float32x4_t *)&buf[v20] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v55.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v44 + v20))), (float32x4_t)v55.columns[1], (float32x2_t)v44.n128_u64[v20 / 8], 1), (float32x4_t)v55.columns[2], *(float32x4_t *)((char *)&v44 + v20), 2), (float32x4_t)v55.columns[3], *(float32x4_t *)((char *)&v44 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    v26 = 0;
    v44 = *(__n128 *)buf;
    v45 = v49;
    v46 = v50;
    v47 = v51;
    v28 = (float32x4_t)v42;
    v27 = (float32x4_t)v43;
    v29 = (float32x4_t)v41;
    v30 = (float32x4_t)v40;
    do
    {
      *(float32x4_t *)&buf[v26] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)((char *)&v44 + v26))), v28, (float32x2_t)v44.n128_u64[v26 / 8], 1), v29, *(float32x4_t *)((char *)&v44 + v26), 2), v30, *(float32x4_t *)((char *)&v44 + v26), 3);
      v26 += 16;
    }
    while (v26 != 64);
    v31 = *(_QWORD *)buf;
    v32 = v49;
    v33 = v50;
    v34 = v51;
    v35 = &v16[8 * (unint64_t)v18];
    *((_DWORD *)v35 + 2) = *(_DWORD *)&buf[8];
    *v35 = v31;
    *((_DWORD *)v35 + 6) = v32.n128_u32[2];
    v35[2] = v32.n128_u64[0];
    *((_DWORD *)v35 + 10) = v33.n128_u32[2];
    v35[4] = v33.n128_u64[0];
    *((_DWORD *)v35 + 14) = v34.n128_u32[2];
    ++v18;
    v35[6] = v34.n128_u64[0];
  }
  +[ADJasperPointCloud pointCloudByMergingPointClouds:applyingTransforms:projectingToCamera:](ADJasperPointCloud, "pointCloudByMergingPointClouds:applyingTransforms:projectingToCamera:", v13, v16, v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v38;
}

@end
