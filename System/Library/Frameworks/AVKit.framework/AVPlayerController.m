@implementation AVPlayerController

- (void)observationInfo
{
  return self->_observationInfo;
}

- (void)setObservationInfo:(void *)a3
{
  self->_observationInfo = a3;
}

- (CGSize)contentDimensions
{
  double v3;
  double v4;
  CGSize result;

  if (-[AVPlayerController isReadyToPlay](self, "isReadyToPlay"))
  {
    -[AVPlayerController presentationSize](self, "presentationSize");
  }
  else
  {
    v4 = NAN;
    v3 = NAN;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)presentationSize
{
  double suspendedRate;
  double width;
  CGSize result;

  suspendedRate = self->_suspendedRate;
  width = self->_presentationSize.width;
  result.height = width;
  result.width = suspendedRate;
  return result;
}

- (BOOL)isPictureInPicturePossible
{
  void *v3;
  int64_t v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  int64_t v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController pipActivitySessionIdentifier](self, "pipActivitySessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  if (!-[AVPlayerController isPictureInPictureSupported](self, "isPictureInPictureSupported")
    || -[AVPlayerController isPlayingOnExternalScreen](self, "isPlayingOnExternalScreen"))
  {
    goto LABEL_9;
  }
  v4 = -[AVPlayerController status](self, "status");
  if (v4 == 1)
    return v4;
  if (v4 == 2
    && (-[AVPlayerController hasVideo](self, "hasVideo")
     || -[AVPlayerController hasEnabledVideo](self, "hasEnabledVideo")))
  {
LABEL_2:
    LOBYTE(v4) = 1;
  }
  else
  {
LABEL_9:
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "yes";
      if (-[AVPlayerController isPictureInPictureSupported](self, "isPictureInPictureSupported"))
        v7 = "yes";
      else
        v7 = "no";
      if (-[AVPlayerController isPlayingOnExternalScreen](self, "isPlayingOnExternalScreen"))
        v8 = "yes";
      else
        v8 = "no";
      v9 = -[AVPlayerController status](self, "status");
      if (!-[AVPlayerController hasVideo](self, "hasVideo")
        && !-[AVPlayerController hasEnabledVideo](self, "hasEnabledVideo"))
      {
        v6 = "no";
      }
      -[AVPlayerController pipActivitySessionIdentifier](self, "pipActivitySessionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136316418;
      v13 = "-[AVPlayerController isPictureInPicturePossible]";
      v14 = 2080;
      v15 = v7;
      v16 = 2080;
      v17 = v8;
      v18 = 2048;
      v19 = v9;
      v20 = 2080;
      v21 = v6;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s !isPictureInPicturePossible. supported = %s, isPlayingOnExternalScreen = %s, status = %ld, hasVideo = %s; pip"
        "ActivitySessionIdentifier = %{public}@",
        (uint8_t *)&v12,
        0x3Eu);

    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSString)pipActivitySessionIdentifier
{
  return (NSString *)&self->_scrubCoordinatorSuspension->super.isa;
}

- (BOOL)isPictureInPictureSupported
{
  return BYTE5(self->_liveEdgeTimer);
}

- (BOOL)hasVideo
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasVideo");

  return v4;
}

- (BOOL)isPlayingOnSecondScreen
{
  return LOBYTE(self->_rateBeforeForceScanning);
}

- (BOOL)hasLiveStreamingContent
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v11;
  char v12;

  if (-[AVPlayerController isReadyToPlay](self, "isReadyToPlay")
    && (-[AVPlayerController hasEnabledAudio](self, "hasEnabledAudio")
     || -[AVPlayerController hasEnabledVideo](self, "hasEnabledVideo")))
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "duration");
      if ((v12 & 1) != 0)
      {
        -[AVPlayerController player](self, "player");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currentItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "duration");
          v6 = (v11 >> 4) & 1;
        }
        else
        {
          LOBYTE(v6) = 0;
        }

      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (int64_t)status
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (!v4)
    goto LABEL_10;
  if (v4 != 1)
  {
    if (v4 == 2)
      return 3;
    else
      return 0;
  }
  -[AVPlayerController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "status");

  switch(v8)
  {
    case 0:
LABEL_10:
      -[AVPlayerController player](self, "player");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10 != 0;

      return v5;
    case 2:
      return 3;
    case 1:
      return 2;
  }
  return 0;
}

- (AVPlayer)player
{
  return *(AVPlayer **)&self->_canTogglePictureInPicture;
}

- (BOOL)isReadyToPlay
{
  return -[AVPlayerController status](self, "status") == 2;
}

- (BOOL)hasEnabledAudio
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEnabledAudio");

  return v4;
}

void __30__AVPlayerController_startKVO__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oldValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_observeValueForKeyPath:oldValue:newValue:", v6, v7, v8);
}

- (BOOL)hasEnabledVideo
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEnabledVideo");

  return v4;
}

- (int64_t)externalPlaybackType
{
  void *v3;
  int64_t v4;

  if (!-[AVPlayerController isExternalPlaybackActive](self, "isExternalPlaybackActive")
    || (-[AVPlayerController player](self, "player"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "externalPlaybackType"),
        v3,
        v4 != 1)
    && v4 != 2)
  {
    if (-[AVPlayerController isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen"))
      return 2;
    else
      return 0;
  }
  return v4;
}

- (BOOL)isPlayingOnExternalScreen
{
  return -[AVPlayerController isExternalPlaybackActive](self, "isExternalPlaybackActive")
      || -[AVPlayerController isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen");
}

- (BOOL)isExternalPlaybackActive
{
  void *v2;
  char v3;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExternalPlaybackActive");

  return v3;
}

void __30__AVPlayerController_startKVO__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB37D0];
  v3 = a2;
  objc_msgSend(v2, "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("AVPlayerControllerContentDimensionsChangedNotification"), v3);

}

void __30__AVPlayerController_startKVO__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a4, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGSizeValue");
  objc_msgSend(v5, "setPresentationSize:");

}

- (void)setPresentationSize:(CGSize)a3
{
  *(CGSize *)&self->_suspendedRate = a3;
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateCurrentVideoTrackIfNeeded");
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateCurrentAudioTrackIfNeeded");
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTiming");
}

uint64_t __30__AVPlayerController_startKVO__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_prepareAssetForInspectionIfNeeded");
}

void __30__AVPlayerController_startKVO__block_invoke_10(uint64_t a1, void *a2)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  v2 = a2;
  objc_initWeak(&location, v2);
  v3 = v2[42];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__AVPlayerController_startKVO__block_invoke_11;
  v4[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)allowsExternalPlayback
{
  void *v2;
  char v3;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsExternalPlayback");

  return v3;
}

- (BOOL)usesExternalPlaybackWhileExternalScreenIsActive
{
  void *v2;
  char v3;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesExternalPlaybackWhileExternalScreenIsActive");

  return v3;
}

- (void)_updateAtLiveEdgeStateAndScheduleTimerIfNeeded
{
  if (BYTE3(self->_photosensitivityMetadataHandler))
  {
    -[AVPlayerController _cancelOutstandingAtLiveEdgeStateUpdates](self, "_cancelOutstandingAtLiveEdgeStateUpdates");
    BYTE3(self->_photosensitivityMetadataHandler) = 0;
    -[AVPlayerController _updateAtLiveEdgeStateIfNeeded](self, "_updateAtLiveEdgeStateIfNeeded");
    if (-[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent"))
      -[AVPlayerController _scheduleAtLiveEdgeStateUpdateIfNeeded](self, "_scheduleAtLiveEdgeStateUpdateIfNeeded");
  }
}

- (void)setAtLiveEdge:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  double v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (BYTE1(self->_liveEdgeTimer) != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v8 = 136315650;
      v9 = "-[AVPlayerController setAtLiveEdge:]";
      v11 = "atLiveEdge";
      v10 = 2080;
      if (v3)
        v6 = "YES";
      v12 = 2080;
      v13 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    BYTE1(self->_liveEdgeTimer) = v3;
    if (v3)
    {
      -[AVPlayerController defaultPlaybackRate](self, "defaultPlaybackRate");
      if (v7 > 1.0)
        -[AVPlayerController setDefaultPlaybackRate:](self, "setDefaultPlaybackRate:", 1.0);
    }
  }
}

- (void)_updateAtLiveEdgeStateIfNeeded
{
  _BOOL4 v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v10;
  double v11;
  uint64_t v12;

  v3 = -[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent");
  v4 = !-[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent");
  if ((v4 & 1) != 0)
  {
    v12 = v3 & v4;
  }
  else
  {
    -[AVPlayerController maxTime](self, "maxTime");
    v6 = v5;
    v7 = fabs(v5);
    -[AVPlayerController currentTime](self, "currentTime");
    v10 = fabs(v8) == INFINITY || v7 == INFINITY;
    v11 = vabdd_f64(v6, v8);
    if (v10)
      v11 = NAN;
    v12 = v11 <= 10.0;
  }
  -[AVPlayerController setAtLiveEdge:](self, "setAtLiveEdge:", v12);
}

- (BOOL)hasSeekableLiveStreamingContent
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;

  -[AVPlayerController _updateMinMaxTimingIfNeeded](self, "_updateMinMaxTimingIfNeeded");
  LODWORD(v3) = -[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent");
  if ((_DWORD)v3)
  {
    -[AVPlayerController minTiming](self, "minTiming");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[AVPlayerController maxTiming](self, "maxTiming");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        -[AVPlayerController player](self, "player");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currentItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "seekableTimeRangesLastModifiedTime");
        if (v9 != 0.0)
        {
          -[AVPlayerController player](self, "player");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "currentItem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "liveUpdateInterval");
          if (fabs(v12) != INFINITY)
          {
            -[AVPlayerController player](self, "player");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "currentItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "liveUpdateInterval");
            v16 = v15;

            if (v16 > 1.0)
            {
              +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
              v18 = v17;
              -[AVPlayerController minTiming](self, "minTiming");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "valueForTimeStamp:", v18);
              v21 = v20;

              -[AVPlayerController maxTiming](self, "maxTiming");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "valueForTimeStamp:", v18);
              v24 = v23;

              LOBYTE(v3) = v24 - v21 > 30.0;
              return v3;
            }
LABEL_11:
            LOBYTE(v3) = 0;
            return v3;
          }

        }
      }

      goto LABEL_11;
    }
  }
  return v3;
}

- (void)_updateMinMaxTimingIfNeeded
{
  if (!self->_hasSetUpSeekableLiveStreamState)
  {
    if (-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
    {
      self->_hasSetUpSeekableLiveStreamState = 1;
      -[AVPlayerController updateMinMaxTiming](self, "updateMinMaxTiming");
    }
  }
}

- (AVValueTiming)timing
{
  return (AVValueTiming *)self->_externalPlaybackAirPlayDeviceLocalizedName;
}

- (double)minTime
{
  double Seconds;
  double v4;
  void *v5;
  void *v6;
  double v7;
  CMTime v9[2];

  memset(&v9[1], 0, sizeof(CMTime));
  -[AVPlayerController reversePlaybackEndTime](self, "reversePlaybackEndTime");
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v9[0] = v9[1];
    Seconds = CMTimeGetSeconds(v9);
    if (fabs(Seconds) == INFINITY)
      return NAN;
    else
      return Seconds;
  }
  else
  {
    v4 = 0.0;
    if (-[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent"))
    {
      -[AVPlayerController minTiming](self, "minTiming");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[AVPlayerController minTiming](self, "minTiming");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "currentValue");
        v4 = v7;

      }
    }
  }
  return v4;
}

- (double)maxTime
{
  double Seconds;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  CMTime v11[2];

  memset(&v11[1], 0, sizeof(CMTime));
  -[AVPlayerController forwardPlaybackEndTime](self, "forwardPlaybackEndTime");
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v11[0] = v11[1];
    Seconds = CMTimeGetSeconds(v11);
    if (fabs(Seconds) == INFINITY)
      return NAN;
    else
      return Seconds;
  }
  else
  {
    -[AVPlayerController contentDuration](self, "contentDuration");
    v4 = v5;
    v6 = fabs(v5);
    if (v6 >= INFINITY && v6 <= INFINITY)
    {
      if (-[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent")
        && (-[AVPlayerController maxTiming](self, "maxTiming"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        -[AVPlayerController maxTiming](self, "maxTiming");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "currentValue");
        v4 = v9;

      }
      else
      {
        return NAN;
      }
    }
  }
  return v4;
}

- (double)contentDuration
{
  void *v2;
  void *v3;
  void *v4;
  double Seconds;
  CMTime v7;
  CMTime time;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "duration");
  else
    memset(&v7, 0, sizeof(v7));
  time = v7;
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)reversePlaybackEndTime
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v7;

  -[AVPlayerController player](self, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "reversePlaybackEndTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v7;

  -[AVPlayerController player](self, "player");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "forwardPlaybackEndTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (AVValueTiming)minTiming
{
  return self->_timing;
}

- (AVValueTiming)maxTiming
{
  return self->_minTiming;
}

- (void)_cancelOutstandingAtLiveEdgeStateUpdates
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPerformSelector:target:argument:", sel__updateAtLiveEdgeStateAndScheduleTimerIfNeeded, self, 0);

}

- (BOOL)isSeeking
{
  return HIBYTE(self->_liveEdgeTimer);
}

- (double)seekToTime
{
  return *(double *)&self->_currentVideoTrack;
}

- (int64_t)timeControlStatus
{
  void *v3;
  void *v4;
  int64_t v5;

  if (-[AVPlayerController _mainPlayerIsWaitingForInterstitialPlayback](self))
  {
    -[AVPlayerController interstitialController](self, "interstitialController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "interstitialPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "timeControlStatus");

  }
  else
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "timeControlStatus");
  }

  return v5;
}

- (BOOL)avkit_isAVPlayerControllerOrSubclass
{
  return 1;
}

- (double)suspendedRate
{
  return *(double *)&self->_captionAppearanceDisplayType;
}

- (BOOL)isPlaybackSuspended
{
  return self->_disablingAutomaticTermination;
}

- (BOOL)isPlaying
{
  double v2;

  -[AVPlayerController rate](self, "rate");
  return v2 != 0.0;
}

- (double)activeRate
{
  void *v2;
  float v3;
  double v4;

  -[AVPlayerController activePlayer](self, "activePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (double)rate
{
  void *v2;
  float v3;
  double v4;

  -[AVPlayerController activePlayer](self, "activePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (AVPlayer)activePlayer
{
  return self->_player;
}

- (AVInterstitialController)interstitialController
{
  return (AVInterstitialController *)self->_pipActivitySessionIdentifier;
}

- (void)setCurrentAssetIfReady:(id)a3
{
  objc_storeStrong((id *)&self->_observationController, a3);
}

- (void)setSeeking:(BOOL)a3
{
  HIBYTE(self->_liveEdgeTimer) = a3;
}

- (BOOL)hasContent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_observeValueForKeyPath:(id)a3 oldValue:(id)a4 newValue:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *seekQueue;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id *v29;
  id v30;
  NSObject *v31;
  id *v32;
  id v33;
  void *v34;
  NSObject *v35;
  id *v36;
  id v37;
  void *v38;
  NSObject *v39;
  id *v40;
  id v41;
  void *v42;
  NSObject *v43;
  id *v44;
  void *v45;
  CMTimeValue v46;
  NSObject *v47;
  __int128 v48;
  NSObject *v49;
  void *v50;
  void *v51;
  int v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  NSObject *v62;
  Float64 Seconds;
  double v64;
  double v65;
  CMTimeValue v66;
  double v67;
  Float64 v68;
  NSObject *v69;
  int liveStreamMaxTiming_low;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  _BOOL4 v79;
  id v80;
  id retryPlayingImmediatelyBlock;
  id v82;
  void *v83;
  float v84;
  float v85;
  NSObject *v86;
  Float64 v87;
  void *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unsigned int v94;
  void *v95;
  void *v96;
  int v97;
  uint64_t v98;
  NSObject *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  _QWORD v110[4];
  id v111[2];
  CMTime v112;
  CMTimeRange range2;
  CMTimeRange location;
  _QWORD v115[4];
  id v116;
  NSObject *v117;
  _QWORD v118[4];
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  NSObject *v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  id v130;
  _QWORD v131[4];
  id v132;
  NSObject *v133;
  _QWORD v134[4];
  id v135;
  _QWORD v136[4];
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  NSObject *v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  id v146;
  _QWORD v147[4];
  id v148;
  NSObject *v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  id v154;
  _QWORD v155[4];
  id v156;
  id v157;
  _QWORD v158[4];
  id v159;
  _QWORD block[4];
  id v161;
  CMTimeRange time;
  CMTimeRange buf;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v108 = a4;
  v109 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.currentItem")))
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "PlayerItemDidChange", (uint8_t *)&buf, 2u);
    }

    -[AVPlayerController updateTiming](self, "updateTiming");
    -[AVPlayerController setMetadata:](self, "setMetadata:", 0);
    -[AVPlayerController stopGeneratingTimecodes](self, "stopGeneratingTimecodes");
    v10 = *(void **)&self->_touchBarRequiresLinearPlayback;
    *(_QWORD *)&self->_touchBarRequiresLinearPlayback = 0;

    -[AVPlayerController setComposable:](self, "setComposable:", 0);
    -[AVPlayerController setHasProtectedContent:](self, "setHasProtectedContent:", 0);
    -[AVPlayerController setAvailableMetadataFormats:](self, "setAvailableMetadataFormats:", 0);
    -[AVPlayerController setCompatibleWithAirPlayVideo:](self, "setCompatibleWithAirPlayVideo:", 0);
    -[AVPlayerController setSeeking:](self, "setSeeking:", 0);
    objc_initWeak((id *)&location, self);
    seekQueue = self->_seekQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v161, (id *)&location);
    dispatch_async(seekQueue, block);
    -[AVPlayerController setContentChapters:](self, "setContentChapters:", 0);
    if (v109)
    {
      _AVLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_opt_class();
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v13;
        LOWORD(buf.start.flags) = 2048;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v109;
        v14 = v13;
        _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "New playerItem: <%{public}@: %p>", (uint8_t *)&buf, 0x16u);

      }
      LOBYTE(self->_liveStreamMaxTiming) = 1;
      -[AVPlayerController updateAtMinMaxTime](self, "updateAtMinMaxTime");
    }
    -[AVPlayerController reduceResourceUsageAssertion](self, "reduceResourceUsageAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[AVPlayerController reduceResourceUsageAssertion](self, "reduceResourceUsageAssertion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "invalidate");

      -[AVPlayerController acquireResourceReductionAssertion](self, "acquireResourceReductionAssertion");
    }
    objc_destroyWeak(&v161);
    objc_destroyWeak((id *)&location);
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("currentAssetIfReady")))
  {
    -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (v107)
    {
      _AVLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.start.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = objc_opt_class();
        LOWORD(buf.start.flags) = 2048;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v107;
        v18 = *(id *)((char *)&buf.start.value + 4);
        _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "New asset: <%{public}@: %p>", (uint8_t *)&buf, 0x16u);

      }
      objc_initWeak((id *)&buf, self);
      if (objc_msgSend(v107, "statusOfValueForKey:error:", CFSTR("commonMetadata"), 0) == 2)
      {
        dispatch_get_global_queue(0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v158[0] = MEMORY[0x1E0C809B0];
        v158[1] = 3221225472;
        v158[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_151;
        v158[3] = &unk_1E5BB4A40;
        objc_copyWeak(&v159, (id *)&buf);
        dispatch_async(v19, v158);

        objc_destroyWeak(&v159);
      }
      else
      {
        v155[0] = MEMORY[0x1E0C809B0];
        v155[1] = 3221225472;
        v155[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_2;
        v155[3] = &unk_1E5BB45E8;
        v156 = v107;
        objc_copyWeak(&v157, (id *)&buf);
        objc_msgSend(v156, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF4050, v155);
        objc_destroyWeak(&v157);

      }
      v26 = MEMORY[0x1E0C809B0];
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_3;
      v152[3] = &unk_1E5BB45E8;
      v27 = v107;
      v153 = v27;
      objc_copyWeak(&v154, (id *)&buf);
      v106 = (void *)MEMORY[0x1AF43E9B8](v152);
      if (objc_msgSend(v27, "statusOfValueForKey:error:", CFSTR("availableChapterLocales"), 0) == 2)
      {
        dispatch_get_global_queue(0, 0);
        v28 = objc_claimAutoreleasedReturnValue();
        v150[0] = v26;
        v150[1] = 3221225472;
        v150[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_8;
        v150[3] = &unk_1E5BB4610;
        v29 = &v151;
        v151 = v106;
        dispatch_async(v28, v150);
      }
      else
      {
        v147[0] = v26;
        v147[1] = 3221225472;
        v147[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_9;
        v147[3] = &unk_1E5BB4C10;
        v148 = v27;
        v149 = v106;
        objc_msgSend(v148, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF4080, v147);
        v29 = &v148;
        v28 = v149;
      }

      v144[0] = v26;
      v144[1] = 3221225472;
      v144[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_10;
      v144[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v146, (id *)&buf);
      v30 = v27;
      v145 = v30;
      v105 = (void *)MEMORY[0x1AF43E9B8](v144);
      if (objc_msgSend(v30, "statusOfValueForKey:error:", CFSTR("composable"), 0) == 2)
      {
        dispatch_get_global_queue(0, 0);
        v31 = objc_claimAutoreleasedReturnValue();
        v142[0] = v26;
        v142[1] = 3221225472;
        v142[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_12;
        v142[3] = &unk_1E5BB4610;
        v32 = &v143;
        v143 = v105;
        dispatch_async(v31, v142);
      }
      else
      {
        v139[0] = v26;
        v139[1] = 3221225472;
        v139[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_13;
        v139[3] = &unk_1E5BB4C10;
        v140 = v30;
        v141 = v105;
        objc_msgSend(v140, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF4098, v139);
        v32 = &v140;
        v31 = v141;
      }

      v136[0] = v26;
      v136[1] = 3221225472;
      v136[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_14;
      v136[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v138, (id *)&buf);
      v33 = v30;
      v137 = v33;
      v34 = (void *)MEMORY[0x1AF43E9B8](v136);
      if (objc_msgSend(v33, "statusOfValueForKey:error:", CFSTR("hasProtectedContent"), 0) == 2)
      {
        dispatch_get_global_queue(0, 0);
        v35 = objc_claimAutoreleasedReturnValue();
        v134[0] = v26;
        v134[1] = 3221225472;
        v134[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_16;
        v134[3] = &unk_1E5BB4610;
        v36 = &v135;
        v135 = v34;
        dispatch_async(v35, v134);
      }
      else
      {
        v131[0] = v26;
        v131[1] = 3221225472;
        v131[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_17;
        v131[3] = &unk_1E5BB4C10;
        v132 = v33;
        v133 = v34;
        objc_msgSend(v132, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF40B0, v131);
        v36 = &v132;
        v35 = v133;
      }

      v128[0] = v26;
      v128[1] = 3221225472;
      v128[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_18;
      v128[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v130, (id *)&buf);
      v37 = v33;
      v129 = v37;
      v38 = (void *)MEMORY[0x1AF43E9B8](v128);
      if (objc_msgSend(v37, "statusOfValueForKey:error:", CFSTR("availableMetadataFormats"), 0) == 2)
      {
        dispatch_get_global_queue(0, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        v126[0] = v26;
        v126[1] = 3221225472;
        v126[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_20;
        v126[3] = &unk_1E5BB4610;
        v40 = &v127;
        v127 = v38;
        dispatch_async(v39, v126);
      }
      else
      {
        v123[0] = v26;
        v123[1] = 3221225472;
        v123[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_21;
        v123[3] = &unk_1E5BB4C10;
        v124 = v37;
        v125 = v38;
        objc_msgSend(v124, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF40C8, v123);
        v40 = &v124;
        v39 = v125;
      }

      v120[0] = v26;
      v120[1] = 3221225472;
      v120[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_22;
      v120[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v122, (id *)&buf);
      v41 = v37;
      v121 = v41;
      v42 = (void *)MEMORY[0x1AF43E9B8](v120);
      if (objc_msgSend(v41, "statusOfValueForKey:error:", CFSTR("compatibleWithAirPlayVideo"), 0) == 2)
      {
        dispatch_get_global_queue(0, 0);
        v43 = objc_claimAutoreleasedReturnValue();
        v118[0] = v26;
        v118[1] = 3221225472;
        v118[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_24;
        v118[3] = &unk_1E5BB4610;
        v44 = &v119;
        v119 = v42;
        dispatch_async(v43, v118);
      }
      else
      {
        v115[0] = v26;
        v115[1] = 3221225472;
        v115[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_25;
        v115[3] = &unk_1E5BB4C10;
        v116 = v41;
        v117 = v42;
        objc_msgSend(v116, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF40E0, v115);
        v44 = &v116;
        v43 = v117;
      }

      -[AVPlayerController reloadOptions](self, "reloadOptions");
      objc_destroyWeak(&v122);

      objc_destroyWeak(&v130);
      objc_destroyWeak(&v138);

      objc_destroyWeak(&v146);
      objc_destroyWeak(&v154);

      objc_destroyWeak((id *)&buf);
    }

    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.currentItem.seekableTimeRanges")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v108;
    else
      v20 = 0;
    v21 = v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v109;
    else
      v22 = 0;
    v23 = v22;
    memset(&buf, 0, sizeof(buf));
    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v21, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        objc_msgSend(v24, "CMTimeRangeValue");
      else
        memset(&buf, 0, sizeof(buf));

    }
    else
    {
      v48 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&buf.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&buf.start.epoch = v48;
      *(_OWORD *)&buf.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    }
    memset(&location, 0, sizeof(location));
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "firstObject");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (v58)
        objc_msgSend(v58, "CMTimeRangeValue");
      else
        memset(&location, 0, sizeof(location));

    }
    else
    {
      v60 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&location.start.value = *MEMORY[0x1E0CA2E40];
      v61 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      *(_OWORD *)&location.start.epoch = v60;
      *(_OWORD *)&location.duration.timescale = v61;
    }
    _AVLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)&buf.start.value;
      time.start.epoch = buf.start.epoch;
      Seconds = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&buf.start.value;
      time.start.epoch = buf.start.epoch;
      v64 = CMTimeGetSeconds(&time.start);
      time.start = buf.duration;
      v65 = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&location.start.value;
      time.start.epoch = location.start.epoch;
      v66 = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&location.start.value;
      time.start.epoch = location.start.epoch;
      v67 = CMTimeGetSeconds(&time.start);
      time.start = location.duration;
      v68 = CMTimeGetSeconds(&time.start);
      LODWORD(time.start.value) = 134218752;
      *(Float64 *)((char *)&time.start.value + 4) = Seconds;
      LOWORD(time.start.flags) = 2048;
      *(double *)((char *)&time.start.flags + 2) = v64 + v65;
      HIWORD(time.start.epoch) = 2048;
      time.duration.value = v66;
      LOWORD(time.duration.timescale) = 2048;
      *(double *)((char *)&time.duration.timescale + 2) = v67 + v68;
      _os_log_impl(&dword_1AC4B1000, v62, OS_LOG_TYPE_DEFAULT, "SeekableTimeRanges changed {%f, %f} -> {%f, %f}.", (uint8_t *)&time, 0x2Au);
    }

    time = buf;
    range2 = location;
    if (!CMTimeRangeEqual(&time, &range2))
    {
      if (LOBYTE(self->_liveStreamMaxTiming))
      {
        if ((location.start.flags & 1) != 0
          && (location.duration.flags & 1) != 0
          && !location.duration.epoch
          && (location.duration.value & 0x8000000000000000) == 0
          && (buf.start.flags & 1) != 0
          && (buf.duration.flags & 1) != 0
          && !buf.duration.epoch
          && (buf.duration.value & 0x8000000000000000) == 0)
        {
          time = location;
          *(_OWORD *)&range2.start.value = *(_OWORD *)&buf.start.value;
          range2.start.epoch = buf.start.epoch;
          if (!CMTimeRangeContainsTime(&time, &range2.start))
          {
            LOBYTE(self->_liveStreamMaxTiming) = 0;
            _AVLog();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              liveStreamMaxTiming_low = LOBYTE(self->_liveStreamMaxTiming);
              LODWORD(time.start.value) = 67109120;
              HIDWORD(time.start.value) = liveStreamMaxTiming_low;
              _os_log_impl(&dword_1AC4B1000, v69, OS_LOG_TYPE_DEFAULT, "liveStreamEventModePossible: %d", (uint8_t *)&time, 8u);
            }

          }
        }
      }
      -[AVPlayerController updateMinMaxTiming](self, "updateMinMaxTiming");
    }

    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("hasLiveStreamingContent")))
  {
    -[AVPlayerController updateMinMaxTiming](self, "updateMinMaxTiming");
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("timeControlStatus")))
  {
    -[AVPlayerController player](self, "player");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "timeControlStatus");

    _AVLog();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.start.value) = 134217984;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = v46;
      _os_log_impl(&dword_1AC4B1000, v47, OS_LOG_TYPE_DEFAULT, "Time control status = %ld", (uint8_t *)&buf, 0xCu);
    }

    if (v46)
    {
      if (v46 == 2)
      {
        self->_shouldPlayImmediately = 0;
        retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
        self->_retryPlayingImmediatelyBlock = 0;

      }
      else if (v46 == 1)
      {
        self->_shouldPlayImmediately = 1;
      }
    }
    else
    {
      v80 = self->_retryPlayingImmediatelyBlock;
      self->_retryPlayingImmediatelyBlock = 0;

    }
    -[AVPlayerController _setNeedsAtLiveEdgeStateUpdate](self, "_setNeedsAtLiveEdgeStateUpdate");
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.currentItem.playbackLikelyToKeepUp")))
  {
    _AVLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      -[AVPlayerController player](self, "player");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "currentItem");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isPlaybackLikelyToKeepUp");
      v53 = CFSTR("NO");
      if (v52)
        v53 = CFSTR("YES");
      LODWORD(buf.start.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v53;
      _os_log_impl(&dword_1AC4B1000, v49, OS_LOG_TYPE_DEFAULT, "Playback likely to keep up changed to: %@", (uint8_t *)&buf, 0xCu);

    }
    if (AVPlayerControllerAutoplayEnabled == 1
      && !-[AVPlayerController coordinatedPlaybackActive](self, "coordinatedPlaybackActive"))
    {
      if (BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount))
      {
        -[AVPlayerController player](self, "player");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "currentItem");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "isPlaybackLikelyToKeepUp");

        if (v56)
        {
          _AVLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.start.value) = 136315138;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[AVPlayerController _observeValueForKeyPath:o"
                                                                          "ldValue:newValue:]";
            _os_log_impl(&dword_1AC4B1000, v57, OS_LOG_TYPE_DEFAULT, "%s setPlaying:YES because AVPlayerControllerAutoplayEnabled", (uint8_t *)&buf, 0xCu);
          }

          -[AVPlayerController setPlaying:](self, "setPlaying:", 1);
        }
      }
    }
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.currentItem.playbackBufferEmpty")))
  {
    _AVLog();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      -[AVPlayerController player](self, "player");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "currentItem");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.start.value) = 67109120;
      HIDWORD(buf.start.value) = objc_msgSend(v73, "isPlaybackBufferEmpty");
      _os_log_impl(&dword_1AC4B1000, v71, OS_LOG_TYPE_DEFAULT, "isPlaybackBufferEmpty: %d", (uint8_t *)&buf, 8u);

    }
    if (AVPlayerControllerAutoplayEnabled == 1
      && !-[AVPlayerController coordinatedPlaybackActive](self, "coordinatedPlaybackActive"))
    {
      -[AVPlayerController player](self, "player");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "currentItem");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v75, "isPlaybackBufferEmpty") & 1) != 0)
      {
        -[AVPlayerController player](self, "player");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "currentItem");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v77, "status") == 1)
        {
          -[AVPlayerController rate](self, "rate");
          v79 = v78 > 0.0;

          if (v79)
            BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 1;
        }
        else
        {

        }
      }
      else
      {

      }
    }
    -[AVPlayerController _retryPlayImmediatelyIfNeeded](self, "_retryPlayImmediatelyIfNeeded");
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.currentItem.loadedTimeRanges")))
  {
    -[AVPlayerController _retryPlayImmediatelyIfNeeded](self, "_retryPlayImmediatelyIfNeeded");
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.rate")))
  {
    v82 = self->_retryPlayingImmediatelyBlock;
    self->_retryPlayingImmediatelyBlock = 0;

    -[AVPlayerController player](self, "player");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "rate");
    v85 = v84;

    _AVLog();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.start.value) = 134217984;
      *(double *)((char *)&buf.start.value + 4) = v85;
      _os_log_impl(&dword_1AC4B1000, v86, OS_LOG_TYPE_DEFAULT, "Rate changed to: %f", (uint8_t *)&buf, 0xCu);
    }
