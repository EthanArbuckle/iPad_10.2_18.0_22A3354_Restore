@implementation AVTRecordView

+ (BOOL)usesInternalTrackingPipeline
{
  return +[AVTFaceTracker usesInternalTrackingPipeline](AVTFaceTracker, "usesInternalTrackingPipeline");
}

+ (void)setUsesInternalTrackingPipeline:(BOOL)a3
{
  +[AVTFaceTracker setUsesInternalTrackingPipeline:](AVTFaceTracker, "setUsesInternalTrackingPipeline:", a3);
}

- (void)_avt_commonInit
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: [Record view] No point of view in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (AVTRecordView)init
{
  AVTRecordView *v2;
  AVTRecordView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTRecordView;
  v2 = -[AVTRecordView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AVTRecordView _avt_commonInit](v2, "_avt_commonInit");
  return v3;
}

- (AVTRecordView)initWithCoder:(id)a3
{
  AVTRecordView *v3;
  AVTRecordView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTRecordView;
  v3 = -[AVTView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AVTRecordView _avt_commonInit](v3, "_avt_commonInit");
  return v4;
}

- (AVTRecordView)initWithFrame:(CGRect)a3 options:(id)a4
{
  AVTRecordView *v4;
  AVTRecordView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTRecordView;
  v4 = -[AVTView initWithFrame:options:](&v7, sel_initWithFrame_options_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[AVTRecordView _avt_commonInit](v4, "_avt_commonInit");
  return v5;
}

- (AVTRecordView)initWithFrame:(CGRect)a3
{
  AVTRecordView *v3;
  AVTRecordView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTRecordView;
  v3 = -[AVTView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AVTRecordView _avt_commonInit](v3, "_avt_commonInit");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3050], 0);

  v4.receiver = self;
  v4.super_class = (Class)AVTRecordView;
  -[AVTView dealloc](&v4, sel_dealloc);
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond_user;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond_user = a3;
  -[AVTRecordView _setEffectivePreferredFramesPerSecond](self, "_setEffectivePreferredFramesPerSecond");
}

- (void)_setEffectivePreferredFramesPerSecond
{
  int64_t preferredFramesPerSecond_thermal;
  int64_t preferredFramesPerSecond_user;
  objc_super v4;
  objc_super v5;
  objc_super v6;

  preferredFramesPerSecond_thermal = self->_preferredFramesPerSecond_thermal;
  preferredFramesPerSecond_user = self->_preferredFramesPerSecond_user;
  if (preferredFramesPerSecond_thermal)
  {
    if (preferredFramesPerSecond_user)
    {
      if (preferredFramesPerSecond_user < preferredFramesPerSecond_thermal)
        preferredFramesPerSecond_thermal = self->_preferredFramesPerSecond_user;
      -[AVTRecordView setPreferredFramesPerSecond:](&v6, sel_setPreferredFramesPerSecond_, preferredFramesPerSecond_thermal, v4.receiver, v4.super_class, v5.receiver, v5.super_class, self, AVTRecordView);
    }
    else
    {
      -[AVTRecordView setPreferredFramesPerSecond:](&v5, sel_setPreferredFramesPerSecond_, preferredFramesPerSecond_thermal, v4.receiver, v4.super_class, self, AVTRecordView, v6.receiver, v6.super_class);
    }
  }
  else
  {
    -[AVTRecordView setPreferredFramesPerSecond:](&v4, sel_setPreferredFramesPerSecond_, preferredFramesPerSecond_user, self, AVTRecordView, v5.receiver, v5.super_class, v6.receiver, v6.super_class);
  }
}

- (void)_updateFrameRateForThermalState:(int64_t)a3
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("avatarKit.disableThermalDrivenFPS")) & 1) == 0)
  {
    if ((unint64_t)a3 <= 3)
      self->_preferredFramesPerSecond_thermal = qword_1DD26A928[a3];
    -[AVTRecordView _setEffectivePreferredFramesPerSecond](self, "_setEffectivePreferredFramesPerSecond");
  }

}

- (void)_processInfoThermalStateDidChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTRecordView _updateFrameRateForThermalState:](self, "_updateFrameRateForThermalState:", objc_msgSend(v4, "thermalState"));

}

- (id)faceTrackingRecordingURL
{
  void *v2;
  void *v3;

  -[AVTView faceTracker](self, "faceTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceTrackingRecordingURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFaceTrackingRecordingURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTView faceTracker](self, "faceTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFaceTrackingRecordingURL:", v4);

}

- (void)faceTracker:(id)a3 session:(id)a4 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentAudioTime;
  AVAssetWriter *audioWriter;
  int64_t epoch;
  $95D729B680665BEAEFA1D6FCA8238556 v10;

  -[NSLock lock](self->_audioLock, "lock", a3, a4);
  if (self->_audioWriterInput)
  {
    p_currentAudioTime = &self->_currentAudioTime;
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&v10, a5);
    self->_currentAudioTime = v10;
    if (!self->_audioIsRecording)
    {
      audioWriter = self->_audioWriter;
      *(_OWORD *)&v10.value = *(_OWORD *)&p_currentAudioTime->value;
      v10.epoch = self->_currentAudioTime.epoch;
      -[AVAssetWriter startSessionAtSourceTime:](audioWriter, "startSessionAtSourceTime:", &v10);
      epoch = self->_currentAudioTime.epoch;
      *(_OWORD *)&self->_startAudioTime.value = *(_OWORD *)&p_currentAudioTime->value;
      self->_startAudioTime.epoch = epoch;
      self->_audioIsRecording = 1;
    }
    if (-[AVAssetWriterInput isReadyForMoreMediaData](self->_audioWriterInput, "isReadyForMoreMediaData"))
    {
      self->_recordedSampleCount += CMSampleBufferGetNumSamples(a5);
      -[AVAssetWriterInput appendSampleBuffer:](self->_audioWriterInput, "appendSampleBuffer:", a5);
    }
  }
  -[NSLock unlock](self->_audioLock, "unlock");
}

- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[AVTRecordView recordDelegate](self, "recordDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordView:session:didFailWithError:", self, v14, v7);

  }
  -[AVTView faceTrackingDelegate](self, "faceTrackingDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AVTView faceTrackingDelegate](self, "faceTrackingDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "avatarView:faceTrackingSessionFailedWithError:", self, v7);

  }
}

- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  -[AVTRecordView recordDelegate](self, "recordDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordView:sessionWasInterrupted:", self, v11);

  }
  -[AVTView faceTrackingDelegate](self, "faceTrackingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AVTView faceTrackingDelegate](self, "faceTrackingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "avatarViewFaceTrackingSessionInterruptionDidBegin:", self);

  }
}

- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  -[AVTRecordView recordDelegate](self, "recordDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordView:sessionInterruptionEnded:", self, v11);

  }
  -[AVTView faceTrackingDelegate](self, "faceTrackingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[AVTView faceTrackingDelegate](self, "faceTrackingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "avatarViewFaceTrackingSessionInterruptionDidEnd:", self);

  }
}

- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AVTRecordView;
  -[AVTView faceTrackerDidUpdate:withARFrame:](&v26, sel_faceTrackerDidUpdate_withARFrame_, v6, a4);
  if (!self->_exportingMovie)
  {
    v7 = objc_msgSend(v6, "faceIsTracked")
      && !self->_exportingMovie
      && !-[AVTView faceTrackingIsPaused](self, "faceTrackingIsPaused");
    -[AVTView setRendersContinuously:](self, "setRendersContinuously:", v7);
    if (self->_recording)
    {
      if (self->_recordedCount >= self->_recordingCapacity)
      {
        -[AVTRecordView stopRecording](self, "stopRecording");
      }
      else
      {
        objc_msgSend(v6, "faceTrackingInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "trackingData");
        -[NSMutableData increaseLengthBy:](self->_rawTimesData, "increaseLengthBy:", 8);
        v10 = *(_QWORD *)v9;
        *(_QWORD *)(-[NSMutableData mutableBytes](self->_rawTimesData, "mutableBytes") + 8 * self->_recordedCount) = v10;
        -[NSMutableData increaseLengthBy:](self->_rawBlendShapesData, "increaseLengthBy:", 204);
        v11 = -[NSMutableData mutableBytes](self->_rawBlendShapesData, "mutableBytes") + 204 * self->_recordedCount;
        *v11 = *(_OWORD *)(v9 + 256);
        v12 = *(_OWORD *)(v9 + 400);
        v13 = *(_OWORD *)(v9 + 416);
        v14 = *(_OWORD *)(v9 + 432);
        *(_OWORD *)((char *)v11 + 188) = *(_OWORD *)(v9 + 444);
        v11[10] = v13;
        v11[11] = v14;
        v11[9] = v12;
        v15 = *(_OWORD *)(v9 + 336);
        v16 = *(_OWORD *)(v9 + 352);
        v17 = *(_OWORD *)(v9 + 384);
        v11[7] = *(_OWORD *)(v9 + 368);
        v11[8] = v17;
        v11[5] = v15;
        v11[6] = v16;
        v18 = *(_OWORD *)(v9 + 272);
        v19 = *(_OWORD *)(v9 + 288);
        v20 = *(_OWORD *)(v9 + 320);
        v11[3] = *(_OWORD *)(v9 + 304);
        v11[4] = v20;
        v11[1] = v18;
        v11[2] = v19;
        -[NSMutableData increaseLengthBy:](self->_rawTransformsData, "increaseLengthBy:", 64);
        v21 = -[NSMutableData mutableBytes](self->_rawTransformsData, "mutableBytes")
            + ((uint64_t)self->_recordedCount << 6);
        objc_msgSend(v6, "rawTransform");
        *v21 = v22;
        v21[1] = v23;
        v21[2] = v24;
        v21[3] = v25;
        -[NSMutableData increaseLengthBy:](self->_rawParametersData, "increaseLengthBy:", 4);
        *(_DWORD *)(-[NSMutableData mutableBytes](self->_rawParametersData, "mutableBytes")
                  + 4 * self->_recordedCount++) = *(_DWORD *)(v9 + 464);

      }
    }
  }

}

- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  void (**v10)(_QWORD);
  void *v11;
  objc_super v12;

  v6 = a5;
  v10 = (void (**)(_QWORD))a6;
  if (!self->_exportingMovie && !self->_playing)
  {
    v12.receiver = self;
    v12.super_class = (Class)AVTRecordView;
    -[AVTView transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:](&v12, sel_transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler_, a4, v6, v10, a3);
    goto LABEL_9;
  }
  -[AVTView avatar](self, "avatar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPose:", 0);

  if (-[AVTView enableFaceTracking](self, "enableFaceTracking"))
  {
    -[AVTRecordView setFaceTrackingPaused:](self, "setFaceTrackingPaused:", 0);
    if (!v10)
      goto LABEL_9;
    goto LABEL_7;
  }
  -[AVTView setEnableFaceTracking:](self, "setEnableFaceTracking:", 1);
  if (v10)
LABEL_7:
    v10[2](v10);
LABEL_9:

}

- (void)_didLostTrackingForAWhile
{
  void *v3;
  char v4;
  id v5;

  -[AVTRecordView recordDelegate](self, "recordDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordViewDidLostTrackingWhileRecording:", self);

  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  id v6;
  AVPlayer *audioPlayer;
  double v8;
  AVPlayer *v9;
  CMTime v10;
  CMTime time;

  v6 = a3;
  if (-[AVTRecordView isPreviewing](self, "isPreviewing"))
  {
    audioPlayer = self->_audioPlayer;
    if (audioPlayer)
      -[AVPlayer currentTime](audioPlayer, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    v8 = fmax(CMTimeGetSeconds(&time), 0.0);
    if (self->_lastAudioPlayerTime != v8 || v8 == 0.0)
    {
      v9 = self->_audioPlayer;
      if (v9)
        -[AVPlayer currentTime](v9, "currentTime");
      else
        memset(&v10, 0, sizeof(v10));
      self->_lastAudioPlayerTime = CMTimeGetSeconds(&v10);
      self->_lastAudioSystemTime = CACurrentMediaTime();
    }
    else
    {
      v8 = v8 + CACurrentMediaTime() - self->_lastAudioSystemTime;
    }
    objc_msgSend(v6, "setSceneTime:", v8, v10.value, *(_QWORD *)&v10.timescale, v10.epoch, time.value, *(_QWORD *)&time.timescale, time.epoch);
  }
  -[AVTView updateAtTime:](self, "updateAtTime:", a4);

}

- (double)_renderer:(id)a3 inputTimeForCurrentFrameWithTime:(double)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  v7 = 0.0;
  if (!self->_playing && !self->_exportingMovie)
  {
    -[AVTView currentlyRenderedTrackingDate](self, "currentlyRenderedTrackingDate");
    if (v8 == 0.0)
      v7 = a4;
    else
      v7 = v8;
  }

  return v7;
}

- (BOOL)allowTrackSmoothing
{
  return !self->_transitioningFromSnapshot;
}

- (void)setAvatar:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)AVTRecordView;
  -[AVTView setAvatar:](&v5, sel_setAvatar_, v4);

  kdebug_trace();
}

- (void)avatarDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AVTView lockAvatar](self, "lockAvatar");
  -[AVTRecordView convertRecordedDataToAnimationGroup](self, "convertRecordedDataToAnimationGroup");
  -[AVTView environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView avatar](self, "avatar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTView presentationConfiguration](self, "presentationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarDidChange:presentationConfiguration:", v4, v5);

  if (!self->_recordedAnimationGroup)
    self->_referenceAnimationBeginTime = CACurrentMediaTime();
  -[AVTView avatar](self, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBakedAnimationReferenceTime:", self->_referenceAnimationBeginTime);

  -[AVTView unlockAvatar](self, "unlockAvatar");
}

- (void)startRecording
{
  int v3;
  NSMutableData *v4;
  NSMutableData *rawTimesData;
  NSMutableData *v6;
  NSMutableData *rawBlendShapesData;
  NSMutableData *v8;
  NSMutableData *rawTransformsData;
  NSMutableData *v10;
  NSMutableData *rawParametersData;
  CAAnimationGroup *recordedAnimationGroup;
  void *v13;

  -[AVTView lockAvatar](self, "lockAvatar");
  self->_playing = 0;
  v3 = (int)(float)(self->_maxRecordingDuration * 60.0);
  self->_recordingCapacity = v3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 8 * v3);
  v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  rawTimesData = self->_rawTimesData;
  self->_rawTimesData = v4;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 204 * self->_recordingCapacity);
  v6 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  rawBlendShapesData = self->_rawBlendShapesData;
  self->_rawBlendShapesData = v6;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", (uint64_t)self->_recordingCapacity << 6);
  v8 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  rawTransformsData = self->_rawTransformsData;
  self->_rawTransformsData = v8;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 4 * self->_recordingCapacity);
  v10 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  rawParametersData = self->_rawParametersData;
  self->_rawParametersData = v10;

  self->_recording = 1;
  self->_recordingStartTime = CACurrentMediaTime();
  self->_recordedCount = 0;
  recordedAnimationGroup = self->_recordedAnimationGroup;
  self->_recordedAnimationGroup = 0;

  -[AVTView faceTracker](self, "faceTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startRecording");

  -[AVTRecordView cancelRecordingAudio](self, "cancelRecordingAudio");
  -[AVTRecordView startRecordingAudio](self, "startRecordingAudio");
  -[AVTView unlockAvatar](self, "unlockAvatar");
}

- (void)cancelRecording
{
  NSMutableData *rawTimesData;
  NSMutableData *rawBlendShapesData;
  NSMutableData *rawTransformsData;
  NSMutableData *rawParametersData;
  CAAnimationGroup *recordedAnimationGroup;
  void *v8;

  -[AVTView lockAvatar](self, "lockAvatar");
  rawTimesData = self->_rawTimesData;
  self->_rawTimesData = 0;

  rawBlendShapesData = self->_rawBlendShapesData;
  self->_rawBlendShapesData = 0;

  rawTransformsData = self->_rawTransformsData;
  self->_rawTransformsData = 0;

  rawParametersData = self->_rawParametersData;
  self->_rawParametersData = 0;

  self->_recording = 0;
  self->_recordedCount = 0;
  recordedAnimationGroup = self->_recordedAnimationGroup;
  self->_recordedAnimationGroup = 0;

  -[AVTView faceTracker](self, "faceTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopRecording");

  -[AVTRecordView cancelRecordingAudio](self, "cancelRecordingAudio");
  -[AVTView unlockAvatar](self, "unlockAvatar");
}

- (void)_smoothRecordedData
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, v0, v1, "Error: [Record view] CVAFaceTrackingPostProcessRecordingExt failed with error code %d", v2);
  OUTLINED_FUNCTION_3();
}

