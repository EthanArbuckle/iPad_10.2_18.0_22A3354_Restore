@implementation BWLivePhotoMovieAnalyticsPayload

- (BWLivePhotoMovieAnalyticsPayload)init
{
  BWLivePhotoMovieAnalyticsPayload *v2;
  BWLivePhotoMovieAnalyticsPayload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWLivePhotoMovieAnalyticsPayload;
  v2 = -[BWLivePhotoMovieAnalyticsPayload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BWLivePhotoMovieAnalyticsPayload reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWLivePhotoMovieAnalyticsPayload;
  -[BWLivePhotoMovieAnalyticsPayload dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  self->_clientIDType = 0;
  self->_recordingSucceeded = 0;
  *(_QWORD *)&self->_errorStatus = 0;
  *(int *)((char *)&self->_sessionStatus + 3) = 0;
  *(_OWORD *)&self->_movieDurationInSeconds = 0u;
  *(_OWORD *)&self->_stillTimeOffsetToVideoPrerollStartInMilliseconds = 0u;
  *(_OWORD *)&self->_stillTimeOffsetToAudioPrerollStartInMilliseconds = 0u;
  self->_overlappingCapture = 0;
  *(_OWORD *)&self->_stagingNodeOverallNumberOfVideoFramesReceived = 0u;
  *(_OWORD *)&self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds = 0u;
  *(_OWORD *)&self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples = 0u;
  *(_OWORD *)&self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds = 0u;
  self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds = 0.0;
  self->_transitionVitalityScoreV1 = -1.0;

  self->_transitionVitalityFeatures = 0;
  self->_stillCaptureLuxLevel = 0;
  self->_targetFrameRate = 0.0;
  self->_numberOfFramesDropped = 0;
  self->_stillCapturePortType = 0;
  *(_QWORD *)&self->_stillCaptureType = 0;
  self->_maxSystemPressureLevel = 0;
  *(_OWORD *)&self->_retimingRecipeIdentifier = 0u;
  *(_OWORD *)&self->_maxVideoFrameDurationInMilliseconds = 0u;
  *(_OWORD *)&self->_medianVideoFrameDurationInMilliseconds = 0u;
}

- (id)eventName
{
  return CFSTR("com.apple.coremedia.camera.LivePhotoMovie");
}

- (id)eventDictionary
{
  void *v3;
  NSDictionary *transitionVitalityFeatures;
  NSString *stillCapturePortType;
  NSNumber *retimingRecipeIdentifier;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_clientIDType), CFSTR("clientIDType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_recordingSucceeded), CFSTR("recordingSucceeded"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_errorStatus), CFSTR("errorStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sessionStatus), CFSTR("sessionStatus"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_longPressMovie), CFSTR("longPressMovie"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_originalRecording), CFSTR("originalRecording"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasStillImagePTS), CFSTR("hasStillImagePTS"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_movieDurationInSeconds), CFSTR("movieDurationInSeconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stillTimeOffsetInSeconds), CFSTR("stillTimeOffsetInSeconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stillTimeOffsetToVideoPrerollStartInMilliseconds), CFSTR("stillTimeOffsetToVideoPrerollStartInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stillTimeOffsetToVideoPrerollStopInMilliseconds), CFSTR("stillTimeOffsetToVideoPrerollStopInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stillTimeOffsetToAudioPrerollStartInMilliseconds), CFSTR("stillTimeOffsetToAudioPrerollStartInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stillTimeOffsetToAudioPrerollStopInMilliseconds), CFSTR("stillTimeOffsetToAudioPrerollStopInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_overlappingCapture), CFSTR("overlappingCapture"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stagingNodeOverallNumberOfVideoFramesReceived), CFSTR("stagingNodeOverallNumberOfVideoFramesReceived"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stagingNodeValveActiveNumberOfVideoFramesReceived), CFSTR("stagingNodeValveActiveNumberOfVideoFramesReceived"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds), CFSTR("stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples), CFSTR("fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds), CFSTR("fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds), CFSTR("fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds), CFSTR("fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds), CFSTR("fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds"));
  if (self->_transitionVitalityScoreV1 >= 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("transitionVitalityScoreV1"));
  transitionVitalityFeatures = self->_transitionVitalityFeatures;
  if (transitionVitalityFeatures)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](transitionVitalityFeatures, "objectForKeyedSubscript:", CFSTR("deltaF")), CFSTR("transitionVitalityDeltaF"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_transitionVitalityFeatures, "objectForKeyedSubscript:", CFSTR("thetaMax")), CFSTR("transitionVitalityThetaMax"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_transitionVitalityFeatures, "objectForKeyedSubscript:", CFSTR("motionAnalysisRMS")), CFSTR("transitionVitalitySubjectMotionRMS"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_stillCaptureLuxLevel), CFSTR("stillCaptureLuxLevel"));
  stillCapturePortType = self->_stillCapturePortType;
  if (stillCapturePortType)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", stillCapturePortType, CFSTR("stillCapturePortType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stillCaptureType), CFSTR("stillCaptureType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_stillCaptureResolutionFlavor), CFSTR("stillCaptureResolutionFlavor"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxSystemPressureLevel), CFSTR("maxSystemPressureLevel"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_targetFrameRate), CFSTR("targetFrameRate"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfFramesDropped), CFSTR("numberOfFramesDropped"));
  retimingRecipeIdentifier = self->_retimingRecipeIdentifier;
  if (retimingRecipeIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", retimingRecipeIdentifier, CFSTR("retimingRecipeIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minVideoFrameDurationInMilliseconds), CFSTR("videoFrameDurationMinInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxVideoFrameDurationInMilliseconds), CFSTR("videoFrameDurationMaxInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageVideoFrameDurationInMilliseconds), CFSTR("videoFrameDurationAverageInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_medianVideoFrameDurationInMilliseconds), CFSTR("videoFrameDurationMedianInMilliseconds"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_videoFrameDurationStandardDeviationInMilliseconds), CFSTR("videoFrameDurationStandardDeviationInMilliseconds"));
  return v3;
}

- (int)clientIDType
{
  return self->_clientIDType;
}

- (void)setClientIDType:(int)a3
{
  self->_clientIDType = a3;
}

- (BOOL)recordingSucceeded
{
  return self->_recordingSucceeded;
}

- (void)setRecordingSucceeded:(BOOL)a3
{
  self->_recordingSucceeded = a3;
}

- (int)errorStatus
{
  return self->_errorStatus;
}

- (void)setErrorStatus:(int)a3
{
  self->_errorStatus = a3;
}

- (int)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(int)a3
{
  self->_sessionStatus = a3;
}

- (BOOL)longPressMovie
{
  return self->_longPressMovie;
}

- (void)setLongPressMovie:(BOOL)a3
{
  self->_longPressMovie = a3;
}

- (BOOL)originalRecording
{
  return self->_originalRecording;
}

- (void)setOriginalRecording:(BOOL)a3
{
  self->_originalRecording = a3;
}

- (BOOL)hasStillImagePTS
{
  return self->_hasStillImagePTS;
}

- (void)setHasStillImagePTS:(BOOL)a3
{
  self->_hasStillImagePTS = a3;
}

- (double)movieDurationInSeconds
{
  return self->_movieDurationInSeconds;
}

- (void)setMovieDurationInSeconds:(double)a3
{
  self->_movieDurationInSeconds = a3;
}

- (double)stillTimeOffsetInSeconds
{
  return self->_stillTimeOffsetInSeconds;
}

- (void)setStillTimeOffsetInSeconds:(double)a3
{
  self->_stillTimeOffsetInSeconds = a3;
}

- (double)stillTimeOffsetToVideoPrerollStartInMilliseconds
{
  return self->_stillTimeOffsetToVideoPrerollStartInMilliseconds;
}

- (void)setStillTimeOffsetToVideoPrerollStartInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToVideoPrerollStartInMilliseconds = a3;
}

