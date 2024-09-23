@implementation BWMovieFileOutputAnalyticsPayload

- (BWMovieFileOutputAnalyticsPayload)init
{
  BWMovieFileOutputAnalyticsPayload *v2;
  BWMovieFileOutputAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWMovieFileOutputAnalyticsPayload;
  v2 = -[BWMovieFileOutputAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWMovieFileOutputAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)reset
{
  BWMovieFileOutputAnalyticsPayload *v2;

  v2 = self;
  self->_deviceType = 0;
  *(_QWORD *)&self->_activeDeviceMask = 0;
  *(_QWORD *)&self->_videoOrientation = 0;
  self->_videoMirrored = 0;
  self->_duration = 0.0;
  self->_durationFront = 0.0;
  self->_durationRearTele = 0.0;
  self->_durationRearSuperWide = 0.0;
  self->_durationRearWide = 0.0;
  self->_nominalFramerate = 3.4028e38;
  *(_QWORD *)&self->_height = 0x8000000080000000;
  self->_numberOfTimesRecordingWasPaused = 0;
  *(_OWORD *)&self->_startingUIZoom = xmmword_1A32B1870;
  self->_maxSystemPressureLevel = 0;
  self->_timeToCriticalSystemPressureInMS = -1;
  self->_systemPressureFactors = 0;

  v2->_clientApplicationID = 0;
  v2->_sphereAFStatistics = 0;

  v2->_sphereModeByPortType = 0;
  v2->_APSModeByPortType = 0;

  v2->_variableFrameRateStatistics = 0;
  v2->_afDriverShortOccurred = 0;
  v2->_totalNumberOfFramesDropped = 0;
  v2->_numberOfFramesDroppedDueToFormatWriterQueueFull = 0;
  *(_WORD *)&v2->_hdrVideo = 0;
  v2->_colorSpace = -1;
  v2->_stereoVideoCaptureEnabled = 0;
  v2->_stereoVideoCaptureStatus = 1;
  v2->_numberOfISPFramesDropped = 0;
  v2->_numberOfISPFrames = 0;

  v2->_cameraSwitchStatistics = 0;
  *(_OWORD *)&v2->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests = 0u;
  v2 = (BWMovieFileOutputAnalyticsPayload *)((char *)v2 + 252);
  *(unint64_t *)((char *)&v2[-1]._externalStorageDeviceTotalSize + 4) = 0;
  BYTE4(v2[-1]._externalStorageDeviceBaseOffset) = 0;
  *(_OWORD *)&v2->_videoOrientation = 0u;

  *(_QWORD *)(&v2->_numberOfTimesRecordingWasPaused + 1) = 0;
  *(NSString **)((char *)&v2->_clientApplicationID + 4) = 0;
  HIDWORD(v2->_duration) = -1082130432;
  *(double *)((char *)&v2->_durationFront + 4) = NAN;
  *(double *)((char *)&v2->_durationFrontSuperWide + 4) = NAN;
  BYTE4(v2->_durationRearWide) = 0;

  *(double *)((char *)&v2->_durationRearSuperWide + 4) = 0.0;
  *(double *)((char *)&v2->_durationRearTele + 4) = 0.0;
  *(_OWORD *)&v2->_height = xmmword_1A32B1880;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMovieFileOutputAnalyticsPayload;
  -[BWMovieFileOutputAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (id)eventName
{
  if (self->_proresVideo)
    return CFSTR("com.apple.coremedia.camera.ProResMovieFileCapture");
  else
    return CFSTR("com.apple.coremedia.camera.MovieFileCapture");
}

- (id)eventDictionary
{
  void *v3;
  double durationRearSuperWide;
  double v5;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *sphereAFStatistics;
  double v7;
  int32x4_t v8;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v19;
  unsigned int v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v27;
  void *v28;
  unsigned int *p_range_220_infinityBinWide;
  const __CFString *v30;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v41;
  unsigned int v42;
  float v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v49;
  void *v50;
  unsigned int *p_range_220_infinityBinTele;
  const __CFString *v52;
  BWCoreAnalyticsMovieRecordingSphereAFStatistics *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  NSDictionary *sphereModeByPortType;
  uint64_t *v60;
  uint64_t *v61;
  NSDictionary *APSModeByPortType;
  uint64_t *v63;
  NSDictionary *variableFrameRateStatistics;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  BWCoreAnalyticsMovieRecordingVideoSTFStatistics *videoSTFStatistics;
  BWCoreAnalyticsMovieRecordingVideoSTFStatistics *v91;
  double v92;
  double v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  double v111;
  int64_t totalNANDReadBytesDuringRecording;
  int64_t totalNANDWriteBytesDuringRecording;
  NSString *externalStorageDeviceProductName;
  NSString *externalStorageDeviceVendorName;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clientApplicationID, CFSTR("clientApplicationID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_videoMirrored), CFSTR("videoMirrored"));
  if (self->_activeDeviceMask)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("activeDeviceMask"));
  if (self->_devicePosition)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("devicePosition"));
  if (self->_videoOrientation)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("videoOrientation"));
  if (self->_cameraPosture)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("cameraPosture"));
  if (self->_deviceType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("deviceType"));
  if (self->_numberOfTimesRecordingWasPaused)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("numberOfTimesRecordingWasPaused"));
  if (self->_duration != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("duration"));
  if (self->_durationFront != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("durationFront"));
  if (self->_durationFrontSuperWide != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_durationFront), CFSTR("durationFrontSuperWide"));
  if (self->_durationRearWide != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("durationRearWide"));
  if (self->_durationRearTele != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("durationRearTele"));
  durationRearSuperWide = self->_durationRearSuperWide;
  if (durationRearSuperWide != 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("durationRearSuperWide"));
  if (self->_nominalFramerate != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("nominalFramerate"));
  if (self->_height != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("height"));
  if (self->_width != 0x7FFFFFFF)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("width"));
  if (self->_startingUIZoom != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("startingUIZoom"));
  if (self->_minUIZoomDuringVideoRecording != 3.4028e38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("minUIZoomDuringVideoRecording"));
  if (self->_maxUIZoomDuringVideoRecording != 1.1755e-38)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("maxUIZoomDuringVideoRecording"));
  *(float *)&durationRearSuperWide = self->_averageSystemPressureLevel;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", durationRearSuperWide), CFSTR("averageSystemPressureLevel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxSystemPressureLevel), CFSTR("maxSystemPressureLevel"));
  if ((self->_timeToCriticalSystemPressureInMS & 0x8000000000000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:"), CFSTR("timeToCriticalSystemPressure"));
  if (self->_systemPressureFactors)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("systemPressureFactors"));
  sphereAFStatistics = self->_sphereAFStatistics;
  if (sphereAFStatistics)
  {
    *(float *)&v5 = sphereAFStatistics->accelStandardDeviation;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("accelStd"));
    *(float *)&v7 = self->_sphereAFStatistics->gyroStandardDeviation;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7), CFSTR("gyroStd"));
    v9 = self->_sphereAFStatistics;
    if (v9->numberOfSamplesWide)
    {
      v8.i32[0] = LODWORD(v9->sphereMaxTrackErrorWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)v8.i64), CFSTR("oisMaxTrackErrorWide"));
      *(float *)&v10 = self->_sphereAFStatistics->afMaxTrackErrorWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10), CFSTR("afMaxTrackErrorWide"));
      *(float *)&v11 = sqrtf(self->_sphereAFStatistics->sphereStdTrackErrorSumXXWide/ (float)self->_sphereAFStatistics->numberOfSamplesWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11), CFSTR("oisStdTrackErrorWide"));
      *(float *)&v12 = sqrtf(self->_sphereAFStatistics->afStdTrackErrorSumXXWide/ (float)self->_sphereAFStatistics->numberOfSamplesWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12), CFSTR("afStdTrackErrorWide"));
      *(float *)&v13 = self->_sphereAFStatistics->sphereMinDistanceFromEndStopWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), CFSTR("oisMinDistFromEndStopWide"));
      *(float *)&v14 = self->_sphereAFStatistics->spherePowerWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14), CFSTR("oisPowerWide"));
      *(float *)&v15 = self->_sphereAFStatistics->afPowerWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15), CFSTR("afPowerWide"));
      *(float *)&v16 = self->_sphereAFStatistics->sphereMaxPeakCurrentWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16), CFSTR("oisMaxPeakCurrentWide"));
      *(float *)&v17 = self->_sphereAFStatistics->afMaxPeakCurrentWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17), CFSTR("afMaxPeakCurrentWide"));
      *(float *)&v18 = self->_sphereAFStatistics->afAndSphereMaxPeakCurrentWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18), CFSTR("afAndOisMaxPeakCurrentWide"));
      v19 = self->_sphereAFStatistics;
      v8 = *(int32x4_t *)&v19->range_0_90umBinWide;
      v20 = vaddvq_s32(vaddq_s32(v8, *(int32x4_t *)&v19->range_150_175umBinWide));
      if (v20)
      {
        v21 = (float)v20;
        *(float *)v8.i32 = (float)v8.u32[0] / (float)v20;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)v8.i64), CFSTR("oisPos0to90micronsWide"));
        *(float *)&v22 = (float)self->_sphereAFStatistics->range_90_110umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22), CFSTR("oisPos90to110micronsWide"));
        *(float *)&v23 = (float)self->_sphereAFStatistics->range_110_130umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), CFSTR("oisPos110to130micronsWide"));
        *(float *)&v24 = (float)self->_sphereAFStatistics->range_130_150umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), CFSTR("oisPos130to150micronsWide"));
        *(float *)&v25 = (float)self->_sphereAFStatistics->range_150_175umBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25), CFSTR("oisPos150to175micronsWide"));
        v27 = self->_sphereAFStatistics;
        v28 = (void *)MEMORY[0x1E0CB37E8];
        if (v27->sphereTravelRangeHistogramExtended)
        {
          *(float *)&v26 = (float)v27->range_175_220umBinWide / v21;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26), CFSTR("oisPos175to220micronsWide"));
          v28 = (void *)MEMORY[0x1E0CB37E8];
          p_range_220_infinityBinWide = &self->_sphereAFStatistics->range_220_infinityBinWide;
          v30 = CFSTR("oisPos220toInfmicronsWide");
        }
        else
        {
          p_range_220_infinityBinWide = &v27->range_175_infinityBinWide;
          v30 = CFSTR("oisPos175toInfmicronsWide");
        }
        *(float *)&v26 = (float)*p_range_220_infinityBinWide / v21;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v28, "numberWithFloat:", v26), v30);
      }
    }
    v31 = self->_sphereAFStatistics;
    if (v31->numberOfSamplesTele)
    {
      v8.i32[0] = LODWORD(v31->sphereMaxTrackErrorTele);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)v8.i64), CFSTR("oisMaxTrackErrorTele"));
      *(float *)&v32 = self->_sphereAFStatistics->afMaxTrackErrorTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32), CFSTR("afMaxTrackErrorTele"));
      *(float *)&v33 = sqrtf(self->_sphereAFStatistics->sphereStdTrackErrorSumXXTele/ (float)self->_sphereAFStatistics->numberOfSamplesTele);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33), CFSTR("oisStdTrackErrorTele"));
      *(float *)&v34 = sqrtf(self->_sphereAFStatistics->afStdTrackErrorSumXXTele/ (float)self->_sphereAFStatistics->numberOfSamplesTele);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34), CFSTR("afStdTrackErrorTele"));
      *(float *)&v35 = self->_sphereAFStatistics->sphereMinDistanceFromEndStopTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35), CFSTR("oisMinDistFromEndStopTele"));
      *(float *)&v36 = self->_sphereAFStatistics->spherePowerTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36), CFSTR("oisPowerTele"));
      *(float *)&v37 = self->_sphereAFStatistics->afPowerTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37), CFSTR("afPowerTele"));
      *(float *)&v38 = self->_sphereAFStatistics->sphereMaxPeakCurrentTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38), CFSTR("oisMaxPeakCurrentTele"));
      *(float *)&v39 = self->_sphereAFStatistics->afMaxPeakCurrentTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39), CFSTR("afMaxPeakCurrentTele"));
      *(float *)&v40 = self->_sphereAFStatistics->afAndSphereMaxPeakCurrentTele;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40), CFSTR("afAndOisMaxPeakCurrentTele"));
      v41 = self->_sphereAFStatistics;
      v8 = *(int32x4_t *)&v41->range_0_90umBinTele;
      v42 = vaddvq_s32(vaddq_s32(v8, *(int32x4_t *)&v41->range_150_175umBinTele));
      if (v42)
      {
        v43 = (float)v42;
        *(float *)v8.i32 = (float)v8.u32[0] / (float)v42;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)v8.i64), CFSTR("oisPos0to90micronsTele"));
        *(float *)&v44 = (float)self->_sphereAFStatistics->range_90_110umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44), CFSTR("oisPos90to110micronsTele"));
        *(float *)&v45 = (float)self->_sphereAFStatistics->range_110_130umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45), CFSTR("oisPos110to130micronsTele"));
        *(float *)&v46 = (float)self->_sphereAFStatistics->range_130_150umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46), CFSTR("oisPos130to150micronsTele"));
        *(float *)&v47 = (float)self->_sphereAFStatistics->range_150_175umBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47), CFSTR("oisPos150to175micronsTele"));
        v49 = self->_sphereAFStatistics;
        v50 = (void *)MEMORY[0x1E0CB37E8];
        if (v49->sphereTravelRangeHistogramExtended)
        {
          *(float *)&v48 = (float)v49->range_175_220umBinTele / v43;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48), CFSTR("oisPos175to220micronsTele"));
          v50 = (void *)MEMORY[0x1E0CB37E8];
          p_range_220_infinityBinTele = &self->_sphereAFStatistics->range_220_infinityBinTele;
          v52 = CFSTR("oisPos220toInfmicronsTele");
        }
        else
        {
          p_range_220_infinityBinTele = &v49->range_175_infinityBinTele;
          v52 = CFSTR("oisPos175toInfmicronsTele");
        }
        *(float *)&v48 = (float)*p_range_220_infinityBinTele / v43;
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v50, "numberWithFloat:", v48), v52);
      }
    }
    v53 = self->_sphereAFStatistics;
    if (v53->numberOfSamplesSuperWide)
    {
      v8.i32[0] = LODWORD(v53->afMaxTrackErrorSuperWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)v8.i64), CFSTR("afMaxTrackErrorSuperWide"));
      *(float *)&v54 = sqrtf(self->_sphereAFStatistics->afStdTrackErrorSumXXSuperWide/ (float)self->_sphereAFStatistics->numberOfSamplesSuperWide);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54), CFSTR("afStdTrackErrorSuperWide"));
      *(float *)&v55 = self->_sphereAFStatistics->afPowerSuperWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55), CFSTR("afPowerSuperWide"));
      *(float *)&v56 = self->_sphereAFStatistics->afMaxPeakCurrentSuperWide;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56), CFSTR("afMaxPeakCurrentSuperWide"));
      v53 = self->_sphereAFStatistics;
    }
    v8.i32[0] = LODWORD(v53->sphereMaxPeakCurrentAllChannels);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)v8.i64), CFSTR("oisMaxPeakCurrentAllChannels"));
    *(float *)&v57 = self->_sphereAFStatistics->afMaxPeakCurrentAllChannels;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57), CFSTR("afMaxPeakCurrentAllChannels"));
    *(float *)&v58 = self->_sphereAFStatistics->afAndSphereMaxPeakCurrentAllChannels;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58), CFSTR("afAndOisMaxPeakCurrentAllChannels"));
  }
  sphereModeByPortType = self->_sphereModeByPortType;
  v60 = (uint64_t *)MEMORY[0x1E0D05A18];
  v61 = (uint64_t *)MEMORY[0x1E0D05A30];
  if (sphereModeByPortType)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](sphereModeByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), CFSTR("sphereModeWide"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_sphereModeByPortType, "objectForKeyedSubscript:", *v61), CFSTR("sphereModeTele"));
  }
  APSModeByPortType = self->_APSModeByPortType;
  v63 = (uint64_t *)MEMORY[0x1E0D05A28];
  if (APSModeByPortType)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](APSModeByPortType, "objectForKeyedSubscript:", *v60), CFSTR("apsModeWide"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_APSModeByPortType, "objectForKeyedSubscript:", *v61), CFSTR("apsModeTele"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_APSModeByPortType, "objectForKeyedSubscript:", *v63), CFSTR("apsModeSuperWide"));
  }
  variableFrameRateStatistics = self->_variableFrameRateStatistics;
  if (variableFrameRateStatistics)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](variableFrameRateStatistics, "objectForKeyedSubscript:", 0x1E495A598), CFSTR("vfrEnabled"));
    v65 = -[NSDictionary objectForKeyedSubscript:](self->_variableFrameRateStatistics, "objectForKeyedSubscript:", 0x1E495A5B8);
    v66 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA758);
    v67 = (void *)MEMORY[0x1E0CB37E8];
    if (v66)
      v68 = objc_msgSend(v66, "intValue");
    else
      v68 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v67, "numberWithInt:", v68), CFSTR("countOfFrameRateChangesDueToInitialization"));
    v69 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA770);
    v70 = (void *)MEMORY[0x1E0CB37E8];
    if (v69)
      v71 = objc_msgSend(v69, "intValue");
    else
      v71 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v70, "numberWithInt:", v71), CFSTR("countOfFrameRateChangesDueToHighLightStable"));
    v72 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA788);
    v73 = (void *)MEMORY[0x1E0CB37E8];
    if (v72)
      v74 = objc_msgSend(v72, "intValue");
    else
      v74 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v73, "numberWithInt:", v74), CFSTR("countOfFrameRateChangesDueToHighLightUnstable"));
    v75 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA7A0);
    v76 = (void *)MEMORY[0x1E0CB37E8];
    if (v75)
      v77 = objc_msgSend(v75, "intValue");
    else
      v77 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v76, "numberWithInt:", v77), CFSTR("countOfFrameRateChangesDueToHighLightAELimitsReached"));
    v78 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA7B8);
    v79 = (void *)MEMORY[0x1E0CB37E8];
    if (v78)
      v80 = objc_msgSend(v78, "intValue");
    else
      v80 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v79, "numberWithInt:", v80), CFSTR("countOfFrameRateChangesDueToHighLightFlickerDetected"));
    v81 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA7D0);
    v82 = (void *)MEMORY[0x1E0CB37E8];
    if (v81)
      v83 = objc_msgSend(v81, "intValue");
    else
      v83 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v82, "numberWithInt:", v83), CFSTR("countOfFrameRateChangesDueToMediumLight"));
    v84 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA7E8);
    v85 = (void *)MEMORY[0x1E0CB37E8];
    if (v84)
      v86 = objc_msgSend(v84, "intValue");
    else
      v86 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v85, "numberWithInt:", v86), CFSTR("countOfFrameRateChangesDueToMediumLightAELimitsReached"));
    v87 = (void *)objc_msgSend(v65, "objectForKeyedSubscript:", &unk_1E49FA800);
    v88 = (void *)MEMORY[0x1E0CB37E8];
    if (v87)
      v89 = objc_msgSend(v87, "intValue");
    else
      v89 = 0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v88, "numberWithInt:", v89), CFSTR("countOfFrameRateChangesDueToLowLightToHighLightStopOver"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_afDriverShortOccurred), CFSTR("afDriverShortOccurred"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalNumberOfFramesDropped), CFSTR("totalNumberOfFramesDropped"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfFramesDroppedDueToFormatWriterQueueFull), CFSTR("numberOfFramesDroppedDueToFormatWriterQueueFull"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfISPFrames), CFSTR("numberOfISPFrames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numberOfISPFramesDropped), CFSTR("numberOfISPFramesDropped"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hdrVideo), CFSTR("hdrVideo"));
  videoSTFStatistics = self->_videoSTFStatistics;
  if (videoSTFStatistics)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", videoSTFStatistics->videoSTFEnabled), CFSTR("videoSTFEnabled"));
    v91 = self->_videoSTFStatistics;
    if (v91->videoSTFEnabled)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v91->cancelReason, CFSTR("videoSTFCancelReason"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_videoSTFStatistics->version), CFSTR("videoSTFVersion"));
      *(float *)&v92 = self->_videoSTFStatistics->videoSTFAppliedFrameCountPercentage;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v92), CFSTR("videoSTFAppliedFrameCountPercentage"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_videoSTFStatistics->videoSTFAppliedFrameCountPercentage > 0.0), CFSTR("videoSTFApplied"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoSTFStatistics->lowMeanCorrectionLevelFrameCount), CFSTR("videoSTFLowMeanCorrectionLevelFrameCount"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoSTFStatistics->moderateMeanCorrectionLevelFrameCount), CFSTR("videoSTFModerateMeanCorrectionLevelFrameCount"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoSTFStatistics->highMeanCorrectionLevelFrameCount), CFSTR("videoSTFHighMeanCorrectionLevelFrameCount"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoSTFStatistics->veryHighMeanCorrectionLevelFrameCount), CFSTR("videoSTFVeryHighMeanCorrectionLevelFrameCount"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_videoSTFStatistics->extremeMeanCorrectionLevelFrameCount), CFSTR("videoSTFExtremeMeanCorrectionLevelFrameCount"));
      *(float *)&v93 = self->_videoSTFStatistics->largestMaxCorrectionLevel;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93), CFSTR("videoSTFLargestMaxCorrectionLevel"));
    }
  }
  v94 = *v60;
  v95 = -[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", *v60);
  v96 = *v63;
  v97 = objc_msgSend(v95, "objectForKeyedSubscript:", *v63);
  if (v97)
    v98 = (void *)v97;
  else
    v98 = &unk_1E49FA818;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("countOfWideToSuperWide"));
  v99 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v96), "objectForKeyedSubscript:", v94);
  if (v99)
    v100 = (void *)v99;
  else
    v100 = &unk_1E49FA818;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("countOfSuperWideToWide"));
  v101 = -[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v96);
  v102 = *v61;
  v103 = objc_msgSend(v101, "objectForKeyedSubscript:", v102);
  if (v103)
    v104 = (void *)v103;
  else
    v104 = &unk_1E49FA818;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("countOfSuperWideToTele"));
  v105 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v102), "objectForKeyedSubscript:", v96);
  if (v105)
    v106 = (void *)v105;
  else
    v106 = &unk_1E49FA818;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("countOfTeleToSuperWide"));
  v107 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v94), "objectForKeyedSubscript:", v102);
  if (v107)
    v108 = (void *)v107;
  else
    v108 = &unk_1E49FA818;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("countOfWideToTele"));
  v109 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cameraSwitchStatistics, "objectForKeyedSubscript:", v102), "objectForKeyedSubscript:", v94);
  if (v109)
    v110 = (void *)v109;
  else
    v110 = &unk_1E49FA818;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("countOfTeleToWide"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cinematicVideoEnabled), CFSTR("cinematicVideoEnabled"));
  if (self->_cinematicVideoEnabled)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests), CFSTR("cinematicVideoCountOfSoftFocusRequests"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfHardFocusRequests), CFSTR("cinematicVideoCountOfHardFocusRequests"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfFixedPlaneFocusRequests), CFSTR("cinematicVideoCountOfFixedPlaneFocusRequests"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfTapToTrackFailures), CFSTR("cinematicVideoCountOfTapToTrackFailures"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfFixedTaxonomyFocusDecisions), CFSTR("cinematicVideoCountOfFixedTaxonomyFocusDecisions"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfNonTaxonomyFocusDecisions), CFSTR("cinematicVideoCountOfNonTaxonomyFocusDecisions"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfCustomFocusDecisions), CFSTR("cinematicVideoCountOfCustomFocusDecisions"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_cinematicVideoMovieRecordingStats.countOfAutoFocusDecisions), CFSTR("cinematicVideoCountOfAutoFocusDecisions"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_videoCodec, CFSTR("videoCodec"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_movieFileSize), CFSTR("fileSize"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_movieFileSize * 0.000000953674316), CFSTR("fileSizeInMB"));
  *(float *)&v111 = self->_percentageOfAvailableDataStorageAfterWritingMovie;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v111), CFSTR("percentageOfAvailableDataStorageAfterWritingMovie"));
  totalNANDReadBytesDuringRecording = self->_totalNANDReadBytesDuringRecording;
  if ((totalNANDReadBytesDuringRecording & 0x8000000000000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)totalNANDReadBytesDuringRecording * 0.000000953674316), CFSTR("totalNANDReadSizeDuringRecordingInMB"));
  totalNANDWriteBytesDuringRecording = self->_totalNANDWriteBytesDuringRecording;
  if ((totalNANDWriteBytesDuringRecording & 0x8000000000000000) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(totalNANDWriteBytesDuringRecording - self->_movieFileSize) * 0.000000953674316), CFSTR("totalNANDWriteSizeAndFileSizeDifferenceInMB"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_capturingOntoExternalStorageDevice), CFSTR("capturingOntoExternalStorageDevice"));
  externalStorageDeviceProductName = self->_externalStorageDeviceProductName;
  if (externalStorageDeviceProductName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", externalStorageDeviceProductName, CFSTR("externalStorageDeviceProductName"));
  externalStorageDeviceVendorName = self->_externalStorageDeviceVendorName;
  if (externalStorageDeviceVendorName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", externalStorageDeviceVendorName, CFSTR("externalStorageDeviceVendorName"));
  if (self->_externalStorageDeviceTotalSize)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:"), CFSTR("externalStorageDeviceTotalSize"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_externalStorageDeviceBaseOffset), CFSTR("externalStorageDeviceBaseOffset"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_colorSpace), CFSTR("colorSpace"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stereoVideoCaptureEnabled), CFSTR("stereoVideoCaptureEnabled"));
  if (self->_stereoVideoCaptureEnabled)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stereoVideoCaptureStatus), CFSTR("stereoVideoCaptureStatus"));
  return v3;
}