LABEL_111:

    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("seekToTimeInternal")))
  {
    -[AVPlayerController seekToTimeInternal](self, "seekToTimeInternal");
    v87 = CMTimeGetSeconds(&v112);
    objc_initWeak((id *)&buf, self);
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_188;
    v110[3] = &unk_1E5BB4638;
    objc_copyWeak(v111, (id *)&buf);
    v111[1] = *(id *)&v87;
    dispatch_async(MEMORY[0x1E0C80D38], v110);
    objc_destroyWeak(v111);
    objc_destroyWeak((id *)&buf);
    goto LABEL_107;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("player.externalPlaybackActive")))
  {
    if (-[AVPlayerController isExternalPlaybackActive](self, "isExternalPlaybackActive"))
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v88, "applicationState") == 2)
      {
        v89 = -[AVPlayerController isPlaying](self, "isPlaying");

        if (v89)
        {
          objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "bundleIdentifier");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "setAttribute:forKey:error:", v92, *MEMORY[0x1E0D47E80], 0);

          -[AVPlayerController pauseForAllCoordinatedPlaybackParticipants:](self, "pauseForAllCoordinatedPlaybackParticipants:", 0);
        }
      }
      else
      {

      }
      if (-[AVPlayerController externalPlaybackType](self, "externalPlaybackType") == 1)
      {
        +[AVAirMessageDispatcher shared](AVAirMessageDispatcher, "shared");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "haveAirPlayService");

        if (v101)
        {
          -[AVPlayerController player](self, "player");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "currentItem");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "avkit_airMessageSendToAppleTV");

        }
      }
    }
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("audioFormats")))
    {
      -[AVPlayerController reloadAudioOptions](self, "reloadAudioOptions");
      goto LABEL_107;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("isPiPAvailable")))
    {
      _AVLog();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.start.value) = 138412546;
        *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v104;
        LOWORD(buf.start.flags) = 2112;
        *(_QWORD *)((char *)&buf.start.flags + 2) = v8;
        _os_log_error_impl(&dword_1AC4B1000, v86, OS_LOG_TYPE_ERROR, "Failed to handle %@ %@", (uint8_t *)&buf, 0x16u);

      }
      goto LABEL_111;
    }
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "isPiPAvailable");

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "bundleIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "isEqualToString:", CFSTR("com.apple.videos"));

    v98 = v97 | v94;
    if ((v98 & 1) == 0)
    {
      _AVLog();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.start.value) = 0;
        _os_log_impl(&dword_1AC4B1000, v99, OS_LOG_TYPE_DEFAULT, "AVAudioSession indicates PIP is unavailable for this audio session", (uint8_t *)&buf, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "setCachedIsPictureInPictureSupported:", v98);
    -[AVPlayerController setPictureInPictureSupported:](self, "setPictureInPictureSupported:", v98);
  }
LABEL_107:

}

- (void)_setNeedsAtLiveEdgeStateUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (!BYTE3(self->_photosensitivityMetadataHandler))
  {
    BYTE3(self->_photosensitivityMetadataHandler) = 1;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performSelector:target:argument:order:modes:", sel__updateAtLiveEdgeStateAndScheduleTimerIfNeeded, self, 0, 0, v4);

  }
}

- (void)_retryPlayImmediatelyIfNeeded
{
  NSObject *v3;
  id retryPlayingImmediatelyBlock;
  uint8_t v5[16];

  if (self->_retryPlayingImmediatelyBlock && -[AVPlayerController canPlayImmediately](self, "canPlayImmediately"))
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Retrying play immediately.", v5, 2u);
    }

    (*((void (**)(void))self->_retryPlayingImmediatelyBlock + 2))();
    retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
    self->_retryPlayingImmediatelyBlock = 0;

  }
}

- (void)setHasProtectedContent:(BOOL)a3
{
  self->_atLiveEdge = a3;
}

- (void)setComposable:(BOOL)a3
{
  self->_isPlayingHDRContent = a3;
}

- (void)setCompatibleWithAirPlayVideo:(BOOL)a3
{
  self->_atMaxTime = a3;
}

- (void)setAvailableMetadataFormats:(id)a3
{
  objc_storeStrong((id *)&self->_contentChapters, a3);
}

- (void)stopGeneratingTimecodes
{
  void *v3;
  id timecodePeriodicObserverToken;

  if (self->_timecodePeriodicObserverToken)
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeTimeObserver:", self->_timecodePeriodicObserverToken);

    timecodePeriodicObserverToken = self->_timecodePeriodicObserverToken;
    self->_timecodePeriodicObserverToken = 0;

  }
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_initialScrubbingTime, a3);
}

- (void)setContentChapters:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BSSimpleAssertion)reduceResourceUsageAssertion
{
  return (BSSimpleAssertion *)*(id *)&self->_playingOnSecondScreen;
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "assetBeingPrepared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAssetBeingPrepared:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setCurrentAssetIfReady:", *(_QWORD *)(a1 + 32));
}

- (id)currentEnabledAssetTrackForMediaType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E0C8A7A0] == v4)
  {
    -[AVPlayerController currentAudioMediaSelectionOption](self, "currentAudioMediaSelectionOption");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((id)*MEMORY[0x1E0C8A808] != v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[AVPlayerController currentVideoMediaSelectionOption](self, "currentVideoMediaSelectionOption");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v7;
LABEL_7:
  objc_msgSend(v6, "track");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tracks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v17, "assetTrack");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18 == v8)
          {
            v19 = objc_msgSend(v17, "isEnabled");

            if ((v19 & 1) != 0)
            {
              v26 = v8;
              goto LABEL_33;
            }
          }
          else
          {

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
  if (-[AVPlayerController isStreaming](self, "isStreaming"))
  {
    v30 = v6;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v11;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
LABEL_22:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v24);
        objc_msgSend(v25, "assetTrack");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "isEnabled"))
        {
          objc_msgSend(v26, "mediaType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27 == v5)
            break;
        }

        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v22)
            goto LABEL_22;
          goto LABEL_29;
        }
      }

      v6 = v30;
      if (v26)
        goto LABEL_34;
    }
    else
    {
LABEL_29:

      v6 = v30;
    }
  }
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avkit_tracksWithMediaType:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
LABEL_34:

  return v26;
}

- (BOOL)isStreaming
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("streaming"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_prepareAssetForInspectionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id from;
  id location;

  if (!-[AVPlayerController isReadyToPlay](self, "isReadyToPlay"))
    goto LABEL_3;
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v6)
LABEL_3:
    -[AVPlayerController setCurrentAssetIfReady:](self, "setCurrentAssetIfReady:", 0);
  -[AVPlayerController assetBeingPrepared](self, "assetBeingPrepared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v10)
    -[AVPlayerController setAssetBeingPrepared:](self, "setAssetBeingPrepared:", 0);
  -[AVPlayerController assetBeingPrepared](self, "assetBeingPrepared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (v12 = -[AVPlayerController isReadyToPlay](self, "isReadyToPlay"), v11 = 0, !v12)
    || (v13 = -[AVPlayerController isInspectionSuspended](self, "isInspectionSuspended"), v11 = 0, v13))
  {

  }
  else
  {
    -[AVPlayerController player](self, "player");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "asset");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerController player](self, "player");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 != v20)
      {
        -[AVPlayerController player](self, "player");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "asset");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVPlayerController setAssetBeingPrepared:](self, "setAssetBeingPrepared:", v23);

        objc_initWeak(&location, self);
        -[AVPlayerController player](self, "player");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "currentItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&from, v25);

        v26 = objc_loadWeakRetained(&from);
        objc_msgSend(v26, "asset");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&v34, v27);

        -[AVPlayerController assetInspectionQueue](self, "assetInspectionQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke;
        block[3] = &unk_1E5BB4798;
        objc_copyWeak(&v31, &from);
        objc_copyWeak(&v32, &v34);
        objc_copyWeak(&v33, &location);
        dispatch_async(v28, block);

        objc_destroyWeak(&v33);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&v31);
        objc_destroyWeak(&v34);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }
}

- (AVAsset)assetBeingPrepared
{
  return (AVAsset *)self->_assetInspectionQueue;
}

- (void)setAssetBeingPrepared:(id)a3
{
  objc_storeStrong((id *)&self->_assetInspectionQueue, a3);
}

- (id)_selectedMediaOptionWithMediaCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avkit_mediaSelectionGroupForMediaCharacteristic:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "currentMediaSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedMediaOptionInMediaSelectionGroup:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateCurrentAudioTrackIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVPlayerController currentEnabledAssetTrackForMediaType:](self, "currentEnabledAssetTrackForMediaType:", *MEMORY[0x1E0C8A7A0]);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[AVPlayerController setCurrentAudioTrack:](self, "setCurrentAudioTrack:", v4);

}

- (void)setCurrentAudioTrack:(id)a3
{
  objc_storeStrong((id *)&self->_maxTiming, a3);
}

- (void)_updateCurrentVideoTrackIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVPlayerController currentEnabledAssetTrackForMediaType:](self, "currentEnabledAssetTrackForMediaType:", *MEMORY[0x1E0C8A808]);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[AVPlayerController setCurrentVideoTrack:](self, "setCurrentVideoTrack:", v4);

}

- (AVAsset)currentAssetIfReady
{
  return (AVAsset *)self->_observationController;
}

- (void)setCurrentVideoTrack:(id)a3
{
  objc_storeStrong((id *)&self->_currentAudioTrack, a3);
}

- (void)reloadOptions
{
  -[AVPlayerController reloadOptionsAssumingMediaOptionsMayHaveChanged:](self, "reloadOptionsAssumingMediaOptionsMayHaveChanged:", 0);
}

- (void)reloadOptionsAssumingMediaOptionsMayHaveChanged:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v3 = a3;
  kdebug_trace();
  -[AVPlayerController audioOptions](self, "audioOptions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v8 = (void *)v5;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v17 = v8;

  kdebug_trace();
  kdebug_trace();
  -[AVPlayerController legibleOptions](self, "legibleOptions");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v7;
  v12 = v11;

  kdebug_trace();
  kdebug_trace();
  -[AVPlayerController setLegibleMediaSelectionOptions:audioMediaSelectionOptions:assumeMediaOptionMayHaveChanged:](self, "setLegibleMediaSelectionOptions:audioMediaSelectionOptions:assumeMediaOptionMayHaveChanged:", v12, v17, v3);
  kdebug_trace();
  if (-[AVPlayerController shouldLoadVisualMediaSelectionOptions](self, "shouldLoadVisualMediaSelectionOptions"))
  {
    -[AVPlayerController visualOptions](self, "visualOptions");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v7;
    v16 = v15;

    -[AVPlayerController setVisualMediaSelectionOptions:](self, "setVisualMediaSelectionOptions:", v16);
  }

}

- (void)setLegibleMediaSelectionOptions:(id)a3 audioMediaSelectionOptions:(id)a4 assumeMediaOptionMayHaveChanged:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  if (v8 && !-[NSArray isEqualToArray:](self->_audioMediaSelectionOptions, "isEqualToArray:", v8))
  {
    -[AVPlayerController setAudioMediaSelectionOptions:](self, "setAudioMediaSelectionOptions:", v8);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (v10 && !-[NSArray isEqualToArray:](self->_legibleMediaSelectionOptions, "isEqualToArray:", v10))
  {
    -[AVPlayerController setLegibleMediaSelectionOptions:](self, "setLegibleMediaSelectionOptions:", v10);
  }
  else if ((v9 | v5) != 1)
  {
    goto LABEL_11;
  }
  -[AVPlayerController selectedMediaOptionMayHaveChanged:](self, "selectedMediaOptionMayHaveChanged:", 1);
LABEL_11:

}

- (void)selectedMediaOptionMayHaveChanged:(BOOL)a3
{
  AVMediaSelectionOption **p_cachedSelectedLegibleMediaSelectionOption;
  AVMediaSelectionOption *v5;
  AVMediaSelectionOption *v6;
  AVMediaSelectionOption *v7;
  void *v8;
  int v9;
  int64_t v10;
  int v11;
  int64_t v12;
  void *v13;
  NSObject *v14;
  NSString *lastKnownPersistedExtendedLanguageTag;
  void *v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  AVMediaSelectionOption *v25;
  AVMediaSelectionOption *v26;
  AVMediaSelectionOption *v27;
  void *v28;
  AVMediaSelectionOption *v29;
  void *v30;
  char v31;
  NSObject *v32;
  AVMediaSelectionOption *v33;
  void *v34;
  void *v35;
  char v36;
  NSObject *v37;
  AVMediaSelectionOption *v38;
  void *v39;
  _BOOL4 v40;
  AVMediaSelectionOption *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  NSString *p_isa;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v40 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  p_cachedSelectedLegibleMediaSelectionOption = &self->_cachedSelectedLegibleMediaSelectionOption;
  v5 = self->_cachedSelectedLegibleMediaSelectionOption;
  v6 = self->_cachedSelectedAudioMediaSelectionOption;
  v7 = self->_cachedSelectedLegibleMediaSelectionOptionAccordingToAVFoundation;
  -[AVPlayerController _selectedMediaOptionWithMediaCharacteristic:](self, "_selectedMediaOptionWithMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_cachedSelectedLegibleMediaSelectionOptionAccordingToAVFoundation, v8);
  v9 = objc_msgSend(v8, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A710]);
  v10 = -[AVPlayerController externalPlaybackType](self, "externalPlaybackType");
  v41 = v7;
  v11 = -[AVMediaSelectionOption isEqual:](v7, "isEqual:", v8);
  if (v10 == 1
    && ((!-[AVPlayerController handlesAudioSessionInterruptions](self, "handlesAudioSessionInterruptions") | v11) & 1) == 0
    && !-[AVPlayerController _mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup](self, "_mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup"))
  {
    v12 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
    if (v9)
    {
      if (-[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType") != 2)
      {
LABEL_24:
        -[AVPlayerController _ensureUserCaptionDisplayType:](self, "_ensureUserCaptionDisplayType:", v12);
        goto LABEL_25;
      }
      MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0C8A780]) & 1) == 0
        && (objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0C8A720]) & 1) == 0
        && (objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0C8A728]) & 1) == 0)
      {
        _AVLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
          _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s Enabling automatic display type because receiver changed captions to forced-only.", buf, 0xCu);
        }

        v12 = 1;
      }
    }
    else
    {
      if (!v8)
        goto LABEL_24;
      lastKnownPersistedExtendedLanguageTag = self->_lastKnownPersistedExtendedLanguageTag;
      objc_msgSend(v8, "extendedLanguageTag");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(lastKnownPersistedExtendedLanguageTag) = -[NSString isEqualToString:](lastKnownPersistedExtendedLanguageTag, "isEqualToString:", v16);

      if ((lastKnownPersistedExtendedLanguageTag & 1) != 0)
        goto LABEL_24;
      _AVLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_lastKnownPersistedExtendedLanguageTag;
        objc_msgSend(v8, "extendedLanguageTag");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
        v44 = 2114;
        p_isa = v18;
        v46 = 2114;
        v47 = v19;
        _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "%s Persisting preferences for remote legible option change: %{public}@ -> %{public}@", buf, 0x20u);

      }
      objc_msgSend(v8, "extendedLanguageTag");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (__CFString *)v20;
      else
        v22 = CFSTR("und");
      objc_storeStrong((id *)&self->_lastKnownPersistedExtendedLanguageTag, v22);

      objc_msgSend(v8, "extendedLanguageTag");
      v23 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v23;
      if (v23)
        v24 = (const __CFString *)v23;
      else
        v24 = CFSTR("und");
      MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v24);
      v12 = 2;
    }

    goto LABEL_24;
  }
LABEL_25:
  v25 = v6;
  -[AVPlayerController currentLegibleMediaSelectionOption](self, "currentLegibleMediaSelectionOption");
  v26 = (AVMediaSelectionOption *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController currentAudioMediaSelectionOption](self, "currentAudioMediaSelectionOption");
  v27 = (AVMediaSelectionOption *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionOption propertyList](v26, "propertyList");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionOption propertyList](v5, "propertyList");
  v29 = v5;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v28, "isEqual:", v30);

  if ((v31 & 1) == 0 && v26 != v29)
  {
    _AVLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
      v44 = 2114;
      p_isa = (NSString *)&v26->super.isa;
      _os_log_impl(&dword_1AC4B1000, v32, OS_LOG_TYPE_DEFAULT, "%s Selected legible option: %{public}@ ", buf, 0x16u);
    }

    objc_storeStrong((id *)p_cachedSelectedLegibleMediaSelectionOption, v26);
    v40 = 1;
  }
  v33 = v29;
  -[AVMediaSelectionOption propertyList](v27, "propertyList");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaSelectionOption propertyList](v25, "propertyList");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isEqual:", v35);

  if ((v36 & 1) == 0 && v27 != v25)
  {
    _AVLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v41;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[AVPlayerController(AVMediaSelection) selectedMediaOptionMayHaveChanged:]";
      v44 = 2114;
      p_isa = (NSString *)&v27->super.isa;
      _os_log_impl(&dword_1AC4B1000, v37, OS_LOG_TYPE_DEFAULT, "%s Selected audible option: %{public}@ ", buf, 0x16u);
    }

    objc_storeStrong((id *)&self->_cachedSelectedAudioMediaSelectionOption, v27);
    goto LABEL_36;
  }
  v38 = v41;
  if (v40)
  {
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "postNotificationName:object:", CFSTR("AVPlayerControllerSelectedMediaOptionDidChangeNotification"), self);

  }
}

- (id)legibleOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *recentLegibleLanguageForLastSort;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  NSString *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[5];
  _QWORD v67[5];
  id v68;
  _QWORD v69[2];
  _BYTE v70[128];
  _QWORD v71[2];
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[AVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentMediaSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedMediaOptionInMediaSelectionGroup:", v59);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C8B1F8];
    -[AVPlayerController _optionsForGroup:](self, "_optionsForGroup:", v59);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playableMediaSelectionOptionsFromArray:", v9);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C8B1F8];
    v72[0] = *MEMORY[0x1E0C8A710];
    v11 = v72[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaSelectionOptionsFromArray:withoutMediaCharacteristics:", v58, v12);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C8B1F8];
    v14 = *MEMORY[0x1E0C8A748];
    v71[0] = v11;
    v71[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaSelectionOptionsFromArray:withMediaCharacteristics:", v58, v15);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "arrayByAddingObjectsFromArray:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_recentLegibleLanguageCode");
    v57 = (NSString *)objc_claimAutoreleasedReturnValue();
    recentLegibleLanguageForLastSort = self->_recentLegibleLanguageForLastSort;
    if (v57 != recentLegibleLanguageForLastSort
      && (!v57 || !recentLegibleLanguageForLastSort || !-[NSString isEqualToString:](v57, "isEqualToString:")))
    {
      goto LABEL_17;
    }
    v17 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v56, "valueForKey:", CFSTR("avkit_persistentIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPlayerController currentLegibleMediaSelectionOption](self, "currentLegibleMediaSelectionOption");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[AVPlayerController currentLegibleMediaSelectionOption](self, "currentLegibleMediaSelectionOption");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
      {

      }
      else
      {
        -[AVPlayerController currentLegibleMediaSelectionOption](self, "currentLegibleMediaSelectionOption");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v23 == v24;

        if (v25)
          goto LABEL_13;
        -[AVPlayerController currentLegibleMediaSelectionOption](self, "currentLegibleMediaSelectionOption");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "avkit_persistentIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v21);
      }

    }
LABEL_13:
    v27 = (void *)MEMORY[0x1E0C99E20];
    -[AVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "valueForKey:", CFSTR("avkit_persistentIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "avkit_persistentIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObject:", v32);

    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "avkit_persistentIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeObject:", v34);

    v35 = objc_msgSend(v56, "count");
    if (v35 == objc_msgSend(v19, "count") && (objc_msgSend(v30, "isEqualToSet:", v19) & 1) != 0)
    {
      -[AVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
      goto LABEL_42;
    }

LABEL_17:
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy_;
    v67[4] = __Block_byref_object_dispose_;
    v36 = MEMORY[0x1E0C809B0];
    v68 = 0;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke;
    v66[3] = &unk_1E5BB0C70;
    v66[4] = v67;
    v37 = (void *)MEMORY[0x1AF43E9B8](v66);
    _UpdatePreferredMediaSelectionOptions(v56);
    v64[0] = v36;
    v64[1] = 3221225472;
    v64[2] = __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke_2;
    v64[3] = &unk_1E5BB0CB8;
    v53 = v37;
    v65 = v53;
    objc_msgSend(v56, "sortedArrayUsingComparator:", v64);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v42 = v38;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (!v43)
    {
LABEL_37:

      if (objc_msgSend(v39, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v49;
        objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "arrayByAddingObjectsFromArray:", v39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = 0;
      }

      _Block_object_dispose(v67, 8);
      goto LABEL_41;
    }
    v44 = *(_QWORD *)v61;
LABEL_19:
    v45 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v44)
        objc_enumerationMutation(v42);
      v46 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v45);
      objc_msgSend(v46, "extendedLanguageTag");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v47 || !objc_msgSend(v46, "isMain"))
        goto LABEL_29;
      if ((objc_msgSend(v40, "containsObject:", v47) & 1) != 0)
        break;
      objc_msgSend(v39, "addObject:", v46);
      objc_msgSend(v40, "addObject:", v47);
      if ((objc_msgSend(v46, "isCC") & 1) != 0)
        goto LABEL_35;
LABEL_30:

      if (v43 == ++v45)
      {
        v48 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        v43 = v48;
        if (!v48)
          goto LABEL_37;
        goto LABEL_19;
      }
    }
    if (objc_msgSend(v46, "isCC") && (objc_msgSend(v41, "containsObject:", v47) & 1) == 0)
    {
      objc_msgSend(v39, "addObject:", v46);
LABEL_35:
      objc_msgSend(v41, "addObject:", v47);
      goto LABEL_30;
    }
    if ((objc_msgSend(v39, "containsObject:", v46) & 1) != 0 || !objc_msgSend(v46, "isEqual:", v7))
      goto LABEL_30;
LABEL_29:
    objc_msgSend(v39, "addObject:", v46);
    goto LABEL_30;
  }
  v26 = (void *)MEMORY[0x1E0C9AA60];
LABEL_42:

  return v26;
}

- (AVMediaSelectionOption)currentVideoMediaSelectionOption
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController _selectedMediaOptionWithMediaCharacteristic:](self, "_selectedMediaOptionWithMediaCharacteristic:", *MEMORY[0x1E0C8A788]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController visualMediaSelectionOptions](self, "visualMediaSelectionOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v3))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6 != v3)
  {
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[AVPlayerController(AVMediaSelection) currentVideoMediaSelectionOption]";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s Have visual option %{}@ selected but it is not in our options list", (uint8_t *)&v9, 0x16u);
    }

  }
  return (AVMediaSelectionOption *)v6;
}

- (NSArray)visualMediaSelectionOptions
{
  return self->_visualMediaSelectionOptions;
}

- (id)audioOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int (**v9)(_QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C8B1F8];
    -[AVPlayerController _optionsForGroup:](self, "_optionsForGroup:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playableMediaSelectionOptionsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _UpdatePreferredMediaSelectionOptions(v7);
    +[AVPlayerController _sortedAudibleOption:](AVPlayerController, "_sortedAudibleOption:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy_;
    v23[4] = __Block_byref_object_dispose_;
    v24 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __52__AVPlayerController_AVMediaSelection__audioOptions__block_invoke;
    v22[3] = &unk_1E5BB0C70;
    v22[4] = v23;
    v9 = (unsigned int (**)(_QWORD))MEMORY[0x1AF43E9B8](v22);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (!objc_msgSend(v15, "isAC3Only", (_QWORD)v18) || v9[2](v9))
            objc_msgSend(v10, "addObject:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v23, 8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (BOOL)shouldLoadVisualMediaSelectionOptions
{
  return self->_preventingIdleDisplaySleep;
}

- (void)setPictureInPictureSupported:(BOOL)a3
{
  BYTE5(self->_liveEdgeTimer) = a3;
}

+ (void)setCachedIsPictureInPictureSupported:(BOOL)a3
{
  AVPlayerControllerCachedIsPictureInPictureSupported = a3;
}

- (void)startUsingNetworkResourcesForLiveStreamingWhilePaused
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)&self->_liveStreamEventModePossible;
  *(_QWORD *)&self->_liveStreamEventModePossible = v2 + 1;
  if (!v2)
  {
    -[AVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = objc_msgSend(v5, "canUseNetworkResourcesForLiveStreamingWhilePaused");

    -[AVPlayerController player](self, "player");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCanUseNetworkResourcesForLiveStreamingWhilePaused:", 1);

  }
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2(id *a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id WeakRetained;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__21494;
  v12 = __Block_byref_object_dispose__21495;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = (void *)v9[5];
  if (v2)
  {
    objc_msgSend(v2, "assetInspectionQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_340;
    block[3] = &unk_1E5BB4720;
    v5 = a1[4];
    v7 = &v8;
    v6 = a1[5];
    dispatch_async(v3, block);

  }
  _Block_object_dispose(&v8, 8);

}

- (void)startKVO
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  const __CFString *v48;
  const __CFString *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  const __CFString *v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[AVPlayerController observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __30__AVPlayerController_startKVO__block_invoke;
  v45[3] = &unk_1E5BB4450;
  objc_copyWeak(&v46, &location);
  v5 = (void *)MEMORY[0x1AF43E9B8](v45);
  -[AVPlayerController assetInspectionQueue](self, "assetInspectionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v39 = v4;
  v40 = 3221225472;
  v41 = __30__AVPlayerController_startKVO__block_invoke_2;
  v42 = &unk_1E5BB44A0;
  objc_copyWeak(&v44, &location);
  v7 = v5;
  v43 = v7;
  dispatch_async(v6, &v39);

  v8 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.externalPlaybackActive"), 1, v7, v39, v40, v41, v42);
  v9 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.currentItem"), 1, v7);
  v10 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("currentAssetIfReady"), 1, v7);
  v11 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("timeControlStatus"), 1, v7);
  v12 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.currentItem.seekableTimeRanges"), 1, v7);
  v13 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.currentItem.loadedTimeRanges"), 1, v7);
  v14 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.currentItem.playbackBufferEmpty"), 0, v7);
  if (AVPlayerControllerAutoplayEnabled == 1)
    v15 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.currentItem.playbackLikelyToKeepUp"), 0, v7);
  v16 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("player.rate"), 1, v7);
  v17 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("hasLiveStreamingContent"), 1, v7);
  v18 = (id)objc_msgSend(v3, "startObserving:keyPath:includeInitialValue:observationHandler:", self, CFSTR("seekToTimeInternal"), 0, v7);
  -[AVPlayerController observationController](self, "observationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = CFSTR("player.currentItem.presentationSize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v19, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v20, 1, &__block_literal_global_105);

  -[AVPlayerController observationController](self, "observationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = CFSTR("contentDimensions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v22, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v23, 0, &__block_literal_global_108_21645);

  v54[0] = CFSTR("player.currentItem.asset");
  v54[1] = CFSTR("readyToPlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v3, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v25, 1, &__block_literal_global_113);

  v53[0] = CFSTR("player.currentItem.duration");
  v53[1] = CFSTR("readyToPlay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v27, 1, &__block_literal_global_116);

  v52[0] = CFSTR("hasEnabledAudio");
  v52[1] = CFSTR("currentAudioMediaSelectionOption");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v3, "startObserving:keyPaths:observationHandler:", self, v29, &__block_literal_global_121_21651);

  v51[0] = CFSTR("hasEnabledVideo");
  v51[1] = CFSTR("currentVideoMediaSelectionOption");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v3, "startObserving:keyPaths:observationHandler:", self, v31, &__block_literal_global_126);

  v50[0] = CFSTR("player.externalPlaybackActive");
  v50[1] = CFSTR("externalPlaybackType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v3, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v33, 1, &__block_literal_global_129);

  v49 = CFSTR("currentAssetIfReady");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v3, "startObserving:keyPaths:observationHandler:", self, v35, &__block_literal_global_130_21655);

  v48 = CFSTR("player.currentItem.tracks");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v3, "startObserving:keyPaths:includeInitialValue:observationHandler:", self, v37, 1, &__block_literal_global_133_21657);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);

  objc_destroyWeak(&location);
}

