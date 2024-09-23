@implementation HUClipScrubberTimeController

- (HUClipScrubberTimeController)init
{
  HUClipScrubberTimeController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUClipScrubberTimeController;
  result = -[HUClipScrubberTimeController init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_timeScale = xmmword_1B9443160;
  return result;
}

- (void)recalculateMaximumPosterFrameDuration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[HUClipScrubberTimeController _numberOfPosterFrameUnitsForEvent:timeScale:](self, "_numberOfPosterFrameUnitsForEvent:timeScale:", v4, 10.0);
  v6 = v5;
  objc_msgSend(v4, "duration");
  v8 = v7;

  v9 = v8 / v6;
  -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
  if (v9 > v10)
    -[HUClipScrubberTimeController setMaximumPosterFrameDuration:](self, "setMaximumPosterFrameDuration:", v9);
  -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
  -[HUClipScrubberTimeController setMaximumPosterFrameDuration:](self, "setMaximumPosterFrameDuration:", fmax(v11, 2.0));
  -[HUClipScrubberTimeController updateTimeScaleIfNeeded](self, "updateTimeScaleIfNeeded");
}

- (void)updateTimeScaleIfNeeded
{
  double v3;
  double v4;
  double v5;

  -[HUClipScrubberTimeController timeScale](self, "timeScale");
  if (v3 < 2.0 || !-[HUClipScrubberTimeController userControlled](self, "userControlled"))
  {
    -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
    -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:", fmax(v4, 2.0));
  }
  if (objc_msgSend(MEMORY[0x1E0D31288], "shouldCacheScrubberTimeScale"))
  {
    objc_msgSend(MEMORY[0x1E0D31288], "cachedScrubberTimeScale");
    if (v5 < 2.0)
      v5 = 2.0;
    -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:", v5);
  }
}

- (double)maximumGestureScale
{
  double v3;
  double v4;
  double v5;

  -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
  v4 = v3;
  -[HUClipScrubberTimeController minimumPosterFrameDuration](self, "minimumPosterFrameDuration");
  return v4 / v5;
}

- (double)clampGestureScale:(double)a3
{
  double result;

  -[HUClipScrubberTimeController maximumGestureScale](self, "maximumGestureScale");
  if (result > a3)
    result = a3;
  if (result < 1.0)
    return 1.0;
  return result;
}

- (double)updateTimeScaleForGestureScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
  v6 = v5 / a3;
  -[HUClipScrubberTimeController minimumPosterFrameDuration](self, "minimumPosterFrameDuration");
  if (v6 >= v7)
    v7 = v6;
  -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:", v7);
  -[HUClipScrubberTimeController timeScale](self, "timeScale");
  return result;
}

- (double)numberOfPosterFrameUnitsForEvent:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[HUClipScrubberTimeController timeScale](self, "timeScale");
  -[HUClipScrubberTimeController _numberOfPosterFrameUnitsForEvent:timeScale:](self, "_numberOfPosterFrameUnitsForEvent:timeScale:", v4);
  v6 = v5;

  return v6;
}

- (double)_numberOfPosterFrameUnitsForEvent:(id)a3 timeScale:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;

  v6 = a3;
  objc_msgSend(v6, "duration");
  v8 = v7;
  -[HUClipScrubberTimeController timeScale](self, "timeScale");
  if (fabs(v9 + -10.0) >= 0.00000011920929)
  {
    v11 = v8 / a4;
  }
  else
  {
    objc_msgSend(v6, "duration");
    v11 = sqrt(v10);
  }
  v12 = v11;
  if (v12 < 1.0)
    v12 = 1.0;
  v13 = v12;

  return v13;
}

- (double)timelineWidthForEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[HUClipScrubberTimeController posterFrameWidth](self, "posterFrameWidth");
  v6 = v5;
  -[HUClipScrubberTimeController numberOfPosterFrameUnitsForEvent:](self, "numberOfPosterFrameUnitsForEvent:", v4);
  v8 = v7;

  return v6 * v8;
}

- (double)posterFrameWidthFromCameraLiveSource
{
  _BOOL4 v2;
  double result;

  v2 = -[HUClipScrubberTimeController portraitMode](self, "portraitMode");
  result = 58.0;
  if (v2)
    return 33.0;
  return result;
}

- (BOOL)isAtMinimumZoom
{
  double v3;
  double v4;
  double v5;

  -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
  v4 = v3;
  -[HUClipScrubberTimeController timeScale](self, "timeScale");
  return v4 - v5 < 0.00000011920929;
}

- (void)expandTimelineToMaximumZoom
{
  -[HUClipScrubberTimeController minimumPosterFrameDuration](self, "minimumPosterFrameDuration");
  -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:");
}

- (void)shrinkTimelineToMinimumZoom
{
  -[HUClipScrubberTimeController maximumPosterFrameDuration](self, "maximumPosterFrameDuration");
  -[HUClipScrubberTimeController setTimeScale:](self, "setTimeScale:");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (objc_msgSend(MEMORY[0x1E0D31288], "shouldCacheScrubberTimeScale"))
  {
    v3 = (void *)MEMORY[0x1E0D31288];
    -[HUClipScrubberTimeController timeScale](self, "timeScale");
    objc_msgSend(v3, "cacheScrubberTimeScale:");
  }
  v4.receiver = self;
  v4.super_class = (Class)HUClipScrubberTimeController;
  -[HUClipScrubberTimeController dealloc](&v4, sel_dealloc);
}

- (double)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(double)a3
{
  self->_timeScale = a3;
}

- (double)minimumPosterFrameDuration
{
  return self->_minimumPosterFrameDuration;
}

- (void)setMinimumPosterFrameDuration:(double)a3
{
  self->_minimumPosterFrameDuration = a3;
}

- (BOOL)portraitMode
{
  return self->_portraitMode;
}

- (void)setPortraitMode:(BOOL)a3
{
  self->_portraitMode = a3;
}

- (BOOL)userControlled
{
  return self->_userControlled;
}

- (void)setUserControlled:(BOOL)a3
{
  self->_userControlled = a3;
}

- (double)maximumPosterFrameDuration
{
  return self->_maximumPosterFrameDuration;
}

- (void)setMaximumPosterFrameDuration:(double)a3
{
  self->_maximumPosterFrameDuration = a3;
}

@end
