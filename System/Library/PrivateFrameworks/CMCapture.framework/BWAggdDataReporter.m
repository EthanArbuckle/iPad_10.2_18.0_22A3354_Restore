@implementation BWAggdDataReporter

- (void)reportCameraLaunchWithPrewarm:(int)a3 reason:(id)a4
{
  NSObject *aggdDispatchQueue;
  _QWORD block[6];
  int v6;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BWAggdDataReporter_reportCameraLaunchWithPrewarm_reason___block_invoke;
  block[3] = &unk_1E491EEF8;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __46__BWAggdDataReporter_reportISPCreateDuration___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return ADClientPushValueForDistributionKey();
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken_0 != -1)
    dispatch_once(&sharedInstance_sOnceToken_0, &__block_literal_global_57);
  return (id)sharedInstance_sSharedAggdDataCollector;
}

- (void)reportISPCreateDuration:(int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__BWAggdDataReporter_reportISPCreateDuration___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __59__BWAggdDataReporter_reportCameraLaunchWithPrewarm_reason___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  uint64_t result;
  BOOL v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    v2 = *(const __CFString **)(a1 + 40);
  else
    v2 = CFSTR("Unspecified");
  result = objc_msgSend(CFSTR("com.apple.coremedia.camera.lt."), "stringByAppendingString:", v2);
  if (v1)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    return ADClientPushValueForDistributionKey();
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

BWAggdDataReporter *__36__BWAggdDataReporter_sharedInstance__block_invoke()
{
  BWAggdDataReporter *result;

  result = objc_alloc_init(BWAggdDataReporter);
  sharedInstance_sSharedAggdDataCollector = (uint64_t)result;
  return result;
}

- (BWAggdDataReporter)init
{
  BWAggdDataReporter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BWAggdDataReporter;
  v2 = -[BWAggdDataReporter init](&v4, sel_init);
  if (v2)
    v2->_aggdDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWAggdDataReporter;
  -[BWAggdDataReporter dealloc](&v3, sel_dealloc);
}

- (void)reportCameraStreamingTimeInMilliseconds:(unint64_t)a3 deviceType:(int)a4 devicePosition:(int)a5
{
  NSObject *aggdDispatchQueue;
  _QWORD block[6];
  int v7;
  int v8;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__BWAggdDataReporter_reportCameraStreamingTimeInMilliseconds_deviceType_devicePosition___block_invoke;
  block[3] = &unk_1E4920768;
  v7 = a4;
  v8 = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __88__BWAggdDataReporter_reportCameraStreamingTimeInMilliseconds_deviceType_devicePosition___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_aggdCameraStreamingTimeStringFromDeviceType:devicePosition:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3 && *(_QWORD *)(a1 + 40) != *(_QWORD *)(a1 + 40) % 0x64uLL)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportPearlInfraredProjectorUptime:(unint64_t)a3 current:(int)a4 pattern:(int)a5 applicationID:(id)a6
{
  NSObject *aggdDispatchQueue;
  _QWORD v7[7];
  int v8;
  int v9;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__BWAggdDataReporter_reportPearlInfraredProjectorUptime_current_pattern_applicationID___block_invoke;
  v7[3] = &unk_1E49223F8;
  v8 = a4;
  v9 = a5;
  v7[4] = self;
  v7[5] = a6;
  v7[6] = a3;
  dispatch_async(aggdDispatchQueue, v7);
}

uint64_t __87__BWAggdDataReporter_reportPearlInfraredProjectorUptime_current_pattern_applicationID___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_aggdPearlInfraredProjectorUptimeStringFromCurrent:pattern:applicationID:", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40));
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3 && *(_QWORD *)(a1 + 48) != 0)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportGNRSampleBufferProcessorProcessingStatus:(int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__BWAggdDataReporter_reportGNRSampleBufferProcessorProcessingStatus___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __69__BWAggdDataReporter_reportGNRSampleBufferProcessorProcessingStatus___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_aggdGNRProcessingStatusStringFromProcessingStatus:", *(unsigned int *)(a1 + 40));
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportStereoFusionProcessingTypeForCaptureType:(int)a3 isStereoFusionCapture:(BOOL)a4 wideSubCaptureType:(int)a5 teleSubCaptureType:(int)a6 isOriginalImage:(BOOL)a7
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];
  int v9;
  int v10;
  int v11;
  BOOL v12;
  BOOL v13;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __145__BWAggdDataReporter_reportStereoFusionProcessingTypeForCaptureType_isStereoFusionCapture_wideSubCaptureType_teleSubCaptureType_isOriginalImage___block_invoke;
  block[3] = &unk_1E4922420;
  block[4] = self;
  v12 = a4;
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v13 = a7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __145__BWAggdDataReporter_reportStereoFusionProcessingTypeForCaptureType_isStereoFusionCapture_wideSubCaptureType_teleSubCaptureType_isOriginalImage___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_aggdStereoFusionProcessingTypeStringForCaptureType:isStereoFusionCapture:wideSubCaptureType:teleSubCaptureType:isOriginalImage:", *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 52), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 53));
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportStereoFusionSampleBufferProcessorProcessingStatus:(int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__BWAggdDataReporter_reportStereoFusionSampleBufferProcessorProcessingStatus___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __78__BWAggdDataReporter_reportStereoFusionSampleBufferProcessorProcessingStatus___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_aggdStereoFusionProcessingStatusStringFromProcessingStatus:", *(unsigned int *)(a1 + 40));
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportSDOFSampleBufferProcessorProcessingStatus:(int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__BWAggdDataReporter_reportSDOFSampleBufferProcessorProcessingStatus___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __70__BWAggdDataReporter_reportSDOFSampleBufferProcessorProcessingStatus___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_aggdSDOFProcessingStatusStringFromProcessingStatus:", *(unsigned int *)(a1 + 40));
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportLuxLevel:(unsigned int)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  NSObject *aggdDispatchQueue;
  _QWORD block[7];
  int v11;
  int v12;
  unsigned int v13;
  BOOL v14;
  BOOL v15;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__BWAggdDataReporter_reportLuxLevel_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  block[3] = &unk_1E4922448;
  v11 = a4;
  v12 = a5;
  block[4] = self;
  block[5] = a6;
  block[6] = a7;
  v14 = a8;
  v15 = a9;
  v13 = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __130__BWAggdDataReporter_reportLuxLevel_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  uint64_t v4;

  LOBYTE(v4) = *(_BYTE *)(a1 + 69);
  result = objc_msgSend(*(id *)(a1 + 32), "_aggdStringForPrefix:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", CFSTR("lux"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 68), v4);
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientPushValueForDistributionKey();
  return result;
}

- (void)reportZoomFactor:(float)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  NSObject *aggdDispatchQueue;
  _QWORD block[7];
  int v11;
  int v12;
  float v13;
  BOOL v14;
  BOOL v15;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__BWAggdDataReporter_reportZoomFactor_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  block[3] = &unk_1E4922448;
  v11 = a4;
  v12 = a5;
  block[4] = self;
  block[5] = a6;
  block[6] = a7;
  v14 = a8;
  v15 = a9;
  v13 = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __132__BWAggdDataReporter_reportZoomFactor_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  uint64_t v4;

  LOBYTE(v4) = *(_BYTE *)(a1 + 69);
  result = objc_msgSend(*(id *)(a1 + 32), "_aggdStringForPrefix:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", CFSTR("zoom"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 68), v4);
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientPushValueForDistributionKey();
  return result;
}