- (AVObservationController)observationController
{
  return *(AVObservationController **)&self->_activeRate;
}

- (OS_dispatch_queue)assetInspectionQueue
{
  return (OS_dispatch_queue *)self->_currentAssetIfReady;
}

- (void)setPlayingOnMatchPointDevice:(BOOL)a3
{
  self->_compatibleWithAirPlayVideo = a3;
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a4;
  if (objc_msgSend(v10, "isReadyToPlay"))
  {
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "timebase");

    if (v6 == (void *)v9)
      objc_msgSend(v10, "updateTiming");

  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("AVPlayerControllerCurrentTimeJumpedNotification"), v9);

    if ((objc_msgSend(v9, "isScrubbing") & 1) == 0)
      objc_msgSend(v9, "_setNeedsAtLiveEdgeStateUpdate");
  }

}

- (BOOL)isScrubbing
{
  return BYTE4(self->_liveEdgeTimer);
}

- (void)updateMinMaxTiming
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double Seconds;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  _BOOL4 v32;
  _BOOL4 v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  _OWORD v45[2];
  _BYTE buf[28];
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!-[AVPlayerController isReadyToPlay](self, "isReadyToPlay")
    || !-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    goto LABEL_23;
  }
  -[AVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (!v4)
  {
LABEL_24:
    -[AVPlayerController minTime](self, "minTime", v44);
    +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  -[AVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CMTimeRangeValue");
  }
  else
  {
    memset(v45, 0, sizeof(v45));
    v44 = 0u;
  }

  if ((BYTE12(v44) & 1) == 0
    || (BYTE4(v45[1]) & 1) == 0
    || *((_QWORD *)&v45[1] + 1)
    || (*((_QWORD *)&v45[0] + 1) & 0x8000000000000000) != 0)
  {
LABEL_23:
    v4 = 0;
    goto LABEL_24;
  }
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CACurrentMediaTime();
    -[AVPlayerController player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "seekableTimeRangesLastModifiedTime");
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v9 - v12;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "Modifying seekableTimeRange by: %f", buf, 0xCu);

  }
  -[AVPlayerController minTiming](self, "minTiming");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentValue");
  v15 = v14;

  -[AVPlayerController maxTiming](self, "maxTiming");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentValue");
  v18 = v17;

  *(_OWORD *)buf = v44;
  *(_QWORD *)&buf[16] = *(_QWORD *)&v45[0];
  Seconds = CMTimeGetSeconds((CMTime *)buf);
  *(_OWORD *)buf = v44;
  *(_QWORD *)&buf[16] = *(_QWORD *)&v45[0];
  v20 = CMTimeGetSeconds((CMTime *)buf);
  *(_OWORD *)buf = *(_OWORD *)((char *)v45 + 8);
  *(_QWORD *)&buf[16] = *((_QWORD *)&v45[1] + 1);
  v21 = v20 + CMTimeGetSeconds((CMTime *)buf);
  v22 = CACurrentMediaTime();
  -[AVPlayerController player](self, "player");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "seekableTimeRangesLastModifiedTime");
  v26 = v21 + v22 - v25;

  if (LOBYTE(self->_liveStreamMaxTiming))
    v27 = 0.0;
  else
    v27 = 1.0;
  -[AVPlayerController player](self, "player", v44);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "currentItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "liveUpdateInterval");
  v31 = v30;

  v32 = 1;
  v33 = 1;
  if (fabs(v31) == INFINITY || v31 <= 1.0)
    goto LABEL_28;
  if (vabdd_f64(v15, Seconds) <= v31 + 3.0)
  {
    -[AVPlayerController minTiming](self, "minTiming");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rate");
    v33 = v35 != v27;

  }
  v32 = vabdd_f64(v18, v26) > v31 + 3.0;
  if (v33 || v32)
  {
LABEL_28:
    +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
    +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:", Seconds, v37, v27);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
    +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:", v26, v38, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _AVLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AVPlayerController updateMinMaxTiming]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3776;
      _os_log_impl(&dword_1AC4B1000, v39, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
    }

    _AVLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v31;
      _os_log_impl(&dword_1AC4B1000, v40, OS_LOG_TYPE_DEFAULT, "segmentDuration: %f", buf, 0xCu);
    }

    _AVLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v36, "rate");
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)&buf[4] = v33;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = Seconds;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v42;
      v47 = 2048;
      v48 = v15;
      v49 = 2048;
      v50 = vabdd_f64(v15, Seconds);
      _os_log_impl(&dword_1AC4B1000, v41, OS_LOG_TYPE_DEFAULT, "minTimingNeedsUpdate: %d, new minTiming with minTime: %f, rate: %f, old minTime: %f, delta: %f", buf, 0x30u);
    }

    _AVLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = v32;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = v26;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v18;
      v47 = 2048;
      v48 = vabdd_f64(v18, v26);
      _os_log_impl(&dword_1AC4B1000, v43, OS_LOG_TYPE_DEFAULT, "maxTimingNeedsUpdate: %d, new maxTiming with maxTime: %f old maxTime: %f, delta: %f", buf, 0x26u);
    }

  }
  else
  {
    -[AVPlayerController minTiming](self, "minTiming");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController maxTiming](self, "maxTiming");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v36)
    goto LABEL_24;
LABEL_25:
  if (!v4)
  {
    -[AVPlayerController maxTime](self, "maxTime");
    +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AVPlayerController _setMinTiming:maxTiming:](self, "_setMinTiming:maxTiming:", v36, v4);

}

- (void)updateTiming
{
  void *v3;
  void *v4;
  OpaqueCMTimebase *v5;
  double EffectiveRate;
  double Seconds;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CMTime v18;
  CMTime v19;
  CMTime time;

  if (-[AVPlayerController isReadyToPlay](self, "isReadyToPlay")
    && (-[AVPlayerController player](self, "player"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "currentItem"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = (OpaqueCMTimebase *)objc_msgSend(v4, "timebase"),
        v4,
        v3,
        v5))
  {
    memset(&v19, 0, sizeof(v19));
    CMTimebaseGetTime(&v19, v5);
    EffectiveRate = CMTimebaseGetEffectiveRate(v5);
    if (EffectiveRate == 0.0)
    {
      time = v19;
      Seconds = CMTimeGetSeconds(&time);
      v8 = NAN;
      v9 = 0.0;
    }
    else
    {
      v11 = EffectiveRate;
      +[AVValueTiming currentTimeStamp](AVValueTiming, "currentTimeStamp");
      v13 = v12;
      -[AVPlayerController player](self, "player");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "currentTime");
      else
        memset(&v18, 0, sizeof(v18));
      time = v18;
      v17 = CMTimeGetSeconds(&time);

      time = v19;
      v8 = v13 + fabs((v17 - CMTimeGetSeconds(&time)) / v11);
      Seconds = v17;
      v9 = v11;
    }
  }
  else
  {
    Seconds = NAN;
    v8 = NAN;
    v9 = NAN;
  }
  +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:", Seconds, v8, v9, *(_OWORD *)&v18.value, v18.epoch);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController setTiming:](self, "setTiming:", v10);

}

- (void)setTiming:(id)a3
{
  objc_storeStrong((id *)&self->_externalPlaybackAirPlayDeviceLocalizedName, a3);
}

- (void)_setMinTiming:(id)a3 maxTiming:(id)a4
{
  id v6;

  v6 = a4;
  -[AVPlayerController setMinTiming:](self, "setMinTiming:", a3);
  -[AVPlayerController setMaxTiming:](self, "setMaxTiming:", v6);

}

- (id)currentLegibleMediaSelectionOption
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController _selectedMediaOptionWithMediaCharacteristic:](self, "_selectedMediaOptionWithMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {

    return v3;
  }
  v5 = objc_msgSend(v3, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A748]);

  if ((v5 & 1) == 0)
  {
    v6 = objc_msgSend(v3, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A710]);
    v7 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
    v8 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
    v9 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
    -[AVPlayerController player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "appliesMediaSelectionCriteriaAutomatically");

    v12 = -[AVPlayerController _mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup](self, "_mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup");
    v13 = v12;
    if (v8 != 1 || !v11)
    {
      if ((v6 & 1) != 0)
      {
        if (v7)
          v14 = v12;
        else
          v14 = 1;
        if ((v14 & 1) == 0)
        {
          _AVLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v21 = 136315906;
            v22 = "-[AVPlayerController(AVMediaSelection) currentLegibleMediaSelectionOption]";
            v23 = 2114;
            v24 = v3;
            v25 = 2048;
            v26 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
            v27 = 1024;
            v28 = 0;
            _os_log_error_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_ERROR, "*** %s Received a forced-only media selection (%{public}@) when display type was NOT forced-only (was %ld). mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup: %d. ***", (uint8_t *)&v21, 0x26u);
          }

        }
        if (!v13 || !v7)
          goto LABEL_19;
      }
      else
      {
        if (!v3 && !v7)
        {
LABEL_19:
          objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
          v16 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v19 = (void *)v16;

          v3 = v19;
LABEL_30:
          if (!v3)
          {
            objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
          }
          return v3;
        }
        if (v9 == 2 || !v12)
          goto LABEL_30;
        if (!v7)
        {
          _AVLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v21 = 136315394;
            v22 = "-[AVPlayerController(AVMediaSelection) currentLegibleMediaSelectionOption]";
            v23 = 2114;
            v24 = v3;
            _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "*** %s Received a non-forced-only media selection (%{public}@) from automatic media selection when display type was forced-only. ***", (uint8_t *)&v21, 0x16u);
          }

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  return v3;
}

- (id)currentAudioMediaSelectionOption
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AVPlayerController _selectedMediaOptionWithMediaCharacteristic:](self, "_selectedMediaOptionWithMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController audioMediaSelectionOptions](self, "audioMediaSelectionOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v3))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)hasMediaSelectionOptions
{
  return -[AVPlayerController hasAudioMediaSelectionOptions](self, "hasAudioMediaSelectionOptions")
      || -[AVPlayerController hasLegibleMediaSelectionOptions](self, "hasLegibleMediaSelectionOptions");
}

- (BOOL)hasLegibleMediaSelectionOptions
{
  void *v2;
  BOOL v3;

  -[AVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)legibleMediaSelectionOptions
{
  return self->_legibleMediaSelectionOptions;
}

- (BOOL)hasAudioMediaSelectionOptions
{
  void *v2;
  BOOL v3;

  -[AVPlayerController audioMediaSelectionOptions](self, "audioMediaSelectionOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)audioMediaSelectionOptions
{
  return self->_audioMediaSelectionOptions;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (dyld_program_sdk_at_least() & 1) == 0)
    AVPlayerControllerAutoplayEnabled = 1;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    objc_msgSend(WeakRetained, "setSeekingInternal:", 0);
    v5 = *MEMORY[0x1E0CA2E18];
    v4 = v5;
    v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v3 = v6;
    objc_msgSend(v2, "setSeekToTimeInternal:", &v5);
    *(_OWORD *)(v2 + 172) = v4;
    *(_QWORD *)(v2 + 188) = v3;
    *(_OWORD *)(v2 + 196) = v4;
    *(_QWORD *)(v2 + 212) = v3;
  }

}

- (void)setSeekingInternal:(BOOL)a3
{
  BYTE6(self->_liveEdgeTimer) = a3;
}

- (void)setSeekToTimeInternal:(id *)a3
{
  objc_copyStruct(&self->_presentationSize.height, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekToTimeInternal
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_presentationSize.height, 24, 1, 0);
  return result;
}

void __79__AVPlayerController__updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setExternalPlaybackAirPlayDeviceLocalizedName:", *(_QWORD *)(a1 + 32));

}

- (void)setMinTiming:(id)a3
{
  objc_storeStrong((id *)&self->_timing, a3);
}

- (void)setMaxTiming:(id)a3
{
  objc_storeStrong((id *)&self->_minTiming, a3);
}

- (void)setExternalPlaybackAirPlayDeviceLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_assetBeingPrepared, a3);
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double Seconds;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CMTime time;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v4 = v3;
    v17 = *(_QWORD *)v27;
    v16 = *MEMORY[0x1E0C8A8C0];
    v5 = *MEMORY[0x1E0C8A9D0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "items", v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v8, v16, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v7, "timeRange");
          *(_OWORD *)&time.value = v23;
          time.epoch = v24;
          Seconds = CMTimeGetSeconds(&time);
          objc_msgSend(v7, "timeRange");
        }
        else
        {
          v24 = 0u;
          v25 = 0u;
          v23 = 0u;
          memset(&time, 0, sizeof(time));
          Seconds = CMTimeGetSeconds(&time);
          v21 = 0u;
          memset(v22, 0, sizeof(v22));
        }
        time = *(CMTime *)((char *)v22 + 8);
        +[AVChapter playbackChapterWithStartTime:duration:number:title:imageFaultBlock:](AVChapter, "playbackChapterWithStartTime:duration:number:title:imageFaultBlock:", objc_msgSend(v2, "count") + 1, v11, 0, Seconds, CMTimeGetSeconds(&time));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v13);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_163);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_7;
    block[3] = &unk_1E5BB45E8;
    objc_copyWeak(&v20, (id *)(v14 + 40));
    v19 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v20);
  }

}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__AVPlayerController__updatePlayingOnMatchPointDeviceIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPlayingOnMatchPointDevice:", *(unsigned __int8 *)(a1 + 40));

}

- (double)defaultPlaybackRate
{
  void *v2;
  float v3;
  double v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultRate");
  v4 = v3;

  return v4;
}

- (id)loadedTimeRanges
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  CMTime v19;
  __int128 v20;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController isReadyToPlay](self, "isReadyToPlay"))
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loadedTimeRanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVPlayerController contentDuration](self, "contentDuration");
    if (v5)
    {
      v7 = v6;
      v8 = 0;
      if (objc_msgSend(v5, "count") && v7 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v5;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              memset(v21, 0, sizeof(v21));
              v20 = 0u;
              if (v15)
                objc_msgSend(v15, "CMTimeRangeValue");
              *(_OWORD *)&v19.value = v20;
              v19.epoch = *(_QWORD *)&v21[0];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v19) / v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v16);

              v19 = *(CMTime *)((char *)v21 + 8);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v19) / v7);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v17);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v12);
        }

        v8 = (void *)objc_msgSend(v9, "copy");
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)canTogglePlayback
{
  _BOOL4 v3;

  v3 = -[AVPlayerController isReadyToPlay](self, "isReadyToPlay");
  if (v3)
    LOBYTE(v3) = !-[AVPlayerController isPictureInPictureInterrupted](self, "isPictureInPictureInterrupted");
  return v3;
}

- (BOOL)canSeek
{
  int32_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  CMTime v13;
  CMTime time1;
  __int128 v15;
  _OWORD v16[2];

  v3 = -[AVPlayerController isReadyToPlay](self, "isReadyToPlay");
  if (v3)
  {
    if (-[AVPlayerController touchBarRequiresLinearPlayback](self, "touchBarRequiresLinearPlayback")
      || -[AVPlayerController isPictureInPictureInterrupted](self, "isPictureInPictureInterrupted"))
    {
      goto LABEL_4;
    }
    if (-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
    {
      LOBYTE(v3) = -[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent");
      return v3;
    }
    memset(v16, 0, sizeof(v16));
    v15 = 0u;
    -[AVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "CMTimeRangeValue");
    }
    else
    {
      memset(v16, 0, sizeof(v16));
      v15 = 0u;
    }

    v7 = HIDWORD(v15);
    if ((BYTE12(v15) & 1) == 0)
    {
LABEL_12:
      LOBYTE(v3) = 1;
      return v3;
    }
    v8 = DWORD1(v16[1]);
    v9 = BYTE4(v16[1]) & 1;
    v10 = *((_QWORD *)&v16[1] + 1);
    v11 = *((_QWORD *)&v16[0] + 1);
    if ((BYTE4(v16[1]) & 1) != 0 && !*((_QWORD *)&v16[1] + 1) && (*((_QWORD *)&v16[0] + 1) & 0x8000000000000000) == 0)
    {
      time1 = *(CMTime *)((char *)v16 + 8);
      v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v3 = CMTimeCompare(&time1, &v13);
      if (!v3)
        return v3;
      v7 = HIDWORD(v15);
      if ((BYTE12(v15) & 1) == 0)
        goto LABEL_12;
      v8 = DWORD1(v16[1]);
      v10 = *((_QWORD *)&v16[1] + 1);
      v11 = *((_QWORD *)&v16[0] + 1);
      v9 = BYTE4(v16[1]) & 1;
    }
    LOBYTE(v3) = 1;
    if (v9 && !v10 && (v11 & 0x8000000000000000) == 0)
    {
      if ((~v7 & 0x11) == 0)
      {
LABEL_4:
        LOBYTE(v3) = 0;
        return v3;
      }
      LOBYTE(v3) = (~v8 & 0x11) != 0;
    }
  }
  return v3;
}

- (BOOL)isPictureInPictureInterrupted
{
  return self->_pictureInPictureInterrupted;
}

- (BOOL)touchBarRequiresLinearPlayback
{
  return LOBYTE(self->_defaultPlaybackRate);
}

- (id)seekableTimeRanges
{
  void *v2;
  void *v3;
  void *v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seekableTimeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setupInterstitialController
{
  AVInterstitialController *v3;
  void *v4;
  NSString *pipActivitySessionIdentifier;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = objc_alloc_init(AVInterstitialController);
  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInterstitialController setPlayer:](v3, "setPlayer:", v4);

  -[AVPlayerController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("interstitialController"));
  objc_storeStrong((id *)&self->_pipActivitySessionIdentifier, v3);
  -[AVPlayerController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("interstitialController"));
  objc_initWeak(&location, self);
  pipActivitySessionIdentifier = self->_pipActivitySessionIdentifier;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__AVPlayerController__setupInterstitialController__block_invoke;
  v6[3] = &unk_1E5BB47C0;
  objc_copyWeak(&v7, &location);
  -[NSString setDidLeaveRequiredInterstitialTimeRangeBlock:](pipActivitySessionIdentifier, "setDidLeaveRequiredInterstitialTimeRangeBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (BOOL)isPlayingOnMatchPointDevice
{
  return self->_compatibleWithAirPlayVideo;
}

+ (id)keyPathsForValuesAffectingHasLegibleMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("legibleMediaSelectionOptions"));
}

+ (id)keyPathsForValuesAffectingHasAudioMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("audioMediaSelectionOptions"));
}

+ (id)keyPathsForValuesAffectingSeekableTimeRanges
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.seekableTimeRanges"));
}

+ (id)keyPathsForValuesAffectingReversePlaybackEndTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.reversePlaybackEndTime"));
}

+ (id)keyPathsForValuesAffectingReadyToPlay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("status"));
}

+ (id)keyPathsForValuesAffectingHasEnabledVideo
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.hasEnabledVideo"));
}

+ (id)keyPathsForValuesAffectingHasEnabledAudio
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.hasEnabledAudio"));
}

+ (id)keyPathsForValuesAffectingForwardPlaybackEndTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.forwardPlaybackEndTime"));
}

+ (id)keyPathsForValuesAffectingContentDuration
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.duration"));
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  if (LOBYTE(self->_rateBeforeForceScanning) != a3)
  {
    v3 = a3;
    LOBYTE(self->_rateBeforeForceScanning) = a3;
    -[AVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v3)
    {
      BYTE1(self->_rateBeforeForceScanning) = objc_msgSend(v5, "preventsDisplaySleepDuringVideoPlayback");

      -[AVPlayerController player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v6 = 0;
    }
    else
    {
      v6 = BYTE1(self->_rateBeforeForceScanning);
    }
    objc_msgSend(v5, "setPreventsDisplaySleepDuringVideoPlayback:", v6);

  }
}

- (void)setInternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_timecodeController, a3);
}

- (void)startInspectionIfNeeded
{
  double activeRate;
  void *v4;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *internalDelegate;
  double v12;
  NSString *pipActivitySessionIdentifier;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!-[AVPlayerController isInspectionSuspended](self, "isInspectionSuspended")
    && !-[AVPlayerController hasBegunInspection](self, "hasBegunInspection")
    && !self->_isDeallocating)
  {
    -[AVPlayerController setHasBegunInspection:](self, "setHasBegunInspection:", 1);
    objc_initWeak(&location, self);
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0CA2E78], 0, 0, &__block_literal_global_31_21675);
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0CA2E88], 0, 0, &__block_literal_global_31_21675);
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC78], 0, 0, &__block_literal_global_32_21676);
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC48], 0, 0, &__block_literal_global_33_21677);
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC88], *(_QWORD *)&self->_canTogglePictureInPicture, 0, &__block_literal_global_35_21678);
    activeRate = self->_activeRate;
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C896F0], v4, 0, &__block_literal_global_39_21679);

    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C99720], 0, 0, &__block_literal_global_50_21680);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_captionAppearanceSettingsChangeNotificationCallback, (CFStringRef)*MEMORY[0x1E0CC1CA0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_audibleMediaSettingsChangeNotificationCallback, (CFStringRef)*MEMORY[0x1E0CC1C98], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[AVPlayerController startKVO](self, "startKVO");
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC68], 0, 0, &__block_literal_global_52_21681);
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVAirMessageDispatcherDidChangeTargetNotification"), 0, 0, &__block_literal_global_54);
    v7 = self->_activeRate;
    objc_msgSend(*(id *)&self->_canTogglePictureInPicture, "_playbackCoordinatorWithoutTriggeringFullSetup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)&v7, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC00], v8, 0, &__block_literal_global_56);

    -[AVPlayerController _updateCoordinatedPlaybackActive](self, "_updateCoordinatedPlaybackActive");
    -[AVPlayerController _updatePhotosensitivityRegions](self, "_updatePhotosensitivityRegions");
    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AB38], 0, 0, &__block_literal_global_58);
    v9 = *(_QWORD *)&self->_canTogglePictureInPicture;
    if (v9)
      v10 = (id)objc_msgSend(*(id *)&self->_activeRate, "startObserving:keyPath:includeInitialValue:observationHandler:", v9, CFSTR("muted"), 1, &__block_literal_global_64);
    internalDelegate = self->_internalDelegate;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __45__AVPlayerController_startInspectionIfNeeded__block_invoke_4_65;
    v21 = &unk_1E5BB4A40;
    objc_copyWeak(&v22, &location);
    dispatch_async(internalDelegate, &v18);
    -[AVPlayerController _setupInterstitialController](self, "_setupInterstitialController", v18, v19, v20, v21);
    v12 = self->_activeRate;
    pipActivitySessionIdentifier = self->_pipActivitySessionIdentifier;
    v24[0] = CFSTR("interstitialPlayer.rate");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(*(id *)&v12, "startObserving:keyPaths:observationHandler:", pipActivitySessionIdentifier, v14, &__block_literal_global_71);

    objc_msgSend(*(id *)&self->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVKitCurrentInterstitialEventChangedNotification"), self->_pipActivitySessionIdentifier, 0, &__block_literal_global_72);
    -[AVPlayerController internalDelegate](self, "internalDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(pipActivitySessionIdentifier) = objc_opt_respondsToSelector();

    if ((pipActivitySessionIdentifier & 1) != 0)
    {
      -[AVPlayerController internalDelegate](self, "internalDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerControllerDidCompleteInspection:", self);

    }
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (AVPlayerControllerDelegate)internalDelegate
{
  return (AVPlayerControllerDelegate *)objc_loadWeakRetained((id *)&self->_timecodeController);
}

- (BOOL)isInspectionSuspended
{
  return self->_inspectionSuspended;
}

- (void)setInspectionSuspended:(BOOL)a3
{
  if (self->_inspectionSuspended != a3)
  {
    self->_inspectionSuspended = a3;
    if (!a3)
    {
      if (-[AVPlayerController hasBegunInspection](self, "hasBegunInspection"))
        -[AVPlayerController _prepareAssetForInspectionIfNeeded](self, "_prepareAssetForInspectionIfNeeded");
      else
        -[AVPlayerController startInspectionIfNeeded](self, "startInspectionIfNeeded");
    }
  }
}

- (BOOL)hasBegunInspection
{
  return self->_hasProtectedContent;
}

- (void)setHandlesAudioSessionInterruptions:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_handlesAudioSessionInterruptions != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      v7 = 136315650;
      v8 = "-[AVPlayerController(AVPlayerControllerExternalPlaybackSupportInternal) setHandlesAudioSessionInterruptions:]";
      v10 = "handlesAudioSessionInterruptions";
      v9 = 2080;
      if (v3)
        v6 = "YES";
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_handlesAudioSessionInterruptions = v3;
  }
}

- (AVPlayerController)initWithPlayer:(id)a3
{
  id v5;
  NSObject *v6;
  AVPlayerController *v7;
  AVPlayerController *v8;
  AVObservationController *v9;
  double activeRate;
  void *v11;
  uint64_t v12;
  AVCoordinatedPlaybackSuspension *scrubCoordinatorSuspension;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AVPlayerController initWithPlayer:]";
    v18 = 2048;
    v19 = v5;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s player: %p", buf, 0x16u);
  }

  v15.receiver = self;
  v15.super_class = (Class)AVPlayerController;
  v7 = -[AVPlayerController init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AVPlayerController _commonInit](v7, "_commonInit");
    v8->_inspectionSuspended = 1;
    v9 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v8);
    activeRate = v8->_activeRate;
    *(_QWORD *)&v8->_activeRate = v9;

    v8->_availableMetadataFormats = (NSArray *)0x7FF8000000000000;
    BYTE5(v8->_liveEdgeTimer) = objc_msgSend((id)objc_opt_class(), "cachedIsPictureInPictureSupported");
    v8->_handlesAudioSessionInterruptions = 0;
    objc_storeStrong((id *)&v8->_canTogglePictureInPicture, a3);
    LOBYTE(v8->_liveStreamMaxTiming) = 1;
    BYTE1(v8->_liveEdgeTimer) = 0;
    BYTE3(v8->_photosensitivityMetadataHandler) = 0;
    -[AVPlayerController startInspectionIfNeeded](v8, "startInspectionIfNeeded");
    objc_msgSend(*(id *)&v8->_activeRate, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0C8AC28], 0, 0, &__block_literal_global_21704);
    objc_msgSend(v5, "backgroundPIPAuthorizationToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    scrubCoordinatorSuspension = v8->_scrubCoordinatorSuspension;
    v8->_scrubCoordinatorSuspension = (AVCoordinatedPlaybackSuspension *)v12;

    v8->_seekTimer = (OS_dispatch_source *)MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
    -[AVPlayerController _updateActivePlayer](v8, "_updateActivePlayer");
  }

  return v8;
}

- (void)_updateActivePlayer
{
  AVPlayer *player;
  void *v4;
  AVPlayer *v5;
  void *v6;
  id v7;

  if (-[AVPlayerController _mainPlayerIsWaitingForInterstitialPlayback](self))
  {
    player = self->_player;
    -[AVPlayerController interstitialController](self, "interstitialController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interstitialPlayer");
    v5 = (AVPlayer *)objc_claimAutoreleasedReturnValue();

    if (player == v5)
      return;
    -[AVPlayerController interstitialController](self, "interstitialController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interstitialPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController setActivePlayer:](self, "setActivePlayer:", v6);

  }
  else
  {
    -[AVPlayerController player](self, "player");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController setActivePlayer:](self, "setActivePlayer:");
  }

}

- (void)setActivePlayer:(id)a3
{
  AVPlayer *v5;
  AVPlayer **p_player;
  NSObject *v7;
  AVPlayer *v8;
  int v9;
  const char *v10;
  __int16 v11;
  AVPlayer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (AVPlayer *)a3;
  if (self->_player != v5)
  {
    p_player = &self->_player;
    objc_storeStrong((id *)p_player, a3);
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_player;
      v9 = 136315394;
      v10 = "-[AVPlayerController setActivePlayer:]";
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s Updated player to: %@ player", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_commonInit
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *seekQueue;
  NSObject *v6;
  AVAsset *v7;
  AVAsset *currentAssetIfReady;
  NSObject *v9;
  NSObject *v10;
  AVPlayerControllerDelegate *v11;
  AVPlayerControllerDelegate *internalDelegate;
  uint64_t v13;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avkit.seekQueue", v3);
  seekQueue = self->_seekQueue;
  self->_seekQueue = v4;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (AVAsset *)dispatch_queue_create("com.apple.avkit.playerControllerAssetInspectionQueue", v6);
  currentAssetIfReady = self->_currentAssetIfReady;
  self->_currentAssetIfReady = v7;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (AVPlayerControllerDelegate *)dispatch_queue_create("com.apple.avkit.playerControllerBackgroundQueue", v10);
  internalDelegate = self->_internalDelegate;
  self->_internalDelegate = v11;

  self->_reduceResourceUsageAssertion = (BSSimpleAssertion *)0x3FF0000000000000;
  self->_currentVideoTrack = (AVAssetTrack *)0x7FF8000000000000;
  v13 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_presentationSize.height = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&self->_seekToTimeInternal.timescale = *(_QWORD *)(v13 + 16);
  self->_captionAppearanceDisplayType = 0x7FF8000000000000;
  BYTE2(self->_photosensitivityMetadataHandler) = 1;
}

+ (BOOL)cachedIsPictureInPictureSupported
{
  return AVPlayerControllerCachedIsPictureInPictureSupported;
}

void __30__AVPlayerController_startKVO__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_observeValueForKeyPath:oldValue:newValue:", CFSTR("isPiPAvailable"), 0, v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "observationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "startObserving:keyPath:includeInitialValue:observationHandler:", v7, CFSTR("audioFormats"), 0, *(_QWORD *)(a1 + 32));

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "observationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "startObserving:keyPath:includeInitialValue:observationHandler:", v10, CFSTR("isPiPAvailable"), 0, *(_QWORD *)(a1 + 32));

}

- (void)setHasBegunInspection:(BOOL)a3
{
  self->_hasProtectedContent = a3;
}

- (void)setCoordinatedPlaybackActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_allowsPictureInPicturePlayback != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVPlayerController setCoordinatedPlaybackActive:]";
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s coordinatedPlaybackActive set to %d", (uint8_t *)&v6, 0x12u);
    }

    self->_allowsPictureInPicturePlayback = v3;
  }
}

