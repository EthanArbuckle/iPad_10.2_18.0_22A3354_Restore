@implementation MTMediaTimeTracker

- (MTMediaTimeTracker)initWithPosition:(unint64_t)a3 playbackRate:(float)a4
{
  MTMediaTimeTracker *v6;
  double v7;
  MTMediaTimeTracker *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTMediaTimeTracker;
  v6 = -[MTMediaTimeTracker init](&v10, sel_init);
  v8 = v6;
  if (v6)
  {
    *(float *)&v7 = a4;
    -[MTMediaTimeTracker updatePosition:playbackRate:](v6, "updatePosition:playbackRate:", a3, v7);
  }
  return v8;
}

- (void)updatePosition:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMediaTimeTracker setDate:](self, "setDate:", v6);

  -[MTMediaTimeTracker setPosition:](self, "setPosition:", a3);
}

- (void)updatePosition:(unint64_t)a3 playbackRate:(float)a4
{
  void *v7;
  void *v8;
  double v9;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMediaTimeTracker setDate:](self, "setDate:", v8);

  -[MTMediaTimeTracker setPosition:](self, "setPosition:", a3);
  *(float *)&v9 = a4;
  -[MTMediaTimeTracker setPlaybackRate:](self, "setPlaybackRate:", v9);
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

  v4 = ((double)a3 - (double)-[MTMediaTimeTracker position](self, "position")) / 1000.0;
  -[MTMediaTimeTracker date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMediaTimeTracker playbackRate](self, "playbackRate");
  objc_msgSend(v5, "dateByAddingTimeInterval:", v4 / v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)estimatedTimeAtPastPosition:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MTMediaTimeTracker estimatedTimeAtPosition:](self, "estimatedTimeAtPosition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "compare:", v5) == -1)
    v6 = v3;
  else
    v6 = v5;
  v7 = v6;

  return v7;
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
}

@end
