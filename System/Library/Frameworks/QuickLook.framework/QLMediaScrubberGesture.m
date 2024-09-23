@implementation QLMediaScrubberGesture

- (QLMediaScrubberGesture)initWithPlayer:(id)a3
{
  id v5;
  QLMediaScrubberGesture *v6;
  QLMediaScrubberGesture *v7;
  QLMediaScrubberGesture *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLMediaScrubberGesture;
  v6 = -[QLMediaScrubberGesture initWithTarget:action:](&v10, sel_initWithTarget_action_, self, sel_scrubbGestureDidChange_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = v7;
  }

  return v7;
}

- (float)nominalFrameRate
{
  void *v3;
  void *v4;
  void *v5;
  AVPlayer *player;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  float v14;
  CMTime v16;
  CMTimeRange range;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[AVPlayer currentItem](self->_player, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v22, 0, sizeof(v22));
  player = self->_player;
  if (player)
    -[AVPlayer currentTime](player, "currentTime");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v12)
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "timeRange");
        else
          memset(&range, 0, sizeof(range));
        v16 = v22;
        if (CMTimeRangeContainsTime(&range, &v16))
        {
          objc_msgSend(v12, "nominalFrameRate");
          v13 = v14;
          goto LABEL_16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = NAN;
LABEL_16:

  return v13;
}

- (float)clampedEstimatedFrameRate
{
  double estimatedFrameRate;
  float result;

  estimatedFrameRate = self->_estimatedFrameRate;
  result = 30.0;
  if (estimatedFrameRate > 0.0)
    return fmin(fmax(estimatedFrameRate, 10.0), 480.0);
  return result;
}

- (void)scrubbGestureDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  AVPlayer *player;
  void *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  CGFloat y;
  BOOL v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double Seconds;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  float v39;
  float v40;
  float v41;
  double v42;
  CMTime v43;
  CMTime time;

  v4 = a3;
  -[QLMediaScrubberGesture view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLMediaScrubberGesture locationInView:](self, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (objc_msgSend(v4, "state") == 1)
  {
    -[QLMediaScrubberGesture nominalFrameRate](self, "nominalFrameRate");
    self->_estimatedFrameRate = v10;
    player = self->_player;
    if (player)
      -[AVPlayer currentTime](player, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    -[AVPlayer currentItem](self->_player, "currentItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "asset");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
      objc_msgSend(v35, "duration");
    else
      memset(&v43, 0, sizeof(v43));
    v37 = Seconds / CMTimeGetSeconds(&v43);
    self->_value = v37;

    self->_startTouchLocationInView.x = v7;
    self->_startTouchLocationInView.y = v9;
    -[QLMediaScrubberGesture scrubberDelegate](self, "scrubberDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrubberDidStartScrubbing:", self);
  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    -[QLMediaScrubberGesture scrubberDelegate](self, "scrubberDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrubberDidEndScrubbing:", self);
  }
  else
  {
    -[QLMediaScrubberGesture view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14 + -40.0;

    -[QLMediaScrubberGesture maximumValue](self, "maximumValue");
    v17 = v16;
    -[QLMediaScrubberGesture minimumValue](self, "minimumValue");
    v19 = v17 - v18;
    v20 = v7 - self->_previousTouchLocationInView.x;
    -[QLMediaScrubberGesture view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "center");

    y = self->_startTouchLocationInView.y;
    v23 = v9 <= y;
    *(float *)&y = 1.0 - fabs(v9 / y);
    v24 = *(float *)&y;
    if (v23)
      v25 = v24;
    else
      v25 = 0.0;
    -[QLMediaScrubberGesture value](self, "value");
    v27 = v26;
    -[QLMediaScrubberGesture minimumValue](self, "minimumValue");
    v29 = (float)(v27 - v28) / v19;
    v30 = v20 / v15;
    if (v25 <= 0.75)
    {
      v32 = 0.25;
      if (v25 > 0.25)
        v38 = 0.5;
      else
        v38 = 1.0;
      if (v25 <= 0.5)
        v32 = v38;
    }
    else
    {
      -[QLMediaScrubberGesture clampedEstimatedFrameRate](self, "clampedEstimatedFrameRate");
      v32 = v15 / (float)(v19 * v31);
      if (v32 > 0.125)
        v32 = 0.125;
    }
    v39 = fmin(fmax(v29 + v32 * v30, 0.0), 1.0);
    -[QLMediaScrubberGesture minimumValue](self, "minimumValue");
    v41 = v40 + (float)(v39 * v19);
    self->_value = v41;
    self->_previousTouchLocationInView.x = v7;
    self->_previousTouchLocationInView.y = v9;
    -[QLMediaScrubberGesture scrubberDelegate](self, "scrubberDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v42 = v41;
    objc_msgSend(v12, "scrubber:didChangeValue:", self, v42);
  }

}

- (QLMediaScrubberGestureDelegate)scrubberDelegate
{
  return (QLMediaScrubberGestureDelegate *)objc_loadWeakRetained((id *)&self->_scrubberDelegate);
}

- (void)setScrubberDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrubberDelegate, a3);
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrubberDelegate);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
