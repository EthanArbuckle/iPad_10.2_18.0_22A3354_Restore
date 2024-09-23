@implementation ABVCardWatchdogTimer

+ (ABVCardWatchdogTimer)timerWithTimeProvider:(id)a3
{
  if (objc_msgSend(a1, "shouldCheckTime"))
    return (ABVCardWatchdogTimer *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTimeProvider:", a3);
  else
    return 0;
}

+ (BOOL)shouldCheckTime
{
  return ABIsDataAccess() ^ 1;
}

- (ABVCardWatchdogTimer)initWithTimeProvider:(id)a3
{
  ABVCardWatchdogTimer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABVCardWatchdogTimer;
  v4 = -[ABVCardWatchdogTimer init](&v6, sel_init);
  if (v4)
  {
    v4->_timeProvider = (ABVCardTimeProvider *)a3;
    v4->_valid = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABVCardWatchdogTimer;
  -[ABVCardWatchdogTimer dealloc](&v3, sel_dealloc);
}

- (void)start
{
  -[ABVCardWatchdogTimer setStartTime:](self, "setStartTime:", -[ABVCardTimeProvider now](-[ABVCardWatchdogTimer timeProvider](self, "timeProvider"), "now"));
}

- (BOOL)isStarted
{
  return -[ABVCardWatchdogTimer startTime](self, "startTime") != 0;
}

- (void)checkValidity
{
  double v3;

  objc_msgSend((id)-[ABVCardTimeProvider now](-[ABVCardWatchdogTimer timeProvider](self, "timeProvider"), "now"), "timeIntervalSinceDate:", -[ABVCardWatchdogTimer startTime](self, "startTime"));
  if (v3 > 9.0)
    -[ABVCardWatchdogTimer setValid:](self, "setValid:", 0);
}

- (BOOL)isValid
{
  if (!-[ABVCardWatchdogTimer isStarted](self, "isStarted"))
    return 1;
  -[ABVCardWatchdogTimer setTicks:](self, "setTicks:", (-[ABVCardWatchdogTimer ticks](self, "ticks") + 1) % 0xC8);
  if (!-[ABVCardWatchdogTimer ticks](self, "ticks"))
    -[ABVCardWatchdogTimer checkValidity](self, "checkValidity");
  return -[ABVCardWatchdogTimer valid](self, "valid");
}

- (unint64_t)ticks
{
  return self->_ticks;
}

- (void)setTicks:(unint64_t)a3
{
  self->_ticks = a3;
}

- (ABVCardTimeProvider)timeProvider
{
  return self->_timeProvider;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