- (void)reportNonCameraAppCaptureWithPrimaryCaptureType:(int)a3 secondaryCaptureType:(int)a4 captureFlags:(unint64_t)a5 sceneFlags:(unint64_t)a6 stillDuringVideo:(BOOL)a7 frontCamera:(BOOL)a8
{
  NSObject *aggdDispatchQueue;
  _QWORD block[7];
  int v10;
  int v11;
  BOOL v12;
  BOOL v13;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __144__BWAggdDataReporter_reportNonCameraAppCaptureWithPrimaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  block[3] = &unk_1E4922470;
  v10 = a3;
  v11 = a4;
  block[4] = self;
  block[5] = a5;
  block[6] = a6;
  v12 = a7;
  v13 = a8;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __144__BWAggdDataReporter_reportNonCameraAppCaptureWithPrimaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;
  uint64_t v4;

  LOBYTE(v4) = *(_BYTE *)(a1 + 65);
  result = objc_msgSend(*(id *)(a1 + 32), "_aggdStringForPrefix:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", CFSTR("nca"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), v4);
  if (result)
    v3 = *(_QWORD *)(a1 + 32) == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera:(BOOL)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__BWAggdDataReporter_reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera___block_invoke;
  v4[3] = &unk_1E491EE18;
  v5 = a3;
  v4[4] = self;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __82__BWAggdDataReporter_reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportFaceCount:(unsigned int)a3 frontCamera:(BOOL)a4
{
  NSObject *aggdDispatchQueue;
  _QWORD v5[5];
  unsigned int v6;
  BOOL v7;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__BWAggdDataReporter_reportFaceCount_frontCamera___block_invoke;
  v5[3] = &unk_1E4922498;
  v7 = a4;
  v5[4] = self;
  v6 = a3;
  dispatch_async(aggdDispatchQueue, v5);
}

uint64_t __50__BWAggdDataReporter_reportFaceCount_frontCamera___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 44))
  {
    if (*(_QWORD *)(result + 32))
      return ADClientPushValueForDistributionKey();
  }
  return result;
}

- (void)reportSensorTemperature:(unsigned int)a3 frontCamera:(BOOL)a4
{
  NSObject *aggdDispatchQueue;
  _QWORD v5[5];
  unsigned int v6;
  BOOL v7;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__BWAggdDataReporter_reportSensorTemperature_frontCamera___block_invoke;
  v5[3] = &unk_1E4922498;
  v7 = a4;
  v5[4] = self;
  v6 = a3;
  dispatch_async(aggdDispatchQueue, v5);
}

uint64_t __58__BWAggdDataReporter_reportSensorTemperature_frontCamera___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 44))
  {
    if (*(_QWORD *)(result + 32))
      return ADClientPushValueForDistributionKey();
  }
  return result;
}

- (void)reportShutterLag:(id *)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  NSObject *aggdDispatchQueue;
  _QWORD v10[7];
  int v11;
  int v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  BOOL v14;
  BOOL v15;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __132__BWAggdDataReporter_reportShutterLag_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke;
  v10[3] = &unk_1E49224C0;
  v11 = a4;
  v12 = a5;
  v10[4] = self;
  v10[5] = a6;
  v10[6] = a7;
  v14 = a8;
  v15 = a9;
  v13 = *a3;
  dispatch_async(aggdDispatchQueue, v10);
}

void __132__BWAggdDataReporter_reportShutterLag_primaryCaptureType_secondaryCaptureType_captureFlags_sceneFlags_stillDuringVideo_frontCamera___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int *v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  CMTime time;

  LOBYTE(v9) = *(_BYTE *)(a1 + 89);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_aggdStringForPrefix:primaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", CFSTR("shutterlag"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), v9);
  time = *(CMTime *)(a1 + 64);
  v3 = (int)(CMTimeGetSeconds(&time) * 1000.0);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(v4 + 16);
  v5 = (unsigned int *)(v4 + 16);
  v6 = v7;
  while (1)
  {
    v8 = __ldxr(v5);
    if (v8 != v6)
      break;
    if (!__stxr(v3, v5))
    {
      if (!v2)
        return;
      goto LABEL_7;
    }
  }
  __clrex();
  if (!v2)
    return;
LABEL_7:
  if (*(_QWORD *)(a1 + 32))
    ADClientPushValueForDistributionKey();
}

- (int)lastShutterLag
{
  return self->_lastShutterLag;
}

- (void)reportZeroShutterLagFirmwareTimeMachineInitFailure
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__BWAggdDataReporter_reportZeroShutterLagFirmwareTimeMachineInitFailure__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __72__BWAggdDataReporter_reportZeroShutterLagFirmwareTimeMachineInitFailure__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = ADClientAddValueForScalarKey();
    if (*(_QWORD *)(v1 + 32))
      return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportZeroShutterLagPreviewTimeMachineInitFailure
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BWAggdDataReporter_reportZeroShutterLagPreviewTimeMachineInitFailure__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __71__BWAggdDataReporter_reportZeroShutterLagPreviewTimeMachineInitFailure__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = ADClientAddValueForScalarKey();
    if (*(_QWORD *)(v1 + 32))
      return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportZeroShutterLagSphereInitFailure
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BWAggdDataReporter_reportZeroShutterLagSphereInitFailure__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __59__BWAggdDataReporter_reportZeroShutterLagSphereInitFailure__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = ADClientAddValueForScalarKey();
    if (*(_QWORD *)(v1 + 32))
      return ADClientAddValueForScalarKey();
  }
  return result;
}

