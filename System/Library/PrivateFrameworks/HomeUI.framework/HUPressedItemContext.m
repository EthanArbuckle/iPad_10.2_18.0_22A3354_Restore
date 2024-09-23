@implementation HUPressedItemContext

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (HUElasticApplier)applier
{
  return self->_applier;
}

- (void)setApplier:(id)a3
{
  objc_storeStrong((id *)&self->_applier, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

- (double)rawInputProgress
{
  return self->_rawInputProgress;
}

- (void)setRawInputProgress:(double)a3
{
  self->_rawInputProgress = a3;
}

- (double)currentViewScale
{
  return self->_currentViewScale;
}

- (void)setCurrentViewScale:(double)a3
{
  self->_currentViewScale = a3;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->_isUserInitiated = a3;
}

- (NSTimer)programmaticBounceTimer
{
  return self->_programmaticBounceTimer;
}

- (void)setProgrammaticBounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_programmaticBounceTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programmaticBounceTimer, 0);
  objc_storeStrong((id *)&self->_applier, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