- (void)_updatePhotosensitivityRegions
{
  void *v3;
  AVPlayerItemPhotosensitivityMetadataHandler *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *updatePlayingOnMatchPointDeviceThrottleTimer;
  NSTimer *v8;
  NSTimer *v9;

  -[AVPlayerController setPhotosensitivityRegions:](self, "setPhotosensitivityRegions:", 0);
  if (_AXSPhotosensitiveMitigationEnabled())
  {
    -[AVPlayerController observationController](self, "observationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startObservingNotificationForName:object:notificationCenter:observationHandler:", CFSTR("AVPlayerItemPhotosensitiveRegionsChangedNotification"), 0, 0, &__block_literal_global_307);

    v4 = [AVPlayerItemPhotosensitivityMetadataHandler alloc];
    -[AVPlayerController player](self, "player");
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    -[NSTimer currentItem](v9, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AVPlayerItemPhotosensitivityMetadataHandler initWithPlayerItem:](v4, "initWithPlayerItem:", v5);
    updatePlayingOnMatchPointDeviceThrottleTimer = self->_updatePlayingOnMatchPointDeviceThrottleTimer;
    self->_updatePlayingOnMatchPointDeviceThrottleTimer = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_updatePlayingOnMatchPointDeviceThrottleTimer;
    self->_updatePlayingOnMatchPointDeviceThrottleTimer = 0;
  }

}

- (void)setPhotosensitivityRegions:(id)a3
{
  objc_storeStrong((id *)&self->_playerLayerForReducingResources, a3);
}

- (void)_updateCoordinatedPlaybackActive
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)&self->_canTogglePictureInPicture, "_playbackCoordinatorWithoutTriggeringFullSetup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "otherParticipants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  -[AVPlayerController setCoordinatedPlaybackActive:](self, "setCoordinatedPlaybackActive:", v5);
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_23(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCompatibleWithAirPlayVideo:", objc_msgSend(*(id *)(a1 + 32), "isCompatibleWithAirPlayVideo"));

}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_15(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHasProtectedContent:", objc_msgSend(*(id *)(a1 + 32), "hasProtectedContent"));

}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setComposable:", objc_msgSend(*(id *)(a1 + 32), "isComposable"));

}

+ (id)keyPathsForValuesAffectingLoadedTimeRanges
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.currentItem.loadedTimeRanges"), CFSTR("readyToPlay"), CFSTR("contentDuration"), 0);
}

+ (id)keyPathsForValuesAffectingCurrentVideoMediaSelectionOption
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("visualMediaSelectionOptions"), CFSTR("currentAssetIfReady"), 0);
}

+ (id)keyPathsForValuesAffectingHasMediaSelectionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hasAudioMediaSelectionOptions"), CFSTR("hasLegibleMediaSelectionOptions"), 0);
}

+ (id)keyPathsForValuesAffectingCanTogglePlayback
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("readyToPlay"), CFSTR("pictureInPictureInterrupted"), 0);
}

+ (id)keyPathsForValuesAffectingCanSeek
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("seekableTimeRanges"), CFSTR("readyToPlay"), CFSTR("hasLiveStreamingContent"), CFSTR("hasSeekableLiveStreamingContent"), CFSTR("touchBarRequiresLinearPlayback"), CFSTR("pictureInPictureInterrupted"), 0);
}

+ (id)keyPathsForValuesAffectingActiveRate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("activePlayer.rate"), 0);
}

+ (id)keyPathsForValuesAffectingExternalPlaybackType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.externalPlaybackActive"), CFSTR("playingOnSecondScreen"), 0);
}

+ (id)keyPathsForValuesAffectingTimeControlStatus
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.timeControlStatus"), CFSTR("interstitialController.interstitialPlayer.timeControlStatus"), 0);
}

+ (id)keyPathsForValuesAffectingMinTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("reversePlaybackEndTime"), CFSTR("hasSeekableLiveStreamingContent"), CFSTR("minTiming"), 0);
}

+ (id)keyPathsForValuesAffectingCurrentAudioMediaSelectionOption
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentAssetIfReady"), 0);
}

+ (id)keyPathsForValuesAffectingMaxTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("forwardPlaybackEndTime"), CFSTR("contentDuration"), CFSTR("hasSeekableLiveStreamingContent"), CFSTR("maxTiming"), 0);
}

+ (id)keyPathsForValuesAffectingCurrentLegibleMediaSelectionOption
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.appliesMediaSelectionCriteriaAutomatically"), CFSTR("currentAssetIfReady"), CFSTR("player.currentItem.currentMediaSelection"), CFSTR("captionAppearanceDisplayType"), 0);
}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.status"), CFSTR("player.currentItem"), CFSTR("player.currentItem.status"), 0);
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_19(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "availableMetadataFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAvailableMetadataFormats:", v2);

}

- (BOOL)isMuted
{
  return (BOOL)self->_photosensitivityMetadataHandler;
}

- (void)setMuted:(BOOL)a3
{
  if (LOBYTE(self->_photosensitivityMetadataHandler) != a3)
  {
    LOBYTE(self->_photosensitivityMetadataHandler) = a3;
    -[AVPlayerController _updatePlayerMutedState](self, "_updatePlayerMutedState");
  }
}

- (void)_updatePlayerMutedState
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!BYTE1(self->_photosensitivityMetadataHandler))
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (LOBYTE(self->_photosensitivityMetadataHandler))
    {
      if ((objc_msgSend(v3, "isMuted") & 1) == 0)
      {
        v5 = 1;
LABEL_6:
        _AVLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315650;
          v8 = "-[AVPlayerController _updatePlayerMutedState]";
          v9 = 2112;
          v10 = v4;
          v11 = 1024;
          v12 = v5;
          _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s Updating %@ muted state to %d", (uint8_t *)&v7, 0x1Cu);
        }

        BYTE1(self->_photosensitivityMetadataHandler) = 1;
        objc_msgSend(v4, "setMuted:", v5);
        BYTE1(self->_photosensitivityMetadataHandler) = 0;
      }
    }
    else
    {
      v5 = BYTE2(self->_photosensitivityMetadataHandler) == 0;
      if (objc_msgSend(v3, "isMuted") != v5)
        goto LABEL_6;
    }

  }
}

+ (id)_sortedAudibleOption:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_38);
}

- (id)_outputContext
{
  void *v2;
  void *v3;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updatePlayingOnMatchPointDeviceIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  _QWORD block[4];
  id v13;
  char v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AVPlayerController _outputContext](self, "_outputContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "deviceSubType");
        if (v10 <= 0x11 && ((1 << v10) & 0x30800) != 0)
          v7 = 1;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVPlayerController__updatePlayingOnMatchPointDeviceIfNeeded__block_invoke;
  block[3] = &unk_1E5BB4CC8;
  objc_copyWeak(&v13, &location);
  v14 = v7 & 1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  id *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_loadWeakRetained(a1 + 5);
  v4 = a1 + 6;
  v5 = objc_loadWeakRetained(a1 + 6);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(WeakRetained, "asset");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v3)
    {
      objc_msgSend(&unk_1E5BF4140, "arrayByAddingObject:", CFSTR("preferredDisplayCriteria"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2;
      v9[3] = &unk_1E5BB4770;
      objc_copyWeak(&v12, v4);
      v10 = v3;
      v11 = WeakRetained;
      objc_msgSend(v10, "loadValuesAsynchronouslyForKeys:completionHandler:", v8, v9);

      objc_destroyWeak(&v12);
    }
  }

}

- (void)_updateMetadata
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  AVPlayerController *val;
  void *v14;
  _QWORD block[4];
  id v16;
  id location;
  _QWORD v18[4];
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    val = self;
    v4 = dispatch_group_create();
    v14 = v3;
    objc_msgSend(v3, "commonMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
          dispatch_group_enter(v4);
          v18[0] = v7;
          v18[1] = 3221225472;
          v18[2] = __37__AVPlayerController__updateMetadata__block_invoke;
          v18[3] = &unk_1E5BB4CA0;
          v19 = v4;
          objc_msgSend(v11, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF40F8, v18);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }
    objc_initWeak(&location, val);
    dispatch_get_global_queue(21, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __37__AVPlayerController__updateMetadata__block_invoke_2;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v16, &location);
    dispatch_group_notify(v4, v12, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    v3 = v14;
  }

}

+ (id)keyPathsForValuesAffectingContentDimensions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("readyToPlay");
  v6[1] = CFSTR("presentationSize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_optionsForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __SCNetworkReachability *v7;
  const __SCNetworkReachability *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  SCNetworkReachabilityFlags flags;
  _BYTE v39[128];
  sockaddr address;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(v5, "assetCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPlayableOffline") & 1) == 0)
  {

    goto LABEL_9;
  }
  *(_QWORD *)&address.sa_len = 528;
  *(_QWORD *)&address.sa_data[6] = 0;
  v7 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &address);
  if (v7)
  {
    v8 = v7;
    flags = 0;
    if (SCNetworkReachabilityGetFlags(v7, &flags))
    {
      v9 = flags;
      if ((flags & 6) == 2)
      {
        CFRelease(v8);

        if ((v9 & 0x10) != 0)
          goto LABEL_12;
LABEL_9:
        objc_msgSend(v4, "options");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    CFRelease(v8);
  }

LABEL_12:
  objc_msgSend(v5, "assetCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaSelectionOptionsInMediaSelectionGroup:", v4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = MEMORY[0x1E0C9AA60];
  if (v12)
    v15 = (void *)v12;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v15;

  v16 = (void *)MEMORY[0x1E0C99E20];
  v33 = v4;
  objc_msgSend(v4, "options");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = v17;
  else
    v19 = v14;
  objc_msgSend(v16, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minusSet:", v21);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    v26 = *MEMORY[0x1E0C8A7B8];
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v28, "mediaType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", v26);

        if (v30)
        {
          objc_msgSend(v10, "arrayByAddingObject:", v28);
          v31 = objc_claimAutoreleasedReturnValue();

          v10 = (id)v31;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v24);
  }

  v4 = v33;
LABEL_28:

  return v10;
}

+ (id)keyPathsForValuesAffectingHasLiveStreamingContent
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("readyToPlay");
  v6[1] = CFSTR("player.currentItem.duration");
  v6[2] = CFSTR("hasEnabledVideo");
  v6[3] = CFSTR("hasEnabledAudio");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __30__AVPlayerController_startKVO__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPiPAvailable");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AVPlayerController_startKVO__block_invoke_3;
  block[3] = &unk_1E5BB4478;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = v3;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

+ (id)keyPathsForValuesAffectingHasSeekableLiveStreamingContent
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("hasLiveStreamingContent");
  v6[1] = CFSTR("minTiming");
  v6[2] = CFSTR("maxTiming");
  v6[3] = CFSTR("player.currentItem.liveUpdateInterval");
  v6[4] = CFSTR("player.currentItem.seekableTimeRangesLastModifiedTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLegibleMediaSelectionOptions:(id)a3
{
  NSArray *v5;
  NSArray **p_legibleMediaSelectionOptions;
  NSArray *legibleMediaSelectionOptions;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  legibleMediaSelectionOptions = self->_legibleMediaSelectionOptions;
  p_legibleMediaSelectionOptions = &self->_legibleMediaSelectionOptions;
  if (legibleMediaSelectionOptions != v5)
  {
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaSelectionOptions:]";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s LegibleMediaSelectionOptions: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)p_legibleMediaSelectionOptions, a3);
  }

}

- (void)setAudioMediaSelectionOptions:(id)a3
{
  NSArray *v5;
  NSArray **p_audioMediaSelectionOptions;
  NSArray *audioMediaSelectionOptions;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  audioMediaSelectionOptions = self->_audioMediaSelectionOptions;
  p_audioMediaSelectionOptions = &self->_audioMediaSelectionOptions;
  if (audioMediaSelectionOptions != v5)
  {
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[AVPlayerController(AVMediaSelection) setAudioMediaSelectionOptions:]";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioMediaSelectionOptions: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)p_audioMediaSelectionOptions, a3);
  }

}

void __30__AVPlayerController_startKVO__block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded");

}

- (void)_updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController isExternalPlaybackActive](self, "isExternalPlaybackActive")
    && -[AVPlayerController externalPlaybackType](self, "externalPlaybackType") == 1)
  {
    -[AVPlayerController _outputContext](self, "_outputContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[AVPlayerController _updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded]";
      v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Using output context %@", buf, 0x16u);
    }

    if (objc_msgSend(v3, "supportsMultipleOutputDevices"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v18 = v3;
      objc_msgSend(v3, "outputDevices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "deviceName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(v11, "copy");
            v13 = v12;
            if (v12)
            {
              v14 = v12;
            }
            else
            {
              AVLocalizedString(CFSTR("EXTERNAL_PLAYBACK_DEVICE_NAME_NIL"));
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            v15 = v14;

            objc_msgSend(v5, "addObject:", v15);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v8);
      }

      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" + "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v18;
    }
    else
    {
      objc_msgSend(v3, "deviceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = 0;
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerController__updateExternalPlaybackAirPlayDeviceLocalizedNameIfNeeded__block_invoke;
  block[3] = &unk_1E5BB45E8;
  objc_copyWeak(&v21, (id *)buf);
  v20 = v16;
  v17 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("und"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "avkit_chapterMetadataGroupsBestMatchingPreferredLanguages:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  v7 = MEMORY[0x1E0C809B0];
  v21 = v6;
  if (v6)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        v22 = v8;
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v9, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
              dispatch_group_enter(v5);
              v26[0] = v7;
              v26[1] = 3221225472;
              v26[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_4;
              v26[3] = &unk_1E5BB4CA0;
              v27 = v5;
              objc_msgSend(v15, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E5BF4068, v26);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v12);
        }

        v8 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v21);
  }

  dispatch_get_global_queue(21, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_5;
  block[3] = &unk_1E5BB45E8;
  v24 = obj;
  v17 = obj;
  objc_copyWeak(&v25, (id *)(a1 + 40));
  dispatch_group_notify(v5, v16, block);

  objc_destroyWeak(&v25);
}

void __40__AVPlayerController_updateAtMinMaxTime__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CMTime v17;
  CMTime time1;
  CMTime time2;
  CMTime v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "isReadyToPlay"))
  {
    v5 = 0;
LABEL_10:
    v8 = 0;
    goto LABEL_15;
  }
  memset(&v20, 0, sizeof(v20));
  objc_msgSend(WeakRetained, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentTime");
  else
    memset(&v20, 0, sizeof(v20));

  if ((objc_msgSend(WeakRetained, "isLooping") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    playbackMinTimeForPlayerItem((uint64_t)&time2, v7);
    time1 = v20;
    v5 = CMTimeCompare(&time1, &time2) < 1;

  }
  if ((objc_msgSend(WeakRetained, "isLooping") & 1) != 0)
    goto LABEL_10;
  objc_msgSend(WeakRetained, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "duration");
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  playbackMaxTimeForPlayerItemAndContentDuration((uint64_t)&v17, v10, (uint64_t)&v14);
  time1 = v20;
  v8 = CMTimeCompare(&time1, &v17) >= 0;

LABEL_15:
  objc_msgSend(WeakRetained, "setAtMinTime:", v5, v14, v15, v16);
  objc_msgSend(WeakRetained, "setAtMaxTime:", v8);

}

- (void)updateAtMinMaxTime
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__AVPlayerController_updateAtMinMaxTime__block_invoke;
  v2[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)setSeekToTime:(double)a3
{
  *(double *)&self->_currentVideoTrack = a3;
}

- (void)setPictureInPictureInterrupted:(BOOL)a3
{
  if (self->_pictureInPictureInterrupted != a3)
  {
    self->_pictureInPictureInterrupted = a3;
    if (a3)
    {
      if (-[AVPlayerController isPlaying](self, "isPlaying"))
        -[AVPlayerController pauseForAllCoordinatedPlaybackParticipants:](self, "pauseForAllCoordinatedPlaybackParticipants:", 0);
    }
  }
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  self->_seeking = a3;
}

- (void)setCanTogglePictureInPicture:(BOOL)a3
{
  self->_composable = a3;
}

- (void)setAtMinTime:(BOOL)a3
{
  BYTE3(self->_liveEdgeTimer) = a3;
}

- (void)setAtMaxTime:(BOOL)a3
{
  BYTE2(self->_liveEdgeTimer) = a3;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  self->_seekingInternal = a3;
}

- (NSString)externalPlaybackAirPlayDeviceLocalizedName
{
  return (NSString *)&self->_assetBeingPrepared->super.isa;
}

- (BOOL)coordinatedPlaybackActive
{
  return self->_allowsPictureInPicturePlayback;
}

+ (id)keyPathsForValuesAffectingUsesExternalPlaybackWhileExternalScreenIsActive
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.usesExternalPlaybackWhileExternalScreenIsActive"));
}

+ (id)keyPathsForValuesAffectingRate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("activePlayer.rate"));
}

+ (id)keyPathsForValuesAffectingPlaying
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("rate"));
}

+ (id)keyPathsForValuesAffectingPlayingOnExternalScreen
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("externalPlaybackActive"), CFSTR("playingOnSecondScreen"), 0);
}

+ (id)keyPathsForValuesAffectingPictureInPicturePossible
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("pictureInPictureSupported"), CFSTR("status"), CFSTR("hasVideo"), CFSTR("hasEnabledVideo"), CFSTR("playingOnExternalScreen"), CFSTR("pipActivitySessionIdentifier"), 0);
}

+ (id)keyPathsForValuesAffectingHasVideo
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem.hasVideo"));
}

+ (id)keyPathsForValuesAffectingExternalPlaybackActive
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.externalPlaybackActive"));
}

+ (id)keyPathsForValuesAffectingDefaultPlaybackRate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.defaultRate"), 0);
}

+ (id)keyPathsForValuesAffectingAllowsExternalPlayback
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.allowsExternalPlayback"));
}

- (BOOL)closedCaptionsEnabled
{
  return _AXSClosedCaptionsEnabled() != 0;
}

- (void)setVisualMediaSelectionOptions:(id)a3
{
  NSArray *v5;
  NSArray **p_visualMediaSelectionOptions;
  NSArray *visualMediaSelectionOptions;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSArray *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  visualMediaSelectionOptions = self->_visualMediaSelectionOptions;
  p_visualMediaSelectionOptions = &self->_visualMediaSelectionOptions;
  if (visualMediaSelectionOptions != v5)
  {
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[AVPlayerController(AVMediaSelection) setVisualMediaSelectionOptions:]";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s VisualMediaSelectionOptions: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong((id *)p_visualMediaSelectionOptions, a3);
  }

}

- (void)setCurrentAudioMediaSelectionOption:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0C8A6F0];
  v5 = a3;
  -[AVPlayerController _setMediaOption:mediaCharacteristic:](self, "_setMediaOption:mediaCharacteristic:", v5, v4);
  -[AVPlayerController _setMostRecentChosenOption:](self, "_setMostRecentChosenOption:", v5);

  -[AVPlayerController reloadAudioOptions](self, "reloadAudioOptions");
}

- (void)setCurrentLegibleMediaSelectionOption:(id)a3
{
  MACaptionAppearanceDisplayType DisplayType;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  DisplayType = MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
  if (DisplayType != kMACaptionAppearanceDisplayTypeAlwaysOn)
    LastKnownCaptionAppearanceDisplayType = DisplayType;
  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_offOption");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    -[AVPlayerController _disableLegibleMediaSelectionOptions:](self, "_disableLegibleMediaSelectionOptions:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B200], "avkit_autoOption");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      -[AVPlayerController _enableAutoMediaSelection:](self, "_enableAutoMediaSelection:", self);
    }
    else
    {
      -[AVPlayerController _setMediaOption:mediaCharacteristic:](self, "_setMediaOption:mediaCharacteristic:", v8, *MEMORY[0x1E0C8A770]);
      -[AVPlayerController _setMostRecentChosenOption:](self, "_setMostRecentChosenOption:", v8);
      -[AVPlayerController reloadLegibleOptions](self, "reloadLegibleOptions");
    }
  }
  +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitleAutomaticallyEnabledState:", 0);

}

- (id)mediaSelectionGroupForMediaCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_mediaSelectionGroupForMediaCharacteristic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)selectedMediaOptionMayHaveChanged
{
  -[AVPlayerController selectedMediaOptionMayHaveChanged:](self, "selectedMediaOptionMayHaveChanged:", 0);
}

- (void)reloadOptionsAndCurrentSelections
{
  -[AVPlayerController reloadOptionsAssumingMediaOptionsMayHaveChanged:](self, "reloadOptionsAssumingMediaOptionsMayHaveChanged:", 1);
}

- (void)reloadAudioOptions
{
  id v3;
  id v4;

  kdebug_trace();
  -[AVPlayerController audioOptions](self, "audioOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  if (v4)
    v3 = v4;
  else
    v3 = (id)MEMORY[0x1E0C9AA60];
  -[AVPlayerController setLegibleMediaSelectionOptions:audioMediaSelectionOptions:assumeMediaOptionMayHaveChanged:](self, "setLegibleMediaSelectionOptions:audioMediaSelectionOptions:assumeMediaOptionMayHaveChanged:", 0, v3, 0);

}

- (void)reloadLegibleOptions
{
  id v3;
  NSString *v4;
  NSString *recentLegibleLanguageForLastSort;
  id v6;

  kdebug_trace();
  -[AVPlayerController legibleOptions](self, "legibleOptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  if (v6)
    v3 = v6;
  else
    v3 = (id)MEMORY[0x1E0C9AA60];
  -[AVPlayerController setLegibleMediaSelectionOptions:audioMediaSelectionOptions:assumeMediaOptionMayHaveChanged:](self, "setLegibleMediaSelectionOptions:audioMediaSelectionOptions:assumeMediaOptionMayHaveChanged:", v3, 0, 0);
  objc_msgSend(MEMORY[0x1E0C8B200], "avkit_recentLegibleLanguageCode");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  recentLegibleLanguageForLastSort = self->_recentLegibleLanguageForLastSort;
  self->_recentLegibleLanguageForLastSort = v4;

}

- (void)reloadVisualOptions
{
  id v3;

  -[AVPlayerController visualOptions](self, "visualOptions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController setVisualMediaSelectionOptions:](self, "setVisualMediaSelectionOptions:", v3);

}

- (id)visualOptions
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A788]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "options");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C8B1F8];
    -[AVPlayerController _optionsForGroup:](self, "_optionsForGroup:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playableMediaSelectionOptionsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v5 != v8 && (-[NSObject isEqualToArray:](v5, "isEqualToArray:", v8) & 1) == 0)
    {
      _AVLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = "-[AVPlayerController(AVMediaSelection) visualOptions]";
        v16 = 2114;
        v17 = v5;
        v18 = 2114;
        v19 = v8;
        _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s group.options != playable options from filtered options for group; unfiltered options: %{public}@; filterd "
          "options: %{public}@",
          (uint8_t *)&v14,
          0x20u);
      }

    }
    v10 = MEMORY[0x1E0C9AA60];
    if (v5)
      v10 = v5;
    v11 = v10;

  }
  else
  {
    -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v11 = MEMORY[0x1E0C9AA60];
      goto LABEL_15;
    }
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[AVPlayerController(AVMediaSelection) visualOptions]";
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s currentAsset is ready but reports no media selection group for AVMediaCharacteristicVisual", (uint8_t *)&v14, 0xCu);
    }
    v11 = MEMORY[0x1E0C9AA60];
  }

LABEL_15:
  return v11;
}

- (BOOL)isDisplayingNonForcedOnlyLegibleOption
{
  void *v2;
  void *v3;
  int v4;

  -[AVPlayerController _selectedMediaOptionWithMediaCharacteristic:](self, "_selectedMediaOptionWithMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A710]) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_ensureUserCaptionDisplayType:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType") != a3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = "-[AVPlayerController(AVMediaSelection) _ensureUserCaptionDisplayType:]";
      v8 = 2048;
      v9 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
      v10 = 2048;
      v11 = a3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Changing MACaptionAppearanceDisplayType: %ld -> %ld", (uint8_t *)&v6, 0x20u);
    }

    MACaptionAppearanceSetDisplayType(kMACaptionAppearanceDomainUser, (MACaptionAppearanceDisplayType)a3);
  }
}

- (void)_performAutomaticMediaSelectionForUserCaptionDisplayType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVPlayerController _ensureUserCaptionDisplayType:](self, "_ensureUserCaptionDisplayType:", a3);
  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "selectMediaOptionAutomaticallyInMediaSelectionGroup:", v6);
}

- (void)_disableLegibleMediaSelectionOptions:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[AVPlayerController(AVMediaSelection) _disableLegibleMediaSelectionOptions:]";
    v7 = 1024;
    v8 = 964;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  -[AVPlayerController _performAutomaticMediaSelectionForUserCaptionDisplayType:](self, "_performAutomaticMediaSelectionForUserCaptionDisplayType:", 0);
}

- (void)_enableAutoMediaSelection:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVPlayerController(AVMediaSelection) _enableAutoMediaSelection:]";
    v9 = 1024;
    v10 = 971;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  MACaptionAppearanceCopyPreferredCaptioningMediaCharacteristics(kMACaptionAppearanceDomainUser);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8A780]) & 1) != 0
    || (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8A720]) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8A728]))
  {
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  -[AVPlayerController _performAutomaticMediaSelectionForUserCaptionDisplayType:](self, "_performAutomaticMediaSelectionForUserCaptionDisplayType:", v6);

}

- (BOOL)setLegibleMediaOptionVisibility:(BOOL)a3 prefersLastKnownCaptionType:(BOOL)a4 prefersSystemLanguage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  void *v9;
  int v10;
  int64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  _BOOL4 v22;
  NSObject *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  AVPlayerController *v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  __CFString *v48;
  CFArrayRef v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  void *v62;
  uint64_t v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  uint64_t v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  const char *v87;
  uint64_t v88;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v88 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController player](self, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "appliesMediaSelectionCriteriaAutomatically");

  if (!v10)
  {
    v25 = *MEMORY[0x1E0C8A770];
    -[AVPlayerController _selectedMediaOptionWithMediaCharacteristic:](self, "_selectedMediaOptionWithMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = *MEMORY[0x1E0C8A710];
      if (objc_msgSend(v26, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A710]) == v7)
      {
        v29 = (void *)MEMORY[0x1E0C8B1F8];
        if ((v7 & 1) == 0)
        {
          -[AVPlayerController _playableLegibleMediaSelectionOptions](self, "_playableLegibleMediaSelectionOptions");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "mediaSelectionOptionsFromArray:withMediaCharacteristics:", v30, v31);
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        }
LABEL_44:
        -[AVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "mediaSelectionOptionsFromArray:withoutMediaCharacteristics:", v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
LABEL_45:
        v36 = (void *)v32;

        v37 = self->_lastKnownPersistedExtendedLanguageTag;
        if (!v37)
        {
          objc_msgSend(v27, "locale");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "languageCode");
          v38 = (id)objc_claimAutoreleasedReturnValue();

          if (!v38
            || (-[AVPlayerController _preferredLanguageCodes](self, "_preferredLanguageCodes"),
                v54 = (void *)objc_claimAutoreleasedReturnValue(),
                v55 = objc_msgSend(v54, "containsObject:", v38),
                v54,
                !v55))
          {
            v37 = 0;
LABEL_70:

            goto LABEL_71;
          }
          objc_msgSend(v27, "extendedLanguageTag");
          v37 = (NSString *)objc_claimAutoreleasedReturnValue();

          if (!v37)
          {
LABEL_71:
            v56 = (void *)MEMORY[0x1E0C8B1F8];
            objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "mediaSelectionOptionsFromArray:withLocale:", v36, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "firstObject");
            v52 = (id)objc_claimAutoreleasedReturnValue();

            if (v52 || (v7 & 1) == 0)
            {
LABEL_74:
              _AVLog();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType"
                      ":prefersSystemLanguage:]";
                v74 = 2114;
                v75 = v52;
                _os_log_impl(&dword_1AC4B1000, v59, OS_LOG_TYPE_DEFAULT, "%s Setting legible selection option: %{public}@", buf, 0x16u);
              }

              -[AVPlayerController _setMediaOption:mediaCharacteristic:](self, "_setMediaOption:mediaCharacteristic:", v52, v25);
              if ((v7 & 1) == 0)
                -[AVPlayerController _disableLegibleMediaSelectionOptions:](self, "_disableLegibleMediaSelectionOptions:", 0);
              v24 = 1;
            }
            else
            {
              v52 = 0;
              v24 = 0;
            }

            goto LABEL_80;
          }
        }
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v38 = v36;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        if (v39)
        {
          v40 = v39;
          v62 = v36;
          v63 = v25;
          v64 = v27;
          v41 = *(_QWORD *)v66;
LABEL_48:
          v42 = 0;
          while (1)
          {
            if (*(_QWORD *)v66 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v42);
            objc_msgSend(v43, "extendedLanguageTag");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "isEqualToString:", v37);

            if ((v45 & 1) != 0)
              break;
            if (v40 == ++v42)
            {
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
              if (v40)
                goto LABEL_48;
              v25 = v63;
              v27 = v64;
              v36 = v62;
              goto LABEL_70;
            }
          }
          v52 = v43;

          v25 = v63;
          v27 = v64;
          v36 = v62;
          if (v52)
            goto LABEL_74;
          goto LABEL_71;
        }
        goto LABEL_70;
      }
    }
    else if (v7)
    {
      v29 = (void *)MEMORY[0x1E0C8B1F8];
      v28 = *MEMORY[0x1E0C8A710];
      goto LABEL_44;
    }
    v24 = 0;