- (void)reportZeroShutterLagMetadataInitFailureWithReasons:(unsigned int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__BWAggdDataReporter_reportZeroShutterLagMetadataInitFailureWithReasons___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __73__BWAggdDataReporter_reportZeroShutterLagMetadataInitFailureWithReasons___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = result;
  if (*(_QWORD *)(result + 32))
  {
    result = ADClientAddValueForScalarKey();
    if (*(_QWORD *)(v1 + 32))
      result = ADClientAddValueForScalarKey();
  }
  v2 = *(_DWORD *)(v1 + 40);
  if (!v2)
    return result;
  if ((v2 & 1) != 0 && *(_QWORD *)(v1 + 32))
  {
    result = ADClientAddValueForScalarKey();
    v2 = *(_DWORD *)(v1 + 40);
    if ((v2 & 2) == 0)
      goto LABEL_11;
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_11;
  }
  if (*(_QWORD *)(v1 + 32))
  {
    result = ADClientAddValueForScalarKey();
    v2 = *(_DWORD *)(v1 + 40);
  }
LABEL_11:
  if ((v2 & 4) != 0 && *(_QWORD *)(v1 + 32))
  {
    result = ADClientAddValueForScalarKey();
    v2 = *(_DWORD *)(v1 + 40);
    if ((v2 & 8) != 0)
    {
LABEL_14:
      if (*(_QWORD *)(v1 + 32))
      {
        result = ADClientAddValueForScalarKey();
        v2 = *(_DWORD *)(v1 + 40);
      }
    }
  }
  else if ((v2 & 8) != 0)
  {
    goto LABEL_14;
  }
  if ((v2 & 0x10) != 0 && *(_QWORD *)(v1 + 32))
  {
    result = ADClientAddValueForScalarKey();
    if ((*(_DWORD *)(v1 + 40) & 0x20) == 0)
      return result;
  }
  else if ((v2 & 0x20) == 0)
  {
    return result;
  }
  if (*(_QWORD *)(v1 + 32))
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportZeroShutterLagInitSuccess
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BWAggdDataReporter_reportZeroShutterLagInitSuccess__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __53__BWAggdDataReporter_reportZeroShutterLagInitSuccess__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType:(int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__BWAggdDataReporter_reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType___block_invoke;
  v4[3] = &unk_1E4920568;
  v5 = a3;
  v4[4] = self;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __87__BWAggdDataReporter_reportZeroShutterLagReferenceFrameSelectionFailureForCaptureType___block_invoke(uint64_t result)
{
  int v1;

  v1 = *(_DWORD *)(result + 40);
  if (v1 == 5)
  {
    if (!*(_QWORD *)(result + 32))
      return result;
    return ADClientAddValueForScalarKey();
  }
  if (v1 == 4)
  {
    if (!*(_QWORD *)(result + 32))
      return result;
    return ADClientAddValueForScalarKey();
  }
  if (v1 == 1 && *(_QWORD *)(result + 32))
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportZeroShutterLagSuccess
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BWAggdDataReporter_reportZeroShutterLagSuccess__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __49__BWAggdDataReporter_reportZeroShutterLagSuccess__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportCameraLaunchWithoutPrewarm:(int)a3
{
  NSObject *aggdDispatchQueue;
  _QWORD v4[5];
  int v5;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__BWAggdDataReporter_reportCameraLaunchWithoutPrewarm___block_invoke;
  v4[3] = &unk_1E4920568;
  v4[4] = self;
  v5 = a3;
  dispatch_async(aggdDispatchQueue, v4);
}

uint64_t __55__BWAggdDataReporter_reportCameraLaunchWithoutPrewarm___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return ADClientPushValueForDistributionKey();
  return result;
}

- (void)reportLockScreenCameraLaunchCompletedWithPrewarming:(BOOL)a3 restartedSessionDueToError:(int)a4
{
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *aggdDispatchQueue;
  _QWORD block[6];

  v5 = CFSTR("unknown");
  if (a4 == 1)
    v5 = CFSTR("cameraInUseByOtherClient");
  if (!a4)
    v5 = CFSTR("none");
  v6 = CFSTR("nonPrewarmed");
  if (a3)
    v6 = CFSTR("prewarmed");
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.lockscreen.camera.launch.completed.%@.restartError.%@"), v6, v5);
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__BWAggdDataReporter_reportLockScreenCameraLaunchCompletedWithPrewarming_restartedSessionDueToError___block_invoke;
  block[3] = &unk_1E491E748;
  block[4] = self;
  block[5] = v7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __101__BWAggdDataReporter_reportLockScreenCameraLaunchCompletedWithPrewarming_restartedSessionDueToError___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = result == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportLockScreenCameraLaunchCancelledWithPrewarming:(BOOL)a3 ispStreamingStarted:(BOOL)a4
{
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *aggdDispatchQueue;
  _QWORD block[6];

  v5 = CFSTR("nonPrewarmed");
  if (a3)
    v5 = CFSTR("prewarmed");
  v6 = CFSTR("ispStreamingNotStarted");
  if (a4)
    v6 = CFSTR("ispStreamingStarted");
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.lockscreen.camera.launch.cancelled.%@.%@"), v5, v6);
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__BWAggdDataReporter_reportLockScreenCameraLaunchCancelledWithPrewarming_ispStreamingStarted___block_invoke;
  block[3] = &unk_1E491E748;
  block[4] = self;
  block[5] = v7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __94__BWAggdDataReporter_reportLockScreenCameraLaunchCancelledWithPrewarming_ispStreamingStarted___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  BOOL v3;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = result == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportCalibrationStatisticsWithTime:(id)a3 timeValue:(double)a4 attemptsField:(id)a5 attemptsValue:(int64_t)a6 successField:(id)a7 successValue:(int64_t)a8 magneticFieldMagnitudeField:(id)a9 magneticFieldMagnitudeValue:(double)a10
{
  NSObject *aggdDispatchQueue;
  _QWORD block[13];

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __178__BWAggdDataReporter_reportCalibrationStatisticsWithTime_timeValue_attemptsField_attemptsValue_successField_successValue_magneticFieldMagnitudeField_magneticFieldMagnitudeValue___block_invoke;
  block[3] = &unk_1E49224E8;
  block[4] = self;
  block[5] = a3;
  *(double *)&block[9] = a4;
  block[6] = a5;
  block[7] = a7;
  block[10] = a6;
  block[11] = a8;
  block[8] = a9;
  *(double *)&block[12] = a10;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __178__BWAggdDataReporter_reportCalibrationStatisticsWithTime_timeValue_attemptsField_attemptsValue_successField_successValue_magneticFieldMagnitudeField_magneticFieldMagnitudeValue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  BOOL v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    ADClientSetValueForScalarKey();
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (v3)
    v5 = *(_QWORD *)(a1 + 48) == 0;
  else
    v5 = 1;
  if (!v5 && *(_QWORD *)(a1 + 80) != 0)
  {
    ADClientAddValueForScalarKey();
    v3 = *(_QWORD *)(a1 + 32);
  }
  if (v3)
    v7 = *(_QWORD *)(a1 + 56) == 0;
  else
    v7 = 1;
  if (!v7 && *(_QWORD *)(a1 + 88) != 0)
    ADClientAddValueForScalarKey();
  result = *(_QWORD *)(a1 + 64);
  if (result && *(double *)(a1 + 96) > 0.0)
  {
    if (*(_QWORD *)(a1 + 32))
      return ADClientSetValueForScalarKey();
  }
  return result;
}

- (void)reportAutoFocusPositionSensorCalibrationForPosition:(int)a3 iStopZEstimate:(int)a4 eSensorOutput:(signed __int16)a5 wSensorOutput:(signed __int16)a6 gravityZ:(int)a7 calibrationStatus:(unsigned int)a8 sensorTemp:(signed __int16)a9 successfulInfinityEndStopDelta:(int)a10 currentInfinityEndStopDelta:(int)a11 previousInfinityEndStopDelta:(int)a12 currentAngleDelta:(int)a13 previousAngleDelta:(int)a14 factoryCalibrationOffset:(int *)a15 estimatedNeutralZ:(int *)a16 deltaNeutralZFromNVM:(int *)a17 estimatedSagZ:(int *)a18 combinedSensorOutput:(int *)a19 deltaSagFromNVM:(int *)a20 isValid:(BOOL)a21 dataWasRejectedByHistory:(BOOL)a22
{
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  NSObject *aggdDispatchQueue;
  _QWORD v29[5];
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  signed __int16 v45;
  signed __int16 v46;
  signed __int16 v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  BOOL v53;
  BOOL v54;
  BOOL v55;

  if (a15)
    v22 = *a15;
  else
    v22 = 0;
  if (a16)
    v23 = *a16;
  else
    v23 = 0;
  if (a17)
    v24 = *a17;
  else
    v24 = 0;
  if (a18)
  {
    v25 = *a18;
    if (a19)
    {
LABEL_12:
      v26 = *a19;
      goto LABEL_15;
    }
  }
  else
  {
    v25 = 0;
    if (a19)
      goto LABEL_12;
  }
  v26 = 0;
LABEL_15:
  if (a20)
    v27 = *a20;
  else
    v27 = 0;
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __428__BWAggdDataReporter_reportAutoFocusPositionSensorCalibrationForPosition_iStopZEstimate_eSensorOutput_wSensorOutput_gravityZ_calibrationStatus_sensorTemp_successfulInfinityEndStopDelta_currentInfinityEndStopDelta_previousInfinityEndStopDelta_currentAngleDelta_previousAngleDelta_factoryCalibrationOffset_estimatedNeutralZ_deltaNeutralZFromNVM_estimatedSagZ_combinedSensorOutput_deltaSagFromNVM_isValid_dataWasRejectedByHistory___block_invoke;
  v29[3] = &unk_1E4922510;
  v29[4] = self;
  v30 = a3;
  v31 = a8;
  v48 = a22;
  v49 = a21;
  v32 = a11;
  v33 = a12;
  v34 = a13;
  v35 = a14;
  v45 = a5;
  v46 = a6;
  v47 = a9;
  v36 = a4;
  v37 = a10;
  v50 = a15 != 0;
  v38 = a7;
  v39 = v22;
  v51 = a16 != 0;
  v52 = a17 != 0;
  v40 = v23;
  v41 = v24;
  v53 = a18 != 0;
  v54 = a19 != 0;
  v42 = v25;
  v43 = v26;
  v55 = a20 != 0;
  v44 = v27;
  dispatch_async(aggdDispatchQueue, v29);
}

uint64_t __428__BWAggdDataReporter_reportAutoFocusPositionSensorCalibrationForPosition_iStopZEstimate_eSensorOutput_wSensorOutput_gravityZ_calibrationStatus_sensorTemp_successfulInfinityEndStopDelta_currentInfinityEndStopDelta_previousInfinityEndStopDelta_currentAngleDelta_previousAngleDelta_factoryCalibrationOffset_estimatedNeutralZ_deltaNeutralZFromNVM_estimatedSagZ_combinedSensorOutput_deltaSagFromNVM_isValid_dataWasRejectedByHistory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.status.%d"), *(unsigned int *)(a1 + 40));
  if (v2)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    result = ADClientSetValueForScalarKey();
  if (*(_BYTE *)(a1 + 106) || *(_BYTE *)(a1 + 107))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.deltachangeum.%d"), *(unsigned int *)(a1 + 40));
    if (v5 && v6)
      ADClientSetValueForScalarKey();
    v7 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.prevdeltachangeum.%d"), *(unsigned int *)(a1 + 40));
    if (v7 && result)
      result = ADClientSetValueForScalarKey();
    if (*(_QWORD *)(a1 + 32))
    {
      result = ADClientSetValueForScalarKey();
      if (*(_QWORD *)(a1 + 32))
        result = ADClientSetValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 107))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.deltaum.%d"), *(unsigned int *)(a1 + 40));
    if (v8 && v9)
      ADClientSetValueForScalarKey();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.sensor.E.%d"), *(unsigned int *)(a1 + 40));
    if (v10 && v11)
      ADClientSetValueForScalarKey();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.sensor.W.%d"), *(unsigned int *)(a1 + 40));
    if (v12 && v13)
      ADClientSetValueForScalarKey();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.sensorTemp.%d"), *(unsigned int *)(a1 + 40));
    if (v14 && v15)
      ADClientSetValueForScalarKey();
    v16 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.passingdeltachangeum.%d"), *(unsigned int *)(a1 + 40));
    if (v16 && result)
      result = ADClientSetValueForScalarKey();
    if (*(_QWORD *)(a1 + 32))
      result = ADClientSetValueForScalarKey();
    if (*(_BYTE *)(a1 + 108))
    {
      v17 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.factorydeltaum.%d"), *(unsigned int *)(a1 + 40));
      if (v17)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 109))
    {
      v18 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.sag.neutralEst.s.%d"), *(unsigned int *)(a1 + 40));
      if (v18)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 110))
    {
      v19 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.sag.factorydeltaum.s.%d"), *(unsigned int *)(a1 + 40));
      if (v19)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 111))
    {
      v20 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.sag.estimatePerG.s.%d"), *(unsigned int *)(a1 + 40));
      if (v20)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 112))
    {
      v21 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.istop.fieldsense.%d"), *(unsigned int *)(a1 + 40));
      if (v21)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 113))
    {
      v22 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.fieldcal.sag.factorydeltaSag.s.%d"), *(unsigned int *)(a1 + 40));
      if (v22)
      {
        if (result)
          return ADClientSetValueForScalarKey();
      }
    }
  }
  return result;
}

