@implementation HUControlInteractionState

- (NAValueThrottler)writeThrottler
{
  return self->_writeThrottler;
}

- (void)setWriteThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_writeThrottler, a3);
}

- (unint64_t)inFlightWriteCount
{
  return self->_inFlightWriteCount;
}

- (void)setInFlightWriteCount:(unint64_t)a3
{
  self->_inFlightWriteCount = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (BOOL)areWritesInProgressOrPossible
{
  return self->_writesInProgressOrPossible;
}

- (void)setWritesInProgressOrPossible:(BOOL)a3
{
  self->_writesInProgressOrPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeThrottler, 0);
}

@end