LABEL_80:

    return v24;
  }
  v11 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
  v12 = LastKnownCaptionAppearanceDisplayType;
  v13 = -[AVPlayerController isDisplayingNonForcedOnlyLegibleOption](self, "isDisplayingNonForcedOnlyLegibleOption");
  v14 = -[AVPlayerController _willAutomaticallySelectLegibleFallbackForLanguageMismatch](self, "_willAutomaticallySelectLegibleFallbackForLanguageMismatch");
  _AVLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = "NO";
    *(_DWORD *)buf = 136316930;
    v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefersSystemLanguage:]";
    if (v7)
      v17 = "YES";
    else
      v17 = "NO";
    v74 = 2082;
    v75 = (id)v17;
    if (v11)
      v18 = "NO";
    else
      v18 = "YES";
    v76 = 2082;
    v77 = "YES";
    if (v11 == 1)
      v19 = "YES";
    else
      v19 = "NO";
    v78 = 2082;
    if (v11 == 2)
      v20 = "YES";
    else
      v20 = "NO";
    v79 = v18;
    if (v13)
      v21 = "YES";
    else
      v21 = "NO";
    v80 = 2082;
    if (v14)
      v16 = "YES";
    v81 = v19;
    v82 = 2082;
    v83 = v20;
    v84 = 2082;
    v85 = v21;
    v86 = 2082;
    v87 = v16;
    _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "%s Calculating caption appearance type to set, given: visible: %{public}s, playerAppliesMediaSelectionCriteriaAutomatically:%{public}s captionAppearanceDisplayType forcedOnly: %{public}s, automatic: %{public}s, alwaysOn: %{public}s, isDisplayingNonForcedOnlyLegibleOption: %{public}s, willAutomaticallySelectLegibleFallbackForLanguageMismatch: %{public}s", buf, 0x52u);
  }

  if (((v7 ^ 1 | v13) & 1) == 0 && v11 != 2)
  {
    v22 = v12 == 1 && v14;
    if (v22 && v11 != 1 && !v5)
    {
      _AVLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        _os_log_impl(&dword_1AC4B1000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to automatic", buf, 0xCu);
      }
LABEL_31:

      v24 = 1;
      -[AVPlayerController _performAutomaticMediaSelectionForUserCaptionDisplayType:](self, "_performAutomaticMediaSelectionForUserCaptionDisplayType:", 1);
      return v24;
    }
    LastKnownCaptionAppearanceDisplayType = v11;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localeIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVPlayerController canonicalLanguageIdentifierFromString:](AVPlayerController, "canonicalLanguageIdentifierFromString:", v47);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v49 = MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
      _AVLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        v74 = 2114;
        v75 = v48;
        v76 = 2112;
        v77 = (const char *)v49;
        _os_log_impl(&dword_1AC4B1000, v50, OS_LOG_TYPE_DEFAULT, "%s Setting preferred caption language to %{public}@, %@", buf, 0x20u);
      }

      CFRelease(v49);
      MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v48);

    }
    _AVLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefersSystemLanguage:]";
      _os_log_impl(&dword_1AC4B1000, v51, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to always on", buf, 0xCu);
    }

    v34 = self;
    v35 = 2;
    goto LABEL_90;
  }
  v24 = 0;
  if ((v7 & 1) == 0 && v11)
  {
    if (v6)
    {
      _AVLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        _os_log_impl(&dword_1AC4B1000, v33, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type back to last known type", buf, 0xCu);
      }

      v34 = self;
      v35 = v12;
    }
    else
    {
      if (v12 == 1 && !v14 && v11 != 1)
      {
        _AVLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefe"
                "rsSystemLanguage:]";
          _os_log_impl(&dword_1AC4B1000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to automatic", buf, 0xCu);
        }
        goto LABEL_31;
      }
      LastKnownCaptionAppearanceDisplayType = v11;
      _AVLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[AVPlayerController(AVMediaSelection) setLegibleMediaOptionVisibility:prefersLastKnownCaptionType:prefers"
              "SystemLanguage:]";
        _os_log_impl(&dword_1AC4B1000, v60, OS_LOG_TYPE_DEFAULT, "%s Setting caption appearance type to forced only", buf, 0xCu);
      }

      v34 = self;
      v35 = 0;
    }
LABEL_90:
    -[AVPlayerController _performAutomaticMediaSelectionForUserCaptionDisplayType:](v34, "_performAutomaticMediaSelectionForUserCaptionDisplayType:", v35);
    return 1;
  }
  return v24;
}

- (BOOL)subtitlesActive
{
  void *v3;
  int v4;
  int64_t v5;
  int64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "appliesMediaSelectionCriteriaAutomatically");

  v5 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
  v6 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    if (v4)
      v9 = "YES";
    else
      v9 = "NO";
    v13 = 136315906;
    v14 = "-[AVPlayerController(AVMediaSelection) subtitlesActive]";
    if (v5 == 1)
      v10 = "YES";
    else
      v10 = "NO";
    v16 = v9;
    v15 = 2082;
    v17 = 2082;
    v18 = v10;
    if (!v6)
      v8 = "YES";
    v19 = 2082;
    v20 = v8;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s mediaOption: playerAppliesMediaSelectionCriteriaAutomatically:%{public}s isDisplayTypeAutomatic:%{public}s isDisplayTypeForcedOnly:%{public}s", (uint8_t *)&v13, 0x2Au);
  }

  return v5 != 1 && v6 != 0;
}

- (void)setCurrentAssetMediaOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "selectMediaOption:inMediaSelectionGroup:", v4, v7);
}

- (void)setMediaOptionCriteriaAlwaysOn:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __CFString *v30;
  CFArrayRef v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0C8B200], "avkit_subtitleAutomaticallyEnabledState");
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AVPlayerController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "appliesMediaSelectionCriteriaAutomatically");

    v9 = v3 & v8;
    v10 = -[AVPlayerController captionAppearanceDisplayType](self, "captionAppearanceDisplayType");
    v11 = LastKnownCaptionAppearanceDisplayType;
    v12 = -[AVPlayerController isDisplayingNonForcedOnlyLegibleOption](self, "isDisplayingNonForcedOnlyLegibleOption");
    v13 = -[AVPlayerController _willAutomaticallySelectLegibleFallbackForLanguageMismatch](self, "_willAutomaticallySelectLegibleFallbackForLanguageMismatch");
    v14 = v13;
    v15 = v11 == 1 && v13;
    v16 = v10 != 1 && v15;
    _AVLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = "NO";
      *(_DWORD *)buf = 136317442;
      v37 = "-[AVPlayerController(AVMediaSelection) setMediaOptionCriteriaAlwaysOn:]";
      if (v9)
        v19 = "YES";
      else
        v19 = "NO";
      v38 = 2082;
      v39 = (void *)v19;
      if (v8)
        v20 = "YES";
      else
        v20 = "NO";
      v40 = 2082;
      v41 = (void *)v20;
      if (v10 == 1)
        v21 = "YES";
      else
        v21 = "NO";
      v42 = 2048;
      if (v10)
        v22 = "NO";
      else
        v22 = "YES";
      v43 = v5;
      if (v14)
        v23 = "YES";
      else
        v23 = "NO";
      v44 = 2082;
      if (v10 == 2)
        v24 = "YES";
      else
        v24 = "NO";
      v45 = v21;
      if (v12)
        v25 = "YES";
      else
        v25 = "NO";
      v46 = 2082;
      if (v16)
        v18 = "YES";
      v47 = v22;
      v48 = 2082;
      v49 = v23;
      v50 = 2082;
      v51 = v24;
      v52 = 2082;
      v53 = v25;
      v54 = 2082;
      v55 = v18;
      _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "%s mediaOption: enableSubtitles:%{public}s playerAppliesMediaSelectionCriteriaAutomatically:%{public}s autoSubtitlesActive:%lu isDisplayTypeAutomatic:%{public}s isDisplayTypeForcedOnly:%{public}s LanguageMismatch:%{public}s alwaysOn: %{public}s, isDisplayingNonForcedOnlyLegibleOption: %{public}s, shouldRestoreAutomaticCaptions: %{public}s", buf, 0x66u);
    }

    if (v9)
    {
      v26 = !v16;
      if (v10 == 2)
        v26 = 1;
      if (v10 < 2 || (v26 & 1) == 0)
      {
        if (!v14 || v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "localeIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[AVPlayerController canonicalLanguageIdentifierFromString:](AVPlayerController, "canonicalLanguageIdentifierFromString:", v29);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v31 = MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
          _AVLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v37 = "-[AVPlayerController(AVMediaSelection) setMediaOptionCriteriaAlwaysOn:]";
            v38 = 2114;
            v39 = v30;
            v40 = 2112;
            v41 = v31;
            _os_log_impl(&dword_1AC4B1000, v32, OS_LOG_TYPE_DEFAULT, "%s mediaOption: enableSubtitles: Setting preferred caption language to %{public}@, %@", buf, 0x20u);
          }

          CFRelease(v31);
          MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v30);
          -[AVPlayerController _performAutomaticMediaSelectionForUserCaptionDisplayType:](self, "_performAutomaticMediaSelectionForUserCaptionDisplayType:", 2);

        }
        v33 = 2;
        if (v10)
          v33 = v5;
        if (v10 == 1)
          v27 = 1;
        else
          v27 = v33;
        goto LABEL_60;
      }
    }
    if (!v3 && v5 == 1)
    {
      if (!v14 || v10 != 1)
        -[AVPlayerController _enableAutoMediaSelection:](self, "_enableAutoMediaSelection:", self);
LABEL_50:
      v27 = 0;
LABEL_60:
      if (v27 != v5)
      {
        +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setSubtitleAutomaticallyEnabledState:", v27);

      }
      return;
    }
    if (!v3 && v5 == 2)
    {
      if (!v14 || v16)
        -[AVPlayerController _ensureUserCaptionDisplayType:](self, "_ensureUserCaptionDisplayType:", 0);
      goto LABEL_50;
    }
  }
  else if (!v3 && v5)
  {
    -[AVPlayerController _enableAutoMediaSelection:](self, "_enableAutoMediaSelection:", self);
    +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSubtitleAutomaticallyEnabledState:", 0);

  }
}

- (void)_setMediaOption:(id)a3 mediaCharacteristic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315650;
    v23 = "-[AVPlayerController(AVMediaSelection) _setMediaOption:mediaCharacteristic:]";
    v24 = 2114;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s mediaOption: %{public}@ mediaCharacteristic: %{public}@", (uint8_t *)&v22, 0x20u);
  }

  if (v6
    && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8A770])
    && (objc_msgSend(v6, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A710]) & 1) == 0)
  {
    objc_msgSend(v6, "extendedLanguageTag");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = CFSTR("und");
    objc_storeStrong((id *)&self->_lastKnownPersistedExtendedLanguageTag, v11);

    MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, (CFStringRef)self->_lastKnownPersistedExtendedLanguageTag);
    -[AVPlayerController _ensureUserCaptionDisplayType:](self, "_ensureUserCaptionDisplayType:", 2);
  }
  -[AVPlayerController player](self, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "avkit_mediaSelectionGroupForMediaCharacteristic:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v13, "currentMediaSelection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedMediaOptionInMediaSelectionGroup:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "propertyList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) != 0)
    {
      _AVLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315138;
        v23 = "-[AVPlayerController(AVMediaSelection) _setMediaOption:mediaCharacteristic:]";
        _os_log_impl(&dword_1AC4B1000, v21, OS_LOG_TYPE_DEFAULT, "%s Skipped setting identical option.", (uint8_t *)&v22, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v13, "selectMediaOption:inMediaSelectionGroup:", v6, v15);
    }

  }
}

- (BOOL)_mediaSelectionCriteriaCanBeAppliedAutomaticallyToLegibleMediaSelectionGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "currentMediaSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setMostRecentChosenOption:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "extendedLanguageTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A758]) & 1) != 0
    || objc_msgSend(v5, "avkit_preferredSortIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v3 = 0;
LABEL_7:

    goto LABEL_8;
  }
  if (v3)
  {
    if (objc_msgSend(v5, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A770]))
    {
      +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMostRecentLegibleLanguageCode:", v3);
    }
    else
    {
      if (!objc_msgSend(v5, "hasMediaCharacteristic:", *MEMORY[0x1E0C8A6F0]))
        goto LABEL_8;
      +[AVKitGlobalSettings shared](AVKitGlobalSettings, "shared");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMostRecentAudioLanguageCode:", v3);
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)_willAutomaticallySelectLegibleFallbackForLanguageMismatch
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsLegibleFallbackForAllAudibleMediaSelections");

  if (v4)
  {
    -[AVPlayerController currentAudioMediaSelectionOption](self, "currentAudioMediaSelectionOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController legibleMediaSelectionOptions](self, "legibleMediaSelectionOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 && objc_msgSend(v6, "count"))
    {
      -[AVPlayerController _preferredLanguageCodes](self, "_preferredLanguageCodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "languageCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "containsObject:", v10);

      if ((v11 & 1) != 0)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v13 = v7;
        v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
        {
          v20 = v9;
          v14 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "locale");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "languageCode");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v8, "containsObject:", v17);

              if ((v18 & 1) != 0)
              {
                LOBYTE(v12) = 1;
                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v12)
              continue;
            break;
          }
LABEL_18:
          v9 = v20;
        }

      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (id)_preferredLanguageCodes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legibleFallbackMediaSelectionCriteria");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  if (v7)
    objc_msgSend(v3, "addObjectsFromArray:", v7);
  -[AVPlayerController _languageCodesFromLanguageIdentifiers:](self, "_languageCodesFromLanguageIdentifiers:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_languageCodesFromLanguageIdentifiers:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0C99DC8]);
        v12 = (void *)objc_msgSend(v11, "initWithLocaleIdentifier:", v10, (_QWORD)v15);
        objc_msgSend(v12, "languageCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && (objc_msgSend(v4, "containsObject:", v13) & 1) == 0)
          objc_msgSend(v4, "addObject:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_playableLegibleMediaSelectionOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x1E0C8A770]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C8B1F8];
    -[AVPlayerController _optionsForGroup:](self, "_optionsForGroup:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playableMediaSelectionOptionsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

uint64_t __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    v3 = MACaptionAppearancePrefCopyPreferAccessibleCaptions();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return objc_msgSend(v2, "BOOLValue");
}

uint64_t __54__AVPlayerController_AVMediaSelection__legibleOptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if (objc_msgSend(v7, "isCC")
    && (objc_msgSend(v7, "extendedLanguageTag"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    if (!objc_msgSend(v8, "isCC"))
      goto LABEL_29;
    objc_msgSend(v8, "extendedLanguageTag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != 0;

  }
  else
  {
    v10 = objc_msgSend(v7, "languageCompare:", v8);
    if (!v10)
    {
      if (objc_msgSend(v7, "isAuxiliary"))
      {
        v11 = objc_msgSend(v8, "isAuxiliary");
LABEL_11:
        v10 = v11 ^ 1u;
        goto LABEL_34;
      }
      if (objc_msgSend(v7, "isEasyReader"))
      {
        if ((objc_msgSend(v8, "isAuxiliary") & 1) == 0)
        {
          v11 = objc_msgSend(v8, "isEasyReader");
          goto LABEL_11;
        }
LABEL_33:
        v10 = -1;
        goto LABEL_34;
      }
      v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v14 = objc_msgSend(v7, "isSDH");
      if (v13)
      {
        if (v14)
        {
          v15 = objc_msgSend(v8, "isSDH");
LABEL_23:
          v10 = v15 - 1;
          goto LABEL_34;
        }
        v16 = objc_msgSend(v7, "isCC");
        v17 = objc_msgSend(v8, "isSDH");
        if (v16)
        {
          if ((v17 & 1) == 0)
          {
            v15 = objc_msgSend(v8, "isCC");
            goto LABEL_23;
          }
LABEL_29:
          v10 = 1;
          goto LABEL_34;
        }
        if ((v17 & 1) != 0 || (objc_msgSend(v8, "isCC") & 1) != 0)
          goto LABEL_29;
LABEL_32:
        if ((objc_msgSend(v8, "isEasyReader") & 1) == 0)
        {
          v10 = objc_msgSend(v8, "isAuxiliary") << 63 >> 63;
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      if (v14)
      {
        if ((objc_msgSend(v8, "isCC") & 1) == 0
          && (objc_msgSend(v8, "isEasyReader") & 1) == 0
          && (objc_msgSend(v8, "isAuxiliary") & 1) == 0)
        {
          v11 = objc_msgSend(v8, "isSDH");
          goto LABEL_11;
        }
        goto LABEL_33;
      }
      if (!objc_msgSend(v7, "isCC"))
      {
        if ((objc_msgSend(v8, "isSDH") & 1) != 0 || (objc_msgSend(v8, "isCC") & 1) != 0)
          goto LABEL_33;
        goto LABEL_32;
      }
      if ((objc_msgSend(v8, "isCC") & 1) != 0)
      {
        v10 = 0;
      }
      else
      {
        v10 = -1;
        if ((objc_msgSend(v8, "isEasyReader") & 1) == 0 && !objc_msgSend(v8, "isAuxiliary"))
          v10 = 1;
      }
    }
  }
LABEL_34:

  return v10;
}

uint64_t __52__AVPlayerController_AVMediaSelection__audioOptions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioFormats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue") == 1667326771)
          {
            v6 = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(v3, "numberWithBool:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return objc_msgSend(v2, "BOOLValue");
}

+ (id)canonicalLanguageIdentifierFromString:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "+[AVPlayerController(AVMediaSelection) canonicalLanguageIdentifierFromString:]";
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v8, 0xCu);
    }

  }
  if (canonicalLanguageIdentifierFromString__createQueueOnceToken[0] != -1)
    dispatch_once(canonicalLanguageIdentifierFromString__createQueueOnceToken, &__block_literal_global_2019);
  if (v3)
    v5 = v3;
  else
    v5 = CFSTR("NilString");
  objc_msgSend((id)canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

uint64_t __61__AVPlayerController_AVMediaSelection___sortedAudibleOption___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "audioLanguageCompare:");
}

void __78__AVPlayerController_AVMediaSelection__canonicalLanguageIdentifierFromString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache;
  canonicalLanguageIdentifierFromString__canonicalLanguageIdentifiersCache = v0;

}

- (AVPlayerController)init
{
  NSObject *v3;
  AVPlayerController *v4;
  AVPlayerController *v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AVPlayerController init]";
    v10 = 1024;
    v11 = 456;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerController;
  v4 = -[AVPlayerController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[AVPlayerController _commonInit](v4, "_commonInit");
    BYTE1(v5->_liveEdgeTimer) = 0;
    BYTE3(v5->_photosensitivityMetadataHandler) = 0;
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSDate *lastTimePlayingOnMatchPointDeviceWasUpdated;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v7;
  id retryPlayingImmediatelyBlock;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVPlayerController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_isDeallocating = 1;
  -[AVPlayerController observationController](self, "observationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAllObservation");

  -[AVPlayerController reduceResourceUsageAssertion](self, "reduceResourceUsageAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[AVPlayerController setPlayerLayerForReducingResources:](self, "setPlayerLayerForReducingResources:", 0);
  -[NSDate invalidate](self->_lastTimePlayingOnMatchPointDeviceWasUpdated, "invalidate");
  lastTimePlayingOnMatchPointDeviceWasUpdated = self->_lastTimePlayingOnMatchPointDeviceWasUpdated;
  self->_lastTimePlayingOnMatchPointDeviceWasUpdated = 0;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0CC1C98], 0);
  v7 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v7, self, (CFNotificationName)*MEMORY[0x1E0CC1CA0], 0);
  if (self->_updateAtMinMaxTimePeriodicObserverToken)
    objc_msgSend(*(id *)&self->_canTogglePictureInPicture, "removeTimeObserver:");
  -[AVPlayerController stopGeneratingTimecodes](self, "stopGeneratingTimecodes");
  retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
  self->_retryPlayingImmediatelyBlock = 0;

  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[AVPlayerController dealloc]";
    v14 = 1024;
    v15 = 842;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)&self->_muted, "invalidate");
  v10 = *(void **)&self->_muted;
  *(_QWORD *)&self->_muted = 0;

  v11.receiver = self;
  v11.super_class = (Class)AVPlayerController;
  -[AVPlayerController dealloc](&v11, sel_dealloc);
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_currentAudioTrack;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform preferredTransform](result, "preferredTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)_queuePlayer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[AVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = 136315394;
    v9 = "-[AVPlayerController _queuePlayer]";
    v10 = 1024;
    LOBYTE(v11) = objc_opt_isKindOfClass() & 1;
    v11 = v11;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s queuePlayer: %d", (uint8_t *)&v8, 0x12u);

  }
  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVPlayerController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSError)error
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSError *)v4;
}

- (BOOL)isCompletelySeekable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  CMTimeRange v12;
  CMTimeRange range;
  CMTimeRange range1;
  CMTime duration;
  CMTimeRange v16;

  -[AVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  memset(&v16, 0, sizeof(v16));
  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  *(_OWORD *)&v12.start.value = *MEMORY[0x1E0CA2E68];
  v12.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  CMTimeRangeMake(&v16, &v12.start, &duration);

  -[AVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "CMTimeRangeValue");
    else
      memset(&range, 0, sizeof(range));
    v12 = v16;
    CMTimeRangeGetIntersection(&range1, &range, &v12);
    v12 = v16;
    v7 = CMTimeRangeEqual(&range1, &v12) != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAtLiveEdge
{
  return BYTE1(self->_liveEdgeTimer);
}

- (void)stopUsingNetworkResourcesForLiveStreamingWhilePaused
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = *(_QWORD *)&self->_liveStreamEventModePossible;
  if (v3 <= 0)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Calls to -[AVPlayerController stopUsingNetworkResourcesForLiveStreamingWhilePaused] must be counterbalanced with calls to -[AVPlayerController startUsingNetworkResourcesForLiveStreamingWhilePaused].", v7, 2u);
    }

    v3 = *(_QWORD *)&self->_liveStreamEventModePossible;
  }
  *(_QWORD *)&self->_liveStreamEventModePossible = v3 - 1;
  if (v3 <= 1)
  {
    -[AVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCanUseNetworkResourcesForLiveStreamingWhilePaused:", LOBYTE(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount));

  }
}

- (void)_playAtRate:(double)a3
{
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  double v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  double v14;
  id retryPlayingImmediatelyBlock;
  double v16;
  _QWORD v17[4];
  id v18;
  double v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController activePlayer](self, "activePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldPlayImmediately)
  {
    v6 = -[AVPlayerController canPlayImmediately](self, "canPlayImmediately");
    _AVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (a3 == 0.0 || v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134217984;
        v21 = a3;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Calling playImmediatelyAtRate: %f", buf, 0xCu);
      }

      retryPlayingImmediatelyBlock = self->_retryPlayingImmediatelyBlock;
      self->_retryPlayingImmediatelyBlock = 0;

      *(float *)&v16 = a3;
      objc_msgSend(v5, "playImmediatelyAtRate:", v16);
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 136315650;
        v21 = COERCE_DOUBLE("-[AVPlayerController _playAtRate:]");
        v22 = 2048;
        v23 = a3;
        v24 = 2048;
        v25 = v5;
        _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "%s %.1f on %p", buf, 0x20u);
      }

      *(float *)&v9 = a3;
      objc_msgSend(v5, "setRate:", v9);
      _AVLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "Could not play immediately, setting a play immediately retry block.", buf, 2u);
      }

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __34__AVPlayerController__playAtRate___block_invoke;
      v17[3] = &unk_1E5BB4660;
      v19 = a3;
      v18 = v5;
      v11 = (void *)MEMORY[0x1AF43E9B8](v17);
      v12 = self->_retryPlayingImmediatelyBlock;
      self->_retryPlayingImmediatelyBlock = v11;

    }
  }
  else
  {
    _AVLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = COERCE_DOUBLE("-[AVPlayerController _playAtRate:]");
      v22 = 2048;
      v23 = a3;
      v24 = 2048;
      v25 = v5;
      _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s %.1f on %p", buf, 0x20u);
    }

    *(float *)&v14 = a3;
    objc_msgSend(v5, "setRate:", v14);
  }

}

- (void)_setRate_AVFoundationStrategy:(double)a3
{
  if (-[AVPlayerController isPlaybackSuspended](self, "isPlaybackSuspended"))
    *(double *)&self->_captionAppearanceDisplayType = a3;
  else
    -[AVPlayerController _playAtRate:](self, "_playAtRate:", a3);
}

- (void)setRate:(double)a3
{
  NSNumber *rateToRestoreAfterAudioSessionInterruptionEnds;

  rateToRestoreAfterAudioSessionInterruptionEnds = self->_rateToRestoreAfterAudioSessionInterruptionEnds;
  self->_rateToRestoreAfterAudioSessionInterruptionEnds = 0;

  -[AVPlayerController _setRate_AVFoundationStrategy:](self, "_setRate_AVFoundationStrategy:", a3);
  if (AVPlayerControllerAutoplayEnabled == 1)
    BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 0;
}

- (void)setDefaultPlaybackRate:(double)a3
{
  double v4;
  void *v5;
  double v6;
  NSNumber *v7;
  NSNumber *rateToRestoreAfterAudioSessionInterruptionEnds;

  if (a3 >= 0.05)
    v4 = a3;
  else
    v4 = 0.05;
  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = v4;
  objc_msgSend(v5, "setDefaultRate:", v6);

  if (-[AVPlayerController isPlaying](self, "isPlaying"))
    -[AVPlayerController setRate:](self, "setRate:", v4);
  if (self->_rateToRestoreAfterAudioSessionInterruptionEnds)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    rateToRestoreAfterAudioSessionInterruptionEnds = self->_rateToRestoreAfterAudioSessionInterruptionEnds;
    self->_rateToRestoreAfterAudioSessionInterruptionEnds = v7;

  }
}

- (BOOL)canPlayImmediately
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  CMTime v18;
  CMTime time;
  CMTimeRange range;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CMTime v25;
  CMTime v26;
  CMTimeRange buf;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackBufferEmpty");

  if ((v5 & 1) != 0)
  {
    LODWORD(v6) = 0;
  }
  else
  {
    -[AVPlayerController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadedTimeRanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v26, 0, sizeof(v26));
    CMTimeMakeWithSeconds(&v26, 1.0, 90000);
    memset(&v25, 0, sizeof(v25));
    -[AVPlayerController player](self, "player");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "currentTime");
    else
      memset(&v25, 0, sizeof(v25));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v9;
    v6 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v6)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          memset(&buf, 0, sizeof(buf));
          if (v15)
            objc_msgSend(v15, "CMTimeRangeValue");
          range = buf;
          time = v25;
          if (CMTimeRangeContainsTime(&range, &time))
          {
            range.start = v25;
            time = v26;
            CMTimeAdd(&v18, &range.start, &time);
            range = buf;
            if (CMTimeRangeContainsTime(&range, &v18))
            {
              LODWORD(v6) = 1;
              goto LABEL_19;
            }
          }
        }
        v6 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_19:

  }
  _AVLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.start.value) = 67109120;
    HIDWORD(buf.start.value) = v6;
    _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "Can play immediately: %d", (uint8_t *)&buf, 8u);
  }

  return v6;
}

- (BOOL)canPlay
{
  _BOOL4 v3;

  v3 = -[AVPlayerController isReadyToPlay](self, "isReadyToPlay");
  if (v3)
    LOBYTE(v3) = !-[AVPlayerController isPictureInPictureInterrupted](self, "isPictureInPictureInterrupted");
  return v3;
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *seekQueue;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[AVPlayerController setPlaying:]";
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  -[AVPlayerController setRateBeforeScrubBegan:](self, "setRateBeforeScrubBegan:", NAN);
  if (v3)
  {
    objc_initWeak((id *)buf, self);
    seekQueue = self->_seekQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__AVPlayerController_setPlaying___block_invoke;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_async(seekQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[AVPlayerController setRate:](self, "setRate:", 0.0);
  }
}

- (void)play:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[AVPlayerController play:]";
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s setPlaying:YES", (uint8_t *)&v5, 0xCu);
  }

  -[AVPlayerController setPlaying:](self, "setPlaying:", 1);
}

- (void)autoplay:(id)a3
{
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[AVPlayerController isPlaying](self, "isPlaying", a3))
  {
    if (AVPlayerControllerAutoplayEnabled == 1
      && !-[AVPlayerController coordinatedPlaybackActive](self, "coordinatedPlaybackActive"))
    {
      -[AVPlayerController player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPlaybackLikelyToKeepUp");

      if (!v8)
      {
        BYTE1(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 1;
        return;
      }
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_7;
      v9 = 136315138;
      v10 = "-[AVPlayerController autoplay:]";
      v5 = "%s setPlaying:YES (AVPlayerControllerAutoplayEnabled)";
    }
    else
    {
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        -[AVPlayerController setPlaying:](self, "setPlaying:", 1);
        return;
      }
      v9 = 136315138;
      v10 = "-[AVPlayerController autoplay:]";
      v5 = "%s setPlaying:YES";
    }
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, 0xCu);
    goto LABEL_7;
  }
}

- (void)pause:(id)a3
{
  -[AVPlayerController pauseForAllCoordinatedPlaybackParticipants:](self, "pauseForAllCoordinatedPlaybackParticipants:", 1);
}

- (void)pauseForAllCoordinatedPlaybackParticipants:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 136315394;
    v9 = "-[AVPlayerController pauseForAllCoordinatedPlaybackParticipants:]";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s notifyCoordinatedPlayback of pause: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v3)
  {
    -[AVPlayerController setPlaying:](self, "setPlaying:", 0);
  }
  else
  {
    -[AVPlayerController setRateBeforeScrubBegan:](self, "setRateBeforeScrubBegan:", NAN);
    -[AVPlayerController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pauseWithoutAffectingCoordinatedPlayback");

  }
}

- (void)togglePlayback:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!-[AVPlayerController isPlaying](self, "isPlaying", a3))
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[AVPlayerController togglePlayback:]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s setPlaying:YES", (uint8_t *)&v5, 0xCu);
    }

  }
  -[AVPlayerController setPlaying:](self, "setPlaying:", -[AVPlayerController isPlaying](self, "isPlaying") ^ 1);
}

- (void)togglePlaybackEvenWhenInBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D48560];
  v8 = a3;
  objc_msgSend(v4, "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v7, *MEMORY[0x1E0D47E80], 0);

  -[AVPlayerController togglePlayback:](self, "togglePlayback:", v8);
}

- (void)setTouchBarRequiresLinearPlayback:(BOOL)a3
{
  if (LOBYTE(self->_defaultPlaybackRate) != a3)
  {
    LOBYTE(self->_defaultPlaybackRate) = a3;
    if (a3)
    {
      -[AVPlayerController endScrubbing](self, "endScrubbing");
      -[AVPlayerController _cancelPendingSeeksIfNeeded](self, "_cancelPendingSeeksIfNeeded");
    }
  }
}

- (BOOL)isPlayingHDRContent
{
  return (BOOL)self->_liveEdgeTimer;
}

- (BOOL)isLooping
{
  return self->_looping;
}

- (void)setLooping:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int64_t actionAtItemEnd;

  if (self->_looping != a3)
  {
    v3 = a3;
    self->_looping = a3;
    -[AVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      self->_actionAtItemEnd = objc_msgSend(v5, "actionAtItemEnd");

      -[AVPlayerController player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      actionAtItemEnd = 2;
    }
    else
    {
      actionAtItemEnd = self->_actionAtItemEnd;
    }
    objc_msgSend(v5, "setActionAtItemEnd:", actionAtItemEnd);

    -[AVPlayerController updateAtMinMaxTime](self, "updateAtMinMaxTime");
  }
}

- (void)beginPlaybackSuspension
{
  NSObject *v3;
  int64_t playbackSuspensionCount;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[AVPlayerController beginPlaybackSuspension]";
    v7 = 1024;
    v8 = 2020;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  playbackSuspensionCount = self->_playbackSuspensionCount;
  if (!playbackSuspensionCount)
  {
    -[AVPlayerController _startSuspendingPlayback](self, "_startSuspendingPlayback");
    playbackSuspensionCount = self->_playbackSuspensionCount;
  }
  self->_playbackSuspensionCount = playbackSuspensionCount + 1;
}

