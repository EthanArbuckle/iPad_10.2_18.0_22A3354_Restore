@implementation MSStopwatchLap

- (MSStopwatchLap)initWithLapTime:(unint64_t)a3 andName:(id)a4
{
  id v6;
  MSStopwatchLap *v7;
  MSStopwatchLap *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MSStopwatchLap;
  v7 = -[MSStopwatchLap init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MSStopwatchLap setName:](v7, "setName:", v6);
    -[MSStopwatchLap setLapTime:](v8, "setLapTime:", a3);
  }

  return v8;
}

- (unint64_t)lapTimeMS
{
  return UpTicksToMilliseconds();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)lapTime
{
  return self->_lapTime;
}

- (void)setLapTime:(unint64_t)a3
{
  self->_lapTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