- (void)stopRecording
{
  void *v3;

  -[AVTView lockAvatar](self, "lockAvatar");
  if (self->_recording)
  {
    self->_recording = 0;
    -[AVTView faceTracker](self, "faceTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopRecording");

    -[AVTRecordView stopRecordingAudio](self, "stopRecordingAudio");
    -[AVTRecordView trimRecordedData](self, "trimRecordedData");
    -[AVTRecordView finalizeAudioFile](self, "finalizeAudioFile");
    -[AVTRecordView _smoothRecordedData](self, "_smoothRecordedData");
    -[AVTRecordView convertRecordedDataToAnimationGroup](self, "convertRecordedDataToAnimationGroup");
  }
  -[AVTView unlockAvatar](self, "unlockAvatar");
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)addRecordedAnimationToAvatar:(id)a3
{
  CAAnimationGroup *v4;
  void *v5;
  void *v6;
  CAAnimationGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "pauseBakedAnimation");
  v4 = self->_recordedAnimationGroup;
  objc_msgSend(v11, "bakedAnimationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setUsesSceneTimeBase:", 1);
    objc_msgSend(v6, "setBeginTime:", 0.0);
    objc_msgSend(v6, "setTimeOffset:", self->_recordingStartTime - self->_referenceAnimationBeginTime);
    v7 = (CAAnimationGroup *)-[CAAnimationGroup copy](v4, "copy");

    -[CAAnimationGroup animations](v7, "animations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAAnimationGroup setAnimations:](v7, "setAnimations:", v9);

    v4 = v7;
  }
  objc_msgSend(v11, "avatarNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v4, CFSTR("livePreview"));

}

- (void)removeRecordedAnimationFromAvatar:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "avatarNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("livePreview"));

  objc_msgSend(v4, "resumeBakedAnimation");
}

- (void)_playLivePreviewAnimation
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[AVTView avatar](self, "avatar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTView environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showReticle");

  if (v4)
  {
    -[AVTView environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowReticle:", 0);

    -[AVTView setFaceIsTracked:](self, "setFaceIsTracked:", 1);
  }
  -[AVTRecordView addRecordedAnimationToAvatar:](self, "addRecordedAnimationToAvatar:", v6);

}

- (void)startPreviewing
{
  void *v3;
  char v4;
  id v5;

  -[AVTView lockAvatar](self, "lockAvatar");
  self->_playing = 1;
  -[AVTRecordView _playLivePreviewAnimation](self, "_playLivePreviewAnimation");
  -[AVTRecordView updateAudioState](self, "updateAudioState");
  -[AVTRecordView _updateTrackingState](self, "_updateTrackingState");
  -[AVTView unlockAvatar](self, "unlockAvatar");
  -[AVTRecordView recordDelegate](self, "recordDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordView:previewDidChangeStatus:", self, 0);

  }
}

- (void)playPreviewOnce
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  if (self->_playing)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[AVTRecordView recordDelegate](self, "recordDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordView:previewDidChangeStatus:", self, 1);

    }
    -[AVTView lockAvatar](self, "lockAvatar");
    -[AVTRecordView _playLivePreviewAnimation](self, "_playLivePreviewAnimation");
    -[AVTRecordView stopPlayingAudio](self, "stopPlayingAudio");
    -[AVTRecordView startPlayingAudio](self, "startPlayingAudio");
    -[AVTRecordView _updateTrackingState](self, "_updateTrackingState");
    -[AVTView unlockAvatar](self, "unlockAvatar");
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[AVTRecordView recordDelegate](self, "recordDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordView:previewDidChangeStatus:", self, 0);

    }
  }
  else
  {
    -[AVTRecordView startPreviewing](self, "startPreviewing");
  }
}

- (void)stopPreviewing
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[AVTView lockAvatar](self, "lockAvatar");
  self->_playing = 0;
  -[AVTView avatar](self, "avatar");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTRecordView removeRecordedAnimationFromAvatar:](self, "removeRecordedAnimationFromAvatar:");
  -[AVTRecordView updateAudioState](self, "updateAudioState");
  -[AVTRecordView stopPlayingAudio](self, "stopPlayingAudio");
  -[AVTRecordView _updateTrackingState](self, "_updateTrackingState");
  -[AVTView unlockAvatar](self, "unlockAvatar");
  -[AVTRecordView recordDelegate](self, "recordDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordView:previewDidChangeStatus:", self, 1);

  }
}

- (BOOL)isPreviewing
{
  return self->_playing;
}

- (BOOL)playBakedAnimation
{
  return self->_playBakedAnimation;
}

- (void)setPlayBakedAnimation:(BOOL)a3
{
  if (self->_playBakedAnimation != a3)
  {
    self->_playBakedAnimation = a3;
    -[AVTRecordView _updateTrackingState](self, "_updateTrackingState");
  }
}

- (BOOL)disableRendering
{
  return self->_disableRendering;
}

- (void)setDisableRendering:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (self->_disableRendering != a3)
  {
    v3 = a3;
    self->_disableRendering = a3;
    -[AVTRecordView scene](self, "scene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)_updateTrackingState
{
  id v3;

  if (self->_playBakedAnimation
    || -[AVTView faceTrackingIsPaused](self, "faceTrackingIsPaused")
    || self->_playing
    || self->_exportingMovie)
  {
    -[AVTView faceTracker](self, "faceTracker");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseByPausingARSession");
  }
  else
  {
    -[AVTView faceTracker](self, "faceTracker");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "run");
  }

}

- (void)setFaceTrackingPaused:(BOOL)a3
{
  objc_super v3;

  if (!self->_playing)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVTRecordView;
    -[AVTView setFaceTrackingPaused:](&v3, sel_setFaceTrackingPaused_, a3);
  }
}

- (void)updateForChangedFaceTrackingPaused
{
  _BOOL8 v3;
  void *v4;

  v3 = -[AVTView faceTrackingIsPaused](self, "faceTrackingIsPaused");
  -[AVTRecordView scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaused:", v3);

  -[AVTRecordView _updateTrackingState](self, "_updateTrackingState");
}

- (BOOL)faceIsFullyActive
{
  void *v2;
  char v3;

  -[AVTView environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceIsFullyVisible");

  return v3;
}

- (void)trimRecordedData
{
  double *v3;
  char *v4;
  char *v5;
  char *v6;
  double Seconds;
  double v8;
  uint64_t recordedCount;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  CMTime time;

  v3 = -[NSMutableData mutableBytes](self->_rawTimesData, "mutableBytes");
  v4 = -[NSMutableData mutableBytes](self->_rawBlendShapesData, "mutableBytes");
  v5 = -[NSMutableData mutableBytes](self->_rawTransformsData, "mutableBytes");
  v6 = -[NSMutableData mutableBytes](self->_rawParametersData, "mutableBytes");
  time = (CMTime)self->_startAudioTime;
  Seconds = CMTimeGetSeconds(&time);
  time = (CMTime)self->_stopAudioTime;
  v8 = CMTimeGetSeconds(&time);
  recordedCount = self->_recordedCount;
  if ((int)recordedCount < 1)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    v10 = 0;
    while (v3[v10] <= Seconds)
    {
      if (recordedCount == ++v10)
      {
        LODWORD(v10) = self->_recordedCount;
        goto LABEL_12;
      }
    }
  }
  if ((int)v10 >= (int)recordedCount)
  {
LABEL_12:
    v11 = v10;
    LODWORD(recordedCount) = v10;
  }
  else
  {
    v11 = v10;
    v12 = v10;
    while (v3[v12] <= v8)
    {
      if ((int)recordedCount <= (int)++v12)
        goto LABEL_14;
    }
    LODWORD(recordedCount) = v12;
  }
LABEL_14:
  v13 = recordedCount - v10;
  self->_recordedCount = v13;
  v14 = 8 * v13;
  memmove(v3, &v3[v11], v14);
  -[NSMutableData setLength:](self->_rawTimesData, "setLength:", v14);
  v15 = 204 * self->_recordedCount;
  memmove(v4, &v4[4 * (51 * v10)], v15);
  -[NSMutableData setLength:](self->_rawBlendShapesData, "setLength:", v15);
  v16 = (uint64_t)self->_recordedCount << 6;
  memmove(v5, &v5[64 * v11], v16);
  -[NSMutableData setLength:](self->_rawTransformsData, "setLength:", v16);
  v17 = 4 * self->_recordedCount;
  memmove(v6, &v6[4 * v11], v17);
  -[NSMutableData setLength:](self->_rawParametersData, "setLength:", v17);
}

- (double)recordingDuration
{
  double *v3;
  int recordedCount;

  v3 = -[NSMutableData mutableBytes](self->_rawTimesData, "mutableBytes");
  recordedCount = self->_recordedCount;
  if (recordedCount <= 1)
    recordedCount = 1;
  return v3[recordedCount - 1] - *v3;
}

- (double)finalVideoDuration
{
  double v2;
  double v3;
  unint64_t v4;
  NSObject *v5;
  float v6;
  int v8;
  double v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AVTRecordView recordingDuration](self, "recordingDuration");
  v3 = v2 + 0.25;
  *(float *)&v2 = (v2 + 0.25) * 60.0;
  v4 = vcvtps_u32_f32(*(float *)&v2);
  avt_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v3;
    v8 = 134218752;
    v9 = (float)((float)v4 / 60.0);
    v10 = 1024;
    v11 = v4;
    v12 = 1024;
    v13 = 60;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_1DD1FA000, v5, OS_LOG_TYPE_DEFAULT, "[Record view] Final video duration: %.3fs (for %d frames at %dfps ; exact duration: %.3fs)",
      (uint8_t *)&v8,
      0x22u);
  }

  return (float)((float)v4 / 60.0);
}