- (void)endPlaybackSuspension
{
  NSObject *v3;
  int64_t playbackSuspensionCount;
  NSObject *v5;
  int64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVPlayerController endPlaybackSuspension]";
    v9 = 1024;
    v10 = 2032;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  playbackSuspensionCount = self->_playbackSuspensionCount;
  if (playbackSuspensionCount > 0)
    goto LABEL_7;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v7) = 0;
    _os_log_error_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_ERROR, "Error: Calls to endPlaybackSuspension must be balanced with calls to beginPlaybackSuspension.", (uint8_t *)&v7, 2u);
  }

  playbackSuspensionCount = self->_playbackSuspensionCount;
  if (playbackSuspensionCount >= 1)
  {
LABEL_7:
    v6 = playbackSuspensionCount - 1;
    self->_playbackSuspensionCount = v6;
    if (!v6)
      -[AVPlayerController _stopSuspendingPlayback](self, "_stopSuspendingPlayback");
  }
}

- (double)volume
{
  void *v2;
  float v3;
  double v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)setVolume:(double)a3
{
  NSObject *v5;
  void *v6;
  double v7;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVPlayerController setVolume:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %f", (uint8_t *)&v8, 0x16u);
  }

  -[AVPlayerController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setVolume:", v7);

}

- (void)increaseVolume:(id)a3
{
  double v4;

  -[AVPlayerController volume](self, "volume", a3);
  -[AVPlayerController setVolume:](self, "setVolume:", fmin(v4 + 0.0625, 1.0));
}

- (void)decreaseVolume:(id)a3
{
  double v4;

  -[AVPlayerController volume](self, "volume", a3);
  -[AVPlayerController setVolume:](self, "setVolume:", fmax(v4 + -0.0625, 0.0));
}

- (void)changeVolumeToMinimum:(id)a3
{
  -[AVPlayerController setVolume:](self, "setVolume:", a3, 0.0);
}

- (void)changeVolumeToMaximum:(id)a3
{
  -[AVPlayerController setVolume:](self, "setVolume:", a3, 1.0);
}

- (BOOL)allowsAudioPlayback
{
  return BYTE2(self->_photosensitivityMetadataHandler);
}

- (void)setAllowsAudioPlayback:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (BYTE2(self->_photosensitivityMetadataHandler) != a3)
  {
    v3 = a3;
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVPlayerController setAllowsAudioPlayback:]";
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }

    BYTE2(self->_photosensitivityMetadataHandler) = v3;
    -[AVPlayerController _updatePlayerMutedState](self, "_updatePlayerMutedState");
  }
}

- (void)toggleMuted:(id)a3
{
  -[AVPlayerController setMuted:](self, "setMuted:", -[AVPlayerController isMuted](self, "isMuted", a3) ^ 1);
}

- (float)nominalFrameRate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  CMTime v17;
  CMTimeRange range;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return NAN;
  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avkit_tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v23, 0, sizeof(v23));
  -[AVPlayerController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "currentTime");
  else
    memset(&v23, 0, sizeof(v23));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (v14)
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "timeRange");
        else
          memset(&range, 0, sizeof(range));
        v17 = v23;
        if (CMTimeRangeContainsTime(&range, &v17))
        {
          objc_msgSend(v14, "nominalFrameRate");
          v8 = v15;
          goto LABEL_19;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
  v8 = NAN;
LABEL_19:

  return v8;
}

- (double)currentTime
{
  void *v3;
  void *v4;
  void *v5;
  double result;
  Float64 Seconds;
  double v8;
  BOOL v9;
  BOOL v10;
  CMTime time;

  if (!-[AVPlayerController isReadyToPlay](self, "isReadyToPlay"))
    return NAN;
  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  v8 = fabs(Seconds);
  v9 = v8 < INFINITY;
  v10 = v8 <= INFINITY;
  result = NAN;
  if (v9)
    result = Seconds;
  if (!v10)
    return Seconds;
  return result;
}

- (void)setMinTime:(double)a3
{
  void *v5;
  void *v6;
  CMTime v7;

  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    CMTimeMakeWithSeconds(&v7, a3, 90000);
    objc_msgSend(v6, "setReversePlaybackEndTime:", &v7);
  }

}

- (void)setReversePlaybackEndTime:(id *)a3
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend(v5, "setReversePlaybackEndTime:", &v6);

}

- (void)setMaxTime:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  CMTime v11;
  _QWORD v12[3];

  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    -[AVPlayerController contentDuration](self, "contentDuration");
    if (v7 == a3)
    {
      -[AVPlayerController player](self, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "duration");
      else
        memset(v12, 0, sizeof(v12));
      objc_msgSend(v6, "setForwardPlaybackEndTime:", v12);

    }
    else
    {
      CMTimeMakeWithSeconds(&v11, a3, 90000);
      objc_msgSend(v6, "setForwardPlaybackEndTime:", &v11);
    }
  }

}

- (void)setForwardPlaybackEndTime:(id *)a3
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  -[AVPlayerController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend(v5, "setForwardPlaybackEndTime:", &v6);

}

- (double)contentDurationWithinEndTimes
{
  double v3;
  double v4;
  double v5;

  -[AVPlayerController maxTime](self, "maxTime");
  v4 = v3;
  -[AVPlayerController minTime](self, "minTime");
  return v4 - v5;
}

- (NSDate)currentDate
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

- (NSDate)currentOrEstimatedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    if (-[AVPlayerController isReadyToPlay](self, "isReadyToPlay"))
    {
      -[AVPlayerController player](self, "player");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v4, "currentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "currentEstimatedDate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

- (double)currentTimeWithinEndTimes
{
  double v3;
  double v4;
  double v5;

  -[AVPlayerController currentTime](self, "currentTime");
  v4 = v3;
  -[AVPlayerController minTime](self, "minTime");
  return v4 - v5;
}

- (BOOL)hasContentChapters
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AVPlayerController contentChapters](self, "contentChapters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2 && objc_msgSend(v2, "count");

  return v4;
}

- (BOOL)isPlayableOffline
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "assetCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPlayableOffline");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTrimmableContent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && -[AVPlayerController isCompletelySeekable](self, "isCompletelySeekable"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v5, "isComposable");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasShareableContent
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v8;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && !-[AVPlayerController _assetIsRestrictedFromSaving:](self, "_assetIsRestrictedFromSaving:", v5))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = v8 != 0;

      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
      }
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_assetIsRestrictedFromSaving:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = -[AVPlayerController _assetIsMarkedNotSerializable:](self, "_assetIsMarkedNotSerializable:", v4);
  v6 = -[AVPlayerController hasProtectedContent](self, "hasProtectedContent");
  objc_msgSend(v4, "availableVideoDynamicRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  LOBYTE(self) = -[AVPlayerController _assetContainsProResRaw:](self, "_assetContainsProResRaw:", v4);
  return self | v6 | v5 | v9;
}

- (id)audioWaveform
{
  return 0;
}

- (BOOL)_assetIsMarkedNotSerializable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v20;

  v4 = a3;
  -[AVPlayerController availableMetadataFormats](self, "availableMetadataFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C8A908];
  if (!objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8A908]))
    goto LABEL_4;
  v7 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(v4, "avkit_metadataForFormat:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadataItemsFromArray:withKey:keySpace:", v8, CFSTR("com.apple.motion.notserializable"), *MEMORY[0x1E0C8A9E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
LABEL_4:
    v12 = *MEMORY[0x1E0C8A900];
    if (objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0C8A900]))
    {
      objc_msgSend(v4, "avkit_metadataForFormat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0C8B220];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1853055350);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadataItemsFromArray:withKey:keySpace:", v13, v15, *MEMORY[0x1E0C8A9E0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "objectAtIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dataValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 0;
        objc_msgSend(v18, "getBytes:length:", &v20, 4);
        v11 = HIBYTE(v20) & 1;

      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (BOOL)_assetContainsProResRaw:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  FourCharCode MediaSubType;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a3, "tracks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v5, "formatDescriptions");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = 0;
          v10 = *(_QWORD *)v19;
LABEL_8:
          v11 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v6);
            MediaSubType = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((_QWORD *)&v18 + 1) + 8 * v11));
            if (MediaSubType == 1634759272 || MediaSubType == 1634759278)
              v9 = 1;
            if (MediaSubType == 1634759272 || MediaSubType == 1634759278)
              break;
            if (v8 == ++v11)
            {
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v8)
                goto LABEL_8;
              break;
            }
          }

          if ((v9 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_27;
          }
        }
        else
        {

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v3);
  }
LABEL_27:

  return v3;
}

- (void)_throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *internalDelegate;
  double v12;
  void *v13;
  NSDate *v14;
  NSDate *lastTimePlayingOnMatchPointDeviceWasUpdated;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_backgroundQueue)
  {
    objc_initWeak(&location, self);
    goto LABEL_7;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:");
  v8 = v7;
  objc_initWeak(&location, self);
  if (v8 > 0.25)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_backgroundQueue, v6);
    internalDelegate = self->_internalDelegate;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke;
    block[3] = &unk_1E5BB45E8;
    v19 = v4;
    objc_copyWeak(&v20, &location);
    dispatch_async(internalDelegate, block);
    objc_destroyWeak(&v20);

    goto LABEL_8;
  }
  if (!self->_lastTimePlayingOnMatchPointDeviceWasUpdated)
  {
    if (self->_backgroundQueue)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:");
      v10 = 0.25 - v9;
    }
    else
    {
      v10 = 0.0;
    }
    v12 = fmax(v10, 0.01);
    v13 = (void *)MEMORY[0x1E0C99E88];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_2;
    v16[3] = &unk_1E5BB49A8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, v16, v12);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastTimePlayingOnMatchPointDeviceWasUpdated = self->_lastTimePlayingOnMatchPointDeviceWasUpdated;
    self->_lastTimePlayingOnMatchPointDeviceWasUpdated = v14;

    objc_destroyWeak(&v17);
  }
LABEL_8:
  objc_destroyWeak(&location);

}

- (void)seekToTime:(double)a3
{
  -[AVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:", a3, 0.0, 0.0);
}

- (void)beginScrubbing
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[AVPlayerController beginScrubbing]";
    v6 = 1024;
    v7 = 2972;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  -[AVPlayerController setScrubbing:](self, "setScrubbing:", 1);
  -[AVPlayerController suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary](self, "suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary");
  -[AVPlayerController _updateRateForScrubbingAndSeeking](self, "_updateRateForScrubbingAndSeeking");
  -[AVPlayerController _cancelPendingSeeksIfNeeded](self, "_cancelPendingSeeksIfNeeded");
  -[AVPlayerController currentTime](self, "currentTime");
  -[AVPlayerController setInitialScrubbingTime:](self, "setInitialScrubbingTime:");
}

- (void)endScrubbing
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double Seconds;
  double v9;
  CMTime time;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[AVPlayerController endScrubbing]";
    v13 = 1024;
    v14 = 2989;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  -[AVPlayerController setScrubbing:](self, "setScrubbing:", 0);
  -[AVPlayerController _updateRateForScrubbingAndSeeking](self, "_updateRateForScrubbingAndSeeking");
  -[AVPlayerController initialScrubbingTime](self, "initialScrubbingTime");
  v5 = v4;
  -[AVPlayerController currentTime](self, "currentTime");
  v7 = v6;
  if (-[AVPlayerController isSeekingInternal](self, "isSeekingInternal"))
  {
    -[AVPlayerController seekToTimeInternal](self, "seekToTimeInternal");
    Seconds = CMTimeGetSeconds(&time);
    if (fabs(Seconds) != INFINITY)
      v7 = Seconds;
  }
  -[AVPlayerController _adjustedSeekTimeFromTime:toTime:](self, "_adjustedSeekTimeFromTime:toTime:", v5, v7);
  if (v9 != v7)
    -[AVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:", v9, 0.0, 0.0);
  -[AVPlayerController resumePlaybackCoordinatorIfSuspended](self, "resumePlaybackCoordinatorIfSuspended");
}

- (void)suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController scrubCoordinatorSuspension](self, "scrubCoordinatorSuspension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[AVPlayerController suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Starting coordination suspension.", (uint8_t *)&v8, 0xCu);
    }

    -[AVPlayerController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_playbackCoordinatorWithoutTriggeringFullSetup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginSuspensionForReason:", *MEMORY[0x1E0C8A240]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController setScrubCoordinatorSuspension:](self, "setScrubCoordinatorSuspension:", v7);

  }
}

- (void)resumePlaybackCoordinatorIfSuspended
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint8_t buf[16];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AVPlayerController scrubCoordinatorSuspension](self, "scrubCoordinatorSuspension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AVPlayerController resumePlaybackCoordinatorIfSuspended]";
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Ending coordination suspension.", buf, 0xCu);
    }

    memset(buf, 0, sizeof(buf));
    v11 = 0;
    -[AVPlayerController seekToTimeInternal](self, "seekToTimeInternal");
    if ((buf[12] & 1) == 0)
    {
      -[AVPlayerController player](self, "player");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "currentTime");
      }
      else
      {
        v8 = 0uLL;
        v9 = 0;
      }
      *(_OWORD *)buf = v8;
      v11 = v9;

    }
    -[AVPlayerController scrubCoordinatorSuspension](self, "scrubCoordinatorSuspension", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_OWORD *)buf;
    v9 = v11;
    objc_msgSend(v7, "endProposingNewTime:", &v8);

    -[AVPlayerController setScrubCoordinatorSuspension:](self, "setScrubCoordinatorSuspension:", 0);
  }
}

- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  CMTime v8;
  CMTime v9;
  CMTime v10;

  AVTimeIntervalToCMTime(&v10, a3);
  AVTimeIntervalToCMTime(&v9, a4);
  AVTimeIntervalToCMTime(&v8, a5);
  -[AVPlayerController seekToCMTime:toleranceBefore:toleranceAfter:](self, "seekToCMTime:toleranceBefore:toleranceAfter:", &v10, &v9, &v8);
}

- (void)seekToCMTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a3;
  v6 = *a4;
  v5 = *a5;
  -[AVPlayerController throttledSeekToTime:toleranceBefore:toleranceAfter:](self, "throttledSeekToTime:toleranceBefore:toleranceAfter:", &v7, &v6, &v5);
}

- (void)throttledSeekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5
{
  Float64 v9;
  Float64 v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  __int128 v16;
  int64_t v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v18;
  unsigned int var2;
  void *v20;
  Float64 v21;
  double Seconds;
  NSObject *seekQueue;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  int64_t var3;
  __int128 v28;
  int64_t v29;
  __int128 v30;
  int64_t v31;
  CMTime time1;
  CMTimeRange range;
  CMTime time2;
  CMTime time;
  CMTime v36;
  CMTime v37;

  if (!-[AVPlayerController canSeek](self, "canSeek"))
    return;
  memset(&v37, 0, sizeof(v37));
  -[AVPlayerController minTime](self, "minTime");
  CMTimeMakeWithSeconds(&v37, v9, 60000);
  memset(&v36, 0, sizeof(v36));
  -[AVPlayerController maxTime](self, "maxTime");
  CMTimeMakeWithSeconds(&v36, v10, 60000);
  if (-[AVPlayerController isStreaming](self, "isStreaming")
    && !-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
  {
    -[AVPlayerController seekableTimeRanges](self, "seekableTimeRanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "CMTimeRangeValue");
    else
      memset(&range, 0, sizeof(range));
    CMTimeRangeGetEnd(&time2, &range);
    time1 = v36;
    CMTimeMinimum(&time, &time1, &time2);
    v36 = time;

  }
  v14 = -[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent");
  v15 = MEMORY[0x1E0CA2E68];
  if (v14)
  {
    v16 = *MEMORY[0x1E0CA2E68];
    *(_OWORD *)&a5->var0 = *MEMORY[0x1E0CA2E68];
    v17 = *(_QWORD *)(v15 + 16);
    a5->var3 = v17;
    *(_OWORD *)&a4->var0 = v16;
    a4->var3 = v17;
  }
  time = (CMTime)*a3;
  time1 = v37;
  if (CMTimeCompare(&time, &time1) < 0 || (~a3->var2 & 9) == 0)
  {
    *(CMTime *)a3 = v37;
    v18 = a4;
LABEL_20:
    *(_OWORD *)&v18->var0 = *(_OWORD *)v15;
    v18->var3 = *(_QWORD *)(v15 + 16);
    var2 = a3->var2;
    goto LABEL_21;
  }
  time = (CMTime)*a3;
  time1 = v36;
  if (CMTimeCompare(&time, &time1) > 0 || (var2 = a3->var2, (~var2 & 5) == 0))
  {
    if (-[AVPlayerController hasSeekableLiveStreamingContent](self, "hasSeekableLiveStreamingContent")
      || !-[AVPlayerController hasLiveStreamingContent](self, "hasLiveStreamingContent"))
    {
      *(CMTime *)a3 = v36;
    }
    else
    {
      -[AVPlayerController maxTiming](self, "maxTiming");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentValue");
      CMTimeMakeWithSeconds(&time, v21, 60000);
      *(CMTime *)a3 = time;

    }
    v18 = a5;
    goto LABEL_20;
  }
LABEL_21:
  if ((var2 & 1) != 0)
  {
    time = (CMTime)*a3;
    Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    Seconds = NAN;
  }
  -[AVPlayerController setSeeking:](self, "setSeeking:", 1);
  -[AVPlayerController setSeekToTime:](self, "setSeekToTime:", Seconds);
  objc_initWeak((id *)&time, self);
  seekQueue = self->_seekQueue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73__AVPlayerController_throttledSeekToTime_toleranceBefore_toleranceAfter___block_invoke;
  v24[3] = &unk_1E5BB46B0;
  objc_copyWeak(&v25, (id *)&time);
  v26 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v28 = *(_OWORD *)&a4->var0;
  v29 = a4->var3;
  v30 = *(_OWORD *)&a5->var0;
  v31 = a5->var3;
  dispatch_async(seekQueue, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)&time);
}

- (void)actuallySeekToTime
{
  NSObject *v3;
  Float64 Seconds;
  Float64 v5;
  Float64 v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _BYTE v12[24];
  id location;
  CMTime time;
  _QWORD block[4];
  id v16;
  CMTime v17;
  Float64 v18;
  __int16 v19;
  Float64 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController canSeek](self, "canSeek"))
  {
    -[AVPlayerController setSeekingInternal:](self, "setSeekingInternal:", 1);
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[AVPlayerController seekToTimeInternal](self, "seekToTimeInternal");
      Seconds = CMTimeGetSeconds(&time);
      v17 = *(CMTime *)(&self->_pendingSeek + 4);
      v5 = CMTimeGetSeconds(&v17);
      v17 = *(CMTime *)((char *)&self->_toleranceBefore.epoch + 4);
      v6 = CMTimeGetSeconds(&v17);
      LODWORD(v17.value) = 136315906;
      *(CMTimeValue *)((char *)&v17.value + 4) = (CMTimeValue)"-[AVPlayerController actuallySeekToTime]";
      LOWORD(v17.flags) = 2048;
      *(Float64 *)((char *)&v17.flags + 2) = Seconds;
      HIWORD(v17.epoch) = 2048;
      v18 = v5;
      v19 = 2048;
      v20 = v6;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s time: %f toleranceBefore: %f toleranceAfter: %f", (uint8_t *)&v17, 0x2Au);
    }

    objc_initWeak(&location, self);
    -[AVPlayerController player](self, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController seekToTimeInternal](self, "seekToTimeInternal");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke_260;
    v10[3] = &unk_1E5BB4688;
    objc_copyWeak(&v11, &location);
    v17 = *(CMTime *)(&self->_pendingSeek + 4);
    v8 = *(_OWORD *)((char *)&self->_toleranceBefore.epoch + 4);
    v9 = *(_QWORD *)&self->_toleranceAfter.flags;
    objc_msgSend(v7, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", v12, &v17, &v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak((id *)&v17, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v16, (id *)&v17);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)&v17);
  }
}

- (void)seekByTimeInterval:(double)a3
{
  -[AVPlayerController seekByTimeInterval:toleranceBefore:toleranceAfter:](self, "seekByTimeInterval:toleranceBefore:toleranceAfter:", a3, 0.0, 0.0);
}

- (void)seekByTimeInterval:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  double v24;
  double v25;
  double v26;

  if (-[AVPlayerController isSeeking](self, "isSeeking"))
  {
    -[AVPlayerController seekToTime](self, "seekToTime");
    -[AVPlayerController seekToTime](self, "seekToTime");
    v10 = v9;
  }
  else
  {
    -[AVPlayerController timing](self, "timing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentValue");
    v10 = v12;

  }
  v13 = v10 + a3;
  -[AVPlayerController minTime](self, "minTime");
  v14 = v13;
  if (v15 > v13)
  {
    -[AVPlayerController minTime](self, "minTime");
    v14 = v16;
  }
  -[AVPlayerController maxTime](self, "maxTime");
  if (v14 >= v17)
  {
    -[AVPlayerController maxTime](self, "maxTime");
    goto LABEL_10;
  }
  -[AVPlayerController minTime](self, "minTime");
  v18 = v13;
  if (v19 > v13)
  {
    -[AVPlayerController minTime](self, "minTime");
LABEL_10:
    v18 = v20;
  }
  -[AVPlayerController seekToTime](self, "seekToTime");
  if (v18 != v21 && (v18 < v18 - a4 || v18 > v18 + a5))
    -[AVPlayerController _cancelPendingSeeksIfNeeded](self, "_cancelPendingSeeksIfNeeded");
  -[AVPlayerController timing](self, "timing");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentValue");
  v25 = v24;

  -[AVPlayerController _adjustedSeekTimeFromTime:toTime:](self, "_adjustedSeekTimeFromTime:toTime:", v25, v13);
  if (v13 == v26)
    v26 = v13;
  -[AVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:", v26, a4, a5);
}

- (BOOL)canScanForward
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canPlayFastForward")
    && !-[AVPlayerController touchBarRequiresLinearPlayback](self, "touchBarRequiresLinearPlayback"))
  {
    v5 = !-[AVPlayerController isPictureInPictureInterrupted](self, "isPictureInPictureInterrupted");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)scanForward:(id)a3
{
  double v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  double v9;

  if (-[AVPlayerController canScanForward](self, "canScanForward", a3))
  {
    v4 = 32.0;
  }
  else
  {
    -[AVPlayerController defaultPlaybackRate](self, "defaultPlaybackRate");
    v4 = v5;
  }
  -[AVPlayerController rate](self, "rate");
  v7 = 2.0;
  if (v6 < v4)
  {
    if (v6 <= -4.0)
    {
      v8 = ceil(log2(-v6));
      v9 = -1.0;
      goto LABEL_9;
    }
    v7 = 2.0;
    if (v6 >= 2.0)
    {
      v8 = floor(log2(v6));
      v9 = 1.0;
LABEL_9:
      v7 = exp2(v8 + v9);
    }
  }
  -[AVPlayerController setRate:](self, "setRate:", v7);
}

- (void)beginScanningForward:(id)a3
{
  NSObject *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = BYTE4(self->_toleranceAfter.epoch);
    v6 = BYTE5(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315650;
    v13 = "-[AVPlayerController beginScanningForward:]";
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = v6;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningForward: %d    isScanningBackward: %d", buf, 0x18u);
  }

  if (!BYTE4(self->_toleranceAfter.epoch) && !BYTE5(self->_toleranceAfter.epoch))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("AVPlayerControllerScanningDirectionKey");
    v11 = &unk_1E5BF3930;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("AVPlayerControllerDidBeginScanningNotification"), self, v8);

    *(_QWORD *)&self->_isScanningForward = 0;
    BYTE4(self->_toleranceAfter.epoch) = 1;
    -[AVPlayerController rate](self, "rate");
    self->_scanningCount = v9;
    -[AVPlayerController suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary](self, "suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary");
    -[AVPlayerController _updateScanningForwardRate](self, "_updateScanningForwardRate");
  }
}

- (void)_updateScanningForwardRate
{
  double v3;
  long double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  _QWORD block[5];

  -[AVPlayerController rate](self, "rate");
  if (v3 == 0.0)
  {
    -[AVPlayerController setRate:](self, "setRate:", 0.5);
    return;
  }
  v4 = v3;
  v5 = -[AVPlayerController canScanForward](self, "canScanForward");
  v6 = 60.0;
  if (!v5)
    v6 = 2.0;
  if (v4 < v6)
  {
    if (v4 <= -4.0)
    {
      v8 = ceil(log2(-v4));
      v9 = -1.0;
    }
    else
    {
      v7 = 2.0;
      if (v4 < 2.0)
      {
LABEL_11:
        -[AVPlayerController setRate:](self, "setRate:", v7);
        goto LABEL_12;
      }
      v8 = floor(log2(v4));
      v9 = 1.0;
    }
    v7 = exp2(v8 + v9);
    goto LABEL_11;
  }
LABEL_12:
  -[AVPlayerController scanningDelays](self, "scanningDelays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") > *(_QWORD *)&self->_isScanningForward)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    ++*(_QWORD *)&self->_isScanningForward;
    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AVPlayerController__updateScanningForwardRate__block_invoke;
    block[3] = &unk_1E5BB4CA0;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);
  }

}

- (void)endScanningForward:(id)a3
{
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = BYTE4(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315394;
    v11 = "-[AVPlayerController endScanningForward:]";
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningForward: %d", buf, 0x12u);
  }

  if (BYTE4(self->_toleranceAfter.epoch))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("AVPlayerControllerScanningDirectionKey");
    v9 = &unk_1E5BF3930;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("AVPlayerControllerDidEndScanningNotification"), self, v7);

    BYTE4(self->_toleranceAfter.epoch) = 0;
    -[AVPlayerController setRate:](self, "setRate:", *(double *)&self->_scanningCount);
    -[AVPlayerController resumePlaybackCoordinatorIfSuspended](self, "resumePlaybackCoordinatorIfSuspended");
  }
}

- (BOOL)canScanBackward
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canPlayFastReverse")
    && !-[AVPlayerController touchBarRequiresLinearPlayback](self, "touchBarRequiresLinearPlayback"))
  {
    v5 = !-[AVPlayerController isPictureInPictureInterrupted](self, "isPictureInPictureInterrupted");
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)scanBackward:(id)a3
{
  double v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;

  if (-[AVPlayerController canScanBackward](self, "canScanBackward", a3))
  {
    v4 = -32.0;
  }
  else
  {
    -[AVPlayerController defaultPlaybackRate](self, "defaultPlaybackRate");
    v4 = -v5;
  }
  -[AVPlayerController rate](self, "rate");
  v7 = v6;
  v8 = 2.0;
  if (v7 > v4)
  {
    if (v7 >= 4.0)
    {
      v9 = ceil(log2(v7));
      v10 = -1.0;
      goto LABEL_9;
    }
    if (v7 <= -2.0)
    {
      v9 = floor(log2(-v7));
      v10 = 1.0;
LABEL_9:
      v8 = exp2(v9 + v10);
    }
  }
  -[AVPlayerController setRate:](self, "setRate:", -v8);
}

- (void)beginScanningBackward:(id)a3
{
  NSObject *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = BYTE4(self->_toleranceAfter.epoch);
    v6 = BYTE5(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315650;
    v13 = "-[AVPlayerController beginScanningBackward:]";
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = v6;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningForward: %d isScanningBackward: %d", buf, 0x18u);
  }

  if (!BYTE5(self->_toleranceAfter.epoch) && !BYTE4(self->_toleranceAfter.epoch))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("AVPlayerControllerScanningDirectionKey");
    v11 = &unk_1E5BF3948;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("AVPlayerControllerDidBeginScanningNotification"), self, v8);

    *(_QWORD *)&self->_isScanningForward = 0;
    BYTE5(self->_toleranceAfter.epoch) = 1;
    -[AVPlayerController rate](self, "rate");
    self->_scanningCount = v9;
    -[AVPlayerController suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary](self, "suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary");
    -[AVPlayerController _updateScanningBackwardRate](self, "_updateScanningBackwardRate");
  }
}

- (void)_updateScanningBackwardRate
{
  double v3;
  long double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  _QWORD block[5];

  -[AVPlayerController rate](self, "rate");
  if (v3 == 0.0)
  {
    -[AVPlayerController setRate:](self, "setRate:", -0.5);
    return;
  }
  v4 = v3;
  v5 = -[AVPlayerController canScanBackward](self, "canScanBackward");
  v6 = 2.0;
  if (v5)
    v6 = 60.0;
  if (v6 > -v4)
  {
    if (v4 >= 4.0)
    {
      v8 = ceil(log2(v4));
      v9 = -1.0;
    }
    else
    {
      v7 = 2.0;
      if (v4 > -2.0)
      {
LABEL_11:
        -[AVPlayerController setRate:](self, "setRate:", -v7);
        goto LABEL_12;
      }
      v8 = floor(log2(-v4));
      v9 = 1.0;
    }
    v7 = exp2(v8 + v9);
    goto LABEL_11;
  }
LABEL_12:
  -[AVPlayerController scanningDelays](self, "scanningDelays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") > *(_QWORD *)&self->_isScanningForward)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    ++*(_QWORD *)&self->_isScanningForward;
    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AVPlayerController__updateScanningBackwardRate__block_invoke;
    block[3] = &unk_1E5BB4CA0;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);
  }

}

- (void)endScanningBackward:(id)a3
{
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = BYTE5(self->_toleranceAfter.epoch);
    *(_DWORD *)buf = 136315394;
    v11 = "-[AVPlayerController endScanningBackward:]";
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s isScanningBackward: %d", buf, 0x12u);
  }

  if (BYTE5(self->_toleranceAfter.epoch))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("AVPlayerControllerScanningDirectionKey");
    v9 = &unk_1E5BF3948;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("AVPlayerControllerDidEndScanningNotification"), self, v7);

    BYTE5(self->_toleranceAfter.epoch) = 0;
    -[AVPlayerController setRate:](self, "setRate:", *(double *)&self->_scanningCount);
    -[AVPlayerController resumePlaybackCoordinatorIfSuspended](self, "resumePlaybackCoordinatorIfSuspended");
  }
}