- (int)activeDeviceMask
{
  return self->_activeDeviceMask;
}

- (void)setActiveDeviceMask:(int)a3
{
  self->_activeDeviceMask = a3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (int)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int)a3
{
  self->_videoOrientation = a3;
}

- (int)cameraPosture
{
  return self->_cameraPosture;
}

- (void)setCameraPosture:(int)a3
{
  self->_cameraPosture = a3;
}

- (BOOL)videoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int)a3
{
  self->_deviceType = a3;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)numberOfTimesRecordingWasPaused
{
  return self->_numberOfTimesRecordingWasPaused;
}

- (void)setNumberOfTimesRecordingWasPaused:(int)a3
{
  self->_numberOfTimesRecordingWasPaused = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)durationFront
{
  return self->_durationFront;
}

- (void)setDurationFront:(double)a3
{
  self->_durationFront = a3;
}

- (double)durationFrontSuperWide
{
  return self->_durationFrontSuperWide;
}

- (void)setDurationFrontSuperWide:(double)a3
{
  self->_durationFrontSuperWide = a3;
}

- (double)durationRearWide
{
  return self->_durationRearWide;
}

- (void)setDurationRearWide:(double)a3
{
  self->_durationRearWide = a3;
}

- (double)durationRearTele
{
  return self->_durationRearTele;
}