- (double)stillTimeOffsetToVideoPrerollStopInMilliseconds
{
  return self->_stillTimeOffsetToVideoPrerollStopInMilliseconds;
}

- (void)setStillTimeOffsetToVideoPrerollStopInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToVideoPrerollStopInMilliseconds = a3;
}

- (double)stillTimeOffsetToAudioPrerollStartInMilliseconds
{
  return self->_stillTimeOffsetToAudioPrerollStartInMilliseconds;
}

- (void)setStillTimeOffsetToAudioPrerollStartInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToAudioPrerollStartInMilliseconds = a3;
}

- (double)stillTimeOffsetToAudioPrerollStopInMilliseconds
{
  return self->_stillTimeOffsetToAudioPrerollStopInMilliseconds;
}

- (void)setStillTimeOffsetToAudioPrerollStopInMilliseconds:(double)a3
{
  self->_stillTimeOffsetToAudioPrerollStopInMilliseconds = a3;
}

- (BOOL)overlappingCapture
{
  return self->_overlappingCapture;
}

- (void)setOverlappingCapture:(BOOL)a3
{
  self->_overlappingCapture = a3;
}

- (int64_t)stagingNodeOverallNumberOfVideoFramesReceived
{
  return self->_stagingNodeOverallNumberOfVideoFramesReceived;
}

