@implementation CLKUIRenderFrequencyLink

- (CLKUIRenderFrequencyLink)init
{
  CLKUIRenderFrequencyLink *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUIRenderFrequencyLink;
  result = -[CLKUIRenderFrequencyLink init](&v3, sel_init);
  if (result)
  {
    result->_paused = 1;
    result->_preferredFramesPerSecond = 0;
  }
  return result;
}

- (unint64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(unint64_t)a3
{
  self->_preferredFramesPerSecond = a3;
  -[CLKUIRenderFrequencyLink updateCoordinator](self, "updateCoordinator");
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  -[CLKUIRenderFrequencyLink updateCoordinator](self, "updateCoordinator");
}

@end