- (void)setDurationRearTele:(double)a3
{
  self->_durationRearTele = a3;
}

- (double)durationRearSuperWide
{
  return self->_durationRearSuperWide;
}

- (void)setDurationRearSuperWide:(double)a3
{
  self->_durationRearSuperWide = a3;
}

- (float)nominalFramerate
{
  return self->_nominalFramerate;
}

- (void)setNominalFramerate:(float)a3
{
  self->_nominalFramerate = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (float)startingUIZoom
{
  return self->_startingUIZoom;
}

- (void)setStartingUIZoom:(float)a3
{
  self->_startingUIZoom = a3;
}

- (float)minUIZoomDuringVideoRecording
{
  return self->_minUIZoomDuringVideoRecording;
}

- (void)setMinUIZoomDuringVideoRecording:(float)a3
{
  self->_minUIZoomDuringVideoRecording = a3;
}

- (float)maxUIZoomDuringVideoRecording
{
  return self->_maxUIZoomDuringVideoRecording;
}

- (void)setMaxUIZoomDuringVideoRecording:(float)a3
{
  self->_maxUIZoomDuringVideoRecording = a3;
}

- (float)averageSystemPressureLevel
{
  return self->_averageSystemPressureLevel;
}

- (void)setAverageSystemPressureLevel:(float)a3
{
  self->_averageSystemPressureLevel = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (int64_t)timeToCriticalSystemPressureInMS
{
  return self->_timeToCriticalSystemPressureInMS;
}

- (void)setTimeToCriticalSystemPressureInMS:(int64_t)a3
{
  self->_timeToCriticalSystemPressureInMS = a3;
}

- (unsigned)systemPressureFactors
{
  return self->_systemPressureFactors;
}

- (void)setSystemPressureFactors:(unsigned int)a3
{
  self->_systemPressureFactors = a3;
}

- (BWCoreAnalyticsMovieRecordingSphereAFStatistics)sphereAFStatistics
{
  return self->_sphereAFStatistics;
}

- (void)setSphereAFStatistics:(BWCoreAnalyticsMovieRecordingSphereAFStatistics *)a3
{
  self->_sphereAFStatistics = a3;
}

- (NSDictionary)cameraSwitchStatistics
{
  return self->_cameraSwitchStatistics;
}

- (void)setCameraSwitchStatistics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSDictionary)sphereModeByPortType
{
  return self->_sphereModeByPortType;
}

- (void)setSphereModeByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSDictionary)APSModeByPortType
{
  return self->_APSModeByPortType;
}

