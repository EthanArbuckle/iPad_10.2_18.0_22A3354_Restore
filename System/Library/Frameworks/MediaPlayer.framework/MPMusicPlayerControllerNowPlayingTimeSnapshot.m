@implementation MPMusicPlayerControllerNowPlayingTimeSnapshot

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerControllerNowPlayingTimeSnapshot;
  return -[MPMusicPlayerControllerNowPlayingTimeSnapshot init](&v3, sel_init);
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 1193046;
  if (!self->_live)
    v2 = 11259375;
  return v2 ^ (unint64_t)self->_rate ^ (unint64_t)self->_elapsedTime ^ (unint64_t)self->_duration ^ (unint64_t)self->_timestamp ^ self->_state;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = v5;
    if (self->_state != *((_QWORD *)v5 + 5) || !self->_live == (*((_BYTE *)v5 + 32) != 0))
      goto LABEL_12;
    -[MPMusicPlayerControllerNowPlayingTimeSnapshot rate](self, "rate");
    v8 = v7;
    objc_msgSend(v6, "rate");
    v10 = v8 - v9;
    if (v10 < 0.0)
      v10 = -v10;
    if (v10 >= 0.05)
    {
LABEL_12:
      v15 = 0;
    }
    else
    {
      -[MPMusicPlayerControllerNowPlayingTimeSnapshot currentTime](self, "currentTime");
      v12 = v11;
      objc_msgSend(v6, "currentTime");
      v14 = v12 - v13;
      if (v14 < 0.0)
        v14 = -v14;
      v15 = v14 < 0.05;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (double)currentTime
{
  double elapsedTime;
  double v5;
  double duration;

  if (self->_live)
    return NAN;
  elapsedTime = self->_elapsedTime;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  duration = elapsedTime + (v5 - self->_timestamp) * self->_rate;
  if (duration >= self->_duration)
    duration = self->_duration;
  return fmax(duration, 0.0);
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerControllerNowPlayingTimeSnapshot *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPMusicPlayerControllerNowPlayingTimeSnapshot;
  v5 = -[MPMusicPlayerControllerNowPlayingTimeSnapshot init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("rate"));
    v5->_rate = v6;
    v5->_live = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("live"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    if (!v5->_live)
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("elapsed"));
      v5->_elapsedTime = v7;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
      v5->_duration = v8;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
      v5->_timestamp = v9;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  *(float *)&v4 = self->_rate;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("rate"), v4);
  objc_msgSend(v5, "encodeBool:forKey:", self->_live, CFSTR("live"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  if (!self->_live)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("elapsed"), self->_elapsedTime);
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  }

}

- (BOOL)isLive
{
  return self->_live;
}

- (float)rate
{
  return self->_rate;
}

- (int64_t)state
{
  return self->_state;
}

+ (id)liveSnapshotWithRate:(float)a3 state:(int64_t)a4
{
  uint64_t v6;

  v6 = objc_msgSend(objc_alloc((Class)a1), "_init");
  *(_BYTE *)(v6 + 32) = 1;
  *(float *)(v6 + 36) = a3;
  *(_QWORD *)(v6 + 40) = a4;
  return (id)v6;
}

+ (MPMusicPlayerControllerNowPlayingTimeSnapshot)snapshotWithElapsedTime:(double)a3 duration:(double)a4 rate:(float)a5 atTimestamp:(double)a6 state:(int64_t)a7
{
  uint64_t v12;

  v12 = objc_msgSend(objc_alloc((Class)a1), "_init");
  *(double *)(v12 + 8) = a3;
  *(double *)(v12 + 16) = a4;
  *(float *)(v12 + 36) = a5;
  *(double *)(v12 + 24) = a6;
  *(_QWORD *)(v12 + 40) = a7;
  return (MPMusicPlayerControllerNowPlayingTimeSnapshot *)(id)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