- (void)reportAutoFocusCalibrationForPosition:(int)a3 freqZ:(int)a4 deltaFreqZ:(int)a5 qZ:(int)a6 deltaQZ:(int)a7 gainZ:(int)a8 calibrationStatus:(unsigned int)a9 gelModelCoefficientD1:(int *)a10 gelModelCoefficientD2:(int *)a11 gelModelCoefficientP1:(int *)a12 gelModelCoefficientP2:(int *)a13 isValid:(BOOL)a14
{
  int v14;
  int v15;
  int v16;
  int v17;
  NSObject *aggdDispatchQueue;
  _QWORD v19[5];
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;

  if (a10)
    v14 = *a10;
  else
    v14 = 0;
  if (a11)
  {
    v15 = *a11;
    if (a12)
    {
LABEL_6:
      v16 = *a12;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = 0;
    if (a12)
      goto LABEL_6;
  }
  v16 = 0;
LABEL_9:
  if (a13)
    v17 = *a13;
  else
    v17 = 0;
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __208__BWAggdDataReporter_reportAutoFocusCalibrationForPosition_freqZ_deltaFreqZ_qZ_deltaQZ_gainZ_calibrationStatus_gelModelCoefficientD1_gelModelCoefficientD2_gelModelCoefficientP1_gelModelCoefficientP2_isValid___block_invoke;
  v19[3] = &unk_1E4922538;
  v19[4] = self;
  v20 = a3;
  v21 = a9;
  v31 = a14;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v32 = a10 != 0;
  v26 = a8;
  v27 = v14;
  v33 = a11 != 0;
  v34 = a12 != 0;
  v28 = v15;
  v29 = v16;
  v35 = a13 != 0;
  v30 = v17;
  dispatch_async(aggdDispatchQueue, v19);
}

uint64_t __208__BWAggdDataReporter_reportAutoFocusCalibrationForPosition_freqZ_deltaFreqZ_qZ_deltaQZ_gainZ_calibrationStatus_gelModelCoefficientD1_gelModelCoefficientD2_gelModelCoefficientP1_gelModelCoefficientP2_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.status.s.%d"), *(unsigned int *)(a1 + 40));
  if (v2)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    result = ADClientSetValueForScalarKey();
  if (*(_BYTE *)(a1 + 84))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.Freq.s.%d"), *(unsigned int *)(a1 + 40));
    if (v5 && v6)
      ADClientSetValueForScalarKey();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.FreqChange.s.%d"), *(unsigned int *)(a1 + 40));
    if (v7 && v8)
      ADClientSetValueForScalarKey();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.Q.s.%d"), *(unsigned int *)(a1 + 40));
    if (v9 && v10)
      ADClientSetValueForScalarKey();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.QChange.s.%d"), *(unsigned int *)(a1 + 40));
    if (v11 && v12)
      ADClientSetValueForScalarKey();
    v13 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.LoopGain.s.%d"), *(unsigned int *)(a1 + 40));
    if (v13 && result)
      result = ADClientSetValueForScalarKey();
    if (*(_BYTE *)(a1 + 85))
    {
      v14 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.gelModelCoeffD1.s.%d"), *(unsigned int *)(a1 + 40));
      if (v14)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 86))
    {
      v15 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.gelModelCoeffD2.s.%d"), *(unsigned int *)(a1 + 40));
      if (v15)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 87))
    {
      v16 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.gelModelCoeffP1.s.%d"), *(unsigned int *)(a1 + 40));
      if (v16)
      {
        if (result)
          result = ADClientSetValueForScalarKey();
      }
    }
    if (*(_BYTE *)(a1 + 88))
    {
      v17 = *(_QWORD *)(a1 + 32);
      result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.fieldcal.gelModelCoeffP2.s.%d"), *(unsigned int *)(a1 + 40));
      if (v17)
      {
        if (result)
          return ADClientSetValueForScalarKey();
      }
    }
  }
  return result;
}

- (void)reportSphereCalibrationForPosition:(int)a3 freqX:(float)a4 deltaFreqX:(float)a5 qX:(float)a6 deltaQX:(float)a7 gainX:(float)a8 freqY:(float)a9 deltaFreqY:(float)a10 qY:(float)a11 deltaQY:(float)a12 gainY:(float)a13 calibrationStatus:(unsigned int)a14 isValid:(BOOL)a15
{
  NSObject *aggdDispatchQueue;
  _QWORD v16[5];
  int v17;
  unsigned int v18;
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
  BOOL v29;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __151__BWAggdDataReporter_reportSphereCalibrationForPosition_freqX_deltaFreqX_qX_deltaQX_gainX_freqY_deltaFreqY_qY_deltaQY_gainY_calibrationStatus_isValid___block_invoke;
  v16[3] = &unk_1E4922538;
  v16[4] = self;
  v17 = a3;
  v18 = a14;
  v29 = a15;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  dispatch_async(aggdDispatchQueue, v16);
}