- (void)setAPSModeByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSDictionary)variableFrameRateStatistics
{
  return self->_variableFrameRateStatistics;
}

- (void)setVariableFrameRateStatistics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (BOOL)afDriverShortOccurred
{
  return self->_afDriverShortOccurred;
}

- (void)setAfDriverShortOccurred:(BOOL)a3
{
  self->_afDriverShortOccurred = a3;
}

- (unint64_t)totalNumberOfFramesDropped
{
  return self->_totalNumberOfFramesDropped;
}

- (void)setTotalNumberOfFramesDropped:(unint64_t)a3
{
  self->_totalNumberOfFramesDropped = a3;
}

- (unint64_t)numberOfFramesDroppedDueToFormatWriterQueueFull
{
  return self->_numberOfFramesDroppedDueToFormatWriterQueueFull;
}

- (void)setNumberOfFramesDroppedDueToFormatWriterQueueFull:(unint64_t)a3
{
  self->_numberOfFramesDroppedDueToFormatWriterQueueFull = a3;
}

- (BOOL)hdrVideo
{
  return self->_hdrVideo;
}

- (void)setHdrVideo:(BOOL)a3
{
  self->_hdrVideo = a3;
}

- (BOOL)proresVideo
{
  return self->_proresVideo;
}

- (void)setProresVideo:(BOOL)a3
{
  self->_proresVideo = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (BOOL)stereoVideoCaptureEnabled
{
  return self->_stereoVideoCaptureEnabled;
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  self->_stereoVideoCaptureEnabled = a3;
}

- (int)stereoVideoCaptureStatus
{
  return self->_stereoVideoCaptureStatus;
}

- (void)setStereoVideoCaptureStatus:(int)a3
{
  self->_stereoVideoCaptureStatus = a3;
}

- (unint64_t)numberOfISPFramesDropped
{
  return self->_numberOfISPFramesDropped;
}

- (void)setNumberOfISPFramesDropped:(unint64_t)a3
{
  self->_numberOfISPFramesDropped = a3;
}

- (unint64_t)numberOfISPFrames
{
  return self->_numberOfISPFrames;
}

- (void)setNumberOfISPFrames:(unint64_t)a3
{
  self->_numberOfISPFrames = a3;
}

- (BWCoreAnalyticsMovieRecordingVideoSTFStatistics)videoSTFStatistics
{
  return self->_videoSTFStatistics;
}

- (void)setVideoSTFStatistics:(BWCoreAnalyticsMovieRecordingVideoSTFStatistics *)a3
{
  self->_videoSTFStatistics = a3;
}

- (BOOL)cinematicVideoEnabled
{
  return self->_cinematicVideoEnabled;
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  self->_cinematicVideoEnabled = a3;
}

- (BWCoreAnalyticsMovieRecordingCinematicVideoStatistics)cinematicVideoMovieRecordingStats
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].countOfTapToTrackFailures;
  *(_OWORD *)&retstr->countOfSoftFocusRequests = *(_OWORD *)&self[7].countOfAutoFocusDecisions;
  *(_OWORD *)&retstr->countOfFixedTaxonomyFocusDecisions = v3;
  return self;
}

