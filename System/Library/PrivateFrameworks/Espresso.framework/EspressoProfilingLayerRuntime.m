@implementation EspressoProfilingLayerRuntime

- (double)start_t
{
  return self->_start_t;
}

- (void)setStart_t:(double)a3
{
  self->_start_t = a3;
}

- (double)end_t
{
  return self->_end_t;
}

- (void)setEnd_t:(double)a3
{
  self->_end_t = a3;
}

@end
