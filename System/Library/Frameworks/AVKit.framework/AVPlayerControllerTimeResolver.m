@implementation AVPlayerControllerTimeResolver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  kdebug_trace();
  if ((void *)AVPlayerControllerTimeResolverUpdateContext == a6)
  {
    AVPlayerControllerTimeResolverUpdate(self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AVPlayerControllerTimeResolver;
    -[AVPlayerControllerTimeResolver observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
  kdebug_trace();

}

- (double)targetTime
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;

  -[AVPlayerControllerTimeResolver currentTime](self, "currentTime");
  v4 = v3;
  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "seekToTime");
  v7 = v6;

  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "isSeeking");

  if ((v5 & 1) != 0)
    return v7;
  else
    return v4;
}

- (AVTimeControlling)playerController
{
  return self->_playerController;
}

- (double)minTime
{
  return self->_minTime;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setResolution:(double)a3
{
  if (self->_resolution != a3)
  {
    self->_resolution = a3;
    AVPlayerControllerTimeResolverUpdate(self);
  }
}

- (void)setInterval:(double)a3
{
  if (self->_interval != a3)
  {
    self->_interval = a3;
    AVPlayerControllerTimeResolverUpdate(self);
  }
}

- (double)resolution
{
  return self->_resolution;
}

- (double)interval
{
  return self->_interval;
}

- (AVPlayerControllerTimeResolver)init
{
  AVPlayerControllerTimeResolver *v2;
  AVPlayerControllerTimeResolver *v3;
  uint64_t v4;
  AVPlayerControllerTimeResolver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerControllerTimeResolver;
  v2 = -[AVPlayerControllerTimeResolver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_interval = 1.0;
    v4 = AVPlayerControllerTimeResolverUpdateContext;
    v5 = v2;
    -[AVPlayerControllerTimeResolver addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.minTime"), 0, v4);
    -[AVPlayerControllerTimeResolver addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.minTiming"), 0, AVPlayerControllerTimeResolverUpdateContext);
    -[AVPlayerControllerTimeResolver addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.maxTime"), 0, AVPlayerControllerTimeResolverUpdateContext);
    -[AVPlayerControllerTimeResolver addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.maxTiming"), 0, AVPlayerControllerTimeResolverUpdateContext);
    -[AVPlayerControllerTimeResolver addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("playerController.timing"), 0, AVPlayerControllerTimeResolverUpdateContext);

  }
  return v3;
}

+ (BOOL)automaticallyNotifiesObserversOfCurrentTime
{
  return 0;
}

+ (id)keyPathsForValuesAffectingTargetTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentTime"), CFSTR("playerController.seeking"), CFSTR("playerController.seekToTime"), 0);
}

- (void)setPlayerController:(id)a3
{
  AVTimeControlling *v5;
  AVTimeControlling **p_playerController;
  AVTimeControlling *playerController;
  AVTimeControlling *v8;

  v5 = (AVTimeControlling *)a3;
  playerController = self->_playerController;
  p_playerController = &self->_playerController;
  if (playerController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_playerController, a3);
    v5 = v8;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[AVPlayerControllerTimeResolver removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.timing"), AVPlayerControllerTimeResolverUpdateContext);
  -[AVPlayerControllerTimeResolver removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.maxTiming"), AVPlayerControllerTimeResolverUpdateContext);
  -[AVPlayerControllerTimeResolver removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.maxTime"), AVPlayerControllerTimeResolverUpdateContext);
  -[AVPlayerControllerTimeResolver removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.minTiming"), AVPlayerControllerTimeResolverUpdateContext);
  -[AVPlayerControllerTimeResolver removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("playerController.minTime"), AVPlayerControllerTimeResolverUpdateContext);
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerControllerTimeResolver;
  -[AVPlayerControllerTimeResolver dealloc](&v3, sel_dealloc);
}

- (void)setCurrentTime:(double)a3
{
  double EffectiveInterval;

  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    EffectiveInterval = AVPlayerControllerTimeResolverGetEffectiveInterval(self);
    -[AVTimeControlling seekToTime:toleranceBefore:toleranceAfter:](self->_playerController, "seekToTime:toleranceBefore:toleranceAfter:", a3, a3 - EffectiveInterval * floor(a3 / EffectiveInterval), EffectiveInterval * ceil(a3 / EffectiveInterval) - a3);
  }
}

- (void)setMinTime:(double)a3
{
  self->_minTime = a3;
}

- (void)setMaxTime:(double)a3
{
  self->_maxTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
}

- (double)targetTimeWithinEndTimes
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[AVPlayerControllerTimeResolver targetTime](self, "targetTime");
  v4 = v3;
  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minTime");
  v7 = v4 - v6;

  return v7;
}

- (void)setTargetTimeWithinEndTimes:(double)a3
{
  double v5;
  id v6;

  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minTime");
  -[AVPlayerControllerTimeResolver setTargetTime:](self, "setTargetTime:", v5 + a3);

}

- (double)remainingTargetTimeWithinEndTimes
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxTime");
  v5 = v4;
  -[AVPlayerControllerTimeResolver targetTime](self, "targetTime");
  v7 = v5 - v6;

  return v7;
}

- (double)currentTimeWithinEndTimes
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[AVPlayerControllerTimeResolver currentTime](self, "currentTime");
  v4 = v3;
  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minTime");
  v7 = v4 - v6;

  return v7;
}

- (void)setCurrentTimeWithinEndTimes:(double)a3
{
  double v5;
  id v6;

  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minTime");
  -[AVPlayerControllerTimeResolver setCurrentTime:](self, "setCurrentTime:", v5 + a3);

}

- (double)remainingTime
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentDuration");
  v5 = v4;
  -[AVPlayerControllerTimeResolver currentTime](self, "currentTime");
  v7 = v5 - v6;

  return v7;
}

- (double)remainingTimeWithinEndTimes
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxTime");
  v5 = v4;
  -[AVPlayerControllerTimeResolver currentTime](self, "currentTime");
  v7 = v5 - v6;

  return v7;
}

- (double)seekableTimeRangeDuration
{
  double v3;
  double v4;
  double v5;

  -[AVPlayerControllerTimeResolver maxTime](self, "maxTime");
  v4 = v3;
  -[AVPlayerControllerTimeResolver minTime](self, "minTime");
  return v4 - v5;
}

- (BOOL)isCurrentTimeAtEndOfSeekableTimeRanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double Seconds;
  double v12;
  CMTimeRange v14;
  CMTime time;
  CMTimeRange v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVPlayerControllerTimeResolver playerController](self, "playerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seekableTimeRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = NAN;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        memset(&v16, 0, sizeof(v16));
        if (v10)
          objc_msgSend(v10, "CMTimeRangeValue");
        v14 = v16;
        CMTimeRangeGetEnd(&time, &v14);
        Seconds = CMTimeGetSeconds(&time);
        if (Seconds > v8)
          v8 = Seconds;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);

    -[AVPlayerControllerTimeResolver currentTime](self, "currentTime");
    if (v12 > v8 + -2.0)
      return 1;
  }
  else
  {

  }
  return 0;
}

+ (id)keyPathsForValuesAffectingTargetTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("targetTime"), CFSTR("playerController.minTime"), 0);
}

+ (id)keyPathsForValuesAffectingRemainingTargetTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playerController.maxTime"), CFSTR("targetTime"), 0);
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentTime"), CFSTR("playerController.minTime"), 0);
}

+ (id)keyPathsForValuesAffectingRemainingTime
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playerController.contentDuration"), CFSTR("currentTime"), 0);
}

+ (id)keyPathsForValuesAffectingRemainingTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("playerController.maxTime"), CFSTR("currentTime"), 0);
}

+ (id)keyPathsForValuesAffectingSeekableTimeRangeDuration
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("minTime"), CFSTR("maxTime"), 0);
}

+ (id)keyPathsForValuesAffectingCurrentTimeAtEndOfSeekableTimeRanges
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("currentTime"), CFSTR("playerController.seekableTimeRanges"), 0);
}

@end
