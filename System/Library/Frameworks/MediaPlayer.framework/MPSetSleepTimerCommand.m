@implementation MPSetSleepTimerCommand

- (id)_mediaRemoteCommandInfoOptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_time);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D4C848]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_stopMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D4C840]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fireDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D4C838]);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setFireDate:(double)a3
{
  if (self->_fireDate != a3)
  {
    self->_fireDate = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setStopMode:(int64_t)a3
{
  if (self->_stopMode != a3)
  {
    self->_stopMode = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (double)time
{
  return self->_time;
}

- (double)fireDate
{
  return self->_fireDate;
}

- (int64_t)stopMode
{
  return self->_stopMode;
}

@end
