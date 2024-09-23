@implementation MSStopwatch

- (MSStopwatch)init
{
  MSStopwatch *v2;
  MSStopwatch *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSStopwatch;
  v2 = -[MSStopwatch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSStopwatch setStartTime:](v2, "setStartTime:", 0);
    -[MSStopwatch setStopTime:](v3, "setStopTime:", 0);
    -[MSStopwatch setElapsedTime:](v3, "setElapsedTime:", 0);
    -[MSStopwatch setElapsedTimeMS:](v3, "setElapsedTimeMS:", 0);
    -[MSStopwatch setElapsedTimeSeconds:](v3, "setElapsedTimeSeconds:", 0);
    -[MSStopwatch setLastLapTime:](v3, "setLastLapTime:", 0);
    -[MSStopwatch setStatus:](v3, "setStatus:", 1);
    -[MSStopwatch setIsLocked:](v3, "setIsLocked:", 0);
    v4 = (void *)objc_opt_new();
    -[MSStopwatch setLaps:](v3, "setLaps:", v4);

  }
  return v3;
}

- (void)start
{
  if (self->_status && !self->_isLocked)
  {
    if (!self->_startTime)
      self->_startTime = mach_absolute_time();
    self->_status = 0;
  }
}

- (void)stop
{
  uint64_t v3;
  unint64_t v4;

  if (self->_status != 1 && !self->_isLocked)
  {
    v3 = mach_absolute_time();
    v4 = v3 - self->_startTime;
    self->_stopTime = v3;
    self->_elapsedTime = v4;
    self->_elapsedTimeMS = UpTicksToMilliseconds();
    self->_elapsedTimeSeconds = UpTicksToSeconds();
    self->_status = 1;
  }
}

- (void)lap
{
  -[MSStopwatch lapWithName:](self, "lapWithName:", 0);
}

- (void)lapWithName:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *laps;
  MSStopwatchLap *v9;
  id v10;

  v4 = a3;
  if (self->_status != 1 && !self->_isLocked)
  {
    v10 = v4;
    v5 = mach_absolute_time() - self->_startTime;
    if (v10)
    {
      v6 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    laps = self->_laps;
    v9 = -[MSStopwatchLap initWithLapTime:andName:]([MSStopwatchLap alloc], "initWithLapTime:andName:", v5, v6);
    -[NSMutableArray addObject:](laps, "addObject:", v9);

    self->_startTime = 0;
    self->_lastLapTime = v5;

    v4 = v10;
  }

}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *laps;

  if (self->_status)
  {
    if (!self->_isLocked)
    {
      *(_OWORD *)&self->_elapsedTime = 0u;
      *(_OWORD *)&self->_elapsedTimeSeconds = 0u;
      *(_OWORD *)&self->_startTime = 0u;
      v3 = (NSMutableArray *)objc_opt_new();
      laps = self->_laps;
      self->_laps = v3;

    }
  }
}

- (void)toggleLock:(BOOL)a3
{
  if (self->_isLocked != a3)
    self->_isLocked = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(unint64_t)a3
{
  self->_stopTime = a3;
}

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
}

- (unint64_t)elapsedTimeMS
{
  return self->_elapsedTimeMS;
}

- (void)setElapsedTimeMS:(unint64_t)a3
{
  self->_elapsedTimeMS = a3;
}

- (unint64_t)elapsedTimeSeconds
{
  return self->_elapsedTimeSeconds;
}

- (void)setElapsedTimeSeconds:(unint64_t)a3
{
  self->_elapsedTimeSeconds = a3;
}

- (unint64_t)lastLapTime
{
  return self->_lastLapTime;
}

- (void)setLastLapTime:(unint64_t)a3
{
  self->_lastLapTime = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSMutableArray)laps
{
  return self->_laps;
}

- (void)setLaps:(id)a3
{
  objc_storeStrong((id *)&self->_laps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laps, 0);
}

@end
