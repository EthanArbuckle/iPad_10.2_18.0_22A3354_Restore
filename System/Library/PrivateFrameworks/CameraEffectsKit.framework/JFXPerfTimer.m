@implementation JFXPerfTimer

- (JFXPerfTimer)init
{
  JFXPerfTimer *v2;
  JFXPerfTimer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXPerfTimer;
  v2 = -[JFXPerfTimer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_start = 0.0;
    v2->_end = 0.0;
    -[JFXPerfTimer start](v2, "start");
  }
  return v3;
}

- (void)start
{
  self->_start = JTGetHostTime();
}

- (double)end
{
  double result;

  self->_end = JTGetHostTime();
  -[JFXPerfTimer elapsedTimeMS](self, "elapsedTimeMS");
  return result;
}

- (double)elapsedTime
{
  return self->_end - self->_start;
}

- (double)elapsedTimeMS
{
  double v2;

  -[JFXPerfTimer elapsedTime](self, "elapsedTime");
  return v2 * 1000.0;
}

@end