- (void)convertRecordedDataToAnimationGroup
{
  double *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  __int128 *v30;
  __int128 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  float32x4_t *v37;
  float32x4_t v38;
  float32x4_t v39;
  int32x4_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x4_t v43;
  int32x4_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x4_t v47;
  int32x4_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x4_t v51;
  float v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v57;
  float32x4_t v58;
  int32x4_t v59;
  float32_t v60;
  float32x4_t v61;
  float32x4_t v62;
  double v63;
  void *v64;
  void *v65;
  CAAnimationGroup *v66;
  CAAnimationGroup *recordedAnimationGroup;
  char *v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  uint64_t v74;
  double v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[2];
  id (*v79)(uint64_t, uint64_t, void *);
  void *v80;
  AVTRecordView *v81;
  id v82;
  id v83;
  double v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD v87[7];

  v3 = -[NSMutableData mutableBytes](self->_rawTimesData, "mutableBytes");
  v4 = -[NSMutableData mutableBytes](self->_rawBlendShapesData, "mutableBytes");
  v5 = -[NSMutableData mutableBytes](self->_rawTransformsData, "mutableBytes");
  v6 = -[NSMutableData mutableBytes](self->_rawParametersData, "mutableBytes");
  if (self->_recordedCount)
  {
    v7 = v6;
    -[AVTRecordView recordingDuration](self, "recordingDuration");
    if (v8 > 0.0)
    {
      v9 = v8;
      v72 = v4;
      v68 = v5;
      v10 = self->_recordedCount + 1;
      v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_recordedCount > 1)
      {
        v13 = 0;
        do
        {
          objc_msgSend(v11, "addObject:", v12);
          ++v13;
        }
        while (v13 < self->_recordedCount - 1);
      }
      v14 = v9 + 0.25;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

      v74 = v10;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      if (self->_recordedCount >= 1)
      {
        v17 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v3[v17] - *v3) / v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v18);

          ++v17;
        }
        while (v17 < self->_recordedCount);
      }
      objc_msgSend(v16, "addObject:", &unk_1EA710798);
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke;
      v87[3] = &__block_descriptor_48_e37_f40__0Q8Q16__NSNumber_24__NSNumber_32l;
      v87[4] = v72;
      v87[5] = v7;
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v79 = __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2;
      v80 = &unk_1EA6200D0;
      v81 = self;
      v84 = v14;
      v73 = v11;
      v82 = v73;
      v85 = v74;
      v86 = v87;
      v70 = v16;
      v83 = v70;
      v19 = AVTBlendShapeLocationToARIndex((void *)*MEMORY[0x1E0C894D8]);
      v77 = 0u;
      -[AVTView avatar](self, "avatar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        objc_msgSend(v20, "morphInfoForARKitBlendShapeIndex:", v19);
      else
        v77 = 0u;

      if (BYTE8(v77))
      {
        v79((uint64_t)v78, v19, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v71, "addObject:", v22);
      }
      else
      {
        v22 = 0;
      }
      for (i = 0; i != 52; ++i)
      {
        if (v19 != i)
        {
          BYTE8(v76) = 0;
          -[AVTView avatar](self, "avatar");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
            objc_msgSend(v24, "morphInfoForARKitBlendShapeIndex:", i);
          else
            v76 = 0u;

          if (BYTE8(v76))
          {
            v79((uint64_t)v78, i, v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
              objc_msgSend(v71, "addObject:", v26);

          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("/root_JNT.translation"), 0.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDuration:", v14);
      v69 = *MEMORY[0x1E0CD2B58];
      objc_msgSend(v27, "setFillMode:");
      objc_msgSend(v27, "setTimingFunctions:", v73);
      objc_msgSend(v27, "setUsesSceneTimeBase:", 1);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v74);
      if (self->_recordedCount)
      {
        v29 = 0;
        v30 = (__int128 *)(v68 + 48);
        do
        {
          v31 = *v30;
          v30 += 4;
          objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *(double *)&v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v32);

          ++v29;
        }
        while (v29 < self->_recordedCount);
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *((double *)v68 + 6));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v33);

      objc_msgSend(v27, "setKeyTimes:", v70);
      objc_msgSend(v27, "setValues:", v28);
      objc_msgSend(v71, "addObject:", v27);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("/head_JNT.orientation"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "setDuration:", v14);
      objc_msgSend(v34, "setFillMode:", v69);
      objc_msgSend(v34, "setTimingFunctions:", v73);
      objc_msgSend(v34, "setUsesSceneTimeBase:", 1);
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v74);

      if (self->_recordedCount)
      {
        v36 = 0;
        v37 = (float32x4_t *)(v68 + 32);
        do
        {
          v38 = v37[-2];
          v39 = v37[-1];
          v40 = (int32x4_t)vmulq_f32(v38, v38);
          v40.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1))).u32[0];
          v41 = vrsqrte_f32((float32x2_t)v40.u32[0]);
          v42 = vmul_f32(v41, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v41, v41)));
          v43 = vmulq_n_f32(v38, vmul_f32(v42, vrsqrts_f32((float32x2_t)v40.u32[0], vmul_f32(v42, v42))).f32[0]);
          v44 = (int32x4_t)vmulq_f32(v39, v39);
          v44.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1))).u32[0];
          v45 = vrsqrte_f32((float32x2_t)v44.u32[0]);
          v46 = vmul_f32(v45, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(v45, v45)));
          v47 = vmulq_n_f32(v39, vmul_f32(v46, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(v46, v46))).f32[0]);
          v48 = (int32x4_t)vmulq_f32(*v37, *v37);
          v48.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v48, 2), vadd_f32(*(float32x2_t *)v48.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v48.i8, 1))).u32[0];
          v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
          v50 = vmul_f32(v49, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)));
          v51 = vmulq_n_f32(*v37, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
          v52 = (float)(v43.f32[0] + v47.f32[1]) + v51.f32[2];
          if (v52 <= 0.0)
          {
            if (v43.f32[0] <= v47.f32[1] || v43.f32[0] <= v51.f32[2])
            {
              if (v47.f32[1] <= v51.f32[2])
              {
                v62.i64[0] = v51.i64[0];
                v62.f32[2] = (float)(v51.f32[2] + 1.0) - v43.f32[0];
                v62.i32[3] = v43.i32[1];
                v55 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v47, (int32x4_t)v43), (int8x16_t)v47, 8uLL));
                v54.i64[0] = vaddq_f32(v51, v55).u64[0];
                v54.i64[1] = vsubq_f32(v62, v55).i64[1];
                v55.i32[0] = v54.i32[2];
              }
              else
              {
                v57 = v47;
                v57.f32[1] = (float)(v47.f32[1] + 1.0) - v43.f32[0];
                v57.i32[3] = v51.i32[0];
                v58 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v43, (int32x4_t)v51), vtrn1q_s32((int32x4_t)v51, (int32x4_t)v43));
                v59 = (int32x4_t)vaddq_f32(v47, v58);
                v55 = vsubq_f32(v57, v58);
                v54 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v59), (int32x4_t)v55);
                v55.i32[0] = v55.i32[1];
              }
            }
            else
            {
              v60 = (float)(v43.f32[0] + 1.0) - v47.f32[1];
              v61 = (float32x4_t)vextq_s8((int8x16_t)v47, (int8x16_t)vtrn1q_s32((int32x4_t)v47, (int32x4_t)v51), 0xCuLL);
              v54 = vaddq_f32(v61, v43);
              v61.f32[0] = v60;
              v43.i32[0] = v51.i32[2];
              v43.i32[3] = v51.i32[1];
              v55 = vsubq_f32(v61, v43);
              v54.i32[0] = v55.i32[0];
              v54.i32[3] = v55.i32[3];
            }
          }
          else
          {
            v53 = (float32x4_t)vzip2q_s32((int32x4_t)v47, vuzp1q_s32((int32x4_t)v47, (int32x4_t)v51));
            v53.i32[2] = v43.i32[1];
            v55 = (float32x4_t)vtrn2q_s32((int32x4_t)v51, vzip2q_s32((int32x4_t)v51, (int32x4_t)v43));
            v55.i32[2] = v47.i32[0];
            v54 = vsubq_f32(v53, v55);
            v55.i32[3] = 1.0;
            v53.f32[3] = v52;
            v54.i32[3] = vaddq_f32(v53, v55).i32[3];
            v55.i32[0] = v54.i32[3];
          }
          *(_QWORD *)&v75 = vmulq_n_f32(v54, 0.5 / sqrtf(v55.f32[0])).u64[0];
          if (-[AVTView arMode](self, "arMode"))
            v63 = v75;
          else
            +[AVTAvatar applyGazeCorrectionWithInputAngle:translation:](AVTAvatar, "applyGazeCorrectionWithInputAngle:translation:", v75, *(double *)v37[1].i64);
          objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v64);

          ++v36;
          v37 += 4;
        }
        while (v36 < self->_recordedCount);
      }
      objc_msgSend(v35, "objectAtIndex:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v65);

      objc_msgSend(v34, "setKeyTimes:", v70);
      objc_msgSend(v34, "setValues:", v35);
      objc_msgSend(v71, "addObject:", v34);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v66 = (CAAnimationGroup *)objc_claimAutoreleasedReturnValue();
      -[CAAnimationGroup setAnimations:](v66, "setAnimations:", v71);
      -[CAAnimationGroup setDuration:](v66, "setDuration:", v14);
      -[CAAnimationGroup setUsesSceneTimeBase:](v66, "setUsesSceneTimeBase:", 1);
      -[CAAnimationGroup setFillMode:](v66, "setFillMode:", v69);
      recordedAnimationGroup = self->_recordedAnimationGroup;
      self->_recordedAnimationGroup = v66;

    }
  }
}

