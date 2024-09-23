@implementation AVPictureInPicturePlaybackState

- (AVPictureInPicturePlaybackState)initWithElapsedTime:(double)a3 timelineDuration:(double)a4 timelineRate:(double)a5 paused:(BOOL)a6
{
  AVPictureInPicturePlaybackState *v10;
  AVPictureInPicturePlaybackState *v11;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVPictureInPicturePlaybackState;
  v10 = -[AVPictureInPicturePlaybackState init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    v13 = (*(uint64_t *)&a4 <= -1 || ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
       && (unint64_t)(*(_QWORD *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL;
    v14 = 0.0;
    if (v13)
      v15 = 0.0;
    else
      v15 = a4;
    v16 = fmax(a3, 0.0);
    if (v16 >= v15)
      v16 = v15;
    if ((*(uint64_t *)&a3 <= -1 || ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
      && (unint64_t)(*(_QWORD *)&a3 - 1) >= 0xFFFFFFFFFFFFFLL)
    {
      v16 = 0.0;
    }
    v19 = fabs(a5);
    v10->_initializedElapsedTime = v16;
    if (v19 < INFINITY)
      v14 = a5;
    if (v19 > INFINITY)
      v14 = a5;
    v10->_timelineRate = v14;
    v10->_timelineDuration = v15;
    v10->_paused = a6;
    v10->_initializationTimestamp = CFAbsoluteTimeGetCurrent();
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  AVPictureInPicturePlaybackState *v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (AVPictureInPicturePlaybackState *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[AVPictureInPicturePlaybackState isPaused](self, "isPaused"),
          v5 == -[AVPictureInPicturePlaybackState isPaused](v4, "isPaused"))
      && (-[AVPictureInPicturePlaybackState timelineDuration](self, "timelineDuration"),
          v7 = v6,
          -[AVPictureInPicturePlaybackState timelineDuration](v4, "timelineDuration"),
          v7 == v8))
    {
      -[AVPictureInPicturePlaybackState currentElapsedTime](self, "currentElapsedTime");
      v10 = v9;
      -[AVPictureInPicturePlaybackState currentElapsedTime](v4, "currentElapsedTime");
      v12 = v10 - v11;
      if (v12 < 0.0)
        v12 = -v12;
      v13 = v12 < 0.025;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (double)currentElapsedTime
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  BOOL v7;
  double Current;
  double v10;
  double v11;
  double v12;
  double v13;
  double result;

  -[AVPictureInPicturePlaybackState initializedElapsedTime](self, "initializedElapsedTime");
  v4 = v3;
  -[AVPictureInPicturePlaybackState timelineRate](self, "timelineRate");
  if (v5 != 0.0)
  {
    -[AVPictureInPicturePlaybackState timelineDuration](self, "timelineDuration");
    v7 = v6 < 0 || ((v6 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    if (!v7 || (unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      Current = CFAbsoluteTimeGetCurrent();
      -[AVPictureInPicturePlaybackState initializationTimestamp](self, "initializationTimestamp");
      v11 = Current - v10;
      -[AVPictureInPicturePlaybackState timelineRate](self, "timelineRate");
      v4 = v4 + v12 * v11;
    }
  }
  v13 = fmax(v4, 0.0);
  -[AVPictureInPicturePlaybackState timelineDuration](self, "timelineDuration");
  if (v13 < result)
    return v13;
  return result;
}

- (double)timelineRate
{
  return self->_timelineRate;
}

- (double)timelineDuration
{
  return self->_timelineDuration;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)initializationTimestamp
{
  return self->_initializationTimestamp;
}

- (double)initializedElapsedTime
{
  return self->_initializedElapsedTime;
}

@end
