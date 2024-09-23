@implementation MPAVController

- (id)addPeriodicTimeObserverForInterval:(double)a3 usingBlock:(id)a4
{
  return 0;
}

- (MPAVItem)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentItem, a3);
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)shouldDisplayAsPlaying
{
  return self->_shouldDisplayAsPlaying;
}

- (void)setShouldDisplayAsPlaying:(BOOL)a3
{
  self->_shouldDisplayAsPlaying = a3;
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentItem, 0);
}

@end