float __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  float *v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;

  v9 = a4;
  v10 = a5;
  if (a2 > 0x32)
    v11 = (float *)(*(_QWORD *)(a1 + 40) + 4 * (a2 + a3) - 204);
  else
    v11 = (float *)(*(_QWORD *)(a1 + 32) + 4 * (a2 + 51 * a3));
  v12 = *v11;
  AVTBlendShapeLocationFromARIndex(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = AVTMorphWeightApplyBlinkCorrection(v13, v12);
  AVTBlendShapeLocationFromARIndex(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v15 == (void *)*MEMORY[0x1E0C894D8])
  {
    objc_msgSend(v9, "floatValue");
    v14 = v16 + (float)((float)(v14 - v16) * 0.3);
  }
  if (v10)
  {
    objc_msgSend(v10, "floatValue");
    v18 = v17;
  }
  else
  {
    v18 = -1.0;
  }
  v19 = AVTMorphWeightApplyCorrectionForTongue(v13, v14, v18);

  return v19;
}

id __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  double v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;

  v5 = a3;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "morphInfoForARKitBlendShapeIndex:", a2);
  else
    v33 = 0u;

  AVTBlendShapeLocationFromARIndex(a2);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)&v33 + 1), "name");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_1();
  v10 = (void *)MEMORY[0x1E0CD2798];
  v31 = (void *)v9;
  v32 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@.morpher.weights[\"%@\"]"), v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animationWithKeyPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDuration:", *(double *)(a1 + 56));
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v12, "setTimingFunctions:", *(_QWORD *)(a1 + 40));
  v30 = v12;
  objc_msgSend(v12, "setUsesSceneTimeBase:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 64));
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 872))
  {
    v14 = 0;
    do
    {
      v15 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v13, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "values");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (*(float (**)(uint64_t, uint64_t, unint64_t, void *, void *))(v15 + 16))(v15, a2, v14, v16, v18);

      if (v19 == -1.0)
        __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_2();
      *(float *)&v20 = v19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v21);

      ++v14;
    }
    while (v14 < *(int *)(*(_QWORD *)(a1 + 32) + 872));
  }
  v22 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v13, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "values");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(a1 + 32) + 872));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (*(float (**)(uint64_t, uint64_t, _QWORD, void *, void *))(v22 + 16))(v22, a2, 0, v23, v25);

  *(float *)&v27 = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v28);

  objc_msgSend(v30, "setKeyTimes:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v30, "setValues:", v13);

  return v30;
}

- (float)maxRecordingDuration
{
  return self->_maxRecordingDuration;
}

- (void)setMaxRecordingDuration:(float)a3
{
  self->_maxRecordingDuration = a3;
}

- (id)_tmpAudioURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("avtpuppet-audio.mp4"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_tmpVideoURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("avtpuppet-video.mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_tmpMaskVideoURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("avtpuppet-video-alpha.mov"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)mergeAudio:(id)a3 andVideoTo:(id)a4 error:(id *)a5
{
  void *v7;
  NSObject *v8;
  const char *v9;
  char v10;
  CMTimeEpoch v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  dispatch_semaphore_t v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  dispatch_time_t v46;
  void *v47;
  BOOL v48;
  NSObject *v49;
  void *v50;
  __int128 v52;
  __int128 v53;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  NSObject *v62;
  CMTimeRange *p_start;
  __int128 v64;
  CMTimeEpoch v65;
  CMTimeRange v66;
  CMTime v67;
  CMTime duration;
  CMTimeRange v69;
  _QWORD v70[2];
  uint64_t v71;
  id v72;
  CMTimeRange start;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v58 = a4;
  objc_msgSend(MEMORY[0x1E0C8B268], "composition");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRecordView _tmpVideoURL](self, "_tmpVideoURL");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v57, 0);
  if (v7)
    goto LABEL_5;
  avt_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AVTRecordView mergeAudio:andVideoTo:error:].cold.4(v8, v9);

  sleep(1u);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v57, 0);
  if (v7)
  {
LABEL_5:
    memset(&v69, 0, sizeof(v69));
    objc_msgSend(v7, "duration");
    v10 = 0;
  }
  else
  {
    avt_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AVTRecordView mergeAudio:andVideoTo:error:].cold.3(v16, v17, v18, v19, v20, v21, v22, v23);

    v7 = 0;
    memset(&v69, 0, sizeof(v69));
    memset(&duration, 0, sizeof(duration));
    v10 = 1;
  }
  v52 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  start.start.epoch = v11;
  CMTimeRangeMake(&v69, &start.start, &duration);
  if (!self->_mute)
  {
    memset(&start, 0, sizeof(start));
    if ((v10 & 1) != 0)
      memset(&v67, 0, sizeof(v67));
    else
      objc_msgSend(v7, "duration");
    *(_OWORD *)&v66.start.value = v52;
    v66.start.epoch = v11;
    CMTimeRangeMake(&start, &v66.start, &v67);
    v12 = *MEMORY[0x1E0C8A7A0];
    objc_msgSend(v59, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A7A0], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "tracksWithMediaType:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v66 = start;
      v64 = v52;
      v65 = v11;
      objc_msgSend(v13, "insertTimeRange:ofTrack:atTime:error:", &v66, v15, &v64, 0);
    }
    else
    {
      avt_default_log();
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        -[AVTRecordView mergeAudio:andVideoTo:error:].cold.2(v56, v24);

    }
  }
  v25 = *MEMORY[0x1E0C8A808];
  objc_msgSend(v59, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0, v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tracksWithMediaType:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    start = v69;
    *(_OWORD *)&v66.start.value = v53;
    v66.start.epoch = v11;
    objc_msgSend(v55, "insertTimeRange:ofTrack:atTime:error:", &start, v27, &v66, 0);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "fileExistsAtPath:", v29);

    if ((v30 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeItemAtPath:error:", v32, 0);

    }
    v33 = objc_alloc(MEMORY[0x1E0C8AFC0]);
    v34 = (void *)objc_msgSend(v33, "initWithAsset:presetName:", v59, *MEMORY[0x1E0C89E98]);
    objc_msgSend(v34, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    objc_msgSend(v34, "setOutputURL:", v58);
    objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0C8A9F0];
    objc_msgSend(v35, "setKeySpace:", *MEMORY[0x1E0C8A9F0]);
    objc_msgSend(v35, "setKey:", CFSTR("LOOP"));
    LODWORD(v66.start.value) = 0;
    v37 = *MEMORY[0x1E0CA2440];
    objc_msgSend(v35, "setDataType:", *MEMORY[0x1E0CA2440]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v66, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setValue:", v38);

    objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setKeySpace:", v36);
    objc_msgSend(v39, "setKey:", CFSTR("GREY"));
    objc_msgSend(v39, "setDataType:", v37);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v66, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setValue:", v40);

    v70[0] = v35;
    v70[1] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMetadata:", v41);

    v42 = dispatch_semaphore_create(0);
    avt_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(start.start.value) = 138412290;
      *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v34;
      _os_log_impl(&dword_1DD1FA000, v43, OS_LOG_TYPE_DEFAULT, "[Record view] Video export will start with session %@", (uint8_t *)&start, 0xCu);
    }

    start.start.value = 0;
    *(_QWORD *)&start.start.timescale = &start;
    start.start.epoch = 0x3032000000;
    start.duration.value = (CMTimeValue)__Block_byref_object_copy__7;
    *(_QWORD *)&start.duration.timescale = __Block_byref_object_dispose__7;
    start.duration.epoch = 0;
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke;
    v60[3] = &unk_1EA6200F8;
    v44 = v34;
    v61 = v44;
    p_start = &start;
    v45 = v42;
    v62 = v45;
    objc_msgSend(v44, "exportAsynchronouslyWithCompletionHandler:", v60);
    v46 = dispatch_time(0, 20000000000);
    dispatch_semaphore_wait(v45, v46);
    v47 = *(void **)(*(_QWORD *)&start.start.timescale + 40);
    v48 = v47 == 0;
    if (a5 && v47)
      *a5 = objc_retainAutorelease(v47);

    _Block_object_dispose(&start, 8);
  }
  else
  {
    avt_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      -[AVTRecordView mergeAudio:andVideoTo:error:].cold.1((uint64_t)v7, v56);

    if (!a5)
    {
      v48 = 0;
      goto LABEL_33;
    }
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get video track"));
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v72 = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 1, v35);
    v48 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_33:
  return v48;
}