- (void)setCinematicVideoMovieRecordingStats:(BWCoreAnalyticsMovieRecordingCinematicVideoStatistics *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->countOfSoftFocusRequests;
  *(_OWORD *)&self->_cinematicVideoMovieRecordingStats.countOfFixedTaxonomyFocusDecisions = *(_OWORD *)&a3->countOfFixedTaxonomyFocusDecisions;
  *(_OWORD *)&self->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests = v3;
}

- (NSString)videoCodec
{
  return self->_videoCodec;
}

- (void)setVideoCodec:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (int64_t)movieFileSize
{
  return self->_movieFileSize;
}

- (void)setMovieFileSize:(int64_t)a3
{
  self->_movieFileSize = a3;
}

- (float)percentageOfAvailableDataStorageAfterWritingMovie
{
  return self->_percentageOfAvailableDataStorageAfterWritingMovie;
}

- (void)setPercentageOfAvailableDataStorageAfterWritingMovie:(float)a3
{
  self->_percentageOfAvailableDataStorageAfterWritingMovie = a3;
}

- (int64_t)totalNANDReadBytesDuringRecording
{
  return self->_totalNANDReadBytesDuringRecording;
}

- (void)setTotalNANDReadBytesDuringRecording:(int64_t)a3
{
  self->_totalNANDReadBytesDuringRecording = a3;
}