uint64_t __151__BWAggdDataReporter_reportSphereCalibrationForPosition_freqX_deltaFreqX_qX_deltaQX_gainX_freqY_deltaFreqY_qY_deltaQY_gainY_calibrationStatus_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.status.s.%d"), *(unsigned int *)(a1 + 40));
  if (v2)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    result = ADClientSetValueForScalarKey();
  if (*(_BYTE *)(a1 + 88))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.XFreq.s.%d"), *(unsigned int *)(a1 + 40));
    if (v5 && v6)
      ADClientSetValueForScalarKey();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.XFreqChange.s.%d"), *(unsigned int *)(a1 + 40));
    if (v7 && v8)
      ADClientSetValueForScalarKey();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.XQ.s.%d"), *(unsigned int *)(a1 + 40));
    if (v9 && v10)
      ADClientSetValueForScalarKey();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.XQChange.s.%d"), *(unsigned int *)(a1 + 40));
    if (v11 && v12)
      ADClientSetValueForScalarKey();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.XLoopGain.s.%d"), *(unsigned int *)(a1 + 40));
    if (v13 && v14)
      ADClientSetValueForScalarKey();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.YFreq.s.%d"), *(unsigned int *)(a1 + 40));
    if (v15 && v16)
      ADClientSetValueForScalarKey();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.YFreqChange.s.%d"), *(unsigned int *)(a1 + 40));
    if (v17 && v18)
      ADClientSetValueForScalarKey();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.YQ.s.%d"), *(unsigned int *)(a1 + 40));
    if (v19 && v20)
      ADClientSetValueForScalarKey();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.YQChange.s.%d"), *(unsigned int *)(a1 + 40));
    if (v21 && v22)
      ADClientSetValueForScalarKey();
    v23 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.fieldcal.YLoopGain.s.%d"), *(unsigned int *)(a1 + 40));
    if (v23)
    {
      if (result)
        return ADClientSetValueForScalarKey();
    }
  }
  return result;
}

- (void)reportAPSSphereInteractionCalibrationForPosition:(int)a3 residualErrorNeutral:(float)a4 calibrationZHeightNeutral:(float)a5 residualErrorMacro:(float)a6 calibrationZHeightMacro:(float)a7 calibrationStatus:(unsigned int)a8 isValid:(BOOL)a9
{
  NSObject *aggdDispatchQueue;
  _QWORD block[5];
  int v11;
  unsigned int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  BOOL v17;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __187__BWAggdDataReporter_reportAPSSphereInteractionCalibrationForPosition_residualErrorNeutral_calibrationZHeightNeutral_residualErrorMacro_calibrationZHeightMacro_calibrationStatus_isValid___block_invoke;
  block[3] = &unk_1E4922560;
  block[4] = self;
  v11 = a3;
  v12 = a8;
  v17 = a9;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __187__BWAggdDataReporter_reportAPSSphereInteractionCalibrationForPosition_residualErrorNeutral_calibrationZHeightNeutral_residualErrorMacro_calibrationZHeightMacro_calibrationStatus_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.sphcal.status.s.%d"), *(unsigned int *)(a1 + 40));
  if (v2)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    result = ADClientSetValueForScalarKey();
  if (*(_BYTE *)(a1 + 64))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.sphcal.sphErrorNeutral.s.%d"), *(unsigned int *)(a1 + 40));
    if (v5 && v6)
      ADClientSetValueForScalarKey();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.sphcal.sphNeutralZ.s.%d"), *(unsigned int *)(a1 + 40));
    if (v7 && v8)
      ADClientSetValueForScalarKey();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.sphcal.sphErrorMacro.s.%d"), *(unsigned int *)(a1 + 40));
    if (v9 && v10)
      ADClientSetValueForScalarKey();
    v11 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.sphcal.sphMacroZ.s.%d"), *(unsigned int *)(a1 + 40));
    if (v11)
    {
      if (result)
        return ADClientSetValueForScalarKey();
    }
  }
  return result;
}

- (void)reportSphereEndStopCalibrationForPosition:(int)a3 oisPositiveX:(int)a4 oisNegativeX:(int)a5 oisPositiveY:(int)a6 oisNegativeY:(int)a7 maxPositiveXDriftFromNVM:(int)a8 maxNegativeXDriftFromNVM:(int)a9 maxPositiveYDriftFromNVM:(int)a10 maxNegativeYDriftFromNVM:(int)a11 sphereStrokeX:(int)a12 sphereStrokeY:(int)a13 calibrationStatus:(unsigned int)a14 isValid:(BOOL)a15
{
  NSObject *aggdDispatchQueue;
  _QWORD v16[5];
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  __int128 v24;
  int v25;
  BOOL v26;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __270__BWAggdDataReporter_reportSphereEndStopCalibrationForPosition_oisPositiveX_oisNegativeX_oisPositiveY_oisNegativeY_maxPositiveXDriftFromNVM_maxNegativeXDriftFromNVM_maxPositiveYDriftFromNVM_maxNegativeYDriftFromNVM_sphereStrokeX_sphereStrokeY_calibrationStatus_isValid___block_invoke;
  v16[3] = &unk_1E4922538;
  v16[4] = self;
  v17 = a3;
  v18 = a14;
  v26 = a15;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = *(_OWORD *)&a9;
  v25 = a13;
  dispatch_async(aggdDispatchQueue, v16);
}

uint64_t __270__BWAggdDataReporter_reportSphereEndStopCalibrationForPosition_oisPositiveX_oisNegativeX_oisPositiveY_oisNegativeY_maxPositiveXDriftFromNVM_maxNegativeXDriftFromNVM_maxPositiveYDriftFromNVM_maxNegativeYDriftFromNVM_sphereStrokeX_sphereStrokeY_calibrationStatus_isValid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.status.s.%d"), *(unsigned int *)(a1 + 40));
  if (v2)
    v4 = result == 0;
  else
    v4 = 1;
  if (!v4)
    result = ADClientSetValueForScalarKey();
  if (*(_BYTE *)(a1 + 88))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphXpos.s.%d"), *(unsigned int *)(a1 + 40));
    if (v5 && v6)
      ADClientSetValueForScalarKey();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphXneg.s.%d"), *(unsigned int *)(a1 + 40));
    if (v7 && v8)
      ADClientSetValueForScalarKey();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphYpos.s.%d"), *(unsigned int *)(a1 + 40));
    if (v9 && v10)
      ADClientSetValueForScalarKey();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphYneg.s.%d"), *(unsigned int *)(a1 + 40));
    if (v11 && v12)
      ADClientSetValueForScalarKey();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphXposDelta.s.%d"), *(unsigned int *)(a1 + 40));
    if (v13 && v14)
      ADClientSetValueForScalarKey();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphXnegDelta.s.%d"), *(unsigned int *)(a1 + 40));
    if (v15 && v16)
      ADClientSetValueForScalarKey();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphYposDelta.s.%d"), *(unsigned int *)(a1 + 40));
    if (v17 && v18)
      ADClientSetValueForScalarKey();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphYnegDelta.s.%d"), *(unsigned int *)(a1 + 40));
    if (v19 && v20)
      ADClientSetValueForScalarKey();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphXStroke.s.%d"), *(unsigned int *)(a1 + 40));
    if (v21 && v22)
      ADClientSetValueForScalarKey();
    v23 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.sph.endstopcal.SphYStroke.s.%d"), *(unsigned int *)(a1 + 40));
    if (v23)
    {
      if (result)
        return ADClientSetValueForScalarKey();
    }
  }
  return result;
}

- (void)reportAutoFocusPositionSensorMode:(int)a3 portType:(id)a4
{
  NSObject *aggdDispatchQueue;
  _QWORD block[6];
  int v6;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__BWAggdDataReporter_reportAutoFocusPositionSensorMode_portType___block_invoke;
  block[3] = &unk_1E491EEF8;
  block[4] = a4;
  block[5] = self;
  v6 = a3;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __65__BWAggdDataReporter_reportAutoFocusPositionSensorMode_portType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0D05A30]);
    if (!(_DWORD)result)
      return result;
    v2 = 2;
  }
  v4 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.apsmode.%d"), v2);
  if (v4)
    v5 = result == 0;
  else
    v5 = 1;
  if (!v5)
    return ADClientSetValueForScalarKey();
  return result;
}