intptr_t __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v9[16];

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 3
    && (objc_msgSend(*v2, "error"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Record view] Video export did complete", v9, 2u);
    }
  }
  else
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke_cold_1(v2);
  }

  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)fadePuppetToWhite:(float)a3
{
  double v4;
  id v5;

  -[AVTView environment](self, "environment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFadeFactor:", v4);

}

- (BOOL)exportMovieToURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  double v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 exportingMovie;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  __int128 v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  float v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  __int128 v70;
  void *v71;
  _QWORD v72[4];
  __int128 v73;
  AVTRecordView *v74;
  NSObject *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  float v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  _QWORD v91[3];
  _QWORD v92[3];
  uint8_t buf[4];
  double v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v8 = COERCE_DOUBLE(a3);
  v9 = a4;
  v10 = a5;
  -[AVTRecordView stopRecording](self, "stopRecording");
  -[AVTRecordView scene](self, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    exportingMovie = self->_exportingMovie;
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (exportingMovie)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AVTRecordView exportMovieToURL:options:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
      v22 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v8;
        _os_log_impl(&dword_1DD1FA000, v14, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: exporting movie to %@", buf, 0xCu);
      }

      self->_exportingMovie = 1;
      objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      -[NSObject becomeCurrentWithPendingUnitCount:](v14, "becomeCurrentWithPendingUnitCount:", 1);
      -[AVTRecordView _updateTrackingState](self, "_updateTrackingState");
      LODWORD(v24) = 0;
      -[AVTRecordView fadePuppetToWhite:](self, "fadePuppetToWhite:", v24);
      -[AVTRecordView pointOfView](self, "pointOfView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "camera");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "simdPosition");
      v70 = v27;
      objc_msgSend(v26, "zFar");
      v29 = v28;
      -[AVTView lockAvatar](self, "lockAvatar");
      objc_msgSend(MEMORY[0x1E0CD5A38], "lock");
      -[AVTView avatar](self, "avatar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "copy");

      v32 = v31;
      objc_msgSend(v31, "update");
      -[AVTRecordView addRecordedAnimationToAvatar:](self, "addRecordedAnimationToAvatar:", v31);
      -[CAAnimationGroup duration](self->_recordedAnimationGroup, "duration");
      v34 = v33;
      objc_msgSend(MEMORY[0x1E0CD5A38], "unlock");
      -[AVTView unlockAvatar](self, "unlockAvatar");
      v22 = v34 > 0.0166666667;
      if (v34 > 0.0166666667)
      {
        v69 = v32;
        avt_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = v34;
          *(_DWORD *)buf = 134217984;
          v94 = v36;
          _os_log_impl(&dword_1DD1FA000, v35, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: scene duration %.3fs", buf, 0xCu);
        }

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("size"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v26;
        v66 = v37;
        v67 = v10;
        if (v37)
        {
          objc_msgSend(v37, "CGSizeValue");
          v39 = v38;
          v41 = v40;
        }
        else
        {
          v39 = 0x4074000000000000;
          v41 = 0x4074000000000000;
        }
        v42 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("codec"));
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = (_QWORD *)MEMORY[0x1E0C8AE68];
        if (v43)
        {
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, *MEMORY[0x1E0C8AE68]);
          objc_msgSend(v42, "removeObjectForKey:", CFSTR("codec"));
        }
        v65 = (void *)v43;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTMovieTransparentBackground"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v45, "BOOLValue");

        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTMovieTransparentBackground"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
          objc_msgSend(v42, "removeObjectForKey:", CFSTR("AVTMovieTransparentBackground"));
        if (v68)
          objc_msgSend(v42, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C8AE80], *v44);
        v47 = v29;
        v48 = *MEMORY[0x1E0C8AE98];
        v49 = *MEMORY[0x1E0C8AF40];
        v91[0] = *MEMORY[0x1E0C8AE90];
        v91[1] = v49;
        v50 = *MEMORY[0x1E0C8AF50];
        v92[0] = v48;
        v92[1] = v50;
        v91[2] = *MEMORY[0x1E0C8AF68];
        v92[2] = *MEMORY[0x1E0C8AF70];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0C8AEA8]);

        objc_msgSend(v42, "removeObjectForKey:", CFSTR("AVTMovieGenerateAlphaMask-NoLongerImplemented"));
        objc_msgSend(v42, "removeObjectForKey:", CFSTR("size"));
        v89 = *MEMORY[0x1E0C8AEC8];
        v90 = &unk_1EA655A20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v52, *MEMORY[0x1E0C8AEB8]);

        v87 = CFSTR("AVTRendererOptionInitiallyConfigureForARMode");
        v88 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        +[SCNRenderer rendererWithDevice:options:](AVTRenderer, "rendererWithDevice:options:", 0, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v54, "set_superSamplingFactor:", 2.0);
        v64 = v42;
        if ((v68 & 1) != 0)
          objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        else
          objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setBackgroundColor:", v55);

        objc_msgSend(v54, "setAvatar:", v69);
        objc_msgSend(v54, "scene");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setStartTime:", 0.0);
        objc_msgSend(v56, "setEndTime:", v34);
        objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
        objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.5);
        objc_msgSend(v25, "setSimdPosition:", *(double *)&v70);
        objc_msgSend(v71, "zFar");
        objc_msgSend(v71, "setZFar:", v57 + 20.0);
        v58 = (void *)MEMORY[0x1E0CD5A38];
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke;
        v72[3] = &unk_1EA620120;
        v74 = self;
        v75 = v14;
        v76 = v54;
        v84 = v39;
        v85 = v41;
        v77 = v42;
        v78 = v56;
        v79 = *(id *)&v8;
        v80 = v69;
        v83 = v67;
        v81 = v25;
        v73 = v70;
        v82 = v71;
        v86 = v47;
        v59 = v56;
        v10 = v67;
        v60 = v64;
        v61 = v54;
        v62 = v58;
        v26 = v71;
        objc_msgSend(v62, "setCompletionBlock:", v72);
        objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

        v32 = v69;
      }

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double Current;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  double v13;
  NSObject *v14;
  double v15;
  float v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  char v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  double v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  double v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "setRendersContinuously:", 0);
  objc_msgSend(*(id *)(a1 + 48), "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPaused:", 1);

  objc_msgSend(*(id *)(a1 + 56), "resignCurrent");
  objc_msgSend(*(id *)(a1 + 56), "becomeCurrentWithPendingUnitCount:", 99);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 48), "_tmpVideoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v5, 0);

  }
  v9 = *(void **)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v55 = 0;
  v11 = objc_msgSend(v9, "renderMovieToURL:size:antialiasingMode:attributes:error:", v4, 0, v10, &v55, *(double *)(a1 + 128), *(double *)(a1 + 136));
  v12 = v55;
  if (v11)
  {
    v13 = CFAbsoluteTimeGetCurrent();
    avt_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v13 - Current;
      v16 = v15;
      v17 = v16;
      objc_msgSend(*(id *)(a1 + 80), "endTime");
      v19 = v18;
      objc_msgSend(*(id *)(a1 + 80), "endTime");
      *(float *)&v20 = v20 * 60.0 / v15;
      *(_DWORD *)buf = 134218496;
      v57 = v17;
      v58 = 2048;
      v59 = v19;
      v60 = 2048;
      v61 = *(float *)&v20;
      _os_log_impl(&dword_1DD1FA000, v14, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: movie rendered in %.3fs for a length of %.3fs (%.3f frames rendered per second)", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "_tmpAudioURL");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v21, 0);
    v23 = *(void **)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 88);
    v54 = v12;
    v25 = objc_msgSend(v23, "mergeAudio:andVideoTo:error:", v22, v24, &v54);
    v26 = v54;

    if ((v25 & 1) != 0)
    {
      v12 = v26;
    }
    else
    {
      avt_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_2((uint64_t)v26, v33, v34, v35, v36, v37, v38, v39);

      sleep(1u);
      v40 = *(void **)(a1 + 48);
      v41 = *(_QWORD *)(a1 + 88);
      v53 = v26;
      v42 = objc_msgSend(v40, "mergeAudio:andVideoTo:error:", v22, v41, &v53);
      v12 = v53;

      avt_default_log();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if ((v42 & 1) != 0)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD1FA000, v44, OS_LOG_TYPE_DEFAULT, "[Record view] Video export: audio merge succeeded after 2nd try", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_1((uint64_t)v12, v44, v45, v46, v47, v48, v49, v50);
      }

    }
  }
  else
  {
    avt_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_3((uint64_t)v12, v21, v27, v28, v29, v30, v31, v32);
  }

  objc_msgSend(*(id *)(a1 + 56), "resignCurrent");
  objc_msgSend(*(id *)(a1 + 96), "willRemoveFromScene:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "scene");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setPaused:", 0);

  v52 = *(_QWORD *)(a1 + 120);
  if (v52)
    (*(void (**)(uint64_t, id))(v52 + 16))(v52, v12);
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 816) = 0;
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.75);
  objc_msgSend(*(id *)(a1 + 104), "setSimdPosition:", *(double *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 112), "setZFar:", *(float *)(a1 + 144));
  objc_msgSend(*(id *)(a1 + 48), "_updateTrackingState");
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

}

