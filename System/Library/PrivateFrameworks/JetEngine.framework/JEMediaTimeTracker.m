@implementation JEMediaTimeTracker

- (JEMediaTimeTracker)initWithPosition:(unint64_t)a3 playbackRate:(float)a4
{
  JEMediaTimeTracker *v6;
  JEMediaTimeTrackerDateProvider *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JEMediaTimeTracker;
  v6 = -[JEMediaTimeTracker init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(JEMediaTimeTrackerDateProvider);
    -[JEMediaTimeTracker setDateProvider:](v6, "setDateProvider:", v7);

    *(float *)&v8 = a4;
    -[JEMediaTimeTracker updatePosition:playbackRate:](v6, "updatePosition:playbackRate:", a3, v8);
  }
  return v6;
}

- (void)updatePosition:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[JEMediaTimeTracker dateProvider](self, "dateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEMediaTimeTracker setDate:](self, "setDate:", v6);

  -[JEMediaTimeTracker setPosition:](self, "setPosition:", a3);
}

- (void)updatePosition:(unint64_t)a3 playbackRate:(float)a4
{
  void *v7;
  void *v8;
  double v9;

  -[JEMediaTimeTracker dateProvider](self, "dateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEMediaTimeTracker setDate:](self, "setDate:", v8);

  -[JEMediaTimeTracker setPosition:](self, "setPosition:", a3);
  *(float *)&v9 = a4;
  -[JEMediaTimeTracker setPlaybackRate:](self, "setPlaybackRate:", v9);
}

- (float)playbackRate
{
  float result;

  result = self->_playbackRate;
  if (result == 0.0)
    return 1.0;
  return result;
}

- (id)estimatedTimeAtPosition:(unint64_t)a3
{
  double v4;
  void *v5;
  float v6;
  void *v7;

  v4 = ((double)a3 - (double)-[JEMediaTimeTracker position](self, "position")) / 1000.0;
  -[JEMediaTimeTracker date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEMediaTimeTracker playbackRate](self, "playbackRate");
  objc_msgSend(v5, "dateByAddingTimeInterval:", v4 / v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)estimatedTimeAtPastPosition:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[JEMediaTimeTracker estimatedTimeAtPosition:](self, "estimatedTimeAtPosition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "compare:", v4) == -1)
    v5 = v3;
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (JEMediaTimeTrackerDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void)setDateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dateProvider, a3);
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end