- (void)reportAPSOffsetEstimatorForPortType:(id)a3 accelMotion:(float)a4 gyroMotion:(float)a5 inSessionOffset:(float)a6 deltaOffsetFC:(float)a7 deltaOffsetMI:(float)a8 deltaOffsetFATP:(float)a9 deltaOffsetLastSession:(float)a10 errorHeadroomViolated:(BOOL)a11 errorConvergenceFailed:(BOOL)a12 errorMotionTooLarge:(BOOL)a13 errorConfidenceTooLow:(BOOL)a14 errorOffsetTooLarge:(BOOL)a15 errorDeltaTooLarge:(BOOL)a16 errorSaturated:(BOOL)a17 errorCouldNotRun:(BOOL)a18 successRun:(BOOL)a19 startAPSVoltage:(int)a20 modeGCOL:(BOOL)a21 modeOL:(BOOL)a22
{
  int v36;
  NSObject *aggdDispatchQueue;
  _QWORD block[5];
  float v39;
  float v40;
  float v41;
  int v42;
  float v43;
  float v44;
  float v45;
  float v46;
  int v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  BOOL v53;
  BOOL v54;
  BOOL v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;

  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v36 = 1;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]))
      return;
    v36 = 2;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __365__BWAggdDataReporter_reportAPSOffsetEstimatorForPortType_accelMotion_gyroMotion_inSessionOffset_deltaOffsetFC_deltaOffsetMI_deltaOffsetFATP_deltaOffsetLastSession_errorHeadroomViolated_errorConvergenceFailed_errorMotionTooLarge_errorConfidenceTooLow_errorOffsetTooLarge_errorDeltaTooLarge_errorSaturated_errorCouldNotRun_successRun_startAPSVoltage_modeGCOL_modeOL___block_invoke;
  block[3] = &unk_1E4922588;
  block[4] = self;
  v39 = a4;
  v40 = a5;
  v41 = a7;
  v42 = v36;
  v43 = a8;
  v44 = a9;
  v48 = a11;
  v49 = a12;
  v50 = a13;
  v51 = a14;
  v52 = a15;
  v53 = a16;
  v54 = a17;
  v55 = a18;
  v56 = a19;
  v45 = a10;
  v46 = a6;
  v47 = a20;
  v57 = a21;
  v58 = a22;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __365__BWAggdDataReporter_reportAPSOffsetEstimatorForPortType_accelMotion_gyroMotion_inSessionOffset_deltaOffsetFC_deltaOffsetMI_deltaOffsetFATP_deltaOffsetLastSession_errorHeadroomViolated_errorConvergenceFailed_errorMotionTooLarge_errorConfidenceTooLow_errorOffsetTooLarge_errorDeltaTooLarge_errorSaturated_errorCouldNotRun_successRun_startAPSVoltage_modeGCOL_modeOL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;

  if (*(_QWORD *)(a1 + 32) && (ADClientPushValueForDistributionKey(), *(_QWORD *)(a1 + 32)))
  {
    ADClientPushValueForDistributionKey();
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.delta_fc.%d"), *(unsigned int *)(a1 + 52));
  if (v2 && v3)
    ADClientPushValueForDistributionKey();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.delta_nvm.%d"), *(unsigned int *)(a1 + 52));
  if (v4 && v5)
    ADClientPushValueForDistributionKey();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.delta_syscfg.%d"), *(unsigned int *)(a1 + 52));
  if (v6 && v7)
    ADClientPushValueForDistributionKey();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.delta_offset.%d"), *(unsigned int *)(a1 + 52));
  if (v8 && v9)
    ADClientPushValueForDistributionKey();
  if (*(_BYTE *)(a1 + 76))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_hdrm.%d"), *(unsigned int *)(a1 + 52));
    if (v10)
    {
      if (v11)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 77))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_converge.%d"), *(unsigned int *)(a1 + 52));
    if (v12)
    {
      if (v13)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 78))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_motion.%d"), *(unsigned int *)(a1 + 52));
    if (v14)
    {
      if (v15)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 79))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_confidence.%d"), *(unsigned int *)(a1 + 52));
    if (v16)
    {
      if (v17)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_offset.%d"), *(unsigned int *)(a1 + 52));
    if (v18)
    {
      if (v19)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 81))
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_deltaoffset.%d"), *(unsigned int *)(a1 + 52));
    if (v20)
    {
      if (v21)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 82))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_saturated.%d"), *(unsigned int *)(a1 + 52));
    if (v22)
    {
      if (v23)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 83))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_err_run.%d"), *(unsigned int *)(a1 + 52));
    if (v24)
    {
      if (v25)
        ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 84))
  {
    v26 = *(_QWORD *)(a1 + 32);
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_success.%d"), *(unsigned int *)(a1 + 52));
    if (v26 && v27)
      ADClientAddValueForScalarKey();
    v28 = *(_QWORD *)(a1 + 32);
    v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.offset.%d"), *(unsigned int *)(a1 + 52));
    if (v28 && v29)
      ADClientPushValueForDistributionKey();
  }
  v30 = *(_QWORD *)(a1 + 32);
  v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.aps.insession.num_sessions.%d"), *(unsigned int *)(a1 + 52));
  if (v30 && v31)
    ADClientAddValueForScalarKey();
  v32 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.startup.af.raw_aps.%d"), *(unsigned int *)(a1 + 52));
  if (v32 && result)
    result = ADClientPushValueForDistributionKey();
  if (*(_BYTE *)(a1 + 85))
  {
    v34 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.num_gcol.%d"), *(unsigned int *)(a1 + 52));
    if (v34)
    {
      if (result)
        result = ADClientAddValueForScalarKey();
    }
  }
  if (*(_BYTE *)(a1 + 86))
  {
    v35 = *(_QWORD *)(a1 + 32);
    result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.af.num_cl.%d"), *(unsigned int *)(a1 + 52));
    if (v35)
    {
      if (result)
        return ADClientAddValueForScalarKey();
    }
  }
  return result;
}