- (void)startRecordingAudio
{
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, a1, a3, "Error: [Record view] Audio: can't add audio asset writer input to asset writer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (opaqueCMSampleBuffer)createSilentAudioAtFrame:(int64_t)a3 nFrames:(int)a4 sampleRate:(double)a5 numChannels:(int)a6
{
  UInt32 v10;
  const __CFAllocator *v11;
  size_t v12;
  NSObject *v13;
  OpaqueCMBlockBuffer *v15;
  const opaqueCMFormatDescription *v16;
  OSStatus v17;
  NSObject *v18;
  CMTime presentationTimeStamp;
  CMSampleBufferRef sampleBufferOut;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  AudioStreamBasicDescription asbd;
  CMBlockBufferRef destinationBuffer;

  v10 = 2 * a6;
  destinationBuffer = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = 2 * a6 * a4;
  if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v12, 0, 0, 0, v12, 1u, &destinationBuffer))
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:].cold.4();
LABEL_10:

    return 0;
  }
  if (CMBlockBufferFillDataBytes(0, destinationBuffer, 0, v12))
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:].cold.3();
    goto LABEL_10;
  }
  asbd.mSampleRate = a5;
  *(_QWORD *)&asbd.mFormatID = 0x46C70636DLL;
  asbd.mBytesPerPacket = v10;
  asbd.mFramesPerPacket = 1;
  asbd.mBytesPerFrame = v10;
  asbd.mChannelsPerFrame = a6;
  *(_QWORD *)&asbd.mBitsPerChannel = 16;
  formatDescriptionOut = 0;
  if (CMAudioFormatDescriptionCreate(v11, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:].cold.2();
    goto LABEL_10;
  }
  sampleBufferOut = 0;
  v15 = destinationBuffer;
  v16 = formatDescriptionOut;
  CMTimeMake(&presentationTimeStamp, a3, 1);
  v17 = CMAudioSampleBufferCreateReadyWithPacketDescriptions(v11, v15, v16, a4, &presentationTimeStamp, 0, &sampleBufferOut);
  CFRelease(destinationBuffer);
  if (v17)
  {
    avt_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:].cold.1();

    return 0;
  }
  return sampleBufferOut;
}

- (void)stopRecordingAudio
{
  int64_t epoch;

  if (self->_audioWriter)
  {
    -[NSLock lock](self->_audioLock, "lock");
    epoch = self->_currentAudioTime.epoch;
    *(_OWORD *)&self->_stopAudioTime.value = *(_OWORD *)&self->_currentAudioTime.value;
    self->_stopAudioTime.epoch = epoch;
    -[NSLock unlock](self->_audioLock, "unlock");
  }
}

- (void)finalizeAudioFile
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  float v8;
  int64_t recordedSampleCount;
  float v10;
  opaqueCMSampleBuffer *v11;
  opaqueCMSampleBuffer *v12;
  AVAssetWriterInput *audioWriterInput;
  AVAssetWriter *audioWriter;
  AVAssetWriter *v15;
  AVCaptureMovieFileOutput *movieFileOutput;
  _QWORD v17[5];
  uint8_t buf[4];
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_audioLock, "lock");
  -[AVTRecordView finalVideoDuration](self, "finalVideoDuration");
  v3 = (double)self->_recordedSampleCount / 44100.0;
  v5 = v4 - v3;
  if (v5 <= 0.0)
    v6 = 0.0166666667;
  else
    v6 = v5 + 0.0166666667;
  avt_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v3 + v6;
    recordedSampleCount = self->_recordedSampleCount;
    *(_DWORD *)buf = 134219008;
    v10 = v3;
    v19 = v8;
    v20 = 2048;
    v21 = v10;
    v22 = 1024;
    v23 = recordedSampleCount;
    v24 = 1024;
    v25 = 44100;
    v26 = 1024;
    v27 = (int)(v6 * 44100.0);
    _os_log_impl(&dword_1DD1FA000, v7, OS_LOG_TYPE_DEFAULT, "[Record view] Final audio duration: %.3fs (exact duration: %.3fs for %d samples at %dHz ; %d generated silent samples)",
      buf,
      0x28u);
  }

  if (v6 > 0.0 && self->_audioIsRecording)
  {
    v11 = -[AVTRecordView createSilentAudioAtFrame:nFrames:sampleRate:numChannels:](self, "createSilentAudioAtFrame:nFrames:sampleRate:numChannels:", self->_recordedSampleCount, (int)(v6 * 44100.0), 1, 44100.0);
    if (v11)
    {
      v12 = v11;
      -[AVAssetWriterInput appendSampleBuffer:](self->_audioWriterInput, "appendSampleBuffer:", v11);
      CFRelease(v12);
    }
  }
  audioWriterInput = self->_audioWriterInput;
  self->_audioWriterInput = 0;

  audioWriter = self->_audioWriter;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__AVTRecordView_finalizeAudioFile__block_invoke;
  v17[3] = &unk_1EA61DBF8;
  v17[4] = self;
  -[AVAssetWriter finishWritingWithCompletionHandler:](audioWriter, "finishWritingWithCompletionHandler:", v17);
  -[NSLock lock](self->_audioLock, "lock");
  -[NSLock unlock](self->_audioLock, "unlock");
  v15 = self->_audioWriter;
  self->_audioWriter = 0;

  -[AVCaptureMovieFileOutput stopRecording](self->_movieFileOutput, "stopRecording");
  movieFileOutput = self->_movieFileOutput;
  self->_movieFileOutput = 0;

}

void __34__AVTRecordView_finalizeAudioFile__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 912);
  if (objc_msgSend(v2, "status") == 2
    && (objc_msgSend(v2, "error"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Record view] Audio writing did finish", (uint8_t *)v7, 2u);
    }
  }
  else
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "status");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = 67109378;
      v7[1] = v5;
      v8 = 2112;
      v9 = v6;
      _os_log_impl(&dword_1DD1FA000, v4, OS_LOG_TYPE_DEFAULT, "[Record view] Audio writing did finish with status:%d, error:%@", (uint8_t *)v7, 0x12u);

    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "unlock");
}

- (void)cancelRecordingAudio
{
  AVCaptureMovieFileOutput *movieFileOutput;

  -[AVCaptureMovieFileOutput stopRecording](self->_movieFileOutput, "stopRecording");
  movieFileOutput = self->_movieFileOutput;
  self->_movieFileOutput = 0;

}

- (void)updateAudioState
{
  if (self->_playing)
    -[AVTRecordView startPlayingAudio](self, "startPlayingAudio");
}

- (void)setMute:(BOOL)a3
{
  if (self->_mute != a3)
  {
    self->_mute = a3;
    -[AVTRecordView updateMuteState](self, "updateMuteState");
  }
}

- (void)audioPlayerItemDidReachEnd:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[AVTRecordView recordDelegate](self, "recordDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AVTRecordView recordDelegate](self, "recordDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordView:previewDidChangeStatus:", self, 2);

  }
}

- (void)startPlayingAudio
{
  void *v3;
  AVPlayer *v4;
  AVPlayer *audioPlayer;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_audioPlayer)
  {
    -[AVTRecordView _tmpAudioURL](self, "_tmpAudioURL");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", v10);
    objc_msgSend(MEMORY[0x1E0C8B2E8], "playerWithPlayerItem:", v3);
    v4 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
    audioPlayer = self->_audioPlayer;
    self->_audioPlayer = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C8AC48];
    -[AVPlayer currentItem](self->_audioPlayer, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_audioPlayerItemDidReachEnd_, v7, v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_audioSessionDidInterrupt_, *MEMORY[0x1E0C896F0], 0);

    -[AVTRecordView updateMuteState](self, "updateMuteState");
    -[AVPlayer play](self->_audioPlayer, "play");

  }
}