- (void)setStagingNodeOverallNumberOfVideoFramesReceived:(int64_t)a3
{
  self->_stagingNodeOverallNumberOfVideoFramesReceived = a3;
}

- (double)stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallAverageTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallStandardDeviationOfTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallMinimumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeOverallMaximumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (int64_t)stagingNodeValveActiveNumberOfVideoFramesReceived
{
  return self->_stagingNodeValveActiveNumberOfVideoFramesReceived;
}

- (void)setStagingNodeValveActiveNumberOfVideoFramesReceived:(int64_t)a3
{
  self->_stagingNodeValveActiveNumberOfVideoFramesReceived = a3;
}

- (double)stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveAverageTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveStandardDeviationOfTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveMinimumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (double)stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds
{
  return self->_stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds;
}

- (void)setStagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds:(double)a3
{
  self->_stagingNodeValveActiveMaximumTimeBetweenVideoFramesInMilliseconds = a3;
}

- (int64_t)fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyNumberOfSamples:(int64_t)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyNumberOfSamples = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyAverageInMilliseconds = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyStandardDeviationInMilliseconds = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyMinimumInMilliseconds = a3;
}

- (double)fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds
{
  return self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds;
}

- (void)setFileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds:(double)a3
{
  self->_fileCoordinatorToWriterMovingWindowLatencyMaximumInMilliseconds = a3;
}

- (double)transitionVitalityScoreV1
{
  return self->_transitionVitalityScoreV1;
}

- (void)setTransitionVitalityScoreV1:(double)a3
{
  self->_transitionVitalityScoreV1 = a3;
}

- (NSDictionary)transitionVitalityFeatures
{
  return self->_transitionVitalityFeatures;
}

- (void)setTransitionVitalityFeatures:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (unsigned)stillCaptureLuxLevel
{
  return self->_stillCaptureLuxLevel;
}

- (void)setStillCaptureLuxLevel:(unsigned int)a3
{
  self->_stillCaptureLuxLevel = a3;
}

- (int)stillCaptureType
{
  return self->_stillCaptureType;
}

- (void)setStillCaptureType:(int)a3
{
  self->_stillCaptureType = a3;
}

- (NSString)stillCapturePortType
{
  return self->_stillCapturePortType;
}

- (void)setStillCapturePortType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int)stillCaptureResolutionFlavor
{
  return self->_stillCaptureResolutionFlavor;
}

- (void)setStillCaptureResolutionFlavor:(int)a3
{
  self->_stillCaptureResolutionFlavor = a3;
}

- (int)maxSystemPressureLevel
{
  return self->_maxSystemPressureLevel;
}

- (void)setMaxSystemPressureLevel:(int)a3
{
  self->_maxSystemPressureLevel = a3;
}

- (double)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(double)a3
{
  self->_targetFrameRate = a3;
}

- (unsigned)numberOfFramesDropped
{
  return self->_numberOfFramesDropped;
}

- (void)setNumberOfFramesDropped:(unsigned int)a3
{
  self->_numberOfFramesDropped = a3;
}

- (NSNumber)retimingRecipeIdentifier
{
  return self->_retimingRecipeIdentifier;
}

- (void)setRetimingRecipeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (double)minVideoFrameDurationInMilliseconds
{
  return self->_minVideoFrameDurationInMilliseconds;
}

- (void)setMinVideoFrameDurationInMilliseconds:(double)a3
{
  self->_minVideoFrameDurationInMilliseconds = a3;
}

- (double)maxVideoFrameDurationInMilliseconds
{
  return self->_maxVideoFrameDurationInMilliseconds;
}

- (void)setMaxVideoFrameDurationInMilliseconds:(double)a3
{
  self->_maxVideoFrameDurationInMilliseconds = a3;
}

- (double)averageVideoFrameDurationInMilliseconds
{
  return self->_averageVideoFrameDurationInMilliseconds;
}

- (void)setAverageVideoFrameDurationInMilliseconds:(double)a3
{
  self->_averageVideoFrameDurationInMilliseconds = a3;
}

- (double)medianVideoFrameDurationInMilliseconds
{
  return self->_medianVideoFrameDurationInMilliseconds;
}

- (void)setMedianVideoFrameDurationInMilliseconds:(double)a3
{
  self->_medianVideoFrameDurationInMilliseconds = a3;
}

- (double)videoFrameDurationStandardDeviationInMilliseconds
{
  return self->_videoFrameDurationStandardDeviationInMilliseconds;
}

- (void)setVideoFrameDurationStandardDeviationInMilliseconds:(double)a3
{
  self->_videoFrameDurationStandardDeviationInMilliseconds = a3;
}

@end