- (void)reportStillImageAPSStatisticsForPortType:(id)a3 logicalFocusPosition:(int)a4 apsMotion:(float)a5 sphereMotion:(float)a6 accelMotion:(float)a7 gyroMotion:(float)a8 subjectDistance:(float)a9 luxLevel:(int)a10
{
  int v19;
  NSObject *aggdDispatchQueue;
  _QWORD block[5];
  int v22;
  int v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  int v29;

  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]))
      return;
    v19 = 2;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __155__BWAggdDataReporter_reportStillImageAPSStatisticsForPortType_logicalFocusPosition_apsMotion_sphereMotion_accelMotion_gyroMotion_subjectDistance_luxLevel___block_invoke;
  block[3] = &unk_1E49225B0;
  block[4] = self;
  v22 = a4;
  v23 = v19;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v29 = a10;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __155__BWAggdDataReporter_reportStillImageAPSStatisticsForPortType_logicalFocusPosition_apsMotion_sphereMotion_accelMotion_gyroMotion_subjectDistance_luxLevel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  float v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  float v15;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.capture.af.focuspos.%d"), *(unsigned int *)(a1 + 44));
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
    ADClientPushValueForDistributionKey();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.capture.af.ze_std.%d"), *(unsigned int *)(a1 + 44));
  if (v5 && v6)
    ADClientPushValueForDistributionKey();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.capture.sph.xy_std.%d"), *(unsigned int *)(a1 + 44));
  if (v7 && v8)
    ADClientPushValueForDistributionKey();
  if (*(_QWORD *)(a1 + 32) && (ADClientPushValueForDistributionKey(), *(_QWORD *)(a1 + 32)))
  {
    ADClientPushValueForDistributionKey();
    v9 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v9 = 0;
  }
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.capture.aps_do.%d"), *(unsigned int *)(a1 + 44));
  if (v9 && result)
    result = ADClientPushValueForDistributionKey();
  v11 = *(float *)(a1 + 64);
  if (*(_DWORD *)(a1 + 44) != 1)
  {
    if (v11 < 0.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 34.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 40.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 48.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 60.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 80.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 120.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = CFSTR("com.apple.coremedia.camera.capture.lux.2.apsdo_240_infcm");
    v14 = CFSTR("com.apple.coremedia.camera.capture.lux.2.apsdo_120_240cm");
    v15 = 240.0;
LABEL_67:
    if (v11 >= v15)
      result = (uint64_t)v13;
    else
      result = (uint64_t)v14;
    if (v12)
      return ADClientPushValueForDistributionKey();
    return result;
  }
  if (v11 >= 0.0)
  {
    if (v11 < 15.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 17.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 20.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 24.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 30.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 40.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    if (v11 < 60.0)
    {
      if (*(_QWORD *)(a1 + 32))
        return ADClientPushValueForDistributionKey();
      return result;
    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = CFSTR("com.apple.coremedia.camera.capture.lux.1.apsdo_120_infcm");
    v14 = CFSTR("com.apple.coremedia.camera.capture.lux.1.apsdo_60_120cm");
    v15 = 120.0;
    goto LABEL_67;
  }
  if (*(_QWORD *)(a1 + 32))
    return ADClientPushValueForDistributionKey();
  return result;
}

- (void)reportVideoRecordingAPSStatistics:(float)a3 stdDataFromAPSForTele:(float)a4 stdDataFromSphereForWide:(float)a5 stdDataFromSphereForTele:(float)a6 stdDataFromAccel:(float)a7 stdDataFromGyro:(float)a8 maxDataFromAPSForWide:(float)a9 maxDataFromAPSForTele:(float)a10 minDataFromAPSForWide:(float)a11 minDataFromAPSForTele:(float)a12 maxDataFromSphereForWide:(float)a13 maxDataFromSphereForTele:(float)a14 minDataFromSphereForWide:(float)a15 minDataFromSphereForTele:(float)a16 maxDataFromAccel:(float)a17 minDataFromAccel:(float)a18 maxDataFromGyro:(float)a19 minDataFromGyro:(float)a20
{
  NSObject *aggdDispatchQueue;
  _QWORD v21[5];
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  __int128 v30;
  __int128 v31;
  float v32;
  float v33;

  aggdDispatchQueue = self->_aggdDispatchQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __415__BWAggdDataReporter_reportVideoRecordingAPSStatistics_stdDataFromAPSForTele_stdDataFromSphereForWide_stdDataFromSphereForTele_stdDataFromAccel_stdDataFromGyro_maxDataFromAPSForWide_maxDataFromAPSForTele_minDataFromAPSForWide_minDataFromAPSForTele_maxDataFromSphereForWide_maxDataFromSphereForTele_minDataFromSphereForWide_minDataFromSphereForTele_maxDataFromAccel_minDataFromAccel_maxDataFromGyro_minDataFromGyro___block_invoke;
  v21[3] = &unk_1E49225D8;
  v21[4] = self;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v29 = a10;
  v30 = *(_OWORD *)&a11;
  v31 = *(_OWORD *)&a15;
  v32 = a19;
  v33 = a20;
  dispatch_async(aggdDispatchQueue, v21);
}

uint64_t __415__BWAggdDataReporter_reportVideoRecordingAPSStatistics_stdDataFromAPSForTele_stdDataFromSphereForWide_stdDataFromSphereForTele_stdDataFromAccel_stdDataFromGyro_maxDataFromAPSForWide_maxDataFromAPSForTele_minDataFromAPSForWide_minDataFromAPSForTele_maxDataFromSphereForWide_maxDataFromSphereForTele_minDataFromSphereForWide_minDataFromSphereForTele_maxDataFromAccel_minDataFromAccel_maxDataFromGyro_minDataFromGyro___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = ADClientPushValueForDistributionKey();
    if (*(_QWORD *)(v1 + 32))
    {
      result = ADClientPushValueForDistributionKey();
      if (*(_QWORD *)(v1 + 32))
      {
        result = ADClientPushValueForDistributionKey();
        if (*(_QWORD *)(v1 + 32))
        {
          result = ADClientPushValueForDistributionKey();
          if (*(_QWORD *)(v1 + 32))
          {
            result = ADClientPushValueForDistributionKey();
            if (*(_QWORD *)(v1 + 32))
            {
              result = ADClientPushValueForDistributionKey();
              if (*(_QWORD *)(v1 + 32))
              {
                result = ADClientPushValueForDistributionKey();
                if (*(_QWORD *)(v1 + 32))
                {
                  result = ADClientPushValueForDistributionKey();
                  if (*(_QWORD *)(v1 + 32))
                  {
                    result = ADClientPushValueForDistributionKey();
                    if (*(_QWORD *)(v1 + 32))
                    {
                      result = ADClientPushValueForDistributionKey();
                      if (*(_QWORD *)(v1 + 32))
                      {
                        result = ADClientPushValueForDistributionKey();
                        if (*(_QWORD *)(v1 + 32))
                        {
                          result = ADClientPushValueForDistributionKey();
                          if (*(_QWORD *)(v1 + 32))
                          {
                            result = ADClientPushValueForDistributionKey();
                            if (*(_QWORD *)(v1 + 32))
                            {
                              result = ADClientPushValueForDistributionKey();
                              if (*(_QWORD *)(v1 + 32))
                              {
                                result = ADClientPushValueForDistributionKey();
                                if (*(_QWORD *)(v1 + 32))
                                {
                                  result = ADClientPushValueForDistributionKey();
                                  if (*(_QWORD *)(v1 + 32))
                                  {
                                    result = ADClientPushValueForDistributionKey();
                                    if (*(_QWORD *)(v1 + 32))
                                      return ADClientPushValueForDistributionKey();
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
          }
        }
      }
    }
  }
  return result;
}

- (void)reportCriticalFocusErrorOccurredForPortType:(id)a3
{
  int v5;
  NSObject *aggdDispatchQueue;
  _QWORD v7[5];
  int v8;

  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]))
      return;
    v5 = 2;
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__BWAggdDataReporter_reportCriticalFocusErrorOccurredForPortType___block_invoke;
  v7[3] = &unk_1E4920568;
  v7[4] = self;
  v8 = v5;
  dispatch_async(aggdDispatchQueue, v7);
}

uint64_t __66__BWAggdDataReporter_reportCriticalFocusErrorOccurredForPortType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  BOOL v3;

  v1 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.capture.focus_err.%d"), *(unsigned int *)(a1 + 40));
  if (v1)
    v3 = result == 0;
  else
    v3 = 1;
  if (!v3)
    return ADClientAddValueForScalarKey();
  return result;
}

- (void)reportSphereJitterDetectionsForPortType:(id)a3 detectionAttemps:(int)a4 successfulDetections:(int)a5
{
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  NSObject *aggdDispatchQueue;
  _QWORD block[7];
  int v14;
  int v15;
  int v16;

  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v9 = CFSTR("BackAccumulatedSuccessfulDetections");
    v10 = 1;
    v11 = CFSTR("BackAccumulatedDetectionAttempts");
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05A30]))
      return;
    v9 = CFSTR("BackTelephotoAccumulatedSuccessfulDetections");
    v10 = 2;
    v11 = CFSTR("BackTelephotoAccumulatedDetectionAttempts");
  }
  aggdDispatchQueue = self->_aggdDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__BWAggdDataReporter_reportSphereJitterDetectionsForPortType_detectionAttemps_successfulDetections___block_invoke;
  block[3] = &unk_1E4922600;
  block[4] = v11;
  block[5] = v9;
  v14 = a4;
  v15 = a5;
  block[6] = self;
  v16 = v10;
  dispatch_async(aggdDispatchQueue, block);
}

uint64_t __100__BWAggdDataReporter_reportSphereJitterDetectionsForPortType_detectionAttemps_successfulDetections___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v4 = (void *)CFPreferencesCopyValue(CFSTR("SphereJitterDetectionInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v4)
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  v7 = *(_DWORD *)(a1 + 56)
     + objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)), "intValue");
  v8 = *(_DWORD *)(a1 + 60)
     + objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "intValue");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7), *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8), *(_QWORD *)(a1 + 40));
  CFPreferencesSetValue(CFSTR("SphereJitterDetectionInfo"), v6, CFSTR("com.apple.cameracapture.volatile"), v2, v3);
  CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v2, v3);

  v9 = *(_QWORD *)(a1 + 48);
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.video.sph.esd_recovery_attempts.%d"), *(unsigned int *)(a1 + 64));
  if (v9 && v10 && *(_DWORD *)(a1 + 56))
    ADClientAddValueForScalarKey();
  v11 = *(_QWORD *)(a1 + 48);
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.video.sph.esd_recovery_detects.%d"), *(unsigned int *)(a1 + 64));
  v13 = *(_DWORD *)(a1 + 60);
  if (v11 && v12 && v13)
  {
    ADClientAddValueForScalarKey();
    v13 = *(_DWORD *)(a1 + 60);
  }
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.video.sph.esd_recovery_entries.%d"), *(unsigned int *)(a1 + 64));
    if (v14)
    {
      if (v15)
        ADClientAddValueForScalarKey();
    }
  }
  v16 = *(_QWORD *)(a1 + 48);
  result = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.video.sph.esd_detect_ratio.%d"), *(unsigned int *)(a1 + 64));
  if (v16)
  {
    if (result)
      return ADClientSetValueForScalarKey();
  }
  return result;
}