- (void)audioSessionDidInterrupt:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (self->_playing)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89718]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedLongValue");
    if (v6)
    {
      if (v6 != 1)
        goto LABEL_13;
      avt_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD1FA000, v7, OS_LOG_TYPE_DEFAULT, "[Record view] Audio session was interrupted", buf, 2u);
      }

      -[AVTRecordView recordDelegate](self, "recordDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0)
        goto LABEL_13;
      -[AVTRecordView recordDelegate](self, "recordDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordView:audioSessionWasInterrupted:", self, v11);
    }
    else
    {
      avt_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1DD1FA000, v12, OS_LOG_TYPE_DEFAULT, "[Record view] Audio session interruption ended", v15, 2u);
      }

      -[AVPlayer play](self->_audioPlayer, "play");
      -[AVTRecordView recordDelegate](self, "recordDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
        goto LABEL_13;
      -[AVTRecordView recordDelegate](self, "recordDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordView:audioSessionInterruptionEnded:", self, v11);
    }

LABEL_13:
  }
}

- (void)updateMuteState
{
  double v2;

  LODWORD(v2) = 0;
  if (!self->_mute)
    *(float *)&v2 = 1.0;
  -[AVPlayer setVolume:](self->_audioPlayer, "setVolume:", v2);
}

- (void)stopPlayingAudio
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  AVPlayer *audioPlayer;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C8AC48];
  -[AVPlayer currentItem](self->_audioPlayer, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0C896F0], 0);

  -[AVPlayer pause](self->_audioPlayer, "pause");
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

}

- (BOOL)isDoubleBuffered
{
  return self->_doubleBuffer;
}

- (double)currentAudioTime
{
  AVPlayer *audioPlayer;
  CMTime time;

  audioPlayer = self->_audioPlayer;
  if (audioPlayer)
    -[AVPlayer currentTime](audioPlayer, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- (void)_drawAtTime:(double)a3
{
  CALayer *v5;
  objc_super v6;

  if (-[AVTRecordView renderingAPI](self, "renderingAPI") || !self->_checkDrawableAvailable)
    goto LABEL_2;
  v5 = self->_backingLayer;
  if ((-[CALayer isDrawableAvailable](v5, "isDrawableAvailable") & 1) != 0)
  {

LABEL_2:
    v6.receiver = self;
    v6.super_class = (Class)AVTRecordView;
    -[AVTView _drawAtTime:](&v6, sel__drawAtTime_, a3);
    return;
  }
  if (self->_doubleBuffer)
    -[AVTRecordView drawableNotAvailableForTime:](self, "drawableNotAvailableForTime:", a3);

}

- (void)drawableNotAvailableForTime:(double)a3
{
  NSMutableArray *droppedDoubleBufferFrames;
  void *v6;
  uint64_t v7;
  double v8;
  NSMutableArray *v9;
  NSObject *v10;
  uint8_t v11[8];
  _QWORD v12[9];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  droppedDoubleBufferFrames = self->_droppedDoubleBufferFrames;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](droppedDoubleBufferFrames, "addObject:", v6);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (-[AVTRecordView preferredFramesPerSecond](self, "preferredFramesPerSecond") < 1)
    v7 = 60;
  else
    v7 = -[AVTRecordView preferredFramesPerSecond](self, "preferredFramesPerSecond");
  v8 = 1.0 / (double)v7;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v9 = self->_droppedDoubleBufferFrames;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__AVTRecordView_drawableNotAvailableForTime___block_invoke;
  v12[3] = &unk_1EA620148;
  v12[4] = &v18;
  v12[5] = v13;
  *(double *)&v12[7] = a3 + v8 * -12.0;
  *(double *)&v12[8] = v8;
  v12[6] = &v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v12);
  -[NSMutableArray removeObjectsInRange:](self->_droppedDoubleBufferFrames, "removeObjectsInRange:", 0, v19[3]);
  if (v15[3] >= 5
    && -[CALayer isMemberOfClass:](self->_backingLayer, "isMemberOfClass:", objc_opt_class()))
  {
    avt_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD1FA000, v10, OS_LOG_TYPE_DEFAULT, "[Record view] *****drawableNotAvailableForTime: SWITCHING TO TRIPLE BUFFERING", v11, 2u);
    }

    self->_doubleBuffer = 0;
    -[CALayer setMaximumDrawableCount:](self->_backingLayer, "setMaximumDrawableCount:", 3);
  }
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __45__AVTRecordView_drawableNotAvailableForTime___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;

  result = objc_msgSend(a2, "doubleValue");
  if (v6 >= *(double *)(a1 + 56))
  {
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + *(double *)(a1 + 64) * 1.5 < v6)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

- (BOOL)mute
{
  return self->_mute;
}

- (AVTRecordViewDelegate)recordDelegate
{
  return (AVTRecordViewDelegate *)objc_loadWeakRetained((id *)&self->_recordDelegate);
}

- (void)setRecordDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recordDelegate, a3);
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingLayer, 0);
  objc_storeStrong((id *)&self->_droppedDoubleBufferFrames, 0);
  objc_storeStrong((id *)&self->_audioLock, 0);
  objc_storeStrong((id *)&self->_audioWriter, 0);
  objc_storeStrong((id *)&self->_audioWriterInput, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_movieFileOutput, 0);
  objc_storeStrong((id *)&self->_recordedAnimationGroup, 0);
  objc_storeStrong((id *)&self->_rawParametersData, 0);
  objc_storeStrong((id *)&self->_rawTransformsData, 0);
  objc_storeStrong((id *)&self->_rawBlendShapesData, 0);
  objc_storeStrong((id *)&self->_rawTimesData, 0);
  objc_destroyWeak((id *)&self->_recordDelegate);
}

void __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_1()
{
  __assert_rtn("-[AVTRecordView convertRecordedDataToAnimationGroup]_block_invoke_2", "AVTRecordView.m", 1052, "morphedNodeName != nil");
}

void __52__AVTRecordView_convertRecordedDataToAnimationGroup__block_invoke_2_cold_2()
{
  __assert_rtn("-[AVTRecordView convertRecordedDataToAnimationGroup]_block_invoke_2", "AVTRecordView.m", 1063, "weight != -1");
}

- (void)mergeAudio:(uint64_t)a1 andVideoTo:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_7_0(a2, (const char *)a2, (uint64_t)CFSTR("tracks"));
  OUTLINED_FUNCTION_5_1(&dword_1DD1FA000, v2, v3, "Error: [Record view] Video export: failed to get video track from video asset %@ (status: %d)", v4, v5, v6, v7, 2u);
}

- (void)mergeAudio:(void *)a1 andVideoTo:(char *)a2 error:.cold.2(void *a1, char *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_7_0(a1, a2, (uint64_t)CFSTR("tracks"));
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, a2, v3, "Error: [Record view] Video export: failed to get audio track (status: %d)", (uint8_t *)v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)mergeAudio:(uint64_t)a3 andVideoTo:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, a1, a3, "Error: [Record view] Video export: failed to get video asset after 1s", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)mergeAudio:(NSObject *)a1 andVideoTo:(const char *)a2 error:.cold.4(NSObject *a1, const char *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_7_0(0, a2, (uint64_t)CFSTR("tracks"));
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, a1, v3, "Error: [Record view] Video export: failed to get video asset, will try again in 1 second (status: %d)", (uint8_t *)v4);
  OUTLINED_FUNCTION_1_0();
}

void __45__AVTRecordView_mergeAudio_andVideoTo_error___block_invoke_cold_1(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*a1, "status");
  objc_msgSend(*a1, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1(&dword_1DD1FA000, v2, v3, "Error: [Record view] Video export did complete with status: %d, error: %@", v4, v5, v6, v7, 2u);

}

- (void)exportMovieToURL:(uint64_t)a3 options:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, a1, a3, "Error: [Record view] Can't export more than one movie at a time", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: [Record view] Video export: audio merge failed a second time with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: [Record view] Video export: audio merge failed with error %@, will try again in 1 second", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __60__AVTRecordView_exportMovieToURL_options_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a2, a3, "Error: [Record view] Video export: failed to rendere movie with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, v0, v1, "Error: Audio: failed to create silent audio frame, CMAudioSampleBufferCreateReadyWithPacketDescriptions returned %d", v2);
  OUTLINED_FUNCTION_3();
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, v0, v1, "Error: Audio: failed to create silent audio frame, CMAudioFormatDescriptionCreate returned %d", v2);
  OUTLINED_FUNCTION_3();
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, v0, v1, "Error: Audio: failed to create silent audio frame, CMBlockBufferFillDataBytes returned %d", v2);
  OUTLINED_FUNCTION_3();
}

- (void)createSilentAudioAtFrame:nFrames:sampleRate:numChannels:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_5(&dword_1DD1FA000, v0, v1, "Error: Audio: failed to create silent audio frame, CMBlockBufferCreateWithMemoryBlock returned %d", v2);
  OUTLINED_FUNCTION_3();
}

@end
