@implementation ICTTVectorTimestampElement

- (unint64_t)clock
{
  return self->_clock;
}

- (unint64_t)subclock
{
  return self->_subclock;
}

- (void)setSubclock:(unint64_t)a3
{
  self->_subclock = a3;
}

- (void)setClock:(unint64_t)a3
{
  self->_clock = a3;
}

@end