- (id)_aggdCameraStreamingTimeStringFromDeviceType:(int)a3 devicePosition:(int)a4
{
  int v4;
  __CFString **v5;

  if (a4 == 2)
  {
    v4 = a3 - 2;
    if ((a3 - 2) < 5)
    {
      v5 = &off_1E4922668;
      return v5[v4];
    }
  }
  else if (a4 == 1)
  {
    v4 = a3 - 2;
    if ((a3 - 2) < 9)
    {
      v5 = off_1E4922620;
      return v5[v4];
    }
  }
  return 0;
}

- (id)_aggdPearlInfraredProjectorUptimeStringFromCurrent:(int)a3 pattern:(int)a4 applicationID:(id)a5
{
  BOOL v6;
  const __CFString *v7;
  const __CFString *v8;
  int v10;

  if (a3 != 1 || a4)
  {
    if (a3 == 1 && a4 == 1)
    {
      v6 = 0;
      v7 = CFSTR("lowpowerdense");
    }
    else if (a3 != 2 || a4)
    {
      v6 = a3 != 2 || a4 != 1;
      if (a3 == 2 && a4 == 1)
        v7 = CFSTR("highpowerdense");
      else
        v7 = 0;
    }
    else
    {
      v6 = 0;
      v7 = CFSTR("highpowersparse");
    }
  }
  else
  {
    v6 = 0;
    v7 = CFSTR("lowpowersparse");
  }
  if ((objc_msgSend(a5, "isEqualToString:", 0x1E493D4D8) & 1) != 0
    || (objc_msgSend(a5, "isEqualToString:", 0x1E493D4F8) & 1) != 0)
  {
    v8 = CFSTR("cameraapp");
  }
  else if ((objc_msgSend(a5, "isEqualToString:", 0x1E493D418) & 1) != 0)
  {
    v8 = CFSTR("jellyfish");
  }
  else
  {
    v10 = objc_msgSend(a5, "isEqualToString:", 0x1E493D718);
    v8 = CFSTR("3rdparty");
    if (v10)
      v8 = CFSTR("facetime");
  }
  if (v6)
    return 0;
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.pearl.projectoruptime.%@.%@"), v7, v8);
}

- (id)_aggdGNRProcessingStatusStringFromProcessingStatus:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("success");
  v4 = CFSTR("other-failure");
  if (a3 == -17401)
    v4 = CFSTR("reg-failure");
  if (a3)
    v3 = v4;
  if (a3 == -17402)
    v3 = CFSTR("fusion-failure");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.gnr.status.%@"), v3);
}

- (id)_aggdStereoFusionProcessingTypeStringForCaptureType:(int)a3 isStereoFusionCapture:(BOOL)a4 wideSubCaptureType:(int)a5 teleSubCaptureType:(int)a6 isOriginalImage:(BOOL)a7
{
  const __CFString *v7;
  id result;

  if (a4)
  {
    switch(a3)
    {
      case 1:
        if (a5 != 1 || a6 != 1)
          goto LABEL_25;
        v7 = CFSTR("wysiwyg");
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
      case 2:
        if (a5 != 2 || a6 != 2)
          goto LABEL_25;
        v7 = CFSTR("flash");
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
      case 3:
        v7 = CFSTR("hdr");
        if (a7)
          v7 = CFSTR("wysiwyg");
        if (a5 == 3 && a6 == 3)
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
        goto LABEL_25;
      case 4:
        if (a5 != 4 || a6 != 4)
          goto LABEL_25;
        v7 = CFSTR("sis");
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
      case 5:
        if (a5 == 5 && a6 == 5)
        {
          v7 = CFSTR("ois");
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
        }
        if (a5 == 5 && a6 == 4)
        {
          v7 = CFSTR("ois-sis");
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
        }
LABEL_25:
        result = 0;
        break;
      default:
        goto LABEL_25;
    }
  }
  else
  {
    v7 = CFSTR("not-processed");
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.type.%@"), v7);
  }
  return result;
}

- (id)_aggdStereoFusionProcessingStatusStringFromProcessingStatus:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("other-failure");
  if (a3 == -17411)
    v3 = CFSTR("adc-failure");
  if (!a3)
    v3 = CFSTR("success");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.stereofusion.status.%@"), v3);
}

- (id)_aggdSDOFProcessingStatusStringFromProcessingStatus:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("other-failure");
  if (a3 == -17411)
    v3 = CFSTR("adc-failure");
  if (!a3)
    v3 = CFSTR("success");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.still.processing.sdof.status.%@"), v3);
}

- (id)_aggdStringForPrefix:(id)a3 primaryCaptureType:(int)a4 secondaryCaptureType:(int)a5 captureFlags:(unint64_t)a6 sceneFlags:(unint64_t)a7 stillDuringVideo:(BOOL)a8 frontCamera:(BOOL)a9
{
  __int16 v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;

  if (!a3)
    return 0;
  v9 = a6;
  if (a9)
    v11 = CFSTR("ffc");
  else
    v11 = CFSTR("rfc");
  if ((a6 & 0x400) != 0)
    v12 = CFSTR(".stereofusion");
  else
    v12 = &stru_1E4928818;
  if (a8)
  {
    v13 = CFSTR("stillduringvideo");
  }
  else
  {
    v13 = -[BWAggdDataReporter _captureTypeStringWithPrimaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:]((const __CFString *)self, a4, a5, (unsigned __int16)a6, a7);
    if (!v13)
      return 0;
  }
  if ((v9 & 0x800) != 0)
    v14 = CFSTR(".depth");
  else
    v14 = &stru_1E4928818;
  v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@%@"), *(_QWORD *)&a4, *(_QWORD *)&a5, v11, v12, v13, v14);
  if (v15)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.camera.%@.%@"), a3, v15);
  return 0;
}

- (const)_captureTypeStringWithPrimaryCaptureType:(unsigned int)a3 secondaryCaptureType:(int)a4 captureFlags:(char)a5 sceneFlags:
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  if (result)
  {
    result = CFSTR("wysiwyg");
    switch(a2)
    {
      case 1:
      case 8:
        return result;
      case 2:
        result = CFSTR("flash");
        break;
      case 3:
        result = CFSTR("HDR");
        break;
      case 4:
        v5 = CFSTR("SIS");
        if (a3)
          v5 = 0;
        if (a3 == 4)
          result = CFSTR("SIS+SIS");
        else
          result = v5;
        break;
      case 5:
        if (a3 >= 6)
          goto LABEL_21;
        result = *(&off_1E4922690 + (int)a3);
        break;
      case 6:
        result = CFSTR("nightmode");
        break;
      case 7:
        result = CFSTR("bracket");
        break;
      case 10:
        v6 = CFSTR("HDR");
        v7 = CFSTR("NR.HR");
        if ((a5 & 0x80) == 0)
          v7 = CFSTR("NR");
        if ((a5 & 0xC) == 0)
          v7 = CFSTR("wysiwyg");
        if ((a4 & 0x100000) == 0)
          v6 = v7;
        result = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UB.%@"), v6);
        break;
      case 11:
        result = CFSTR("digitalflash");
        break;
      case 12:
        result = CFSTR("deepfusion");
        break;
      default:
LABEL_21:
        result = 0;
        break;
    }
  }
  return result;
}

@end