- (void)seekToBeginning:(id)a3
{
  -[AVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:", a3, -INFINITY, 0.0, 0.0);
}

- (void)seekToEnd:(id)a3
{
  -[AVPlayerController seekToTime:toleranceBefore:toleranceAfter:](self, "seekToTime:toleranceBefore:toleranceAfter:", a3, INFINITY, 0.0, 0.0);
}

- (BOOL)canSeekFrameForward
{
  return !-[AVPlayerController isAtMaxTime](self, "isAtMaxTime") && -[AVPlayerController canSeek](self, "canSeek");
}

- (void)seekFrameForward:(id)a3
{
  if (-[AVPlayerController canSeekFrameForward](self, "canSeekFrameForward", a3))
    -[AVPlayerController seekOrStepByFrameCount:](self, "seekOrStepByFrameCount:", 1);
}

- (BOOL)canSeekFrameBackward
{
  return !-[AVPlayerController isAtMinTime](self, "isAtMinTime") && -[AVPlayerController canSeek](self, "canSeek");
}

- (void)seekFrameBackward:(id)a3
{
  if (-[AVPlayerController canSeekFrameBackward](self, "canSeekFrameBackward", a3))
    -[AVPlayerController seekOrStepByFrameCount:](self, "seekOrStepByFrameCount:", -1);
}

- (void)seekOrStepByFrameCount:(int64_t)a3
{
  AVPlayerController *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int32_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  Float64 Seconds;
  AVPlayerController *v25;
  CMTime v26;
  CMTime lhs;
  CMTime rhs;
  CMTime v29;
  CMTime time1;
  _BYTE v31[24];
  CMTime v32;
  CMTime v33;
  _BYTE v34[24];
  CMTime time2;
  _BYTE time[32];
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = self;
    -[AVPlayerController pauseForAllCoordinatedPlaybackParticipants:](self, "pauseForAllCoordinatedPlaybackParticipants:", 1);
    -[AVPlayerController player](v4, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 < 1)
    {
      if (objc_msgSend(v6, "canStepBackward"))
      {
        v7 = v31;
        if (v6)
        {
          objc_msgSend(v6, "reversePlaybackEndTime");
          if ((v31[12] & 1) != 0)
          {
            objc_msgSend(v6, "reversePlaybackEndTime");
            time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if (CMTimeCompare(&time1, &time2))
            {
LABEL_21:
              memset(&v29, 0, sizeof(v29));
LABEL_22:
              objc_msgSend(v6, "currentTime");
LABEL_23:
              memset(time, 0, sizeof(time));
              v37 = 0u;
              v38 = 0u;
              objc_msgSend(v6, "tracks");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", time, &time2, 16);
              if (v14)
              {
                v15 = v14;
                v25 = v4;
                v16 = **(_QWORD **)&time[16];
                v17 = *MEMORY[0x1E0C8A808];
                do
                {
                  for (i = 0; i != v15; ++i)
                  {
                    if (**(_QWORD **)&time[16] != v16)
                      objc_enumerationMutation(v13);
                    v19 = *(void **)(*(_QWORD *)&time[8] + 8 * i);
                    objc_msgSend(v19, "assetTrack");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v19, "isEnabled"))
                    {
                      objc_msgSend(v20, "mediaType");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v21, "isEqualToString:", v17) & 1) != 0)
                      {
                        v22 = objc_msgSend(v20, "isEnabled");

                        if ((v22 & 1) != 0)
                          goto LABEL_36;
                      }
                      else
                      {

                      }
                    }

                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", time, &time2, 16);
                }
                while (v15);
                v20 = 0;
LABEL_36:
                v4 = v25;
              }
              else
              {
                v20 = 0;
              }

              memset(&time2, 0, sizeof(time2));
              if (!v20
                || (*(CMTime *)time = v29,
                    objc_msgSend(v20, "avkit_timeForFrameSteppedByFrameCount:fromFrameAtTime:", a3, time),
                    (time2.flags & 0x1D) != 1))
              {
                CMTimeMake(&rhs, a3, 4);
                lhs = v29;
                CMTimeAdd((CMTime *)time, &lhs, &rhs);
                time2 = *(CMTime *)time;
              }
              _AVLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(CMTime *)time = time2;
                Seconds = CMTimeGetSeconds((CMTime *)time);
                *(_DWORD *)time = 136315394;
                *(_QWORD *)&time[4] = "-[AVPlayerController seekOrStepByFrameCount:]";
                *(_WORD *)&time[12] = 2048;
                *(Float64 *)&time[14] = Seconds;
                _os_log_impl(&dword_1AC4B1000, v23, OS_LOG_TYPE_DEFAULT, "%s sampleBasedSeekTarget: %f", time, 0x16u);
              }

              *(CMTime *)time = time2;
              lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
              v26 = lhs;
              -[AVPlayerController seekToCMTime:toleranceBefore:toleranceAfter:](v4, "seekToCMTime:toleranceBefore:toleranceAfter:", time, &lhs, &v26);

              goto LABEL_44;
            }
          }
LABEL_16:
          objc_msgSend(v6, "stepByCount:", a3);
          _AVLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(time2.value) = 136315394;
            *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[AVPlayerController seekOrStepByFrameCount:]";
            LOWORD(time2.flags) = 2048;
            *(_QWORD *)((char *)&time2.flags + 2) = a3;
            _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s stepByCount: %ld", (uint8_t *)&time2, 0x16u);
          }

LABEL_44:
          return;
        }
LABEL_15:
        *v7 = 0;
        v7[1] = 0;
        v7[2] = 0;
        goto LABEL_16;
      }
    }
    else if (objc_msgSend(v6, "canStepForward"))
    {
      v7 = v34;
      if (v6)
      {
        objc_msgSend(v6, "forwardPlaybackEndTime");
        if ((v34[12] & 1) != 0)
        {
          objc_msgSend(v6, "forwardPlaybackEndTime");
          -[AVPlayerController player](v4, "player");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "currentItem");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
            objc_msgSend(v9, "duration");
          else
            memset(&v32, 0, sizeof(v32));
          v12 = CMTimeCompare(&v33, &v32);

          if (v12)
            goto LABEL_21;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    memset(&v29, 0, sizeof(v29));
    if (!v6)
      goto LABEL_23;
    goto LABEL_22;
  }
}

- (void)skipBackwardThirtySeconds:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[AVPlayerController player](self, "player", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AVPlayerController minTiming](self, "minTiming");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVPlayerController minTiming](self, "minTiming");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentValue");
      v8 = v7;

      if (-[AVPlayerController isSeeking](self, "isSeeking"))
        -[AVPlayerController seekToTime](self, "seekToTime");
      else
        -[AVPlayerController currentTime](self, "currentTime");
      v10 = v9 + -30.0;
      if (v8 > v10)
        v10 = v8;
      -[AVPlayerController seekToTime:](self, "seekToTime:", v10);
    }
  }

}

- (void)gotoEndOfSeekableRanges:(id)a3
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = *MEMORY[0x1E0CA2E30];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v5 = v7;
  v6 = v8;
  v3 = v7;
  v4 = v8;
  -[AVPlayerController seekToCMTime:toleranceBefore:toleranceAfter:](self, "seekToCMTime:toleranceBefore:toleranceAfter:", &v7, &v5, &v3);
}

- (void)beginScrubbing:(id)a3
{
  NSObject *v4;
  int64_t scrubbingCount;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AVPlayerController beginScrubbing:]";
    v8 = 1024;
    v9 = 3550;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  scrubbingCount = self->_scrubbingCount;
  if (!scrubbingCount)
  {
    -[AVPlayerController beginScrubbing](self, "beginScrubbing");
    scrubbingCount = self->_scrubbingCount;
  }
  self->_scrubbingCount = scrubbingCount + 1;
}

- (void)endScrubbing:(id)a3
{
  NSObject *v4;
  int64_t scrubbingCount;
  NSObject *v6;
  int64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[AVPlayerController endScrubbing:]";
    v10 = 1024;
    v11 = 3562;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount > 0)
    goto LABEL_7;
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v8) = 0;
    _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "Error: Calls to endScrubbing: must be balanced with calls to beginScrubbing:", (uint8_t *)&v8, 2u);
  }

  scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount >= 1)
  {
LABEL_7:
    v7 = scrubbingCount - 1;
    self->_scrubbingCount = v7;
    if (!v7)
      -[AVPlayerController endScrubbing](self, "endScrubbing");
  }
}

- (void)seekToChapter:(id)a3
{
  objc_msgSend(a3, "startTime");
  -[AVPlayerController seekToTime:](self, "seekToTime:");
}

- (BOOL)canSeekChapterForward
{
  void *v3;
  void *v4;
  uint64_t v5;
  double Seconds;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v17;
  CMTime time;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController canSeek](self, "canSeek"))
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "currentTime");
    else
      memset(&v17, 0, sizeof(v17));
    time = v17;
    Seconds = CMTimeGetSeconds(&time);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[AVPlayerController contentChapters](self, "contentChapters", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v14;
      v9 = floor(Seconds * 1000000.0);
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "startTime");
          if (v9 < floor(v11 * 1000000.0))
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)seekChapterForward:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  Float64 v12;
  id v13;
  void *v14;
  void *v15;
  CMTime v16;
  CMTime time2;
  CMTime v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime time1;
  CMTime preferredTimescale;
  const __CFString *v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController canSeekChapterForward](self, "canSeekChapterForward", a3))
  {
    memset(&preferredTimescale, 0, sizeof(preferredTimescale));
    -[AVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "currentTime");
    else
      memset(&preferredTimescale, 0, sizeof(preferredTimescale));

    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[AVPlayerController contentChapters](self, "contentChapters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        memset(&v18, 0, sizeof(v18));
        objc_msgSend(v11, "startTime");
        CMTimeMakeWithSeconds(&v18, v12, preferredTimescale.timescale);
        time1 = preferredTimescale;
        time2 = v18;
        if (CMTimeCompare(&time1, &time2) < 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v8)
            goto LABEL_7;
          goto LABEL_16;
        }
      }
      v13 = v11;
      time1 = v18;

      if (!v13)
        return;
      v18 = time1;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v16 = time2;
      -[AVPlayerController seekToCMTime:toleranceBefore:toleranceAfter:](self, "seekToCMTime:toleranceBefore:toleranceAfter:", &v18, &time2, &v16);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("AVPlayerControllerDidSeekChapterChapterKey");
      v26 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("AVPlayerControllerDidSeekChapterNotification"), self, v15);

      v6 = v13;
    }
LABEL_16:

  }
}

- (BOOL)canSeekChapterBackward
{
  void *v3;
  void *v4;
  uint64_t v5;
  double Seconds;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime v20;
  CMTime time;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController canSeek](self, "canSeek"))
  {
    -[AVPlayerController player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "currentTime");
    else
      memset(&v20, 0, sizeof(v20));
    time = v20;
    Seconds = CMTimeGetSeconds(&time);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[AVPlayerController contentChapters](self, "contentChapters", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v5)
    {
      v8 = *(_QWORD *)v17;
      v9 = floor(Seconds * 1000000.0);
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "startTime");
          v13 = v12;
          objc_msgSend(v11, "duration");
          if (v9 > floor((v13 + v14 * 0.333333333) * 1000000.0))
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)seekChapterBackward:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  Float64 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTime time1;
  CMTime preferredTimescale;
  const __CFString *v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[AVPlayerController canSeekChapterBackward](self, "canSeekChapterBackward", a3))
  {
    memset(&preferredTimescale, 0, sizeof(preferredTimescale));
    -[AVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "currentTime");
    else
      memset(&preferredTimescale, 0, sizeof(preferredTimescale));

    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[AVPlayerController contentChapters](self, "contentChapters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        memset(&v26, 0, sizeof(v26));
        objc_msgSend(v12, "startTime");
        CMTimeMakeWithSeconds(&v26, v13, preferredTimescale.timescale);
        memset(&v25, 0, sizeof(v25));
        objc_msgSend(v12, "startTime");
        v15 = v14;
        objc_msgSend(v12, "duration");
        CMTimeMakeWithSeconds(&v25, v15 + v16 * 0.333333333, preferredTimescale.timescale);
        memset(&v24, 0, sizeof(v24));
        objc_msgSend(v12, "startTime");
        v18 = v17;
        objc_msgSend(v12, "duration");
        CMTimeMakeWithSeconds(&v24, v18 + v19, preferredTimescale.timescale);
        time1 = preferredTimescale;
        v23 = v25;
        if (CMTimeCompare(&time1, &v23) >= 1)
        {
          time1 = preferredTimescale;
          v23 = v24;
          if (CMTimeCompare(&time1, &v23) < 1)
            break;
        }
        time1 = preferredTimescale;
        v23 = v24;
        if (CMTimeCompare(&time1, &v23) > 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v9)
            goto LABEL_7;
          goto LABEL_18;
        }
      }
      v20 = v12;
      time1 = v26;

      if (!v20)
        return;
      v26 = time1;
      v25 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v24 = v25;
      -[AVPlayerController seekToCMTime:toleranceBefore:toleranceAfter:](self, "seekToCMTime:toleranceBefore:toleranceAfter:", &v26, &v25, &v24);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("AVPlayerControllerDidSeekChapterChapterKey");
      v34 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("AVPlayerControllerDidSeekChapterNotification"), self, v22);

      v7 = v20;
    }
LABEL_18:

  }
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AVPlayerController player](self, "player");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsExternalPlayback:", v3);

}

- (void)beginReducingResourcesForPictureInPicturePlayerLayer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "-[AVPlayerController beginReducingResourcesForPictureInPicturePlayerLayer:]";
    v20 = 1024;
    v21 = 4016;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v18, 0x12u);
  }

  -[AVPlayerController setPlayerLayerForReducingResources:](self, "setPlayerLayerForReducingResources:", v4);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PIPStashBufferDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("PIPStashPeakBitRate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  -[AVPlayerController acquireResourceReductionAssertion](self, "acquireResourceReductionAssertion");
  objc_msgSend(v4, "setPlayer:", 0);

  if (-[AVPlayerController isStreaming](self, "isStreaming") && (v13 != 0.0 || v9 != 0.0))
  {
    -[AVPlayerController player](self, "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPreferredPeakBitRate:", v13);

    -[AVPlayerController player](self, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreferredForwardBufferDuration:", v9);

  }
}

- (void)endReducingResourcesForPictureInPicturePlayerLayer:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AVPlayerController endReducingResourcesForPictureInPicturePlayerLayer:]";
    v8 = 1024;
    v9 = 4036;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  -[AVPlayerController reduceResourceUsageAssertion](self, "reduceResourceUsageAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[AVPlayerController setPlayerLayerForReducingResources:](self, "setPlayerLayerForReducingResources:", 0);
}

- (void)acquireResourceReductionAssertion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17[3];
  id location;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredPeakBitRate");
  v6 = v5;

  -[AVPlayerController player](self, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredForwardBufferDuration");
  v10 = v9;

  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x1E0D01868]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __55__AVPlayerController_acquireResourceReductionAssertion__block_invoke;
  v16 = &unk_1E5BB46D8;
  objc_copyWeak(v17, &location);
  v17[1] = v6;
  v17[2] = v10;
  v12 = (void *)objc_msgSend(v11, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("AVPlayerControllerResourceReductionIdentifier"), CFSTR("Reducing Resources for Picture in Picture"), &v13);
  -[AVPlayerController setReduceResourceUsageAssertion:](self, "setReduceResourceUsageAssertion:", v12, v13, v14, v15, v16);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)setReduceResourceUsageAssertion:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = *(id *)&self->_playingOnSecondScreen;
  if (v6 != v5)
  {
    v7 = v5;
    objc_msgSend(v6, "invalidate");
    objc_storeStrong((id *)&self->_playingOnSecondScreen, a3);
    v5 = v7;
  }

}

- (BOOL)isReducingResourcesForPictureInPicture
{
  void *v2;
  BOOL v3;

  -[AVPlayerController reduceResourceUsageAssertion](self, "reduceResourceUsageAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canUseNetworkResourcesForLiveStreamingWhilePaused
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUseNetworkResourcesForLiveStreamingWhilePaused");

  return v4;
}

- (void)setCanUseNetworkResourcesForLiveStreamingWhilePaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[AVPlayerController player](self, "player");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanUseNetworkResourcesForLiveStreamingWhilePaused:", v3);

}

- (void)_scheduleAtLiveEdgeStateUpdateIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[AVPlayerController rate](self, "rate");
  v4 = v3;
  -[AVPlayerController currentTime](self, "currentTime");
  v6 = v5;
  -[AVPlayerController maxTime](self, "maxTime");
  v8 = vabdd_f64(v7, v6);
  if (v4 < 1.0)
  {
    if (v8 >= 10.0)
      return;
    goto LABEL_3;
  }
  if (v4 > 1.0 && v8 >= 10.0)
LABEL_3:
    -[AVPlayerController _scheduleAtLiveEdgeStateUpdateWithTimeInterval:](self, "_scheduleAtLiveEdgeStateUpdateWithTimeInterval:");
}

- (void)_scheduleAtLiveEdgeStateUpdateWithTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend(*(id *)&self->_muted, "invalidate");
  v5 = *(void **)&self->_muted;
  *(_QWORD *)&self->_muted = 0;

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0C99E88];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__AVPlayerController__scheduleAtLiveEdgeStateUpdateWithTimeInterval___block_invoke;
  v9[3] = &unk_1E5BB49A8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)&self->_muted;
  *(_QWORD *)&self->_muted = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_photosensitiveDisplayTimes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AVPlayerController player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSTimer photosensitivityRegions](self->_updatePlayingOnMatchPointDeviceThrottleTimer, "photosensitivityRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVPhotosensitiveTimeRange timeRangesFromMetadata:initialDate:](AVPhotosensitiveTimeRange, "timeRangesFromMetadata:initialDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_beginPlaybackSuspension_AVFoundationStrategy
{
  -[AVPlayerController rate](self, "rate");
  -[AVPlayerController _setSuspendedRate:](self, "_setSuspendedRate:");
  -[AVPlayerController setRate:](self, "setRate:", 0.0);
}

- (void)_cancelPendingSeeksIfNeeded
{
  NSObject *seekQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  seekQueue = self->_seekQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__AVPlayerController__cancelPendingSeeksIfNeeded__block_invoke;
  v4[3] = &unk_1E5BB4A40;
  objc_copyWeak(&v5, &location);
  dispatch_async(seekQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_createMetadataDictionaryForCurrentAsset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "commonMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C8A8C0];
    v7 = *MEMORY[0x1E0C8A9D0];
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v4, *MEMORY[0x1E0C8A8C0], *MEMORY[0x1E0C8A9D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v6);
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:filteredByIdentifier:", v4, *MEMORY[0x1E0C8A9A0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && objc_msgSend(v13, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C8AB20]);
    v29 = v10;
    v14 = *MEMORY[0x1E0C8A898];
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v4, *MEMORY[0x1E0C8A898], v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && objc_msgSend(v17, "length"))
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v14);
    v18 = v5;
    v19 = *MEMORY[0x1E0C8A880];
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v4, *MEMORY[0x1E0C8A880], v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 && objc_msgSend(v22, "length"))
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, v19);
    v23 = *MEMORY[0x1E0C8A888];
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v4, *MEMORY[0x1E0C8A888], v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dataValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26 && objc_msgSend(v26, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v23);

    }
  }

  return 0;
}

- (void)_endPlaybackSuspension_AVFoundationStrategy
{
  -[AVPlayerController setRate:](self, "setRate:", *(double *)&self->_captionAppearanceDisplayType);
  -[AVPlayerController _setSuspendedRate:](self, "_setSuspendedRate:", NAN);
}

- (void)_setPlaybackSuspended:(BOOL)a3
{
  if (self->_disablingAutomaticTermination != a3)
    self->_disablingAutomaticTermination = a3;
}

- (void)_setSuspendedRate:(double)a3
{
  if (*(double *)&self->_captionAppearanceDisplayType != a3)
    *(double *)&self->_captionAppearanceDisplayType = a3;
}

- (void)_startSuspendingPlayback
{
  -[AVPlayerController suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary](self, "suspendPlaybackCoordinatorWhileActivelySeekingIfNecessary");
  -[AVPlayerController _beginPlaybackSuspension_AVFoundationStrategy](self, "_beginPlaybackSuspension_AVFoundationStrategy");
  -[AVPlayerController _setPlaybackSuspended:](self, "_setPlaybackSuspended:", 1);
}

- (void)_stopSuspendingPlayback
{
  -[AVPlayerController _setPlaybackSuspended:](self, "_setPlaybackSuspended:", 0);
  -[AVPlayerController resumePlaybackCoordinatorIfSuspended](self, "resumePlaybackCoordinatorIfSuspended");
  -[AVPlayerController _endPlaybackSuspension_AVFoundationStrategy](self, "_endPlaybackSuspension_AVFoundationStrategy");
}

- (id)_timecodeTrack
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avkit_tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C8A800];
  objc_msgSend(v5, "avkit_associatedTracksOfType:", *MEMORY[0x1E0C8A800]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "avkit_tracksWithMediaType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)_updateRateForScrubbingAndSeeking
{
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[AVPlayerController _updateRateForScrubbingAndSeeking]";
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "*** %s must be called on main thread. ***", (uint8_t *)&v5, 0xCu);
    }

  }
  if (!-[AVPlayerController isSeeking](self, "isSeeking")
    && !-[AVPlayerController isPlaybackSuspended](self, "isPlaybackSuspended"))
  {
    v4 = -[AVPlayerController isScrubbing](self, "isScrubbing");
    -[AVPlayerController rateBeforeScrubBegan](self, "rateBeforeScrubBegan");
    if (!v4)
    {
      -[AVPlayerController rateBeforeScrubBegan](self, "rateBeforeScrubBegan");
      -[AVPlayerController setRate:](self, "setRate:");
      -[AVPlayerController setRateBeforeScrubBegan:](self, "setRateBeforeScrubBegan:", NAN);
    }
  }
}

- (id)scanningDelays
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;

  v3 = -[AVPlayerController hasEnabledAudio](self, "hasEnabledAudio");
  v4 = -[AVPlayerController hasEnabledVideo](self, "hasEnabledVideo");
  v5 = &unk_1E5BF4110;
  if (!v3)
    v5 = 0;
  if (v4)
    return &unk_1E5BF4128;
  else
    return v5;
}

- (double)_adjustedSeekTimeFromTime:(double)a3 toTime:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;

  -[AVPlayerController activePlayer](self, "activePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[AVPlayerController interstitialController](self, "interstitialController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeToSeekAfterUserNavigatedFromTime:toTime:", a3, a4);
    a4 = v10;

  }
  return a4;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_canTogglePictureInPicture, a3);
}

- (BOOL)isAtMaxTime
{
  return BYTE2(self->_liveEdgeTimer);
}

- (BOOL)isAtMinTime
{
  return BYTE3(self->_liveEdgeTimer);
}

- (void)setScrubbing:(BOOL)a3
{
  BYTE4(self->_liveEdgeTimer) = a3;
}

- (void)setActiveRate:(double)a3
{
  *(double *)&self->_activePlayer = a3;
}

- (void)setAssetInspectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetIfReady, a3);
}

- (AVAssetTrack)currentAudioTrack
{
  return (AVAssetTrack *)self->_maxTiming;
}

- (AVAssetTrack)currentVideoTrack
{
  return self->_currentAudioTrack;
}

- (BOOL)isSeekingInternal
{
  return BYTE6(self->_liveEdgeTimer) & 1;
}

- (double)initialScrubbingTime
{
  return self->_seekToTime;
}

- (void)setInitialScrubbingTime:(double)a3
{
  self->_seekToTime = a3;
}

- (NSDictionary)metadata
{
  return *(NSDictionary **)&self->_initialScrubbingTime;
}

- (NSArray)contentChapters
{
  return (NSArray *)self->_metadata;
}

- (BOOL)isComposable
{
  return self->_isPlayingHDRContent;
}

- (BOOL)hasProtectedContent
{
  return self->_atLiveEdge;
}

- (NSArray)availableMetadataFormats
{
  return self->_contentChapters;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return self->_atMaxTime;
}

- (double)rateBeforeScrubBegan
{
  return *(double *)&self->_availableMetadataFormats;
}

- (void)setRateBeforeScrubBegan:(double)a3
{
  *(double *)&self->_availableMetadataFormats = a3;
}

- (AVCoordinatedPlaybackSuspension)scrubCoordinatorSuspension
{
  return *(AVCoordinatedPlaybackSuspension **)&self->_rateBeforeScrubBegan;
}

- (void)setScrubCoordinatorSuspension:(id)a3
{
  objc_storeStrong((id *)&self->_rateBeforeScrubBegan, a3);
}

- (BOOL)isPreventingIdleSystemSleep
{
  return self->_atMinTime;
}

- (void)setPreventingIdleSystemSleep:(BOOL)a3
{
  self->_atMinTime = a3;
}

- (BOOL)isPreventingIdleDisplaySleep
{
  return self->_scrubbing;
}

- (void)setPreventingIdleDisplaySleep:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (BOOL)isDisablingAutomaticTermination
{
  return self->_pictureInPictureSupported;
}

- (void)setDisablingAutomaticTermination:(BOOL)a3
{
  self->_pictureInPictureSupported = a3;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_seekingInternal;
}

- (BOOL)isPictureInPictureActive
{
  return self->_seeking;
}

- (BOOL)canTogglePictureInPicture
{
  return self->_composable;
}

- (void)setPipActivitySessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (void)setInterstitialController:(id)a3
{
  objc_storeStrong((id *)&self->_pipActivitySessionIdentifier, a3);
}

- (AVPlayerLayer)playerLayerForReducingResources
{
  return (AVPlayerLayer *)objc_loadWeakRetained((id *)&self->_interstitialController);
}

- (void)setPlayerLayerForReducingResources:(id)a3
{
  objc_storeWeak((id *)&self->_interstitialController, a3);
}

- (NSArray)photosensitivityRegions
{
  return (NSArray *)self->_playerLayerForReducingResources;
}

- (BOOL)_isScanningTV
{
  return self->_preventingIdleSystemSleep;
}

- (void)setScanningTV:(BOOL)a3
{
  self->_preventingIdleSystemSleep = a3;
}

- (OS_dispatch_source)seekTimer
{
  return (OS_dispatch_source *)self->_photosensitivityRegions;
}

- (void)setShouldLoadVisualMediaSelectionOptions:(BOOL)a3
{
  self->_preventingIdleDisplaySleep = a3;
}

- (int64_t)captionAppearanceDisplayType
{
  return (int64_t)self->_seekTimer;
}

- (void)setCaptionAppearanceDisplayType:(int64_t)a3
{
  self->_seekTimer = (OS_dispatch_source *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosensitivityRegions, 0);
  objc_storeStrong((id *)&self->_playerLayerForReducingResources, 0);
  objc_destroyWeak((id *)&self->_interstitialController);
  objc_storeStrong((id *)&self->_pipActivitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_scrubCoordinatorSuspension, 0);
  objc_storeStrong((id *)&self->_rateBeforeScrubBegan, 0);
  objc_storeStrong((id *)&self->_contentChapters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_initialScrubbingTime, 0);
  objc_storeStrong((id *)&self->_currentAudioTrack, 0);
  objc_storeStrong((id *)&self->_maxTiming, 0);
  objc_storeStrong((id *)&self->_minTiming, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_externalPlaybackAirPlayDeviceLocalizedName, 0);
  objc_storeStrong((id *)&self->_assetBeingPrepared, 0);
  objc_storeStrong((id *)&self->_assetInspectionQueue, 0);
  objc_storeStrong((id *)&self->_currentAssetIfReady, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_activeRate, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_canTogglePictureInPicture, 0);
  objc_storeStrong((id *)&self->_muted, 0);
  objc_storeStrong((id *)&self->_updatePlayingOnMatchPointDeviceThrottleTimer, 0);
  objc_storeStrong((id *)&self->_lastTimePlayingOnMatchPointDeviceWasUpdated, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegate, 0);
  objc_destroyWeak((id *)&self->_timecodeController);
  objc_storeStrong((id *)&self->_touchBarRequiresLinearPlayback, 0);
  objc_storeStrong((id *)&self->_playingOnSecondScreen, 0);
  objc_storeStrong((id *)&self->_liveStreamMinTiming, 0);
  objc_storeStrong((id *)&self->_preScanningRate, 0);
  objc_storeStrong((id *)&self->_seekQueue, 0);
  objc_storeStrong(&self->_retryPlayingImmediatelyBlock, 0);
  objc_storeStrong((id *)&self->_rateToRestoreAfterAudioSessionInterruptionEnds, 0);
  objc_storeStrong(&self->_timecodePeriodicObserverToken, 0);
  objc_storeStrong(&self->_updateAtMinMaxTimePeriodicObserverToken, 0);
  objc_storeStrong((id *)&self->_recentLegibleLanguageForLastSort, 0);
  objc_storeStrong((id *)&self->_lastKnownPersistedExtendedLanguageTag, 0);
  objc_storeStrong((id *)&self->_cachedSelectedLegibleMediaSelectionOptionAccordingToAVFoundation, 0);
  objc_storeStrong((id *)&self->_cachedSelectedLegibleMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_cachedSelectedAudioMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_legibleMediaSelectionOptions, 0);
  objc_storeStrong((id *)&self->_visualMediaSelectionOptions, 0);
  objc_storeStrong((id *)&self->_audioMediaSelectionOptions, 0);
}

- (uint64_t)_mainPlayerIsWaitingForInterstitialPlayback
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  objc_msgSend(a1, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeControlStatus");

  objc_msgSend(a1, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reasonForWaitingToPlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == 1)
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8ACB8]);
  else
    v6 = 0;

  return v6;
}