- (int64_t)totalNANDWriteBytesDuringRecording
{
  return self->_totalNANDWriteBytesDuringRecording;
}

- (void)setTotalNANDWriteBytesDuringRecording:(int64_t)a3
{
  self->_totalNANDWriteBytesDuringRecording = a3;
}

- (BOOL)capturingOntoExternalStorageDevice
{
  return self->_capturingOntoExternalStorageDevice;
}

- (void)setCapturingOntoExternalStorageDevice:(BOOL)a3
{
  self->_capturingOntoExternalStorageDevice = a3;
}

- (NSString)externalStorageDeviceVendorName
{
  return self->_externalStorageDeviceVendorName;
}

- (void)setExternalStorageDeviceVendorName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSString)externalStorageDeviceProductName
{
  return self->_externalStorageDeviceProductName;
}

- (void)setExternalStorageDeviceProductName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (unint64_t)externalStorageDeviceTotalSize
{
  return self->_externalStorageDeviceTotalSize;
}

- (void)setExternalStorageDeviceTotalSize:(unint64_t)a3
{
  self->_externalStorageDeviceTotalSize = a3;
}

- (unint64_t)externalStorageDeviceBaseOffset
{
  return self->_externalStorageDeviceBaseOffset;
}

- (void)setExternalStorageDeviceBaseOffset:(unint64_t)a3
{
  self->_externalStorageDeviceBaseOffset = a3;
}

@end