void __50__AVPlayerController__setupInterstitialController__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "seekToTime:toleranceBefore:toleranceAfter:", a2, 0.0, 0.0);

}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_340(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  _QWORD block[5];
  _QWORD v10[4];
  id v11;
  __int128 v12;
  _QWORD v13[13];

  v2 = MEMORY[0x1E0C809B0];
  v13[12] = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2_341;
  v10[3] = &unk_1E5BB4720;
  v11 = *(id *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 40);
  v3 = (id)v8;
  v12 = v8;
  v4 = (void (**)(_QWORD))MEMORY[0x1AF43E9B8](v10);
  objc_msgSend(*(id *)(a1 + 32), "avkit_tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13[0] = CFSTR("nominalFrameRate");
    v13[1] = CFSTR("availableMetadataFormats");
    v13[2] = CFSTR("commonMetadata");
    v13[3] = CFSTR("enabled");
    v13[4] = CFSTR("languageCode");
    v13[5] = CFSTR("mediaType");
    v13[6] = CFSTR("metadata");
    v13[7] = CFSTR("minFrameDuration");
    v13[8] = CFSTR("extendedLanguageTag");
    v13[9] = CFSTR("mediaCharacteristics");
    v13[10] = CFSTR("availableTrackAssociationTypes");
    v13[11] = CFSTR("currentVideoTrack.preferredTransform");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadValuesAsynchronouslyForKeys:completionHandler:", v7, v4);

  }
  else if (*(_QWORD *)(a1 + 32))
  {
    v4[2](v4);
  }
  else
  {
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_4;
    block[3] = &unk_1E5BB4748;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_2_341(uint64_t a1)
{
  id v2;
  __int128 v3;
  _QWORD block[4];
  id v5;
  __int128 v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_3;
  block[3] = &unk_1E5BB4720;
  v5 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __56__AVPlayerController__prepareAssetForInspectionIfNeeded__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __37__AVPlayerController__updateMetadata__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __37__AVPlayerController__updateMetadata__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_createMetadataDictionaryForCurrentAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v3, "_createMetadataDictionaryForCurrentAsset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__AVPlayerController__updateMetadata__block_invoke_3;
      v7[3] = &unk_1E5BB45E8;
      objc_copyWeak(&v9, v1);
      v8 = v5;
      v6 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

      objc_destroyWeak(&v9);
    }

  }
}

void __37__AVPlayerController__updateMetadata__block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setMetadata:", v2);

}

void __49__AVPlayerController__cancelPendingSeeksIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    objc_msgSend(WeakRetained, "setSeekingInternal:", 0);
    v7 = *MEMORY[0x1E0CA2E18];
    v6 = v7;
    v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v3 = v8;
    objc_msgSend(v2, "setSeekToTimeInternal:", &v7);
    *(_OWORD *)(v2 + 172) = v6;
    *(_QWORD *)(v2 + 188) = v3;
    *(_OWORD *)(v2 + 196) = v6;
    *(_QWORD *)(v2 + 212) = v3;
    objc_msgSend(v2, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelPendingSeeks");

  }
}

void __52__AVPlayerController__updatePhotosensitivityRegions__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", v5))
  {
    objc_msgSend(v9, "_photosensitiveDisplayTimes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPhotosensitivityRegions:", v8);

  }
}

void __69__AVPlayerController__scheduleAtLiveEdgeStateUpdateWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAtLiveEdgeStateIfNeeded");

}

void __55__AVPlayerController_acquireResourceReductionAssertion__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Resource Reduction assertion was invalidated.", v10, 2u);
    }

    objc_msgSend(WeakRetained, "playerLayerForReducingResources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayer:", v5);

    if (objc_msgSend(WeakRetained, "isStreaming")
      && (*(double *)(a1 + 40) != 0.0 || *(double *)(a1 + 48) != 0.0))
    {
      objc_msgSend(WeakRetained, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreferredPeakBitRate:", *(double *)(a1 + 40));

      objc_msgSend(WeakRetained, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPreferredForwardBufferDuration:", *(double *)(a1 + 48));

    }
  }

}

_BYTE *__49__AVPlayerController__updateScanningBackwardRate__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[221])
    return (_BYTE *)objc_msgSend(result, "_updateScanningBackwardRate");
  return result;
}

_BYTE *__48__AVPlayerController__updateScanningForwardRate__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[220])
    return (_BYTE *)objc_msgSend(result, "_updateScanningForwardRate");
  return result;
}

void __40__AVPlayerController_actuallySeekToTime__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSeeking:", 0);

}

void __40__AVPlayerController_actuallySeekToTime__block_invoke_260(uint64_t a1, int a2)
{
  id *v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "NO";
      if (a2)
        v6 = "YES";
      *(_DWORD *)buf = 136315138;
      v11 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "Seek completed: %s", buf, 0xCu);
    }

    v7 = WeakRetained[20];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke_261;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v9, v3);
    dispatch_async(v7, block);
    objc_destroyWeak(&v9);
  }

}

void __40__AVPlayerController_actuallySeekToTime__block_invoke_261(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  _BYTE *v3;
  uint64_t v4;
  __int128 v5;
  _QWORD block[4];
  id v7;
  __int128 v8;
  uint64_t v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[168])
    {
      WeakRetained[168] = 0;
      objc_msgSend(WeakRetained, "actuallySeekToTime");
    }
    else
    {
      objc_msgSend(WeakRetained, "setSeekingInternal:", 0);
      v8 = *MEMORY[0x1E0CA2E18];
      v5 = v8;
      v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v4 = v9;
      objc_msgSend(v3, "setSeekToTimeInternal:", &v8);
      *(_OWORD *)(v3 + 172) = v5;
      *(_QWORD *)(v3 + 188) = v4;
      *(_OWORD *)(v3 + 196) = v5;
      *(_QWORD *)(v3 + 212) = v4;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__AVPlayerController_actuallySeekToTime__block_invoke_2;
      block[3] = &unk_1E5BB4A40;
      objc_copyWeak(&v7, v1);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v7);
    }
  }

}

void __40__AVPlayerController_actuallySeekToTime__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setSeeking:", 0);
    objc_msgSend(v2, "_updateRateForScrubbingAndSeeking");
    WeakRetained = v2;
  }

}

void __73__AVPlayerController_throttledSeekToTime_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  char *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(_OWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(WeakRetained, "setSeekToTimeInternal:", &v6);
    v4 = *(_OWORD *)(a1 + 64);
    *(_QWORD *)(v3 + 188) = *(_QWORD *)(a1 + 80);
    *(_OWORD *)(v3 + 172) = v4;
    v5 = *(_OWORD *)(a1 + 88);
    *(_QWORD *)(v3 + 212) = *(_QWORD *)(a1 + 104);
    *(_OWORD *)(v3 + 196) = v5;
    if (objc_msgSend(v3, "isSeekingInternal"))
      v3[168] = 1;
    else
      objc_msgSend(v3, "actuallySeekToTime");
  }

}

void __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "contextID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "_updatePlayingOnMatchPointDeviceIfNeeded");

  }
}

void __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_2(uint64_t a1)
{
  id *v1;
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[42];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_3;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }

}

void __83__AVPlayerController__throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)*((_QWORD *)WeakRetained + 43);
    *((_QWORD *)WeakRetained + 43) = v1;

    objc_msgSend(WeakRetained, "_updatePlayingOnMatchPointDeviceIfNeeded");
    objc_msgSend(*((id *)WeakRetained + 44), "invalidate");
    v3 = (void *)*((_QWORD *)WeakRetained + 44);
    *((_QWORD *)WeakRetained + 44) = 0;

  }
}

void __33__AVPlayerController_setPlaying___block_invoke(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  int32_t v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE v17[24];
  CMTime time2;
  CMTime time1;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[24];
  CMTime rhs;
  _QWORD v28[3];
  CMTime lhs;
  CMTime v30;
  CMTime v31;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "activePlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_queuePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 > 1 || (objc_msgSend(v3, "isSeekingInternal") & 1) != 0 || v3[168])
      goto LABEL_5;
    if (v5)
      objc_msgSend(v5, "currentTime");
    else
      memset(&v31, 0, sizeof(v31));
    objc_msgSend(v4, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "duration");
    else
      memset(v28, 0, sizeof(v28));
    playbackMaxTimeForPlayerItemAndContentDuration((uint64_t)&lhs, v5, (uint64_t)v28);
    CMTimeMake(&rhs, 1, 1200);
    CMTimeSubtract(&v30, &lhs, &rhs);
    v12 = CMTimeCompare(&v31, &v30);

    if (v12 < 0)
    {
LABEL_5:
      if (v5)
      {
        objc_msgSend(v5, "currentTime");
        playbackMinTimeForPlayerItem((uint64_t)&time2, v5);
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      }
      if (CMTimeCompare(&time1, &time2) < 0 && objc_msgSend(v3, "hasLiveStreamingContent"))
      {
        playbackMinTimeForPlayerItem((uint64_t)v17, v5);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __33__AVPlayerController_setPlaying___block_invoke_4;
        v15[3] = &unk_1E5BB4688;
        v9 = &v16;
        objc_copyWeak(&v16, v1);
        v22 = *MEMORY[0x1E0CA2E68];
        v23 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        v20 = v22;
        v21 = v23;
        objc_msgSend(v4, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", v17, &v22, &v20, v15);
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __33__AVPlayerController_setPlaying___block_invoke_6;
        block[3] = &unk_1E5BB4A40;
        v9 = &v14;
        objc_copyWeak(&v14, v1);
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {
      playbackMinTimeForPlayerItem((uint64_t)v26, v5);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __33__AVPlayerController_setPlaying___block_invoke_2;
      v24[3] = &unk_1E5BB4688;
      v9 = &v25;
      objc_copyWeak(&v25, v1);
      v22 = *MEMORY[0x1E0CA2E68];
      v23 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v20 = v22;
      v21 = v23;
      objc_msgSend(v4, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", v26, &v22, &v20, v24);
    }
    objc_destroyWeak(v9);

  }
}

void __33__AVPlayerController_setPlaying___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__AVPlayerController_setPlaying___block_invoke_3;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v3);
  }
}

void __33__AVPlayerController_setPlaying___block_invoke_4(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__AVPlayerController_setPlaying___block_invoke_5;
    block[3] = &unk_1E5BB4A40;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v3);
  }
}

void __33__AVPlayerController_setPlaying___block_invoke_6(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "defaultPlaybackRate");
  objc_msgSend(v1, "setRate:");

}

void __33__AVPlayerController_setPlaying___block_invoke_5(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "defaultPlaybackRate");
  objc_msgSend(v1, "setRate:");

}

void __33__AVPlayerController_setPlaying___block_invoke_3(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "defaultPlaybackRate");
  objc_msgSend(v1, "setRate:");

}

uint64_t __34__AVPlayerController__playAtRate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "-[AVPlayerController _playAtRate:]_block_invoke";
    v9 = 2048;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_1AC4B1000, v2, OS_LOG_TYPE_DEFAULT, "%s immediately %.1f on %p", (uint8_t *)&v7, 0x20u);
  }

  v5 = *(double *)(a1 + 40);
  *(float *)&v5 = v5;
  return objc_msgSend(*(id *)(a1 + 32), "playImmediatelyAtRate:", v5);
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_151(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateMetadata");

}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("commonMetadata"), 0) == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_updateMetadata");

  }
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("availableChapterLocales"), 0);
  if (result == 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_10(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_11;
  v2[3] = &unk_1E5BB45E8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("composable"), 0);
  if (result == 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_14(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_15;
  v2[3] = &unk_1E5BB45E8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("hasProtectedContent"), 0);
  if (result == 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_18(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_19;
  v2[3] = &unk_1E5BB45E8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("availableMetadataFormats"), 0);
  if (result == 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_22(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_23;
  v2[3] = &unk_1E5BB45E8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "statusOfValueForKey:error:", CFSTR("compatibleWithAirPlayVideo"), 0);
  if (result == 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_188(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSeekToTime:", *(double *)(a1 + 40));

}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_7(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setContentChapters:", v2);

}

uint64_t __64__AVPlayerController__observeValueForKeyPath_oldValue_newValue___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startTime");
  v7 = v6;
  objc_msgSend(v5, "startTime");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "startTime");
    v11 = v10;
    objc_msgSend(v5, "startTime");
    if (v11 < v12)
      v9 = -1;
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __30__AVPlayerController_startKVO__block_invoke_13(uint64_t a1, _BYTE *a2)
{
  -[AVPlayerController _updateIsPlayingHDRContentIfNeeded](a2);
}

- (void)_updateIsPlayingHDRContentIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  char v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1 && FigIsHDRAllowedOnDevice())
  {
    objc_msgSend(a1, "player");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tracks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      v9 = *MEMORY[0x1E0C8A808];
      v10 = *MEMORY[0x1E0C8A708];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "assetTrack", (_QWORD)v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEnabled") && objc_msgSend(v13, "isEnabled"))
          {
            objc_msgSend(v13, "mediaType");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v14, "isEqualToString:", v9) & 1) != 0)
            {
              v15 = objc_msgSend(v13, "hasMediaCharacteristic:", v10);

              if (v15)
              {

                v16 = 1;
                goto LABEL_17;
              }
            }
            else
            {

            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
    v16 = 0;
LABEL_17:

    if (a1[384] != v16)
    {
      a1[384] = v16;
      objc_msgSend(a1, "internalDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        objc_msgSend(a1, "internalDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "playerControllerDidUpdateIsPlayingHDRContent:", a1);

      }
    }

  }
}

void __30__AVPlayerController_startKVO__block_invoke_12(uint64_t a1, void *a2)
{
  _BYTE *v2;

  v2 = a2;
  objc_msgSend(v2, "_updateCurrentAudioTrackIfNeeded");
  objc_msgSend(v2, "_updateCurrentVideoTrackIfNeeded");
  -[AVPlayerController _updateIsPlayingHDRContentIfNeeded](v2);

}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_4_65(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePlayingOnMatchPointDeviceIfNeeded");

}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateActivePlayer");
}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateActivePlayer");
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_3_62(uint64_t a1, _BYTE *a2)
{
  _BYTE *v2;
  id v3;

  if (!a2[369])
  {
    v2 = a2;
    objc_msgSend(v2, "player");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMuted:", objc_msgSend(v3, "isMuted"));

  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_2_57(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a4, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_throttledUpdatePlayingOnMatchPointDeviceIfNeededWithContext:", v6);

}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_55(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateCoordinatedPlaybackActive");
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_3_53(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "externalPlaybackType");
  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 1)
  {
    if (v5)
    {
      v7 = 136315394;
      v8 = "-[AVPlayerController startInspectionIfNeeded]_block_invoke_3";
      v9 = 2114;
      v10 = (uint64_t)v2;
      _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s have AirPlay to AppleTV for %{public}@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(v2, "player");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject currentItem](v4, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "avkit_airMessageSendToAppleTV");

  }
  else if (v5)
  {
    v7 = 136315394;
    v8 = "-[AVPlayerController startInspectionIfNeeded]_block_invoke";
    v9 = 2048;
    v10 = objc_msgSend(v2, "externalPlaybackType");
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s have AirPlay to AppleTV, but externalPlaybackType = %ld", (uint8_t *)&v7, 0x16u);
  }

}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_2_51(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a4;
  objc_msgSend(v9, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isEqual:", v8);
  if ((_DWORD)v5)
    objc_msgSend(v9, "reloadOptionsAndCurrentSelections");

}

uint64_t __45__AVPlayerController_startInspectionIfNeeded__block_invoke_49(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadOptions");
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_38(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  NSObject *v7;
  void *v8;
  float v9;
  double v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  int v36;
  double v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  _AVLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rate");
    v10 = v9;
    objc_msgSend(v6, "userInfo");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    v36 = 134218242;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "Interruption notification: AVAudioSessionInterruptionNotification player.rate: %.1f userinfo: %@", (uint8_t *)&v36, 0x16u);

  }
  if (objc_msgSend(v5, "handlesAudioSessionInterruptions"))
  {
    objc_msgSend(v6, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C89718]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (!v14)
    {
      _AVLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5[14], "doubleValue");
        v36 = 134217984;
        v37 = *(double *)&v16;
        _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "AVAudioSessionInterruptionTypeEnded: %f", (uint8_t *)&v36, 0xCu);
      }

      v17 = v5[14];
      if (v17)
      {
        v18 = v17;
        v19 = v5[14];
        v5[14] = 0;

        objc_msgSend(v6, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0C89700]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        if ((v22 & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v5, "internalDelegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "playerControllerCanRestorePlaybackRateAfterAudioSessionDeactivation:", v5);

          }
          else
          {
            v24 = 0;
          }
          objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "applicationState"))
            v26 = objc_msgSend(v5, "isPictureInPictureActive") | v24;
          else
            v26 = 1;

          _AVLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            if (v26)
              v28 = "YES";
            else
              v28 = "NO";
            v36 = 136315650;
            v37 = COERCE_DOUBLE("-[AVPlayerController startInspectionIfNeeded]_block_invoke");
            v38 = 2080;
            v39 = "shouldRestoreRate";
            v40 = 2080;
            v41 = v28;
            _os_log_impl(&dword_1AC4B1000, v27, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v36, 0x20u);
          }

          _AVLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            if (v24)
              v30 = "YES";
            else
              v30 = "NO";
            v36 = 136315650;
            v37 = COERCE_DOUBLE("-[AVPlayerController startInspectionIfNeeded]_block_invoke");
            v38 = 2080;
            v39 = "delegateCanResumeAfterInterruption";
            v40 = 2080;
            v41 = v30;
            _os_log_impl(&dword_1AC4B1000, v29, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v36, 0x20u);
          }

          if (v26)
          {
            if (objc_msgSend(v5, "isPictureInPictureActive"))
            {
              objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "bundleIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setAttribute:forKey:error:", v33, *MEMORY[0x1E0D47E80], 0);

            }
            if (objc_msgSend(v5, "hasLiveStreamingContent"))
              objc_msgSend(v5, "gotoEndOfSeekableRanges:", 0);
            objc_msgSend(v18, "floatValue");
            if (v34 != 0.0)
            {
              objc_msgSend(v18, "floatValue");
              objc_msgSend(v5, "setRate:", v35);
            }
          }
        }

      }
    }
  }

}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  _QWORD *v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  NSObject *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rate");
  v9 = v8;

  _AVLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218242;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "Interruption notification: AVPlayerPlaybackWasInterruptedNotification player.rate: %.1f userinfo: %@", (uint8_t *)&v15, 0x16u);

  }
  if (objc_msgSend(v5, "handlesAudioSessionInterruptions") && v9 != 0.0)
  {
    *(float *)&v12 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v5[14];
    v5[14] = v13;

  }
}

void __45__AVPlayerController_startInspectionIfNeeded__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  _BYTE *v16;

  v16 = a2;
  objc_msgSend(a4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    if (AVPlayerControllerAutoplayEnabled == 1)
      v16[273] = 0;
    if (objc_msgSend(v16, "isLooping"))
    {
      objc_msgSend(v16, "player");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rate");
      v10 = v9;

      if (v10 >= 0.0)
        objc_msgSend(v16, "seekToBeginning:", 0);
      else
        objc_msgSend(v16, "seekToEnd:", 0);
    }
    objc_msgSend(v16, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 > 1)
        goto LABEL_13;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("AVPlayerControllerPlaybackDidEndNotification"), v16);

  }
LABEL_13:

}

void __37__AVPlayerController_initWithPlayer___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "pipActivitySessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundPIPAuthorizationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v9, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundPIPAuthorizationToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPipActivitySessionIdentifier:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification"), v9);

  }
}

+ (id)keyPathsForValuesAffectingpreferredTransform
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentVideoTrack.preferredTransform"), 0);
}

+ (id)keyPathsForValuesAffectingError
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.error"), CFSTR("player.currentItem.error"), 0);
}

+ (id)keyPathsForValuesAffectingCompletelySeekable
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.currentItem.duration"), CFSTR("seekableTimeRanges"), 0);
}

+ (id)keyPathsForValuesAffectingCanPlay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("readyToPlay"), CFSTR("pictureInPictureInterrupted"), 0);
}

+ (id)keyPathsForValuesAffectingCanPause
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("readyToPlay"));
}

+ (id)keyPathsForValuesAffectingVolume
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.volume"));
}

+ (id)keyPathsForValuesAffectingHasContent
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("player.currentItem"));
}

+ (id)keyPathsForValuesAffectingCurrentTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("timing"));
}

+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("minTime"), CFSTR("maxTime"), 0);
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentTime"), CFSTR("minTime"), 0);
}

+ (id)keyPathsForValuesAffectingHasContentChapters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("contentChapters"));
}

+ (id)keyPathsForValuesAffectingStreaming
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("currentAssetIfReady"));
}

+ (id)keyPathsForValuesAffectingPlayableOffline
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("currentAssetIfReady"));
}

+ (id)keyPathsForValuesAffectingHasTrimmableContent
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("completelySeekable"), CFSTR("player.currentItem.asset"), 0);
}

+ (id)keyPathsForValuesAffectingHasShareableContent
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("availableMetadataFormats"), CFSTR("hasProtectedContent"), CFSTR("currentAssetIfReady"), 0);
}

+ (id)keyPathsForValuesAffectingCanScanForward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.currentItem.canPlayFastForward"), CFSTR("touchBarRequiresLinearPlayback"), CFSTR("pictureInPictureInterrupted"), 0);
}

+ (id)keyPathsForValuesAffectingCanScanBackward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("player.currentItem.canPlayFastReverse"), CFSTR("touchBarRequiresLinearPlayback"), CFSTR("pictureInPictureInterrupted"), 0);
}

+ (id)keyPathsForValuesAffectingCanSeekToBeginning
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("canSeek"));
}

+ (id)keyPathsForValuesAffectingCanSeekToEnd
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("canSeek"));
}

+ (id)keyPathsForValuesAffectingCanSeekFrameForward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("atMaxTime"), CFSTR("canSeek"), 0);
}

+ (id)keyPathsForValuesAffectingCanSeekFrameBackward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("atMinTime"), CFSTR("canSeek"), 0);
}

+ (id)keyPathsForValuesAffectingCanSeekChapterForward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("contentChapters"), CFSTR("canSeek"), 0);
}

+ (id)keyPathsForValuesAffectingCanSeekChapterBackward
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("contentChapters"), CFSTR("canSeek"), 0);
}

- (BOOL)hasReadableTimecodes
{
  void *v3;
  BOOL v4;

  if (!-[AVPlayerController hasTimecodes](self, "hasTimecodes"))
    return 0;
  -[AVPlayerController loadTimecodeControllerIfNeeded](self, "loadTimecodeControllerIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)hasTimecodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMTime v23;
  CMTime v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CMTime time2;
  CMTime time1;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  -[AVPlayerController _timecodeTrack](self, "_timecodeTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVPlayerController player](self, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "reversePlaybackEndTime");
      if ((v31 & 0x100000000) != 0)
      {
        -[AVPlayerController player](self, "player");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "currentItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v10;
        v22 = v9;
        if (v10)
          objc_msgSend(v10, "reversePlaybackEndTime");
        else
          memset(&time1, 0, sizeof(time1));
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        v7 = 0;
        v8 = 0;
        if (CMTimeCompare(&time1, &time2))
          goto LABEL_17;
      }
      else
      {
        v7 = 1;
      }
    }
    else
    {
      v30 = 0;
      v31 = 0;
      v7 = 1;
      v32 = 0;
    }
    -[AVPlayerController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "forwardPlaybackEndTime");
      if ((v26 & 0x100000000) != 0)
      {
        -[AVPlayerController player](self, "player");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "currentItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          objc_msgSend(v14, "forwardPlaybackEndTime");
        else
          memset(&v24, 0, sizeof(v24));
        -[AVPlayerController player](self, "player");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "currentItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
          objc_msgSend(v18, "duration");
        else
          memset(&v23, 0, sizeof(v23));
        v8 = CMTimeCompare(&v24, &v23) == 0;

        if ((v7 & 1) != 0)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
    }

    v8 = 1;
    if ((v7 & 1) != 0)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:

    goto LABEL_18;
  }
  v8 = 0;
LABEL_19:

  return v8;
}

- (id)loadTimecodeControllerIfNeeded
{
  AVTimecodeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!*(_QWORD *)&self->_touchBarRequiresLinearPlayback && -[AVPlayerController hasTimecodes](self, "hasTimecodes"))
  {
    v3 = [AVTimecodeController alloc];
    -[AVPlayerController _timecodeTrack](self, "_timecodeTrack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avkit_tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AVTimecodeController initWithTimecodeTrack:videoTrack:](v3, "initWithTimecodeTrack:videoTrack:", v4, v7);
    v9 = *(void **)&self->_touchBarRequiresLinearPlayback;
    *(_QWORD *)&self->_touchBarRequiresLinearPlayback = v8;

  }
  return *(id *)&self->_touchBarRequiresLinearPlayback;
}

- (double)timecodeObservationInterval
{
  id v3;
  void *v4;
  void *v5;
  double Seconds;
  CMTime time;

  v3 = -[AVPlayerController loadTimecodeControllerIfNeeded](self, "loadTimecodeControllerIfNeeded");
  -[AVPlayerController timecodeController](self, "timecodeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "observationInterval");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (void)seekToFrame:(int64_t)a3
{
  objc_msgSend(*(id *)&self->_touchBarRequiresLinearPlayback, "timeIntervalForFrameNumber:", a3);
  -[AVPlayerController seekToTime:](self, "seekToTime:");
}

- (BOOL)startGeneratingTimecodesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id timecodePeriodicObserverToken;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v4 = a3;
  v5 = v4;
  if (!self->_timecodePeriodicObserverToken)
  {
    v7 = (void *)objc_msgSend(v4, "copy");
    if (v7 && -[AVPlayerController hasTimecodes](self, "hasTimecodes"))
    {
      -[AVPlayerController loadTimecodeControllerIfNeeded](self, "loadTimecodeControllerIfNeeded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v6 = 0;
LABEL_15:

        goto LABEL_16;
      }
      objc_initWeak(&location, self);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __100__AVPlayerController_AVPlayerControllerTimecodeSupportInternal__startGeneratingTimecodesUsingBlock___block_invoke;
      v20[3] = &unk_1E5BB47E8;
      objc_copyWeak(&v22, &location);
      v21 = v7;
      v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF43E9B8](v20);
      -[AVPlayerController player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "currentTime");
      else
        memset(v19, 0, sizeof(v19));
      ((void (**)(_QWORD, _QWORD *))v9)[2](v9, v19);

      -[AVPlayerController player](self, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerController timecodeController](self, "timecodeController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "observationInterval");
      else
        memset(v18, 0, sizeof(v18));
      objc_msgSend(v12, "addPeriodicTimeObserverForInterval:queue:usingBlock:", v18, 0, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      timecodePeriodicObserverToken = self->_timecodePeriodicObserverToken;
      self->_timecodePeriodicObserverToken = v15;

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v6 = 1;
    goto LABEL_15;
  }
  v6 = 1;
LABEL_16:

  return v6;
}

- (void)seekToTimecode:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)&self->_touchBarRequiresLinearPlayback, "calculateFrameNumberAtTimecode:", a3);
  if ((v4 & 0x8000000000000000) == 0)
  {
    objc_msgSend(*(id *)&self->_touchBarRequiresLinearPlayback, "timeIntervalForFrameNumber:", v4);
    -[AVPlayerController seekToTime:](self, "seekToTime:");
  }
}

- (id)timecodeForCurrentTime
{
  id v3;
  void *v4;
  void *v5;

  v3 = -[AVPlayerController loadTimecodeControllerIfNeeded](self, "loadTimecodeControllerIfNeeded");
  -[AVPlayerController timecodeController](self, "timecodeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calculateTimecodeAtFrame:", -[AVPlayerController frameNumberForCurrentTime](self, "frameNumberForCurrentTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)frameNumberForCurrentTime
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _QWORD v10[3];

  v3 = -[AVPlayerController loadTimecodeControllerIfNeeded](self, "loadTimecodeControllerIfNeeded");
  -[AVPlayerController timecodeController](self, "timecodeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "currentTime");
  else
    memset(v10, 0, sizeof(v10));
  v8 = objc_msgSend(v4, "calculateFrameNumberAtCMTime:", v10);

  return v8;
}

- (id)maxTimecode
{
  void *v2;
  void *v3;

  -[AVPlayerController timecodeController](self, "timecodeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxTimecodeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)maxFrameCountString
{
  void *v2;
  void *v3;

  -[AVPlayerController timecodeController](self, "timecodeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxFrameCountString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __100__AVPlayerController_AVPlayerControllerTimecodeSupportInternal__startGeneratingTimecodesUsingBlock___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "timecodeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *a2;
    v12 = *((_QWORD *)a2 + 2);
    v7 = objc_msgSend(v6, "calculateFrameNumberAtCMTime:", &v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu F"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timecodeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calculateTimecodeAtFrame:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (AVTimecodeController)timecodeController
{
  return (AVTimecodeController *)*(id *)&self->_touchBarRequiresLinearPlayback;
}

- (void)setRateWithForce:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  double v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a3;
  if (!BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount))
  {
    if (fabs(a3) < 1.0)
      return;
    BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 1;
    -[AVPlayerController defaultPlaybackRate](self, "defaultPlaybackRate");
    v17 = v16;
    -[AVPlayerController rate](self, "rate");
    if (a3 >= v17)
    {
      *(double *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused = v17;
    }
    else
    {
      -[AVPlayerController rate](self, "rate");
      v3 = -v17;
      if (a3 <= -v17)
        *(double *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused = v3;
      else
        *(_QWORD *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused = 0;
    }
    goto LABEL_4;
  }
  if (a3 == 0.0)
  {
    BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount) = 0;
    -[AVPlayerController setRate:](self, "setRate:", *(double *)&self->_previousValueOfCanUseNetworkResourcesForLiveStreamingWhilePaused);
LABEL_4:
    if (!BYTE2(self->_canUseNetworkResourcesForLiveStreamingWhilePausedCount))
      return;
  }
  LODWORD(a3) = 1.0;
  LODWORD(v3) = 0;
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = fabs(v6);
  if (v10 < 1.0)
    v10 = 1.0;
  v11 = v10;
  v12 = (float)((float)(v11 + -1.0) / 5.6667) + 0.0;
  if (v10 >= 6.666667)
    *(float *)&v10 = 1.0;
  else
    *(float *)&v10 = v12;
  objc_msgSend(v8, "_solveForInput:", v10);
  v14 = floorf((float)(v13 * 58.0) + 2.0);
  if (v6 <= 0.0)
    v15 = -v14;
  else
    v15 = v14;

  -[AVPlayerController setRate:](self, "setRate:", v15);
}

- (BOOL)handlesAudioSessionInterruptions
{
  return self->_handlesAudioSessionInterruptions;
}

- (id)preferredDisplayCriteria
{
  void *v2;
  void *v3;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredDisplayCriteria");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)maximumVideoResolution
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;

  -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVPlayerController currentAssetIfReady](self, "currentAssetIfReady");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maximumVideoResolution");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v8 = 0x7FF8000000000000;
    v6 = 0x7FF8000000000000;
  }

  v9 = *(double *)&v6;
  v10 = *(double *)&v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)keyPathsForValuesAffectingHasReadableTimecodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentAssetIfReady"), CFSTR("player.currentItem.reversePlaybackEndTime"), CFSTR("player.currentItem.forwardPlaybackEndTime"), 0);
}

+ (id)keyPathsForValuesAffectingPreferredDisplayCriteria
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("currentAssetIfReady"));
}

+ (id)keyPathsForValuesAffectingMaximumVideoResolution
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("currentAssetIfReady"));
}

@end
